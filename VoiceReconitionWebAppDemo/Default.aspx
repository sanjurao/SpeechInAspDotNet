<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VoiceReconitionWebAppDemo.Default" %>
<%@ Register TagPrefix="web" Namespace="VoiceReconitionWebAppDemo" Assembly="VoiceReconitionWebAppDemo" %>
<%@ Register Assembly="System.Speech, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Speech" TagPrefix="web" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">

        function onSpeechRecognized(result) {
            window.alert(result.Text);
        }

        function start() {
            document.getElementById('startBtn').setAttribute('disabled', 'disabled');
            document.getElementById('stopBtn').removeAttribute('disabled');
            document.getElementById('processor').startRecording();
        }

        function stop() {
            document.getElementById('startBtn').removeAttribute('disabled');
            document.getElementById('stopBtn').setAttribute('disabled', 'disabled');
            document.getElementById('processor').stopRecording();
        }

        function onSpeak(text) {
            document.getElementById('synthesizer').speak(text);
        }

	</script>
    x
</head>
<body>
    <form runat="server">
        <div>
            <web:SpeechRecognition runat="server" ID="processor" ClientIDMode="Static" Mode="Desktop" Culture="en-US" OnSpeechRecognized="OnSpeechRecognized" OnClientSpeechRecognized="onSpeechRecognized" _Choices="One,Two,Three,hi,hello" />
            <input type="button" id="startBtn" value="Start" onclick="start()" />
            <input type="button" id="stopBtn" value="Stop" disabled="disabled" onclick="stop()" />
        </div>
        <div>
            <web:SpeechSynthesizer runat="server" ID="synthesizer" Age="Adult" Gender="Male" Culture="en-US" Rate="0" Volume="100" />
            <input type="text" id="text" name="text" />
            <input type="button" value="Speak" onclick="onSpeak(this.form.text.value)" />
        </div>
    </form>
</body>
</html>
