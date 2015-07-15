document.getElementById('enter').onclick = () ->
  name = document.getElementById('name').value
  binaryName = nameToBinary(name)
  hexName = nameToHex(name)
  colorName = getColors(hexName.split(' ').join(''))
  document.getElementById('binaryName').innerHTML = binaryName
  document.getElementById('hexName').innerHTML = hexName
  document.getElementById('colorName').innerHTML = injectColorHTML(colorName)

nameToBinary = (name) ->
  binaryName = ''
  for char in name
    asciiVal = char.charCodeAt(0)
    binaryName += leadingZeros((asciiVal >>> 0).toString(2), 8) + " "
  binaryName

nameToHex = (name) ->
  hexName = ''
  for char in name
    asciiVal = char.charCodeAt(0)
    hexName += leadingZeros(asciiVal.toString(16), 2) + " "
  hexName

leadingZeros = (number, zeros) ->
  strNum = number.toString()
  while(strNum.length < zeros)
    strNum = '0' + strNum
  strNum

getColors = (hexNumber) ->
  colors = []
  while(true)
    if(hexNumber.length < 6)
      colors.push(hexNumber)
      break
    else
      colors.push(hexNumber.substring(0,6))
      hexNumber = hexNumber.substring(6)
  colors

injectColorHTML = (colorName) ->
  html = ''
  for color in colorName
    if color.length != 6 && color.length != 0
      html = html.substring(0, html.length - 6) + "<p id='extra'>+" + color + "</p></div>"
    else if color.length != 0
      html += "<div class='nameInColor' style='background-color: ##{color}; width: #{80/(colorName.length - 1)}%'></div>"
  html
