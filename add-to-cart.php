<?php include('layout/header.php'); ?>

    <!-- Contact Form section -->
    <?php
    //get the id of product
    $product_id = $_GET['id'];
 
    //sql to get the product
    $sql = "SELECT * FROM products where id=$product_id";

    //execute the query
    $execute = mysqli_query($conn,$sql);

    //check if executed
    if($execute == TRUE){
        //counting the number of rows
        $count = mysqli_num_rows($execute);

        //if exactly 1
        if($count == 1){
            //get the value of respective product
            $rows=mysqli_fetch_assoc($execute);
            $pro_title = $rows['title'];
            $pro_id = $rows['id'];
            $pro_price = $rows['price'];
            $pro_desc = $rows['description'];
            $pro_image = $rows['image_name'];


            
        }else{
            //redirect to home page
            header('location:'.APP_URL);
        }
    }else{
        header('location:'.APP_URL);
    }

    ?>
    <section class="search ">
        <div class="container">
            <h2 class="text-center text-white ">Add to cart</h2>
            <form action="" method="post" class="form-horizontal">
                <fieldset>
                    <legend>Selected Food:</legend>
                    <div class="box-img">
                        <img src="images/product/<?php echo $pro_image; ?>" alt="<?php echo $pro_title; ?>"
                         class="img-responsive img-rounded">
                    </div>
                    <div class="box-desc">
                        <h4><?php echo $pro_title; ?></h4>
                        <p class="item-price">Rs.<?php echo $pro_price; ?></p>
                        <p class="item-desc"><?php echo $pro_desc; ?></p>
                        <!-- <a href="#" class="btn btn-primary">Order Now</a> -->
                    </div>
                </fieldset>

                <fieldset>
                    <legend>Order Detail:</legend>
                    
                    <input type="hidden" name="product_id" value="<?php echo $pro_id; ?>">
                    <input type="hidden" name="product" value="<?php echo $pro_title; ?>">
                    <input type="hidden" name="price" value="<?php echo $pro_price; ?>">
                   
    
                   
    
                  

                    <label for="">Quantity</label>
                    <input class="form-control" type="number"  min="1" name="quantity" required id="quantity" value="1">

                  
    
                    <input type="submit" name="submit" class="btn text-center btn-primary">
                </fieldset>
               
            </form>
        </div>
    </section>
    <!-- Contact Form Section Ends -->
    <?php
    //to submit the form
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        if(isset($_POST['submit'])){
            //Getting the data from the web form in respective variable
            $product_id = $_POST['product_id'];  
            $product = $_POST['product'];
            $price = $_POST['price'];
            $quantity = $_POST['quantity'];
            $total = $price * $quantity;
           
            $order_date = date('Y-m-d H:i:sa');
    
            //making sql
            $sql = "INSERT INTO cart SET
            product_id='$product_id',
            product='$product',            
            price='$price',
            quantity='$quantity',
            total='$total',
            
            order_date='$order_date'";

            //Check the connection
            if($conn){
                $execute = mysqli_query($conn, $sql) or die(mysqli_error($conn));
                //create database 
                if($execute = TRUE){
                    $_SESSION['message']= '<div class="success"> Added to cart Succefully </div>';
                    header('location:'.APP_URL);
                }else{
                    $_SESSION['message'] = '<div class="error"> Could not Add to cart Instantly. Try Again </div>';
                    header('location:'.APP_URL.'add-to-cart.php?id=$id');
                }
            }else{
                die("Connection Failed".mysqli_connect_error());
            }
        }
    }
    ?>

    <?php include('layout/footer.php'); ?>
