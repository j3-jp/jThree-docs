% GOML スタイルコントロール リファレンス  

### スタイルコントロールHowTo  
インタラクティブな3Dコンテンツを表現したい場合、  
3次元空間の中のオブジェクトを動的に書き換える仕組みが必要になります。  
jThree では、 javascript の記述により、  
あたかもDOMオブジェクトのスタイルを変更するかのように、オブジェクトの書き換えが可能です。  

以下の例では、 GOML 内の id "hoge" に紐付けられたオブジェクトをクリックするたびに、色が変化します。  

````javascript
jThree( function( j3 ) {
    var i = 0;
    var colors = ["#a0a0a0","#ff0000","#00ff00","#0000ff"];
    j3('#hoge').click(function(){
        i ++;
        if(cnt >= colors.length) i = 0;
        j3(this).css('mtlColor', colors[i]);
    });
});
````

#### GOML内で宣言

GOMLファイル内でstyle要素として宣言できます。  
> ※注意点GOML内で宣言するときは、必ず末尾にセミコロン【;】を入れてください。(無い場合動きません)  

````xml
<obj id="" model="stage/gekido/index.x" style="scale: 10; position: 0 -46.5 0; rotateY: 1.57;"></obj>
````

#### j3オブジェクトでスタイル指定

j3オブジェクトはjQueryオブジェクトと同様の動作をします。  
スタイルを変えるには css(attr, value) や animate(attr, value) メソッドを用います。  

````javascript
// texture rotate
var cnt = 0;
// テクスチャを使う場合は、 あらかじめGOMLでテクスチャを宣言し、idをつけておくと使いやすい
var txrs = ["#txr-sky","#txr-video","#txr-html"];
j3('#hoge').click(function(){
    cnt ++;
    if(cnt >= txrs.length) cnt = 0;

    // css() で即時切り替えが出来る
    j3(this).css('mtlMap', txrs[cnt]);

    // animate() でアニメーションさせることができる
    j3(this).animate({rotateY: 3.14 * (cnt+1)},500);
});
````

#### j3オブジェクトでeasing

[easingプラグイン](plugins.html#easing)を用いることにより、オブジェクトをなめらかに動かすことが出来ます。  

````javascript
j3("mesh").click(function(){
    j3(this).animate({scaleY: 1.2},1000,'easeInElastic').animate({positionY:10},300,'easeOutQuint').animate({positionY:1},300,'easeInQuint').animate({scaleY: 0.7},1000,'easeOutElastic');
});
````


### GOML スタイル リファレンス  

#### ―拡大/縮小―　scale  

scale: 10 20 10;
:    1を100％として親要素に対する拡縮率を style="scale: x y z;" で指定できます。  
	数値を1つだけ指定するとxyz全てに同じ値が適用されます。  
	
	挿入先：sceneタグ内の要素のstyle属性  
	

scaleX: 10;
:    1を100％として親要素に対するX方向の拡縮率を指定できます。  

scaleY: 10;
:    1を100％として親要素に対するY方向の拡縮率を指定できます。  

scaleZ: 10;
:    1を100％として親要素に対するZ方向の拡縮率を指定できます。  

#### ―位置― position  

position: 0 10 10;
:    親要素を原点としたオブジェクト中心の座標をstyle="position: x y z;"で指定できます。  
	数値を1つだけ指定するとxyz全てに同じ値が適用されます。
	
positionX: 10;
:    親要素を原点としたオブジェクト中心のX座標を指定できます。

positionY: 10;
:    親要素を原点としたオブジェクト中心のY座標を指定できます。

positionZ: 10;
:    親要素を原点としたオブジェクト中心のZ座標を指定できます。

#### ―移動― translate  

translate: 0 10 10;
:    オブジェクトを現在の位置から指定した値だけ移動させることが出来ます。  
	オブジェクトの回転や視点を考慮したローカル座標軸に沿って移動します。  
	style="translate: x y z;"で指定できます。  
	数値を1つだけ指定するとxyz全てに同じ値が適用されます。  

translateX: 10;
:    オブジェクトを現在の位置から指定した値だけX軸方向に移動させることが出来ます。  
	オブジェクトの回転や視点を考慮したローカル座標のX軸に沿って移動します。  

translateY: 10;
:    オブジェクトを現在の位置から指定した値だけY軸方向に移動させることが出来ます。  
	オブジェクトの回転や視点を考慮したローカル座標のY軸に沿って移動します。  

translateZ: 10;
:    オブジェクトを現在の位置から指定した値だけZ軸方向に移動させることが出来ます。  
	オブジェクトの回転や視点を考慮したローカル座標のZ軸に沿って移動します。  

#### ―回転― rotate  

rotate: 3.14 1.57 -3.14;
:    オブジェクトの中心を原点とした各座標軸に対する回転角(ラジアン、3.14 ≒ 180°)をstyle="rotate: x y z;"で指定できます。  
	数値を1つだけ指定するとxyz全てに同じ値が適用されます。  

rotateX: 3.14;
:    オブジェクトの中心を原点としたX座標軸に対する回転角(ラジアン、3.14 ≒ 180°)を指定できます。

rotateY: 3.14;
:    オブジェクトの中心を原点としたY座標軸に対する回転角(ラジアン、3.14 ≒ 180°)を指定できます。

rotateZ: 3.14;
:    オブジェクトの中心を原点としたZ座標軸に対する回転角(ラジアン、3.14 ≒ 180°)を指定できます。

#### ―視点― lookAt  

lookAt: 0 5 10;
:    親要素の中心を原点とした座標系において、オブジェクトがどこを視点に取るかをstyle="lookAt: x y z;"で指定できます。  
	主にカメラの視点やライトの方向を設定する際に使います。  
	数値を1つだけ指定するとxyz全てに同じ値が適用されます。  

lookAtX: 10;
:    親要素の中心を原点とした座標系において、オブジェクトの視点のX座標を指定できます。  
	主にカメラの視点やライトの方向を設定する際に使います。  

lookAtY: 10;
:    親要素の中心を原点とした座標系において、オブジェクトの視点のY座標を指定できます。  
	主にカメラの視点やライトの方向を設定する際に使います。  

lookAtZ: 10;
:    親要素の中心を原点とした座標系において、オブジェクトの視点のZ座標を指定できます。  
	主にカメラの視点やライトの方向を設定する際に使います。  

#### ―表示― display  

display: false;
:    オブジェクトの表示・非表示をtrue/falseで指定できます。  

#### ―材質― mtl*  

##### mtlColor  
mtlColor: #f00;
:    基本色をカラーコードか数値かRGB値(mtlColor: 255 0 0;)で指定できます。  
     挿入先：mesh要素のstyle属性  

##### mtlAmbient  
mtlAmbient: #f00;
:    環境光反射色をカラーコードか数値かRGB値(mtlAmbient: 255 0 0;)で指定できます。  
     挿入先：mesh要素のstyle属性  

##### mtlSpecular  
mtlSpecular: #f00;
:    鏡面反射光をカラーコードか数値かRGB値(mtlSpecular: 255 0 0;)で指定できます。  
     挿入先：mesh要素のstyle属性  

##### mtlShininess  
mtlShininess: 10;
:     鏡面反射光の強さを数値で指定できます。  
      挿入先：mesh要素のstyle属性  

##### mtlMap  
mtlMap: txr:first;
:    テクスチャをCSSセレクタで指定できます。  
     挿入先：mesh要素のstyle属性  

##### mtlBumpScale  
mtlBumpScale: 0.5;
:    テクスチャの凹凸の深さを数値で指定できます。  
     挿入先：mesh要素のstyle属性  

##### mtlWireframe  
mtlWireframe: true;
:    ワイヤーフレームの表示をtrue/falseで指定できます。  
     挿入先：mesh要素のstyle属性  

##### mtlBlending  
mtlBlending: 1;
:    透過処理を  
     1:アルファブレンディング  
     2:加算合成  
     3:減算合成  
     4:乗算合成  
     で指定できます。  
     挿入先：mesh要素のstyle属性  

##### mtlSide  
mtlSide: 2;
:    ポリゴンの描画処理を  
     0:表面のみ描画  
     1:裏面のみ描画  
     2:両面を描画  
     で指定できます。  
     挿入先：mesh要素のstyle属性

#### ―ライト設定― light

##### lightColor  
lightColor: #fff;
:    ライトの色をカラーコードか数値かRGB値(lightColor: 255 255 255;)で指定できます。  
     挿入先：light要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。

##### lightIntensity  
lightIntensity: 5;
:    光の強さを0以上の数値で指定できます。  
     type=\"Amb\"のライトには無効です。  
     挿入先：light要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。  

##### lightSky  
lightSky: #0ff;
:    空側の光源色をカラーコードか数値かRGB値(lightSky: 0 255 255;)で指定できます。  
     type="Hem"のライトでのみ有効です。  
     挿入先：light要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。  

##### lightGround  
lightGround: #0f0;
:    地面側の光源色をカラーコードか数値かRGB値(lightGround: 0 255 0;)で指定できます。  
     type="Hem"のライトでのみ有効です。  
     挿入先：light要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。

##### lightDistance  
lightDistance: 5;
:    光が届く距離を0以上の数値で指定できます。  
     type="Poi"とtype="Spo"のライトでのみ有効です。  
     挿入先：light要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。  

##### lightAngle  
lightAngle: 5;
:    スポットライトが照らす範囲の中心角の半分をラジアンで指定できます。  
     type="Spo"のライトでのみ有効です。  
     挿入先：light要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。  

##### lightExponent  
lightExponent: 15;
:    スポットライトの減衰係数を0以上の数値で指定できます。  
     type="Spo"のライトでのみ有効です。  
     挿入先：light要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。

#### ―カメラ設定― camera

##### cameraNear
cameraNear: 0;
:    描画を始めるカメラからの距離を0以上の数値で指定できます。  
     type="Ort"のカメラには無効です。  
     挿入先：camera要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。  

##### cameraFar
cameraFar: 10000;
:    描画を終えるカメラからの距離をcameraNear以上の数値で指定できます。  
     type="Ort"のカメラには無効です。  
     挿入先：camera要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。  

##### cameraFov
cameraFov: 45;
:    カメラからの画角を度数で指定できます。  
     type="Ort"のカメラには無効です。  
     挿入先：camera要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。  

##### cameraAspect
cameraAspect: 1.33;
:    カメラのアスペクト比を0以上の数値で指定できます。  
     指定すると自動計算されなくなるので通常は使いません。  
     type="Ort"のカメラには無効です。  
     挿入先：camera要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。

##### cameraWidth
cameraWidth: 200;
:    カメラの撮影範囲の横幅を0以上の数値で指定できます。  
     cameraWidthだけを指定するとcameraHeightは自動計算されます。  
     type="Ort"のカメラでのみ有効です。  
     挿入先：camera要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。  

##### cameraHeight
cameraHeight: 200;
:    カメラの撮影範囲の高さを0以上の数値で指定できます。  
     cameraHeightだけを指定するとcameraWidthは自動計算されます。  
     type="Ort"のカメラでのみ有効です。  
     挿入先：camera要素のstyle属性  
     ※v2.1よりキャメルケース表記に変わりました。  

#### ―上方向指定― up

up: 0 1 0;
:    オブジェクトの上方向をstyle="up: x y z;"で指定します。  
     通常はカメラにのみ使われるプロパティです。  
     数値を1つだけ指定するとxyz全てに同じ値が適用されます。  
     
     挿入先：sceneタグ内の要素のstyle属性  

upX: 1;
:    オブジェクトの上方向を示すベクトルのX座標を指定します。  

upY: 1;
:    オブジェクトの上方向を示すベクトルのY座標を指定します。  

upZ: 1;
:    オブジェクトの上方向を示すベクトルのZ座標を指定します。  


#### ―自由軸回転― qtAxis

qtAxisAngle: 1 1 1 3.14;
:    style="qtAxisAngle: x y z w;"のxyzで指定した軸に対するオブジェクトの回転角をwのラジアン値で指定します。  
     数値を1つだけ指定するとxyzw全てに同じ値が適用されます。  
     挿入先：sceneタグ内の要素のstyle属性  

qtAxisAngleX: 1;
:     オブジェクトを回転させる軸のX値を指定します。  

qtAxisAngleY: 1;
:     オブジェクトを回転させる軸のY値を指定します。  

qtAxisAngleZ: 1;
:     オブジェクトを回転させる軸のZ値を指定します。  


#### ―クォータニオン― quaternion

quaternion: 0 0 0 1;
:    オブジェクトのクォータニオンをstyle="quaternion: x y z w;"で指定します。  
     値と見た目が直感的に連動しないので手動で思い通りの回転を指定するのは困難です。  
     数値を1つだけ指定するとxyzw全てに同じ値が適用されます。  
     挿入先：sceneタグ内の要素のstyle属性  

quaternionX: 1;
:    オブジェクトのクォータニオンのXの値を指定します。

quaternionY: 1;
:    オブジェクトのクォータニオンのYの値を指定します。

quaternionZ: 1;
:    オブジェクトのクォータニオンのZの値を指定します。

quaternionW: 1;
:    オブジェクトのクォータニオンのWの値を指定します。
