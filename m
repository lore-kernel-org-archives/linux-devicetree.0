Return-Path: <kbeldan@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20160803162528.2337-1-kbeldan@baylibre.com>
References: <20160803162528.2337-1-kbeldan@baylibre.com>
From: Karl Beldan <kbeldan@baylibre.com>
Date: Thu, 4 Aug 2016 20:43:54 +0000
Message-ID: <CAJaRCXNB+fC=0H_A4zSgQmeynZJsacY8kS2dLfstX=gfRzzfpA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dt: da850: add nand_cs3 node label in the dtsi
Content-Type: multipart/alternative; boundary=001a1135b28222c5b7053945023d
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Karl Beldan <karl.beldan+oss@gmail.com>, Karl Beldan <kbeldan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
List-ID: <devicetree@vger.kernel.org>

--001a1135b28222c5b7053945023d
Content-Type: text/plain; charset=UTF-8

2016-08-03 16:25 GMT+00:00 Karl Beldan <kbeldan@baylibre.com>:

> This will allow to adjust the related settings in the board files.
>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
> ---
>  arch/arm/boot/dts/da850.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 25f0f8e..3a00978 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -375,7 +375,7 @@
>                         dma-names = "tx", "rx";
>                 };
>         };
> -       nand_cs3@62000000 {
> +       nand_cs3: nand_cs3@62000000 {
>                 compatible = "ti,davinci-nand";
>                 reg = <0x62000000 0x807ff
>                        0x68000000 0x8000>;
> --
> 2.9.0.rc1
>
> Please discard this one, I think I'll move things around for the nand.

Karl

--001a1135b28222c5b7053945023d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2016=
-08-03 16:25 GMT+00:00 Karl Beldan <span dir=3D"ltr">&lt;<a href=3D"mailto:=
kbeldan@baylibre.com" target=3D"_blank">kbeldan@baylibre.com</a>&gt;</span>=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">This will allow to adjust the related s=
ettings in the board files.<br>
<br>
Cc: Kevin Hilman &lt;<a href=3D"mailto:khilman@baylibre.com">khilman@baylib=
re.com</a>&gt;<br>
Signed-off-by: Karl Beldan &lt;<a href=3D"mailto:kbeldan@baylibre.com">kbel=
dan@baylibre.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/da850.dtsi | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi<br=
>
index 25f0f8e..3a00978 100644<br>
--- a/arch/arm/boot/dts/da850.dtsi<br>
+++ b/arch/arm/boot/dts/da850.dtsi<br>
@@ -375,7 +375,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dma-names =3D &quot;tx&quot;, &quot;rx&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0nand_cs3@62000000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nand_cs3: nand_cs3@62000000 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quo=
t;ti,davinci-nand&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x62000=
000 0x807ff<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x68000000 0x8000&gt;;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.0.rc1<br>
<br></font></span></blockquote><div>Please discard this one, I think I&#39;=
ll move things around for the nand.<br>=C2=A0<br></div><div>Karl <br></div>=
</div><br></div></div>

--001a1135b28222c5b7053945023d--
