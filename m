From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v8 06/17] dt-bindings: add document for analogix display
 port driver
Date: Thu, 29 Oct 2015 16:56:34 +0800
Message-ID: <5631DF42.9050402@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <103292898.nCEg51kmfI@phil> <56317275.90508@rock-chips.com>
 <1689999.2MgYqJktlx@phil>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0673847640=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1689999.2MgYqJktlx@phil>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, el.org@null.null, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kern, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Kukjin Kim <kgene@kernel.org>, robherring2@gmail.com, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, dianders@chromium.org, Kyungmin Park <kyungmin.park@samsung.com>, Kumar Gala <galak@codeaurora.org>, ajaynumb@gmail.com, Andy
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============0673847640==
Content-Type: multipart/alternative;
 boundary="------------050101050207060709000307"

This is a multi-part message in MIME format.
--------------050101050207060709000307
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 10/29/2015 04:40 PM, Heiko Stuebner wrote:
> Am Donnerstag, 29. Oktober 2015, 09:12:21 schrieb Yakir Yang:
>> Hi Heiko,
>>
>> On 10/29/2015 04:02 AM, Heiko Stuebner wrote:
>>> Hi Yakir,
>>>
>>> Am Mittwoch, 28. Oktober 2015, 16:26:33 schrieb Yakir Yang:
>>>> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
>>>> index 7a3a9cd..9905081 100644
>>>> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
>>>> +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
>>>> @@ -31,45 +31,31 @@ Required properties for dp-controller:
>>>>    		from general PHY binding: the phandle for the PHY device.
>>>>    	-phy-names:
>>>>    		from general PHY binding: Should be "dp".
>>>> -	-samsung,color-space:
>>>> -		input video data format.
>>>> -			COLOR_RGB = 0, COLOR_YCBCR422 = 1, COLOR_YCBCR444 = 2
>>>> -	-samsung,dynamic-range:
>>>> -		dynamic range for input video data.
>>>> -			VESA = 0, CEA = 1
>>>> -	-samsung,ycbcr-coeff:
>>>> -		YCbCr co-efficients for input video.
>>>> -			COLOR_YCBCR601 = 0, COLOR_YCBCR709 = 1
>>>> -	-samsung,color-depth:
>>>> -		number of bits per colour component.
>>>> -			COLOR_6 = 0, COLOR_8 = 1, COLOR_10 = 2, COLOR_12 = 3
>>>> -	-samsung,link-rate:
>>>> -		link rate supported by the panel.
>>>> -			LINK_RATE_1_62GBPS = 0x6, LINK_RATE_2_70GBPS = 0x0A
>>>> -	-samsung,lane-count:
>>>> -		number of lanes supported by the panel.
>>>> -			LANE_COUNT1 = 1, LANE_COUNT2 = 2, LANE_COUNT4 = 4
>>>> -	- display-timings: timings for the connected panel as described by
>>>> -		Documentation/devicetree/bindings/video/display-timing.txt
>>> 											^^ display/display-timings.txt
>>> otherwise this patch does not apply.
>> I thought I have deleted this old path of "display-timing.txt", and
>> changed it to
>>
>> -		Documentation/devicetree/bindings/video/display-timing.txt
> in the changes I got from Rob Hering's dt-branch [0] the path in the file
> is already display/display-timing.txt so applying a change with video/...
> in it fails. Anyway, as this will probably only make it in after the merge-
> window, we can see how this ends up before anyway :-) .

Agree

>
>> +		Documentation/devicetree/bindings/display/panel/display-timing.txt
>>
>> And the real path of "display-timing.txt" in linux-next [tag 20151022]
>> do under
>> the "display/panel/", those change should be right.
>
> Heiko
>
> [0] https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=efdbd7345f8836f7495f3ac6ee237d86cb3bb6b0

Found some conflicting things in that commit:

He move the display-timing.txt from "video/" to "display/panel"
diff --git a/Documentation/devicetree/bindings/video/display-timing.txt 
b/Documentation/devicetree/bindings/display/panel/display-timing.txt
index e1d4a0b..e1d4a0b 100644 --- 
a/Documentation/devicetree/bindings/video/display-timing.txt 
<https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/video/display-timing.txt?h=dt/next&id=9ffecb10283508260936b96022d4ee43a7798b4c> 
+++ b/Documentation/devicetree/bindings/display/panel/display-timing.txt 
<https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/display/panel/display-timing.txt?h=dt/next&id=efdbd7345f8836f7495f3ac6ee237d86cb3bb6b0> 
But didn't give the real path to other documents
--- a/Documentation/devicetree/bindings/video/fsl,imx-fb.txt 
<https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/video/fsl,imx-fb.txt?h=dt/next&id=9ffecb10283508260936b96022d4ee43a7798b4c> 
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt 
<https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt?h=dt/next&id=efdbd7345f8836f7495f3ac6ee237d86cb3bb6b0>
@@ -9,7 +9,7 @@ Required properties:
Required nodes:
- display: Phandle to a display node as described in
- Documentation/devicetree/bindings/video/display-timing.txt
+ Documentation/devicetree/bindings/display/display-timing.txt
Additional, the display node has to define properties:
- bits-per-pixel: Bits per pixel
- fsl,pcr: LCDC PCR value
Thanks, - Yakir
>
>
>

--------------050101050207060709000307
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 10/29/2015 04:40 PM, Heiko Stuebner
      wrote:<br>
    </div>
    <blockquote cite="mid:1689999.2MgYqJktlx@phil" type="cite">
      <pre wrap="">Am Donnerstag, 29. Oktober 2015, 09:12:21 schrieb Yakir Yang:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi Heiko,

On 10/29/2015 04:02 AM, Heiko Stuebner wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Hi Yakir,

Am Mittwoch, 28. Oktober 2015, 16:26:33 schrieb Yakir Yang:
</pre>
          <blockquote type="cite">
            <pre wrap="">diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
index 7a3a9cd..9905081 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
@@ -31,45 +31,31 @@ Required properties for dp-controller:
  		from general PHY binding: the phandle for the PHY device.
  	-phy-names:
  		from general PHY binding: Should be "dp".
-	-samsung,color-space:
-		input video data format.
-			COLOR_RGB = 0, COLOR_YCBCR422 = 1, COLOR_YCBCR444 = 2
-	-samsung,dynamic-range:
-		dynamic range for input video data.
-			VESA = 0, CEA = 1
-	-samsung,ycbcr-coeff:
-		YCbCr co-efficients for input video.
-			COLOR_YCBCR601 = 0, COLOR_YCBCR709 = 1
-	-samsung,color-depth:
-		number of bits per colour component.
-			COLOR_6 = 0, COLOR_8 = 1, COLOR_10 = 2, COLOR_12 = 3
-	-samsung,link-rate:
-		link rate supported by the panel.
-			LINK_RATE_1_62GBPS = 0x6, LINK_RATE_2_70GBPS = 0x0A
-	-samsung,lane-count:
-		number of lanes supported by the panel.
-			LANE_COUNT1 = 1, LANE_COUNT2 = 2, LANE_COUNT4 = 4
-	- display-timings: timings for the connected panel as described by
-		Documentation/devicetree/bindings/video/display-timing.txt
</pre>
          </blockquote>
          <pre wrap="">											^^ display/display-timings.txt
otherwise this patch does not apply.
</pre>
        </blockquote>
        <pre wrap="">
I thought I have deleted this old path of "display-timing.txt", and 
changed it to

-		Documentation/devicetree/bindings/video/display-timing.txt
</pre>
      </blockquote>
      <pre wrap="">
in the changes I got from Rob Hering's dt-branch [0] the path in the file
is already display/display-timing.txt so applying a change with video/...
in it fails. Anyway, as this will probably only make it in after the merge-
window, we can see how this ends up before anyway :-) .</pre>
    </blockquote>
    <br>
    Agree<br>
    <br>
    <blockquote cite="mid:1689999.2MgYqJktlx@phil" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">
+		Documentation/devicetree/bindings/display/panel/display-timing.txt

And the real path of "display-timing.txt" in linux-next [tag 20151022] 
do under
the "display/panel/", those change should be right.
</pre>
      </blockquote>
      <pre wrap="">

Heiko

[0] <a class="moz-txt-link-freetext" href="https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/commit/?h=dt/next&amp;id=efdbd7345f8836f7495f3ac6ee237d86cb3bb6b0">https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/commit/?h=dt/next&amp;id=efdbd7345f8836f7495f3ac6ee237d86cb3bb6b0</a>
</pre>
    </blockquote>
    <br>
    Found some conflicting things in that commit:<br>
    <br>
    He move the display-timing.txt from "video/" to "display/panel"<br>
    <meta http-equiv="content-type" content="text/html;
      charset=windows-1252">
    <meta http-equiv="content-type" content="text/html;
      charset=windows-1252">
    <span style="color: rgb(0, 0, 0); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">	
diff --git a/Documentation/devicetree/bindings/video/display-timing.txt b/Documentation/devicetree/bindings/display/panel/display-timing.txt</span><br style="color: rgb(0, 0, 0); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="color: rgb(0, 0, 0); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre
 ; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">index e1d4a0b..e1d4a0b 100644</span>
<span style="color: rgb(0, 0, 0); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">--- a/</span><a href="https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/video/display-timing.txt?h=dt/next&amp;id=9ffecb10283508260936b96022d4ee43a7798b4c" style="color: blue; text-decoration: none; font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; l
 ine-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color
 : rgb(255
, 255, 255);">Documentation/devicetree/bindings/video/display-timing.txt</a>
<span style="color: rgb(0, 0, 0); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">+++ b/</span><a href="https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/display/panel/display-timing.txt?h=dt/next&amp;id=efdbd7345f8836f7495f3ac6ee237d86cb3bb6b0" style="color: blue; text-decoration: none; font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: n
 ormal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgrou
 nd-color:
 rgb(255, 255, 255);">Documentation/devicetree/bindings/display/panel/display-timing.txt</a>

But didn't give the real path to other documents
<meta http-equiv="content-type" content="text/html; charset=windows-1252"><meta http-equiv="content-type" content="text/html; charset=windows-1252"><div class="head" style="font-weight: bold; margin-top: 1em; color: black; font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">--- a/<a href="https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/video/fsl,imx-fb.txt?h=dt/next&amp;id=9ffecb10283508260936b96022d4ee43a7798b4c" style="color: blue; text-decoration: none;">Documentation
 /devicetree/bindings/video/fsl,imx-fb.txt</a>
+++ b/<a href="https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt?h=dt/next&amp;id=efdbd7345f8836f7495f3ac6ee237d86cb3bb6b0" style="color: blue; text-decoration: none;">Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt</a></div><div class="ctx" style="color: rgb(51, 51, 51); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">@@ -9,7 +9,7 @@ Required properties: </div><div class="ctx" style="color: rgb(51, 51, 51); 
 font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; te
 xt-indent
: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"> Required nodes:</div><div class="ctx" style="color: rgb(51, 51, 51); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"> - display: Phandle to a display node as described in</div><div class="del" style="color: red; font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-he
 ight: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(
 255, 255,
 255);">-	Documentation/devicetree/bindings/video/display-timing.txt</div><div class="add" style="color: green; font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">+	Documentation/devicetree/bindings/display/display-timing.txt</div><div class="ctx" style="color: rgb(51, 51, 51); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: non
 e; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"> 	Additional, the display node has to define properties:</div><div c
 lass="ctx
" style="color: rgb(51, 51, 51); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"> 	- bits-per-pixel: Bits per pixel</div><div class="ctx" style="color: rgb(51, 51, 51); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(25
 5, 255, 255);"> 	- fsl,pcr: LCDC PCR value</div>
Thanks,
- Yakir
<blockquote cite="mid:1689999.2MgYqJktlx@phil" type="cite"><pre wrap="">



</pre>

</blockquote>
</body></html>
--------------050101050207060709000307--


--===============0673847640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0673847640==--
