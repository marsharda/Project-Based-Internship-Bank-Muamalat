SELECT
  orders.Date AS order_date,
  category.CategoryName AS category_name,
  products.ProdName AS product_name,
  products.Price AS product_price,
  orders.Quantity AS order_qty,
  (orders.Quantity * products.Price) AS total_sales,
-- saya gunakan untuk membersihkan tanda '#' pada CustomerEmail
  SPLIT(customers.CustomerEmail, '#')[OFFSET(0)] AS cust_email,
  customers.CustomerCity AS cust_city

FROM `project-final-bianalyst-01.final_project.orders` AS orders

LEFT JOIN `project-final-bianalyst-01.final_project.customers` AS customers
  ON orders.CustomerID = customers.CustomerID

LEFT JOIN `project-final-bianalyst-01.final_project.products` AS products
  ON orders.ProdNumber = products.ProdNumber

LEFT JOIN `project-final-bianalyst-01.final_project.product_category` AS category
  ON products.Category = category.CategoryID

ORDER BY order_date