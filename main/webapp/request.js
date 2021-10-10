function httpPost(url, formData, callback){
    fetch(url, {
        method: 'POST',
        body: formData
    }).then(response =>{
        if (!response.ok){
            throw new Error(`Request failed with status ${response.status}`)
        }
        return response.json();
    })
    .then(response => {
        // console.log(response)
        
        callback(response)
    })
    .catch(error => console.log(error))
}
function httpGet(url, callback){
    fetch(url)
    .then(response =>{
        if (!response.ok){
            throw new Error(`Request failed with status ${response.status}`)
        }
        // console.log(response)
        return response.json();
    })
    .then(response =>{
        
        callback(response);
    })
    .catch(error => console.log(error))
}

// let but = document.querySelector("#solicitud")
