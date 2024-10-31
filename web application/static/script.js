document.getElementById('search-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the form from submitting the traditional way

    const productName = document.getElementById('search-input').value;

    // Make a POST request to the Flask backend
    fetch('/search', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ product_name: productName })
    })
    .then(response => response.json())
    .then(data => {
        const resultsDiv = document.getElementById('results');
        resultsDiv.innerHTML = ''; // Clear previous results

        if (data.length > 0) {
            data.forEach(product => {
                const productDiv = document.createElement('div');
                productDiv.innerHTML = `<h3>${product.product_name_data1}</h3>
                                        <p>Brand: ${product.brand_name_data1}</p>
                                        <p>Price: $${product.price_usd_data1}</p>
                                        <p>Rating: ${product.rating}</p>`;
                resultsDiv.appendChild(productDiv);
            });
        } else {
            resultsDiv.innerHTML = '<p>No products found.</p>';
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});
