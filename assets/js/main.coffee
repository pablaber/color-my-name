document.getElementById('enter').onclick = () ->
  name = document.getElementById('name').value
  console.log(nameToBinary(name))

# needs leading 0s
nameToBinary = (name) ->
  binaryName = ''
  for char in name
    asciiVal = char.charCodeAt(0)
    binaryName += (asciiVal >>> 0).toString(2) + " "
  binaryName
