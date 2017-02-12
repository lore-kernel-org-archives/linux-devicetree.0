From: Philippe Fouquet <ph.fouquet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/8] drm/sun4i: Add optional 'mode' property
 to TCON
Date: Sun, 12 Feb 2017 08:50:27 -0800 (PST)
Message-ID: <5e26468b-5f16-4da2-be50-e2375c5bc8ce@googlegroups.com>
References: <20170211174405.28395-1-plaes@plaes.org>
 <20170211174405.28395-5-plaes@plaes.org>
Reply-To: ph.fouquet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_1207_2088436318.1486918227416"
Return-path: <linux-sunxi+bncBDGIZTFA34NBBVFEQLCQKGQEIB4NPXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170211174405.28395-5-plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_1207_2088436318.1486918227416
Content-Type: multipart/alternative;
	boundary="----=_Part_1208_1556929176.1486918227416"

------=_Part_1208_1556929176.1486918227416
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

First way thank for this work
But I can't use it, I'm explain myself.

My LVDS connexion works fine because I display correctly the console under=
=20
uboot (I work with CONFIG_VIDEO_LCD_MODE)

I use the wiki : http://linux-sunxi.org/LCD to convert my fex config to=20
CONFIG_VIDEO_LCD_MODE for the uboot all work fine

But for the kernel nothing, I have some crazy line or black screen.

   - I add my lcd configuration into simple_panel.c (
   http://linux-sunxi.org/LCD)
   - I can seen the debug ligne came from LVDS driver.
   - My LCD screen is a dlc070ddg 7' 800x480 LVDS 18bits.
   - I work with a Olimex_A20-OLinuXino-Micro=20
   <http://linux-sunxi.org/Olimex_A20-OLinuXino-Micro>.

I don't know where I can search If some body have a idea?

Thanks=20

Le samedi 11 f=C3=A9vrier 2017 18:44:59 UTC+1, Priit Laes a =C3=A9crit :
>
> Add variable to enable either 'rgb' or 'lvds' output.=20
>
> Signed-off-by: Priit Laes <pl...-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org <javascript:>>=20
> ---=20
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 +++=20
>  1 file changed, 3 insertions(+)=20
>
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.tx=
t=20
> b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt=20
> index b82c004..c367ede 100644=20
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt=20
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt=20
> @@ -43,6 +43,9 @@ Required properties:=20
>   - reset-names: the reset names mentioned above=20
>   - clock-output-names: Name of the pixel clock created=20
>  =20
> +- mode: Defines which encoder will be enabled. Values are 'rgb', 'lvds'.=
=20
> +  Defaults to 'rgb' if not set.=20
> +=20
>  - ports: A ports node with endpoint definitions as defined in=20
>    Documentation/devicetree/bindings/media/video-interfaces.txt. The=20
>    first port should be the input endpoint, the second one the output=20
> --=20
> 2.9.3=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_1208_1556929176.1486918227416
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font size=3D"2" face=3D"arial, sans-serif">First way=
 thank for this work</font></div><div><font face=3D"arial, sans-serif" size=
=3D"2">But I can&#39;t use it, I&#39;m=C2=A0explain=C2=A0myself.</font></di=
v><div><font face=3D"arial, sans-serif" size=3D"2"><br></font></div><div><f=
ont size=3D"2" face=3D"arial, sans-serif">My LVDS connexion works fine beca=
use I display correctly the console under uboot (I work with=C2=A0<span sty=
le=3D"color: rgb(0, 0, 0);">CONFIG_VIDEO_LCD_MODE</span><span style=3D"colo=
r: rgb(0, 0, 0); background-color: rgb(249, 249, 249);">)</span></font></di=
v><div><font size=3D"2" face=3D"arial, sans-serif"><br></font></div><div><f=
ont size=3D"2" face=3D"arial, sans-serif">I use the wiki :=C2=A0<a href=3D"=
http://linux-sunxi.org/LCD" target=3D"_blank" rel=3D"nofollow" style=3D"cur=
sor: pointer;">http://linux-sunxi.org/LCD</a>=C2=A0to convert my fex config=
 to=C2=A0<span style=3D"color: rgb(0, 0, 0);">CONFIG_VIDEO_LCD_MODE</span><=
span style=3D"color: rgb(0, 0, 0);">=C2=A0for the=C2=A0</span><font color=
=3D"#000000">uboot all work fine</font></font></div><div><font color=3D"#00=
0000" size=3D"2" face=3D"arial, sans-serif"><br></font></div><div><font col=
or=3D"#000000" size=3D"2" face=3D"arial, sans-serif">But for the kernel not=
hing, I have some=C2=A0crazy line or=C2=A0black=C2=A0screen.</font></div><d=
iv><ul><li><font size=3D"2" face=3D"arial, sans-serif"><font color=3D"#0000=
00">I add my lcd configuration into simple_panel.c (</font><a href=3D"http:=
//linux-sunxi.org/LCD" target=3D"_blank" rel=3D"nofollow" style=3D"cursor: =
pointer;">http://linux-sunxi.org/LCD</a>)</font></li><li><font face=3D"aria=
l, sans-serif" size=3D"2">I can seen the debug ligne=C2=A0came from LVDS dr=
iver.</font></li><li><font face=3D"arial, sans-serif" size=3D"2">My LCD scr=
een is a dlc070ddg 7&#39; 800x480 LVDS 18bits.</font></li><li><font face=3D=
"arial, sans-serif" size=3D"2">I work with<font color=3D"#000000"> a=C2=A0<=
/font></font><font color=3D"#000000" size=3D"2" face=3D"arial, sans-serif" =
style=3D"background-image: none;"><a href=3D"http://linux-sunxi.org/Olimex_=
A20-OLinuXino-Micro" title=3D"Olimex A20-OLinuXino-Micro" style=3D"backgrou=
nd-image: none;">Olimex_A20-OLinuXino-Micro</a>.</font></li></ul></div><div=
>I don&#39;t know where I can search If some body have a idea?</div><div><b=
r></div><div>Thanks=C2=A0</div><br>Le samedi 11 f=C3=A9vrier 2017 18:44:59 =
UTC+1, Priit Laes a =C3=A9crit=C2=A0:<blockquote class=3D"gmail_quote" styl=
e=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left:=
 1ex;">Add variable to enable either &#39;rgb&#39; or &#39;lvds&#39; output=
.
<br>
<br>Signed-off-by: Priit Laes &lt;<a href=3D"javascript:" target=3D"_blank"=
 gdf-obfuscated-mailto=3D"hN4L9id-BQAJ" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;ja=
vascript:&#39;;return true;">pl...-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org</a>&gt;
<br>---
<br>=C2=A0Documentation/devicetree/<wbr>bindings/display/sunxi/sun4i-<wbr>d=
rm.txt | 3 +++
<br>=C2=A01 file changed, 3 insertions(+)
<br>
<br>diff --git a/Documentation/devicetree/<wbr>bindings/display/sunxi/sun4i=
-<wbr>drm.txt b/Documentation/devicetree/<wbr>bindings/display/sunxi/sun4i-=
<wbr>drm.txt
<br>index b82c004..c367ede 100644
<br>--- a/Documentation/devicetree/<wbr>bindings/display/sunxi/sun4i-<wbr>d=
rm.txt
<br>+++ b/Documentation/devicetree/<wbr>bindings/display/sunxi/sun4i-<wbr>d=
rm.txt
<br>@@ -43,6 +43,9 @@ Required properties:
<br>=C2=A0 - reset-names: the reset names mentioned above
<br>=C2=A0 - clock-output-names: Name of the pixel clock created
<br>=C2=A0
<br>+- mode: Defines which encoder will be enabled. Values are &#39;rgb&#39=
;, &#39;lvds&#39;.
<br>+ =C2=A0Defaults to &#39;rgb&#39; if not set.
<br>+
<br>=C2=A0- ports: A ports node with endpoint definitions as defined in
<br>=C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/media/video-<wbr>in=
terfaces.txt. The
<br>=C2=A0 =C2=A0first port should be the input endpoint, the second one th=
e output
<br>--=20
<br>2.9.3
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_1208_1556929176.1486918227416--

------=_Part_1207_2088436318.1486918227416--
