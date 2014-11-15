## プラグイン

### カメラ操作

#### Trackball
視点を中心にマウスでアングルを動かせる、モデル鑑賞に適したコントローラーです。  
起動：var ball = jThree.Trackball();  
停止：ball.stop();  
再起動：ball.start();  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/trackball/1.4/jThree.Trackball.js"></script>
```

#### FlyView
一人称視点で空を飛ぶようにアングルを動かせるコントローラーです。  
起動：var fly = jThree.FlyView();  
停止：fly.stop();  
再起動：fly.start();  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/flyview/1.4/jThree.FlyView.js"></script>
```

### モデルローダー

#### MMD
MMDのモデル・モーションデータ読みこみが可能になります。  
モーション再生：jThree.MMD.play();  
モーション停止：jThree.MMD.pause();  
再生位置調整：jThree.MMD.seek( 秒数 );  

制作協力：katwat  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/mmd/1.4/jThree.MMD.js"></script>
```


#### XFile (DirectX)
MMDのステージデータで多用されているXファイルの読みこみが可能になります。  
テキスト形式のみ対応、モーション再生機能はありません。  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/xfile/1.1/jThree.XFile.js"></script>
```

#### STL (3Dプリンタ)
3Dプリンタ用の形状データの読みこみが可能になります。  
テキストとバイナリ両方の形式に対応してます。  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/stl/1.0/jThree.STL.js"></script>
```

#### JSON (three.js)
three.js用のJSONデータの読みこみが可能になります。  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/json/1.0/jThree.JSON.js"></script>
```

#### Collada
Collada形式のモデルデータの読みこみが可能になります。  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/collada/1.0/jThree.Collada.js"></script>
```

### エフェクト

#### ammo (物理演算)
MMDモデルに物理演算を適用したい場合に読み込みます。  
ファイルサイズが約1.6MBでJavaScriptライブラリとしてはかなり巨大です。  

挿入先：HTMLファイルのhead要素内、**MMDプラグインより先**  

```html
<script src="libs/ammo/1.0/ammo.js"></script>
```

#### FrameRate
フレームレート(FPS)メーターを表示できます。  
起動：var stats = jThree.Stats();  
停止：stats.stop();  
再起動：stats.start();  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/stats/1.2/jThree.Stats.js"></script>
```

#### WebAR

WebGLの背景にカメラの映像を重ねてARマーカー上にオブジェクトを表示することが可能になります。  
MMDモデルがターゲットの場合、物理エンジンを適用すると破たんします。  
ターゲットとカメラの位置と回転はデフォルト状態でなければいけません。  
[ARマーカーはココから(ただの画像ページです)](http://jthree.jp/marker/)  
生成：var ar = jThree.WebAR( {  
target: マーカー上に表示する要素のセレクタ,  
error: カメラ非対応などエラー時のコールバック  
} );  
起動：ar.start();  
停止：ar.stop();  
デバイスのカメラ変更：ar.change();  
(現時点ではインカメラかアウトカメラかをJSで判定できないのでユーザーイベントで変更するしかなさそうです。)  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/webar/0.3/jThree.WebAR.js"></script>
```

#### easing
jQueryと同じ方法でアニメーションにイージング効果を与えられるようになります。  
jThree( "mesh" ).animate( { rotateY: "+=3.14" }, 15000, "easeInOutBack" );  

挿入先：HTMLファイルのhead要素内  

```html
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
```

### デバイス

#### RTC (webCamera)
importタグ内のvideoタグにウェブカメラの動画を張り付けることが可能になります。  
生成：var rtc = jThree.RTC( "videoタグのセレクタ" );  
起動：rtc.start();  
停止：rtc.stop();  
デバイスのカメラ変更：rtc.change();  
(現時点ではインカメラかアウトカメラかをJSで判定できないのでユーザーイベントで変更するしかなさそうです。)  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/rtc/0.1/jThree.RTC.js"></script>
```

#### Oculus(DK1)
Oculus Rift(DK1)に対応する描画モードに切り替えられます。  
初期化：var oculus = jThree.Oculus();  
開始：oculus.start();  
終了：oculus.stop();  
交互切替：oculus.toggle();  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/oculus/0.1/jThree.Oculus.js"></script>
```

#### Leap Motion
Leap Motionを接続すると空間に手が描画されます。  
ammo.js（物理エンジン）を先に読み込んでおくとMMDモデルに触れることが出来ます。  
現時点ではこれ以上の機能はありません。  
初期化：var leap = jThree.Leap();  
開始：leap.start();  
終了：leap.stop();  
交互切替：leap.toggle();  

挿入先：HTMLファイルのhead要素内  

```html
<script src="//js.leapmotion.com/0.4.0/leap.min.js"></script>
<script src="libs/leap/0.1/jThree.Leap.js"></script>
```

#### MobileVR (ハコスコ)
スマホの加速度センサーでカメラを動かすコントローラーです。  
ハコスコと併用することを想定しています。  
生成：var vr = jThree.MobileVR();  
起動：vr.start();  
停止：vr.stop();  

挿入先：HTMLファイルのhead要素内  

```html
<script src="libs/mobilevr/0.1/jThree.MobileVR.js"></script>
```
