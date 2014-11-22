% GOML マニュアル

### GOML overview
jThreeで用いる、形状、物体を記述するためのファイル形式。  
フォーマットはxml準拠である。

### Reference

### &lt;goml&gt;
GOMLの定義。  

### &lt;head&gt;
最初に読み込む要素を記述します。
		
#### &lt;import&gt;
外部から読み込むHTML要素。  
txrタグから参照するHTMLファイルを保持します。
href属性にURLを指定するかHTMLのタグを直接記述することができます。  
	
````javascript
var importHTML = jThree( "import" ).contents();
````
	
でインポートしたHTMLにアクセスできます。返り値はjQueryのcontentsメソッドと全く同じです。  
現時点ではimportタグは１ドキュメントに１つのみ有効です。  
	
````html
<import>
	<style>div {color: #f00; height: 50px; position: absolute; top: 0;}</style>
	<div>Hello World!</div>
	<video autoplay>
		<source src="video/nhk1.mp4" /><source src="video/nhk1.ogg" />
	</video>
	<canvas></canvas>
</import>
````
	
#### &lt;geo&gt;
形状定義。

#### &lt;txr&gt;
テクスチャ定義。

#### &lt;mtl&gt;
材質定義。

#### &lt;rdr&gt;
レンダラー定義。  
描画するHTML要素と撮影に使うカメラを設定します。  
frame属性にはHTML要素のCSSセレクタを入力してください(初期値はbody)。常にその要素のサイズに合わせて描画されます。  
camera属性にはcameraタグのCSSセレクタを指定します(初期値はcamera:first)。  
IE11ではrdrタグを複数設置しても1つしか描画されないようです。  

param属性のantialiasでアンチエイリアスのtrue/falseを、clearColorで全体の背景色を、clearAlphaで全体の不透明度(0から1)を設定できます。  

サンプルコード

```html
<rdr id="" frame="body" camera="camera:first" param="antialias: true; clearColor: #fff; clearAlpha: 0.5;" />
```

### &lt;body&gt;
GOMLのbody要素は、1または複数のシーンが挿入されます。  
**body** タグの直下には **scene** タグのみ配置可能です。

#### &lt;scene&gt;
シーンを定義します。  
**body** タグ内に複数配置することが出来ます。

サンプルコード

````html
<scene></scene>
````

属性: fog
:    霞みがかった3次元空間を生成します。  
	
	> fog="#COLOR"
	
	````html
	<scene fog="#fcc"></scene>
	````
	
	> fog="#COLOR float float"
	
	fog属性に**"霞みの色 (開始距離 終了距離)"**を指定できます。  
	
	````html
	<scene fog="#fcc 100 500"></scene>
	````
	>Tips: 開始距離と終了距離の関係で以下のような効果が得られます
	>
	| 距離関係             | 効果 |
	| --------------------|------------------|
	| 開始距離 ＜ 終了距離  | 通常の霧 |
	| 開始距離 ＝ 終了距離  | 視界の一定距離に壁が出来る |
	| 開始距離 ＞ 終了距離  | 近くのオブジェクト自体に霧がかかる |
	
	> fog="#COLOR float"
	
	fog="**霞みの色 濃度**"という指定も可能です。  
	
	````html
	<scene fog="#fcc 0.001"></scene>
	````
	
#### &lt;camera&gt;
カメラ


#### &lt;light&gt;
光源


#### &lt;mesh&gt;
メッシュオブジェクト

````html
<mesh id="" geo="" mtl="" style=""></mesh>
````

#### &lt;obj&gt;
汎用オブジェクト

````html
<obj id="" style=""></obj>
````

#### &lt;sprite&gt;
spriteオブジェクト

````html
<sprite id="" mtl="" style=""></sprite>
````

#### &lt;mmd&gt;
MMDオブジェクト  
MMDモデルを描画します。  
**MMDプラグイン( libs/mmd/1.4/jThree.MMD.js )の読み込みが必要です。**  

**pmx** ファイルの形式のみ対応しています。  

一般に頒布されているMMDモデルをダウンロードして読み込ませる場合、 **toon0.bmp** ～ **toon10.bmp** ファイルをpmxファイルと同じディレクトリに設置する必要があります。  
toon ファイルは　[PmxEditor](http://kkhk22.seesaa.net/category/14045227-1.html) の **\_data/toon** ディレクトリに入っています。  

MMDプラグインより先に物理エンジン( libs/ammo/1.0/ammo.js )を読み込むとモデルの物理演算が有効になります。  
髪や服が自然になびくようになりますが、負荷が増えます。　　

````html
<mmd id="" model="model/miku/index.pmx" motion="motion/kagerou.vmd" style=""></mmd>
````

