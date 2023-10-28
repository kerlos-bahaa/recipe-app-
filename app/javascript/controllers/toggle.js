
try {
    let too = document.getElementById('customSwitch1')
    too.addEventListener('change' , () => {
        let toogle = document.getElementById('recipe-form')
        toogle.submit()
    })
} catch (error) {
    console.log()
}