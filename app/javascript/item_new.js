function cal (){
  const price = document.getElementById("item-price")
  price.addEventListener('keyup', function(){
    const priceVal = price.value
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML =  Math.floor( price.value * 0.1 )
    const profit = document.getElementById("profit")
    profit.innerHTML = Math.ceil( price.value - price.value * 0.1 )
  })
}

window.addEventListener('load', cal)