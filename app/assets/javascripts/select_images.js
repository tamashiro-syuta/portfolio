document.addEventListener("turbolinks:load", function () {

let ocrcount = 0;
let fileList = [];
let fileCount = 0;

// 「ファイル選択」ボタン押下時
function start_img_select() {
    console.log("Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    $("#image_data").css("display", "");
    $("#image_data").trigger('click');
}

// ファイルアップロード後処理
function change_img(e) {
    ocrcount = 0;
    fileList = e.files;
    fileCount = e.files.length;
    let fileName = fileList[ocrcount].name;

    // ファイル読み込みでプレビュー表示
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#preview").attr('src', e.target.result);
    }
    reader.readAsDataURL(fileList[ocrcount]);

    $("#image_data").css("display", "none");
    let fileinfo = `読み込みファイル数: ${ocrcount + 1}/${fileCount}<br>${fileName}`;
    document.getElementById('fileinfo').innerHTML = fileinfo;

    // ファイル送信実行部
    call_execute_form(fileList[ocrcount]);
}

// リクエスト完了後に表示される「次へ」ボタン押下時
function nextOcr() {
    ocrcount = ocrcount + 1;
    let fileName = fileList[ocrcount].name;

    // ファイル読み込みでプレビュー表示
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#preview").attr('src', e.target.result);
    }
    reader.readAsDataURL(fileList[ocrcount]);

    $("#image_data").css("display", "none");
    let fileinfo = `読み込みファイル数: ${ocrcount + 1}/${fileCount}<br>${fileName}`;
    document.getElementById('fileinfo').innerHTML = fileinfo;

    // ファイル送信実行部
    call_execute_form(fileList[ocrcount]);
}
});