const pay = () => {
  Payjp.setPublicKey("pk_test_00f2f61e8dab21421b083bd0")
  const submit = document.getElementById("button")
  submit.addEventListener("click", (e) => {
    e.preventDefault()
    
    const formResult = document.getElementById("charge-form")
    const formData = new FormData(formResult)

    const card = {
      number: formData.get("purchase_address[number]"),
      exp_month: formData.get("purchase_address[exp_month]"),
      exp_year: `20${formData.get("purchase_address[exp_year]")}`,
      cvc: formData.get("purchase_address[cvc]"),
    }

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id
        const renderDOM = document.getElementById("charge-form")
        const tokenObj = `<input value=${token} name='token' type="hidden">`
        renderDOM.insertAdjacentHTML("beforeend", tokenObj)
      }

      document.getElementById("card-number").removeAttribute("name")
      document.getElementById("card-exp-month").removeAttribute("name")
      document.getElementById("card-exp-year").removeAttribute("name")
      document.getElementById("card-cvc").removeAttribute("name")

      document.getElementById("charge-form").submit()
    })
  })
}

window.addEventListener("load", pay)