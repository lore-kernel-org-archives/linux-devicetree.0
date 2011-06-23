From: Manjunatha GK <manjugk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Converting i2c-omap driver to use device tree
Date: Thu, 23 Jun 2011 19:45:14 +0530
Message-ID: <BANLkTin0zaE6M=0+9bq6sCvCVO_PJqYseA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0698712337769739441=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org\"" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0698712337769739441==
Content-Type: multipart/alternative; boundary=0015175932e0b95e5d04a661b6bf

--0015175932e0b95e5d04a661b6bf
Content-Type: text/plain; charset=ISO-8859-1

Hi Grant,
I am trying to convert i2c-omap driver to use device tree. Since omap i2c
driver uses it's own mechanism to register as platform device, I have
commented out i2c device registration part from board file and trying to use
DT data in probe function of i2c driver.

I have i2c node declared under omap4-panda.dts as:

+       i2c@48072000 {
+               compatible = "ti,omap_i2c";
+               reg = <0x48072000 0x80>;
+               #address-cells = <1>;
+               #size-cells = <0>;
+
+               twl@48 {
+                       compatible = "twl6030,4030-6030";
+                       reg = < 0x48 >;
+               };
+       };

and board file is changed as:

@@ -685,6 +686,10 @@ static void __init omap4_panda_init(void)
 {
        int package = OMAP_PACKAGE_CBS;

+#ifdef CONFIG_OF
+       of_platform_prepare(NULL, NULL);
+#endif /* CONFIG_OF */
+
        if (omap_rev() == OMAP4430_REV_ES1_0)
                package = OMAP_PACKAGE_CBL;
        omap4_mux_init(board_mux, NULL, package);
@@ -700,6 +705,7 @@ static void __init omap4_panda_init(void)
        omap4_ehci_init();
        usb_musb_init(&musb_board_data);
        omap4_panda_display_init();
+       of_platform_populate(NULL, NULL, NULL, NULL);
 }

I have commented out device registration for I2C1 in board file:

diff --git a/arch/arm/mach-omap2/board-omap4panda.c
b/arch/arm/mach-omap2/board-omap4panda.c
index c9d1e13..0c31f35 100644
--- a/arch/arm/mach-omap2/board-omap4panda.c
+++ b/arch/arm/mach-omap2/board-omap4panda.c
@@ -409,7 +410,7 @@ static struct i2c_board_info __initdata
panda_i2c_eeprom[] = {

 static int __init omap4_panda_i2c_init(void)
 {
-       omap4_pmic_init("twl6030", &omap4_panda_twldata);
+       //omap4_pmic_init("twl6030", &omap4_panda_twldata);
@@ -685,6 +686,10 @@ static void __init omap4_panda_init(void)
 {
        int package = OMAP_PACKAGE_CBS;

+#ifdef CONFIG_OF
+       of_platform_prepare(NULL, NULL);
+#endif /* CONFIG_OF */
+
        if (omap_rev() == OMAP4430_REV_ES1_0)
                package = OMAP_PACKAGE_CBL;
        omap4_mux_init(board_mux, NULL, package);
@@ -700,6 +705,7 @@ static void __init omap4_panda_init(void)
        omap4_ehci_init();
        usb_musb_init(&musb_board_data);
        omap4_panda_display_init();
+       of_platform_populate(NULL, NULL, NULL, NULL);
 }

and i2c-omap is modified as:

+static const struct of_device_id omap_i2c_of_match[];
 static int __devinit
 omap_i2c_probe(struct platform_device *pdev)
 {
@@ -1162,6 +1169,12 @@ static int omap_i2c_resume(struct device *dev)
        return 0;
 }

+static const struct of_device_id omap_i2c_of_match[] = {
+       {.compatible = "omap_i2c", },
+       {},
+}
+MODULE_DEVICE_TABLE(of, omap_i2c_of_match);

With the above changes, i was expecting probe function to be called since
device gets binded to driver. But probe will never get called.

Did I miss anything with above procedure?

--0015175932e0b95e5d04a661b6bf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Grant,<br>I am trying to convert i2c-omap driver to use device tree. Sin=
ce omap i2c driver uses it&#39;s own mechanism to register as platform devi=
ce, I have commented out i2c device registration part from board file and t=
rying to use DT data in probe function of i2c driver.<br>
<br>I have i2c node declared under omap4-panda.dts as:<br><br>+=A0=A0=A0=A0=
=A0=A0 i2c@48072000 {<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compat=
ible =3D &quot;ti,omap_i2c&quot;;<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 reg =3D &lt;0x48072000 0x80&gt;;<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 #address-cells =3D &lt;1&gt;;<br>
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D &lt;0&gt;;<br>+=
<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 twl@48 {<br>+=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D &quot=
;twl6030,4030-6030&quot;;<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 reg =3D &lt; 0x48 &gt;;<br>+=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 };<br>+=A0=A0=A0=A0=A0=A0 };<br>
<br>and board file is changed as:<br><br>@@ -685,6 +686,10 @@ static void _=
_init omap4_panda_init(void)<br>=A0{<br>=A0=A0=A0=A0=A0=A0=A0 int package =
=3D OMAP_PACKAGE_CBS;<br>=A0<br>+#ifdef CONFIG_OF<br>+=A0=A0=A0=A0=A0=A0 of=
_platform_prepare(NULL, NULL);<br>
+#endif /* CONFIG_OF */<br>+<br>=A0=A0=A0=A0=A0=A0=A0 if (omap_rev() =3D=3D=
 OMAP4430_REV_ES1_0)<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 packa=
ge =3D OMAP_PACKAGE_CBL;<br>=A0=A0=A0=A0=A0=A0=A0 omap4_mux_init(board_mux,=
 NULL, package);<br>@@ -700,6 +705,7 @@ static void __init omap4_panda_init=
(void)<br>
=A0=A0=A0=A0=A0=A0=A0 omap4_ehci_init();<br>=A0=A0=A0=A0=A0=A0=A0 usb_musb_=
init(&amp;musb_board_data);<br>=A0=A0=A0=A0=A0=A0=A0 omap4_panda_display_in=
it();<br>+=A0=A0=A0=A0=A0=A0 of_platform_populate(NULL, NULL, NULL, NULL);<=
br>=A0}<br><br>I have commented out device registration for I2C1 in board f=
ile:<br>
<br>diff --git a/arch/arm/mach-omap2/board-omap4panda.c b/arch/arm/mach-oma=
p2/board-omap4panda.c<br>index c9d1e13..0c31f35 100644<br>--- a/arch/arm/ma=
ch-omap2/board-omap4panda.c<br>+++ b/arch/arm/mach-omap2/board-omap4panda.c=
<br>
@@ -409,7 +410,7 @@ static struct i2c_board_info __initdata panda_i2c_eepro=
m[] =3D {<br>=A0<br>=A0static int __init omap4_panda_i2c_init(void)<br>=A0{=
<br>-=A0=A0=A0=A0=A0=A0 omap4_pmic_init(&quot;twl6030&quot;, &amp;omap4_pan=
da_twldata);<br>
+=A0=A0=A0=A0=A0=A0 //omap4_pmic_init(&quot;twl6030&quot;, &amp;omap4_panda=
_twldata);<br>@@ -685,6 +686,10 @@ static void __init omap4_panda_init(void=
)<br>=A0{<br>=A0=A0=A0=A0=A0=A0=A0 int package =3D OMAP_PACKAGE_CBS;<br>=A0=
<br>+#ifdef CONFIG_OF<br>+=A0=A0=A0=A0=A0=A0 of_platform_prepare(NULL, NULL=
);<br>
+#endif /* CONFIG_OF */<br>+<br>=A0=A0=A0=A0=A0=A0=A0 if (omap_rev() =3D=3D=
 OMAP4430_REV_ES1_0)<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 packa=
ge =3D OMAP_PACKAGE_CBL;<br>=A0=A0=A0=A0=A0=A0=A0 omap4_mux_init(board_mux,=
 NULL, package);<br>@@ -700,6 +705,7 @@ static void __init omap4_panda_init=
(void)<br>
=A0=A0=A0=A0=A0=A0=A0 omap4_ehci_init();<br>=A0=A0=A0=A0=A0=A0=A0 usb_musb_=
init(&amp;musb_board_data);<br>=A0=A0=A0=A0=A0=A0=A0 omap4_panda_display_in=
it();<br>+=A0=A0=A0=A0=A0=A0 of_platform_populate(NULL, NULL, NULL, NULL);<=
br>=A0}<br><br>and i2c-omap is modified as:<br><br>+static const struct of_=
device_id omap_i2c_of_match[];<br>
=A0static int __devinit<br>=A0omap_i2c_probe(struct platform_device *pdev)<=
br>=A0{<br>@@ -1162,6 +1169,12 @@ static int omap_i2c_resume(struct device =
*dev)<br>=A0=A0=A0=A0=A0=A0=A0 return 0;<br>=A0}<br>=A0<br>+static const st=
ruct of_device_id omap_i2c_of_match[] =3D {<br>
+=A0=A0=A0=A0=A0=A0 {.compatible =3D &quot;omap_i2c&quot;, },<br>+=A0=A0=A0=
=A0=A0=A0 {},<br>+}<br>+MODULE_DEVICE_TABLE(of, omap_i2c_of_match);<br><br>=
With the above changes, i was expecting probe function to be called since d=
evice gets binded to driver. But probe will never get called.<br>
<br>Did I miss anything with above procedure?<br>

--0015175932e0b95e5d04a661b6bf--

--===============0698712337769739441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0698712337769739441==--
