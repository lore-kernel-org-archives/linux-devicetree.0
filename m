From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: Add dts file for the
 GA10H-A33 tablet
Date: Tue, 2 Jun 2015 16:18:14 -0400
Message-ID: <CAKON4OwCFayyOMM_UizVDH4XpZ9wuD+KBJ_8fOps1RB49MT7tg@mail.gmail.com>
References: <1433274598-17366-1-git-send-email-hdegoede@redhat.com>
Reply-To: jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a113496f261980b05178ea4b4
Return-path: <linux-sunxi+bncBC55LFUF6ALBBBU7XCVQKGQEC6ABQ6Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1433274598-17366-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, ARM Linux Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--001a113496f261980b05178ea4b4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have one of these GA10H-A33 and tore it apart. They used an uncommon
wifi/BT chip - RDA5990P. Took mine apart since the wifi didn't work worth
two cents.
http://www.rdaic.com/sites/default/files/public/RDA5990P_datasheet_V1.4.pdf

Is that unpopulated pad next to the RSA5990P an option to use an Ampak
module? I am looking for a A33 PCBA where I can mount a 5Ghz wi-fi module.


=E2=80=8B
 IMG_0066.JPG
<https://docs.google.com/file/d/0B-2Z6FDzyIwrWUFVc0ZMOVY1d3c/edit?usp=3Ddri=
ve_web>
=E2=80=8B=E2=80=8B
 IMG_0067.JPG
<https://docs.google.com/file/d/0B-2Z6FDzyIwrbjBmNVVHYzZ2SWc/edit?usp=3Ddri=
ve_web>
=E2=80=8B

On Tue, Jun 2, 2015 at 3:49 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> The ga10h is an 10" tablet with an A33 or A23 soc, 1G RAM, 8G or 16G nand=
,
> sdio wifi, 2 micro usb ports, 1 otg and 1 host and 1 micro sd slot.
>
> This commit adds a dts file for the v1.1 pcb with an a33 soc.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                 |   1 +
>  arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts | 118
> +++++++++++++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a413d7b..7f782d2 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -575,6 +575,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-a23-ippo-q8h-v5.dtb \
>         sun8i-a23-ippo-q8h-v1.2.dtb \
>         sun8i-a33-et-q8-v1.6.dtb \
> +       sun8i-a33-ga10h-v1.1.dtb \
>         sun8i-a33-ippo-q8h-v1.2-lcd1024x600.dtb
>  dtb-$(CONFIG_MACH_SUN9I) +=3D \
>         sun9i-a80-optimus.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts
> b/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts
> new file mode 100644
> index 0000000..0c55954
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts
> @@ -0,0 +1,118 @@
> +/*
> + * Copyright 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of th=
e
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "sun8i-a33.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +       model =3D "Allwinner GA10H Quad Core Tablet (v1.1)";
> +       compatible =3D "allwinner,ga10h-v1.1", "allwinner,sun8i-a33";
> +
> +       aliases {
> +               serial0 =3D &r_uart;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +};
> +
> +&i2c0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c0_pins_a>;
> +       status =3D "okay";
> +};
> +
> +&i2c1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c1_pins_a>;
> +       status =3D "okay";
> +};
> +
> +&lradc {
> +       vref-supply =3D <&reg_vcc3v0>;
> +       status =3D "okay";
> +
> +       button@200 {
> +               label =3D "Volume Up";
> +               linux,code =3D <KEY_VOLUMEUP>;
> +               channel =3D <0>;
> +               voltage =3D <200000>;
> +       };
> +
> +       button@400 {
> +               label =3D "Volume Down";
> +               linux,code =3D <KEY_VOLUMEDOWN>;
> +               channel =3D <0>;
> +               voltage =3D <400000>;
> +       };
> +};
> +
> +&mmc0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_q8h>;
> +       vmmc-supply =3D <&reg_vcc3v0>;
> +       bus-width =3D <4>;
> +       cd-gpios =3D <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
> +       cd-inverted;
> +       status =3D "okay";
> +};
> +
> +&pio {
> +       mmc0_cd_pin_q8h: mmc0_cd_pin@0 {
> +               allwinner,pins =3D "PB4";
> +               allwinner,function =3D "gpio_in";
> +               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +               allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> +       };
> +};
> +
> +&r_uart {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&r_uart_pins_a>;
> +       status =3D "okay";
> +};
> --
> 2.3.6
>
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
>



--=20
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a113496f261980b05178ea4b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have one of these GA10H-A33 and tore it apart. They used=
 an uncommon wifi/BT chip - RDA5990P. Took mine apart since the wifi didn&#=
39;t work worth two cents.<div><a href=3D"http://www.rdaic.com/sites/defaul=
t/files/public/RDA5990P_datasheet_V1.4.pdf">http://www.rdaic.com/sites/defa=
ult/files/public/RDA5990P_datasheet_V1.4.pdf</a><br></div><div><br></div><d=
iv>Is that unpopulated pad next to the RSA5990P an option to use an Ampak m=
odule? I am looking for a A33 PCBA where I can mount a 5Ghz wi-fi module.</=
div><div><br></div><div><br></div>=E2=80=8B<br><div class=3D"gmail_chip gma=
il_drive_chip" style=3D"width:396px;height:18px;max-height:18px;background-=
color:#f5f5f5;padding:5px;color:#222;font-family:arial;font-style:normal;fo=
nt-weight:bold;font-size:13px;border:1px solid #ddd;line-height:1"><a href=
=3D"https://docs.google.com/file/d/0B-2Z6FDzyIwrWUFVc0ZMOVY1d3c/edit?usp=3D=
drive_web" target=3D"_blank" style=3D"display:inline-block;overflow:hidden;=
text-overflow:ellipsis;white-space:nowrap;text-decoration:none;padding:1px =
0px;border:none;width:100%"><img style=3D"vertical-align: bottom; border: n=
one;" src=3D"https://ssl.gstatic.com/docs/doclist/images/icon_10_generic_li=
st.png">=C2=A0<span dir=3D"ltr" style=3D"color:#15c;text-decoration:none;ve=
rtical-align:bottom">IMG_0066.JPG</span></a></div>=E2=80=8B=E2=80=8B<br><di=
v class=3D"gmail_chip gmail_drive_chip" style=3D"width:396px;height:18px;ma=
x-height:18px;background-color:#f5f5f5;padding:5px;color:#222;font-family:a=
rial;font-style:normal;font-weight:bold;font-size:13px;border:1px solid #dd=
d;line-height:1"><a href=3D"https://docs.google.com/file/d/0B-2Z6FDzyIwrbjB=
mNVVHYzZ2SWc/edit?usp=3Ddrive_web" target=3D"_blank" style=3D"display:inlin=
e-block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;text-deco=
ration:none;padding:1px 0px;border:none;width:100%"><img style=3D"vertical-=
align: bottom; border: none;" src=3D"https://ssl.gstatic.com/docs/doclist/i=
mages/icon_10_generic_list.png">=C2=A0<span dir=3D"ltr" style=3D"color:#15c=
;text-decoration:none;vertical-align:bottom">IMG_0067.JPG</span></a></div>=
=E2=80=8B<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Tue, Jun 2, 2015 at 3:49 PM, Hans de Goede <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" target=3D"_blank">hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The ga10h is an 10&quo=
t; tablet with an A33 or A23 soc, 1G RAM, 8G or 16G nand,<br>
sdio wifi, 2 micro usb ports, 1 otg and 1 host and 1 micro sd slot.<br>
<br>
This commit adds a dts file for the v1.1 pcb with an a33 soc.<br>
<br>
Signed-off-by: Hans de Goede &lt;<a href=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">hde=
goede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts | 118 ++++++++++++++++++++=
+++++++++<br>
=C2=A02 files changed, 119 insertions(+)<br>
=C2=A0create mode 100644 arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts<br>
<br>
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile<br>
index a413d7b..7f782d2 100644<br>
--- a/arch/arm/boot/dts/Makefile<br>
+++ b/arch/arm/boot/dts/Makefile<br>
@@ -575,6 +575,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i-a23-ippo-q8h-v5.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i-a23-ippo-q8h-v1.2.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i-a33-et-q8-v1.6.dtb \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sun8i-a33-ga10h-v1.1.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i-a33-ippo-q8h-v1.2-lcd1024x600.dtb<br>
=C2=A0dtb-$(CONFIG_MACH_SUN9I) +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sun9i-a80-optimus.dtb \<br>
diff --git a/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts b/arch/arm/boot/dts=
/sun8i-a33-ga10h-v1.1.dts<br>
new file mode 100644<br>
index 0000000..0c55954<br>
--- /dev/null<br>
+++ b/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts<br>
@@ -0,0 +1,118 @@<br>
+/*<br>
+ * Copyright 2015 Hans de Goede &lt;<a href=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org"=
>hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
+ *<br>
+ * This file is dual-licensed: you can use it either under the terms<br>
+ * of the GPL or the X11 license, at your option. Note that this dual<br>
+ * licensing only applies to this file, and not this project as a<br>
+ * whole.<br>
+ *<br>
+ *=C2=A0 a) This file is free software; you can redistribute it and/or<br>
+ *=C2=A0 =C2=A0 =C2=A0modify it under the terms of the GNU General Public =
License as<br>
+ *=C2=A0 =C2=A0 =C2=A0published by the Free Software Foundation; either ve=
rsion 2 of the<br>
+ *=C2=A0 =C2=A0 =C2=A0License, or (at your option) any later version.<br>
+ *<br>
+ *=C2=A0 =C2=A0 =C2=A0This file is distributed in the hope that it will be=
 useful,<br>
+ *=C2=A0 =C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied w=
arranty of<br>
+ *=C2=A0 =C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=
=C2=A0 See the<br>
+ *=C2=A0 =C2=A0 =C2=A0GNU General Public License for more details.<br>
+ *<br>
+ * Or, alternatively,<br>
+ *<br>
+ *=C2=A0 b) Permission is hereby granted, free of charge, to any person<br=
>
+ *=C2=A0 =C2=A0 =C2=A0obtaining a copy of this software and associated doc=
umentation<br>
+ *=C2=A0 =C2=A0 =C2=A0files (the &quot;Software&quot;), to deal in the Sof=
tware without<br>
+ *=C2=A0 =C2=A0 =C2=A0restriction, including without limitation the rights=
 to use,<br>
+ *=C2=A0 =C2=A0 =C2=A0copy, modify, merge, publish, distribute, sublicense=
, and/or<br>
+ *=C2=A0 =C2=A0 =C2=A0sell copies of the Software, and to permit persons t=
o whom the<br>
+ *=C2=A0 =C2=A0 =C2=A0Software is furnished to do so, subject to the follo=
wing<br>
+ *=C2=A0 =C2=A0 =C2=A0conditions:<br>
+ *<br>
+ *=C2=A0 =C2=A0 =C2=A0The above copyright notice and this permission notic=
e shall be<br>
+ *=C2=A0 =C2=A0 =C2=A0included in all copies or substantial portions of th=
e Software.<br>
+ *<br>
+ *=C2=A0 =C2=A0 =C2=A0THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT =
WARRANTY OF ANY KIND,<br>
+ *=C2=A0 =C2=A0 =C2=A0EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE=
 WARRANTIES<br>
+ *=C2=A0 =C2=A0 =C2=A0OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE=
 AND<br>
+ *=C2=A0 =C2=A0 =C2=A0NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR CO=
PYRIGHT<br>
+ *=C2=A0 =C2=A0 =C2=A0HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LI=
ABILITY,<br>
+ *=C2=A0 =C2=A0 =C2=A0WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,=
 ARISING<br>
+ *=C2=A0 =C2=A0 =C2=A0FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR T=
HE USE OR<br>
+ *=C2=A0 =C2=A0 =C2=A0OTHER DEALINGS IN THE SOFTWARE.<br>
+ */<br>
+<br>
+/dts-v1/;<br>
+#include &quot;sun8i-a33.dtsi&quot;<br>
+#include &quot;sunxi-common-regulators.dtsi&quot;<br>
+<br>
+#include &lt;dt-bindings/gpio/gpio.h&gt;<br>
+#include &lt;dt-bindings/input/input.h&gt;<br>
+#include &lt;dt-bindings/pinctrl/sun4i-a10.h&gt;<br>
+<br>
+/ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0model =3D &quot;Allwinner GA10H Quad Core Table=
t (v1.1)&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;allwinner,ga10h-v1.1&quot;=
, &quot;allwinner,sun8i-a33&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial0 =3D &amp;r_=
uart;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =3D &qu=
ot;serial0:115200n8&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;i2c0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;i2c0_pins_a&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;i2c1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;i2c1_pins_a&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;lradc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vref-supply =3D &lt;&amp;reg_vcc3v0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0button@200 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;Vol=
ume Up&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux,code =3D &lt;=
KEY_VOLUMEUP&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D &lt;0&g=
t;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0voltage =3D &lt;200=
000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0button@400 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;Vol=
ume Down&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux,code =3D &lt;=
KEY_VOLUMEDOWN&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D &lt;0&g=
t;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0voltage =3D &lt;400=
000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;mmc0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;mmc0_pins_a&gt;, &lt;&am=
p;mmc0_cd_pin_q8h&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vmmc-supply =3D &lt;&amp;reg_vcc3v0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd-gpios =3D &lt;&amp;pio 1 4 GPIO_ACTIVE_HIGH&=
gt;; /* PB4 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd-inverted;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;pio {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mmc0_cd_pin_q8h: mmc0_cd_pin@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,pins =3D =
&quot;PB4&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,function =
=3D &quot;gpio_in&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,drive =3D=
 &lt;SUN4I_PINCTRL_10_MA&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,pull =3D =
&lt;SUN4I_PINCTRL_PULL_UP&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;r_uart {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;r_uart_pins_a&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.3.6<br>
<br>
--<br>
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi%2Bunsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux=
-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br>
For more options, visit <a href=3D"https://groups.google.com/d/optout" targ=
et=3D"_blank">https://groups.google.com/d/optout</a>.<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">Jon Smirl<br><a href=3D"mailto:jonsmirl@gm=
ail.com" target=3D"_blank">jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a></div>
</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a113496f261980b05178ea4b4--
