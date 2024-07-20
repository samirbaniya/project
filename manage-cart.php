<?php include('layout/header.php') ?>

<!-- Body Section Starts -->
<section>
    <div>
        <strong style="position: sticky;left: 19%;"class="heading">MANAGE Cart</strong><br>
   
        <?php include('config/session.php') ?>
        
        <!-- Products Table -->
        <table class="table bordertable">
            <thead>
                <tr>
                    <th>SN</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr> 
            </thead>
            <tbody>
                <?php 
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
                ?>
                            <tr>
                                <td><?php echo $sn++; ?></td>
                                <td><?php echo $title; ?></td>
                                <td><?php echo $price; ?></td>
                                <td><?php echo $quantity; ?></td>
                                <td><?php echo $total; ?></td>
                                <td>
                                    <a class="btn btn-danger" href="<?php echo APP_URL; ?>delete-cart.php?id=<?php echo $id; ?>">
                                        Delete this item from cart
                                    </a>
                                </td>
                            </tr>
                <?php 
                        }  
                    } else {
                        echo '<tr><td colspan="6" class="text-center">No products to display</td></tr>';
                    }
                }
                
                ?>
                
            </tbody>
            <!-- Display Grand Total -->
            <tfoot>
                <tr>
                    <td colspan="4" textalign="right"><strong>Grand Total:</strong></td>
                    <td><strong><?php echo $grandTotal; ?></strong></td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
        <!-- Products Table End -->
        
        <!-- Checkout Button -->
        <div>
            <a class="checkout" href="pay.php">Proceed to Checkout</a>
        </div>
        
    </div>
</section>
<!-- Body Section Ends -->

<?php include('layout/footer.php') ?>
