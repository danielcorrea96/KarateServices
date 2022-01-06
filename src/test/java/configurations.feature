Feature: Previus configurations


  Scenario:  Configuration base
    * def baseUrl = 'https://gorest.co.in/'
    * def confHeaders = read('../resources/data/informationheaders/information_headers.json')
    * def numberRandom =
"""
    function(s) {
        var text = "";
        var possible = "1987654567892314562789298371654235167";
        for (var i = 0; i < s; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
        return text;
    }
    """
    * def number =  numberRandom(7)
    * print '\n ENVIO MENSAJE DESDE CONFIGG'

