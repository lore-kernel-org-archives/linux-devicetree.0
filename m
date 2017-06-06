Return-Path: <SRS0=r1pW=5L=gmail.com=andyshrk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170601044336.5745-1-jh80.chung@samsung.com>
References: <CGME20170601044338epcas5p3c202667dad66dabd4f2ad866e8ad870e@epcas5p3.samsung.com>
 <20170601044336.5745-1-jh80.chung@samsung.com>
From: Andy Yan <andyshrk@gmail.com>
Date: Tue, 6 Jun 2017 09:15:56 +0800
Message-ID: <CANbgqAS9_xUfbH6j1u6oM9h8nHAaWUm4Afg8baq4Wxm1vCqg9w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: rk1108: change to "max-frequency" from "clock-freq-min-max"
Content-Type: multipart/alternative; boundary="001a1140422ca034fa0551405c4e"
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
List-ID: <devicetree@vger.kernel.org>

--001a1140422ca034fa0551405c4e
Content-Type: text/plain; charset="UTF-8"

Hi Jaehoon:


2017-06-01 12:43 GMT+08:00 Jaehoon Chung <jh80.chung@samsung.com>:

> "clock-freq-min-max" was deprecated. There is only using in rk1108.dtsi.
> Use the "max-frequency" for removiing "clock-freq-min-max" in future.
>
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
>  arch/arm/boot/dts/rk1108.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
>
  This file now renamed to rv1108.dtsi as rockchip official named it as
RV1108.
   The rename patch now is in Heiko's linux-rockchip tree:v4.13 dts32,
maybe you should rebase this patch on it.

diff --git a/arch/arm/boot/dts/rk1108.dtsi b/arch/arm/boot/dts/rk1108.dtsi
> index 1297924..a9b5293 100644
> --- a/arch/arm/boot/dts/rk1108.dtsi
> +++ b/arch/arm/boot/dts/rk1108.dtsi
> @@ -174,7 +174,7 @@
>
>         emmc: dwmmc@30110000 {
>                 compatible = "rockchip,rk1108-dw-mshc",
> "rockchip,rk3288-dw-mshc";
> -               clock-freq-min-max = <400000 150000000>;
> +               max-frequency = <150000000>;
>                 clocks = <&cru HCLK_EMMC>, <&cru SCLK_EMMC>,
>                          <&cru SCLK_EMMC_DRV>, <&cru SCLK_EMMC_SAMPLE>;
>                 clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> @@ -186,7 +186,7 @@
>
>         sdio: dwmmc@30120000 {
>                 compatible = "rockchip,rk1108-dw-mshc",
> "rockchip,rk3288-dw-mshc";
> -               clock-freq-min-max = <400000 150000000>;
> +               max-frequency = <150000000>;
>                 clocks = <&cru HCLK_SDIO>, <&cru SCLK_SDIO>,
>                          <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
>                 clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> @@ -198,7 +198,7 @@
>
>         sdmmc: dwmmc@30130000 {
>                 compatible = "rockchip,rk1108-dw-mshc",
> "rockchip,rk3288-dw-mshc";
> -               clock-freq-min-max = <400000 100000000>;
> +               max-frequency = <100000000>;
>                 clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
>                          <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
>                 clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> --
> 2.10.2
>
>

--001a1140422ca034fa0551405c4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jaehoon:<div><br></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">2017-06-01 12:43 GMT+08:00 Jaehoon Chung <span di=
r=3D"ltr">&lt;<a href=3D"mailto:jh80.chung@samsung.com" target=3D"_blank">j=
h80.chung@samsung.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&qu=
ot;clock-freq-min-max&quot; was deprecated. There is only using in rk1108.d=
tsi.<br>
Use the &quot;max-frequency&quot; for removiing &quot;clock-freq-min-max&qu=
ot; in future.<br>
<br>
Signed-off-by: Jaehoon Chung &lt;<a href=3D"mailto:jh80.chung@samsung.com">=
jh80.chung@samsung.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/rk1108.dtsi | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br></blockquote><div><br></div><div>=C2=A0 This file now renamed to rv1108=
.dtsi as rockchip official named it as RV1108.</div><div>=C2=A0 =C2=A0The r=
ename patch now is in Heiko&#39;s linux-rockchip tree:v4.13 dts32, maybe yo=
u should rebase this patch on it.</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
diff --git a/arch/arm/boot/dts/rk1108.<wbr>dtsi b/arch/arm/boot/dts/rk1108.=
<wbr>dtsi<br>
index 1297924..a9b5293 100644<br>
--- a/arch/arm/boot/dts/rk1108.<wbr>dtsi<br>
+++ b/arch/arm/boot/dts/rk1108.<wbr>dtsi<br>
@@ -174,7 +174,7 @@<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 emmc: dwmmc@30110000 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quo=
t;rockchip,rk1108-dw-mshc&quot;, &quot;rockchip,rk3288-dw-mshc&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-freq-min-max =
=3D &lt;400000 150000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max-frequency =3D &=
lt;150000000&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp=
;cru HCLK_EMMC&gt;, &lt;&amp;cru SCLK_EMMC&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;&amp;cru SCLK_EMMC_DRV&gt;, &lt;&amp;cru SCLK_EMMC_SAM=
PLE&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &qu=
ot;biu&quot;, &quot;ciu&quot;, &quot;ciu-drive&quot;, &quot;ciu-sample&quot=
;;<br>
@@ -186,7 +186,7 @@<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdio: dwmmc@30120000 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quo=
t;rockchip,rk1108-dw-mshc&quot;, &quot;rockchip,rk3288-dw-mshc&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-freq-min-max =
=3D &lt;400000 150000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max-frequency =3D &=
lt;150000000&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp=
;cru HCLK_SDIO&gt;, &lt;&amp;cru SCLK_SDIO&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;&amp;cru SCLK_SDIO_DRV&gt;, &lt;&amp;cru SCLK_SDIO_SAM=
PLE&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &qu=
ot;biu&quot;, &quot;ciu&quot;, &quot;ciu-drive&quot;, &quot;ciu-sample&quot=
;;<br>
@@ -198,7 +198,7 @@<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdmmc: dwmmc@30130000 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quo=
t;rockchip,rk1108-dw-mshc&quot;, &quot;rockchip,rk3288-dw-mshc&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-freq-min-max =
=3D &lt;400000 100000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max-frequency =3D &=
lt;100000000&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp=
;cru HCLK_SDMMC&gt;, &lt;&amp;cru SCLK_SDMMC&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;&amp;cru SCLK_SDMMC_DRV&gt;, &lt;&amp;cru SCLK_SDMMC_S=
AMPLE&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &qu=
ot;biu&quot;, &quot;ciu&quot;, &quot;ciu-drive&quot;, &quot;ciu-sample&quot=
;;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a1140422ca034fa0551405c4e--
