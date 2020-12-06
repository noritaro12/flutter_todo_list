# mytodoapp

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


_



⓪スプラッシュ画面のinitStateの先頭で端末IDをクリア

 SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("terminalId", "");
    
  さくらのサーバーの端末登録をクリア。

②ライセンス画面で不正なライセンスキーを入力しOKを押下
④プライマリー認証のアドレスを変更しておく
⑤セカンダリー認証のアドレスを変更しておく

⑥プライマリーWebサーバーのアドレスを変更しておく。
⑦プライマリーWebサーバーのアドレスを変更しておく。


→スプラッシュ画面

端末IDを読み込む

２秒待つ

＠端末IDを表示する。

＠５秒待つ（端末IDを保持しているか確認できる）


if( 端末ID.isEmpty)

	→ライセンス画面に遷移（引数：端末ID）⓪

		Txt_On_Change:
		
			_licenceCd = e;

		Ok_Click:
		
			ライセンス情報テキストフィールドの読み込み⓪
			
			端末IDとライセンスキーの登録処理Apiの実行⓪
			
			if( 登録処理Api == OK ) ⓪
			
				端末IDをSaveする。⓪
				
				終了する。⓪
				→エラー画面に移動する。（引数：登録成功 + terminalId + liceneKey）⓪----------------------------2
			
			else( 登録処理Api == Fail )
				
				→エラー画面に移動する。（引数：登録エラー + terminalId + liceneKey ）⓪②------------------------1
	
else( 端末ID.Exist)

	プライマリーで認証Apiを実行する。
	
	if (プライマリ認証Api == Fail)
		
		セカンダリーで認証Apiを実行する。④

		if (セカンダリ認証Api == Fail) ④

			→エラー画面に移動する。（引数：認証エラー + terminalId + liceneKey + status）④⑤-----------------------3

	プライマリ死活確認API

	if( プライマリ死活確認Api == OK ) 
	
		→ブラウザ画面に移動する。（プライマリーサーバー）------------------------------4
	
	else（プライマリ死活確認Api == Fail） ⑥
	
		セカンダリ死活確認API  ⑥
	
		if (セカンダリ死活確認API == OK ) ⑥
		
			→ブラウザ画面に移動する。（セカンダリーサーバー）⑥------------------------5

		esle ( セカンダリ死活確認API == OK )⑥⑦
			
			→エラー画面に移動する。（ブラウザ表示エラー）------------------------------6







