<?php

// Author : Samir Khanal
$error_message = "";
$khalti_public_key = "your-public-api-key";

// Run your code here to get your amount and product id and product url. Change this dynamically.
// ------------------------------------------------------------------------
//  CHANGE THE CODE BELOW  eg. you can get product price and id from here and set these variables.
// Donot change variables name unless you can change everything below
// ------------------------------------------------------------------------

include('admin/config/constants.php');
include('config/session.php');

                // making the sql to fetch the data from products table
                $sql = "SELECT * FROM `cart`";
                
                // execute the query
                $exec = mysqli_query($conn, $sql);

                // Initialize grand total variable
                $grandTotal = 0;

                // if there is something
                if($exec == TRUE){
                    // count the number of rows
                    $count = mysqli_num_rows($exec);
                    if($count > 0){
                        $sn = 1;
                        while($rows = mysqli_fetch_assoc($exec)){
                            $id = $rows['id'];
                            $title = $rows['product'];
                            $price = $rows['price'];
                            $quantity = $rows['quantity'];
                            $total = $rows['total'];
                            
                            // Calculate the grand total
                            $grandTotal += $total;
                        }}}
$amount = $grandTotal;
$uniqueProductId = $id;
$uniqueUrl = "http://localhost/product-ordering-system/index.php";
$uniqueProductName = $title;
$successRedirect = "http://localhost/product-ordering-system/index.php"; 


// ------------------------------------------------------------------------
// HINT : just change price above and redirect user to this page. It will handel everything automatically.
// ------------------------------------------------------------------------

function checkValid($data)
{
    $verifyAmount = 1000; // get amount from database and multiply by 100
    // $data contains khalti response. you can print it to view more details.
    // eg. $data["token] will give token & $data["amount] will give amount and more. see khalti docs for response format
    // $error_message="";
    // show error from above message
    if ((float) $data["amount"] == $verifyAmount) {
        return 1;
    } else {
        return 0;
    }

    // use your extra function for checking price & all again. You can perform more action here. 
    // 1= success, 0 = error, 

    //
}
// ------------------------------------------------------------------------
// DONOT CHANGE THE CODE BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
// ------------------------------------------------------------------------



// declaring some global variables
$token = "";
$price = $amount;
$mpin = "";
// send otp
if (isset($_POST["mobile"]) && isset($_POST["mpin"])) {
    try {
        $mobile = $_POST["mobile"];
        $mpin = $_POST["mpin"];
        $price = (float) $amount;

        $amount = (float) $amount * 100;


        $curl = curl_init();

        curl_setopt_array(
            $curl,
            array(
                CURLOPT_URL => 'https://khalti.com/api/v2/payment/initiate/',
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS => '{
            "public_key": "' . $khalti_public_key . '",
            "mobile": ' . $mobile . ',
            "transaction_pin": ' . $mpin . ',
            "amount": ' . ($amount) . ',
            "product_identity": "' . $uniqueProductId . '",
            "product_name": "' . $uniqueProductName . '",
            "product_url": "' . $uniqueUrl . '"
    }',
                CURLOPT_HTTPHEADER => array(
                    'Content-Type: application/json'
                ),
            )
        );

        $response = curl_exec($curl);

        curl_close($curl);
        $parsed = json_decode($response, true);


        if (key_exists("token", $parsed)) {
            $token = $parsed["token"];

        } else {
            $error_message = "incorrect mobile or mpin";




        }
    } catch (Exception $e) {
        $error_message = "incorrect mobile or mpin";

    }


}

// otp verification
if (isset($_POST["otp"]) && isset($_POST["token"]) && isset($_POST["mpin"])) {
    try {
        $otp = $_POST["otp"];
        $token = $_POST["token"];
        $mpin = $_POST["mpin"];


        $curl = curl_init();

        curl_setopt_array(
            $curl,
            array(
                CURLOPT_URL => 'https://khalti.com/api/v2/payment/confirm/',
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS => '{
            "public_key": "' . $khalti_public_key . '",
            "transaction_pin": ' . $mpin . ',
            "confirmation_code": ' . $otp . ',
            "token": "' . $token . '"
    }',
                CURLOPT_HTTPHEADER => array(
                    'Content-Type: application/json'
                ),
            )
        );

        $response = curl_exec($curl);

        curl_close($curl);
        $parsed = json_decode($response, true);

        if (key_exists("token", $parsed)) {
            $isvalid = checkValid($parsed);
            if ($isvalid) {
                $error_message = "<span style='color:green'>payment success</span> <script> window.location='" . $successRedirect . "'; </script>";
            }


        } else {
            $error_message = "couldnot process the transaction at the moment.";
            if (key_exists("detail", $parsed)) {
                $error_message = $parsed["detail"];
            }

        }
    } catch (Exception $e) {
        $error_message = "couldnot process the transaction at the moment.";

    }


}
?>

<div class="khalticontainer">

    <center>
        <div><img src="khalti.png" alt="khalti" width="200"></div>
    </center>
    <?php
    if ($token == "") {

        ?>
    <form action="pay.php" method="post">
        <small>Mobile Number:</small> <br>
        <input type="number" class="number" minlength="10" maxlength="10" name="mobile" placeholder="98xxxxxxxx">
        <small>Khalti Mpin:</small> <br>
        <input type="password" class="mpin" name="mpin" minlength="4" maxlength="6" placeholder="xxxx">
        <small>Price:</small> <br>

        <input type="text" class="price" Value="Rs. <?php echo $price; ?>" disabled>
        <input type="hidden" class="price" name="amount" Value="<?php echo $price; ?>">
        <br>
        <span style="display:block;color:red;">
            <?php echo $error_message; ?>
        </span>
        <button>Pay Rs.
            <?php echo $price; ?>
        </button>
        <br>
        <small>We dont store your credientials for some security reasons. You will have to reenter your details
            everytime.</small>
    </form>
    <?php }
    if ($token != "") {
        ?>
    <form action="pay.php" method="post">
        <input type="hidden" name="token" value="<?php echo $token; ?>">
        <input type="hidden" name="mpin" value="<?php echo $mpin; ?>">
        <small>OTP:</small> <br>
        <input type="number" value="" name="otp" placeholder="xxxx">
        <?php

            ?>
        <span style="display:block;color:red;">
            <?php echo $error_message; ?>
        </span>
        <button>pay RS.
            <?php echo $price; ?>

        </button>
    </form>
    <?php
    } ?>
</div>
<style>
.khalticontainer {
    width: 300px;
    border: 2px solid #5C2D91;
    margin: 0 auto;
    padding: 8px;
}

input {
    display: block;
    width: 98%;
    padding: 8px;
    margin: 2px;
}

button {
    display: block;
    background-color: #5C2D91;
    border: none;
    color: white;
    cursor: pointer;

    width: 98%;
    padding: 8px;
    margin: 2px;
}

button:hover {
    opacity: 0.8;
}
</style>