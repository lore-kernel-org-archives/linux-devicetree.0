Return-Path: <george.joseph@fairview5.com>
MIME-Version: 1.0
Date: Mon, 7 Jul 2014 19:30:43 -0600
Message-ID: <CAHKv19Dwm1LD83NzSDMLYmvdV-QUiQtihDSmtD_EazT+06NX1g@mail.gmail.com>
Subject: [PATCH] ARM: dts: Restructure imx6qdl-wandboard.dtsi for new rev C1 board.
From: George Joseph <george.joseph@fairview5.com>
Content-Type: multipart/alternative; boundary=001a113a0b224a60c104fda48a91
To: linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a113a0b224a60c104fda48a91
Content-Type: text/plain; charset=UTF-8

The rev C1 Wandboard uses the Broadcom 4330 for WiFi and Bluetooth instead
of
the 4329.  This changes the PADS assigned for the control lines.  Another
side effect of the change is that on the rev C1 board, usdhc driver can't
detect the chip presence correctly so usdhc2 now needs its 'non-removeable'
property removed.

So that rev B1 and earlier can continue to work, this patch splits the
board-specific definitions from imx6qdl-wandboard.dtsi into
imx6qdl-wandboard-revb1.dtsi and imx6qdl-wandboard-revc1.dtsi.  The new
files
include the original base imx6qdl-wandboard.dtsi which retains the common
definitions.

The existing imx6dl-wandboard.dts includes imx6qdl-wandboard-revc1.dtsi and
imx6dl-wandboard-revb1.dts (new) includes imx6qdl-wandboard-revb1.dtsi.
This makes the rev C1 board the new default.  The same pattern is used for
imx6q-wandboard.dts.

So, from U-Boot on a WB-Quad you use imxq-wandboard-revb1.dtb for the older
B1
board and imxq-wandboard.dtb for the current rev C1 board.

Signed-off-by: George Joseph <george.joseph@fairview5.com>
---
 arch/arm/boot/dts/imx6dl-wandboard-revb1.dts   | 22 ++++++++++++++
 arch/arm/boot/dts/imx6dl-wandboard.dts         |  2 +-
 arch/arm/boot/dts/imx6q-wandboard-revb1.dts    | 26 ++++++++++++++++
 arch/arm/boot/dts/imx6q-wandboard.dts          |  2 +-
 arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi | 39
++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-wandboard-revc1.dtsi | 41
++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi       | 21 -------------
 7 files changed, 130 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-wandboard-revb1.dts
b/arch/arm/boot/dts/imx6dl-wandboard-revb1.dts
new file mode 100644
index 0000000..f607d4f
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-wandboard-revb1.dts
@@ -0,0 +1,22 @@
+/*
+ * Copyright 2013 Freescale Semiconductor, Inc.
+ *
+ * Author: Fabio Estevam <fabio.estevam@freescale.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+/dts-v1/;
+#include "imx6dl.dtsi"
+#include "imx6qdl-wandboard-revb1.dtsi"
+
+/ {
+ model = "Wandboard i.MX6 Dual Lite Board";
+ compatible = "wand,imx6dl-wandboard", "fsl,imx6dl";
+
+ memory {
+ reg = <0x10000000 0x40000000>;
+ };
+};
diff --git a/arch/arm/boot/dts/imx6dl-wandboard.dts
b/arch/arm/boot/dts/imx6dl-wandboard.dts
index e672891..bbb6167 100644
--- a/arch/arm/boot/dts/imx6dl-wandboard.dts
+++ b/arch/arm/boot/dts/imx6dl-wandboard.dts
@@ -10,7 +10,7 @@
  */
 /dts-v1/;
 #include "imx6dl.dtsi"
-#include "imx6qdl-wandboard.dtsi"
+#include "imx6qdl-wandboard-revc1.dtsi"

 / {
  model = "Wandboard i.MX6 Dual Lite Board";
diff --git a/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
b/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
new file mode 100644
index 0000000..20bf3c2
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
@@ -0,0 +1,26 @@
+/*
+ * Copyright 2013 Freescale Semiconductor, Inc.
+ *
+ * Author: Fabio Estevam <fabio.estevam@freescale.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+/dts-v1/;
+#include "imx6q.dtsi"
+#include "imx6qdl-wandboard-revb1.dtsi"
+
+/ {
+ model = "Wandboard i.MX6 Quad Board";
+ compatible = "wand,imx6q-wandboard", "fsl,imx6q";
+
+ memory {
+ reg = <0x10000000 0x80000000>;
+ };
+};
+
+&sata {
+ status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6q-wandboard.dts
b/arch/arm/boot/dts/imx6q-wandboard.dts
index 36be17f..4a8a6ee 100644
--- a/arch/arm/boot/dts/imx6q-wandboard.dts
+++ b/arch/arm/boot/dts/imx6q-wandboard.dts
@@ -10,7 +10,7 @@
  */
 /dts-v1/;
 #include "imx6q.dtsi"
-#include "imx6qdl-wandboard.dtsi"
+#include "imx6qdl-wandboard-revc1.dtsi"

 / {
  model = "Wandboard i.MX6 Quad Board";
diff --git a/arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi
b/arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi
new file mode 100644
index 0000000..e44d982
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi
@@ -0,0 +1,39 @@
+/*
+ * Copyright 2013 Freescale Semiconductor, Inc.
+ *
+ * Author: Fabio Estevam <fabio.estevam@freescale.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include "imx6qdl-wandboard.dtsi"
+
+&iomuxc {
+ pinctrl-0 = <&pinctrl_hog>;
+
+ imx6qdl-wandboard {
+ pinctrl_hog: hoggrp {
+ fsl,pins = <
+ MX6QDL_PAD_GPIO_0__CCM_CLKO1 0x130b0 /* GPIO_0_CLKO */
+ MX6QDL_PAD_GPIO_2__GPIO1_IO02 0x80000000 /* uSDHC1 CD */
+ MX6QDL_PAD_EIM_DA9__GPIO3_IO09 0x80000000 /* uSDHC3 CD */
+ MX6QDL_PAD_EIM_EB1__GPIO2_IO29 0x80000000 /* WL_REF_ON */
+ MX6QDL_PAD_EIM_A25__GPIO5_IO02 0x80000000 /* WL_RST_N */
+ MX6QDL_PAD_ENET_RXD1__GPIO1_IO26 0x80000000 /* WL_REG_ON */
+ MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x80000000 /* WL_HOST_WAKE */
+ MX6QDL_PAD_ENET_TXD0__GPIO1_IO30 0x80000000 /* WL_WAKE */
+ MX6QDL_PAD_EIM_D29__GPIO3_IO29 0x80000000 /* RGMII_nRST */
+ >;
+ };
+ };
+};
+
+&usdhc2 {
+ pinctrl-names = "default";
+ pinctrl-0 = <&pinctrl_usdhc2>;
+ non-removable;
+ status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6qdl-wandboard-revc1.dtsi
b/arch/arm/boot/dts/imx6qdl-wandboard-revc1.dtsi
new file mode 100644
index 0000000..1d9b1db
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-wandboard-revc1.dtsi
@@ -0,0 +1,41 @@
+/*
+ * Copyright 2013 Freescale Semiconductor, Inc.
+ *
+ * Author: Fabio Estevam <fabio.estevam@freescale.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include "imx6qdl-wandboard.dtsi"
+
+&iomuxc {
+ pinctrl-0 = <&pinctrl_hog>;
+
+ imx6qdl-wandboard {
+ pinctrl_hog: hoggrp {
+ fsl,pins = <
+ MX6QDL_PAD_GPIO_0__CCM_CLKO1 0x130b0 /* GPIO_0_CLKO */
+ MX6QDL_PAD_GPIO_2__GPIO1_IO02 0x80000000 /* uSDHC1 CD */
+ MX6QDL_PAD_EIM_DA9__GPIO3_IO09 0x80000000 /* uSDHC3 CD */
+ MX6QDL_PAD_CSI0_DAT14__GPIO6_IO00 0x80000000 /* WIFI_ON (reset, active
low) */
+ MX6QDL_PAD_ENET_RXD1__GPIO1_IO26 0x80000000 /* WL_REG_ON (unused) */
+ MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x80000000 /* WL_HOST_WAKE, input */
+ MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31 0x80000000 /* GPIO5_IO31 (Wifi Power
Enable) */
+ MX6QDL_PAD_ENET_TXD0__GPIO1_IO30 0x80000000 /* WL_WAKE (unused) */
+ MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21 0x80000000 /* BT_ON */
+ MX6QDL_PAD_CSI0_DAT12__GPIO5_IO30 0x80000000 /* BT_WAKE */
+ MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20 0x80000000 /* BT_HOST_WAKE */
+ MX6QDL_PAD_EIM_D29__GPIO3_IO29 0x80000000 /* RGMII_nRST */
+ >;
+ };
+ };
+};
+
+&usdhc2 {
+ pinctrl-names = "default";
+ pinctrl-0 = <&pinctrl_usdhc2>;
+ status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
index bdfdf89..2aa9fbf 100644
--- a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
@@ -79,22 +79,8 @@

 &iomuxc {
  pinctrl-names = "default";
- pinctrl-0 = <&pinctrl_hog>;

  imx6qdl-wandboard {
- pinctrl_hog: hoggrp {
- fsl,pins = <
- MX6QDL_PAD_GPIO_0__CCM_CLKO1  0x130b0
- MX6QDL_PAD_GPIO_2__GPIO1_IO02 0x80000000
- MX6QDL_PAD_EIM_DA9__GPIO3_IO09 0x80000000
- MX6QDL_PAD_EIM_EB1__GPIO2_IO29   0x80000000 /* WL_REF_ON */
- MX6QDL_PAD_EIM_A25__GPIO5_IO02   0x80000000 /* WL_RST_N */
- MX6QDL_PAD_ENET_RXD1__GPIO1_IO26 0x80000000 /* WL_REG_ON */
- MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x80000000 /* WL_HOST_WAKE */
- MX6QDL_PAD_ENET_TXD0__GPIO1_IO30 0x80000000 /* WL_WAKE */
- MX6QDL_PAD_EIM_D29__GPIO3_IO29   0x80000000
- >;
- };

  pinctrl_audmux: audmuxgrp {
  fsl,pins = <
@@ -250,13 +236,6 @@
  status = "okay";
 };

-&usdhc2 {
- pinctrl-names = "default";
- pinctrl-0 = <&pinctrl_usdhc2>;
- non-removable;
- status = "okay";
-};
-
 &usdhc3 {
  pinctrl-names = "default";
  pinctrl-0 = <&pinctrl_usdhc3>;

--001a113a0b224a60c104fda48a91
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The rev C1 Wandboard uses the Broadcom 4330 for WiFi =
and Bluetooth instead of</div><div>the 4329. =C2=A0This changes the PADS as=
signed for the control lines. =C2=A0Another</div><div>side effect of the ch=
ange is that on the rev C1 board, usdhc driver can&#39;t</div>


<div>detect the chip presence correctly so usdhc2 now needs its &#39;non-re=
moveable&#39;</div><div>property removed.</div><div><br></div><div>So that =
rev B1 and earlier can continue to work, this patch splits the</div><div>


board-specific definitions from imx6qdl-wandboard.dtsi into</div><div>imx6q=
dl-wandboard-revb1.dtsi and imx6qdl-wandboard-revc1.dtsi. =C2=A0The new fil=
es</div><div>include the original base imx6qdl-wandboard.dtsi which retains=
 the common</div>


<div>definitions. =C2=A0</div><div><br></div><div>The existing imx6dl-wandb=
oard.dts includes imx6qdl-wandboard-revc1.dtsi and=C2=A0</div><div>imx6dl-w=
andboard-revb1.dts (new) includes imx6qdl-wandboard-revb1.dtsi.</div><div>T=
his makes the rev C1 board the new default. =C2=A0The same pattern is used =
for=C2=A0</div>


<div>imx6q-wandboard.dts.</div><div><br></div><div>So, from U-Boot on a WB-=
Quad you use imxq-wandboard-revb1.dtb for the older B1</div><div>board and =
imxq-wandboard.dtb for the current rev C1 board.</div><div><br></div><div>


Signed-off-by: George Joseph &lt;<a href=3D"mailto:george.joseph@fairview5.=
com" target=3D"_blank" onclick=3D"window.open(&#39;https://mail.google.com/=
mail/?view=3Dcm&amp;tf=3D1&amp;to=3Dgeorge.joseph@fairview5.com&amp;cc=3D&a=
mp;bcc=3D&amp;su=3D&amp;body=3D&#39;,&#39;_blank&#39;,&#39;location=3Dyes,m=
enubar=3Dyes,resizable=3Dyes,width=3D800,height=3D600&#39;);return false;">=
george.joseph@fairview5.com</a>&gt;</div>

<div><div>---</div><div>=C2=A0arch/arm/boot/dts/imx6dl-wandboard-revb1.dts =
=C2=A0 | 22 ++++++++++++++</div><div>=C2=A0arch/arm/boot/dts/imx6dl-wandboa=
rd.dts =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-</div><div>=C2=A0arch/arm/bo=
ot/dts/imx6q-wandboard-revb1.dts =C2=A0 =C2=A0| 26 ++++++++++++++++</div>
<div>=C2=A0arch/arm/boot/dts/imx6q-wandboard.dts =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A02 +-</div><div>=C2=A0arch/arm/boot/dts/imx6qdl-wandboard-=
revb1.dtsi | 39 ++++++++++++++++++++++++</div><div>=C2=A0arch/arm/boot/dts/=
imx6qdl-wandboard-revc1.dtsi | 41 ++++++++++++++++++++++++++</div>
<div>=C2=A0arch/arm/boot/dts/imx6qdl-wandboard.dtsi =C2=A0 =C2=A0 =C2=A0 | =
21 -------------</div><div>=C2=A07 files changed, 130 insertions(+), 23 del=
etions(-)</div><div><br></div><div>diff --git a/arch/arm/boot/dts/imx6dl-wa=
ndboard-revb1.dts b/arch/arm/boot/dts/imx6dl-wandboard-revb1.dts</div>
<div>new file mode 100644</div><div>index 0000000..f607d4f</div><div>--- /d=
ev/null</div><div>+++ b/arch/arm/boot/dts/imx6dl-wandboard-revb1.dts</div><=
div>@@ -0,0 +1,22 @@</div><div>+/*</div><div>+ * Copyright 2013 Freescale S=
emiconductor, Inc.</div>
<div>+ *</div><div>+ * Author: Fabio Estevam &lt;<a href=3D"mailto:fabio.es=
tevam@freescale.com">fabio.estevam@freescale.com</a>&gt;</div><div>+ *</div=
><div>+ * This program is free software; you can redistribute it and/or mod=
ify</div>
<div>+ * it under the terms of the GNU General Public License version 2 as<=
/div><div>+ * published by the Free Software Foundation.</div><div>+ *</div=
><div>+ */</div><div>+/dts-v1/;</div><div>+#include &quot;imx6dl.dtsi&quot;=
</div>
<div>+#include &quot;imx6qdl-wandboard-revb1.dtsi&quot;</div><div>+</div><d=
iv>+/ {</div><div>+<span class=3D"" style=3D"white-space:pre">	</span>model=
 =3D &quot;Wandboard i.MX6 Dual Lite Board&quot;;</div><div>+<span class=3D=
"" style=3D"white-space:pre">	</span>compatible =3D &quot;wand,imx6dl-wandb=
oard&quot;, &quot;fsl,imx6dl&quot;;</div>
<div>+</div><div>+<span class=3D"" style=3D"white-space:pre">	</span>memory=
 {</div><div>+<span class=3D"" style=3D"white-space:pre">		</span>reg =3D &=
lt;0x10000000 0x40000000&gt;;</div><div>+<span class=3D"" style=3D"white-sp=
ace:pre">	</span>};</div>
<div>+};</div><div>diff --git a/arch/arm/boot/dts/imx6dl-wandboard.dts b/ar=
ch/arm/boot/dts/imx6dl-wandboard.dts</div><div>index e672891..bbb6167 10064=
4</div><div>--- a/arch/arm/boot/dts/imx6dl-wandboard.dts</div><div>+++ b/ar=
ch/arm/boot/dts/imx6dl-wandboard.dts</div>
<div>@@ -10,7 +10,7 @@</div><div>=C2=A0 */</div><div>=C2=A0/dts-v1/;</div><=
div>=C2=A0#include &quot;imx6dl.dtsi&quot;</div><div>-#include &quot;imx6qd=
l-wandboard.dtsi&quot;</div><div>+#include &quot;imx6qdl-wandboard-revc1.dt=
si&quot;</div>
<div>=C2=A0</div><div>=C2=A0/ {</div><div>=C2=A0<span class=3D"" style=3D"w=
hite-space:pre">	</span>model =3D &quot;Wandboard i.MX6 Dual Lite Board&quo=
t;;</div><div>diff --git a/arch/arm/boot/dts/imx6q-wandboard-revb1.dts b/ar=
ch/arm/boot/dts/imx6q-wandboard-revb1.dts</div>
<div>new file mode 100644</div><div>index 0000000..20bf3c2</div><div>--- /d=
ev/null</div><div>+++ b/arch/arm/boot/dts/imx6q-wandboard-revb1.dts</div><d=
iv>@@ -0,0 +1,26 @@</div><div>+/*</div><div>+ * Copyright 2013 Freescale Se=
miconductor, Inc.</div>
<div>+ *</div><div>+ * Author: Fabio Estevam &lt;<a href=3D"mailto:fabio.es=
tevam@freescale.com">fabio.estevam@freescale.com</a>&gt;</div><div>+ *</div=
><div>+ * This program is free software; you can redistribute it and/or mod=
ify</div>
<div>+ * it under the terms of the GNU General Public License version 2 as<=
/div><div>+ * published by the Free Software Foundation.</div><div>+ *</div=
><div>+ */</div><div>+/dts-v1/;</div><div>+#include &quot;imx6q.dtsi&quot;<=
/div>
<div>+#include &quot;imx6qdl-wandboard-revb1.dtsi&quot;</div><div>+</div><d=
iv>+/ {</div><div>+<span class=3D"" style=3D"white-space:pre">	</span>model=
 =3D &quot;Wandboard i.MX6 Quad Board&quot;;</div><div>+<span class=3D"" st=
yle=3D"white-space:pre">	</span>compatible =3D &quot;wand,imx6q-wandboard&q=
uot;, &quot;fsl,imx6q&quot;;</div>
<div>+</div><div>+<span class=3D"" style=3D"white-space:pre">	</span>memory=
 {</div><div>+<span class=3D"" style=3D"white-space:pre">		</span>reg =3D &=
lt;0x10000000 0x80000000&gt;;</div><div>+<span class=3D"" style=3D"white-sp=
ace:pre">	</span>};</div>
<div>+};</div><div>+</div><div>+&amp;sata {</div><div>+<span class=3D"" sty=
le=3D"white-space:pre">	</span>status =3D &quot;okay&quot;;</div><div>+};</=
div><div>diff --git a/arch/arm/boot/dts/imx6q-wandboard.dts b/arch/arm/boot=
/dts/imx6q-wandboard.dts</div>
<div>index 36be17f..4a8a6ee 100644</div><div>--- a/arch/arm/boot/dts/imx6q-=
wandboard.dts</div><div>+++ b/arch/arm/boot/dts/imx6q-wandboard.dts</div><d=
iv>@@ -10,7 +10,7 @@</div><div>=C2=A0 */</div><div>=C2=A0/dts-v1/;</div><di=
v>=C2=A0#include &quot;imx6q.dtsi&quot;</div>
<div>-#include &quot;imx6qdl-wandboard.dtsi&quot;</div><div>+#include &quot=
;imx6qdl-wandboard-revc1.dtsi&quot;</div><div>=C2=A0</div><div>=C2=A0/ {</d=
iv><div>=C2=A0<span class=3D"" style=3D"white-space:pre">	</span>model =3D =
&quot;Wandboard i.MX6 Quad Board&quot;;</div>
<div>diff --git a/arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi b/arch/arm=
/boot/dts/imx6qdl-wandboard-revb1.dtsi</div><div>new file mode 100644</div>=
<div>index 0000000..e44d982</div><div>--- /dev/null</div><div>+++ b/arch/ar=
m/boot/dts/imx6qdl-wandboard-revb1.dtsi</div>
<div>@@ -0,0 +1,39 @@</div><div>+/*</div><div>+ * Copyright 2013 Freescale =
Semiconductor, Inc.</div><div>+ *</div><div>+ * Author: Fabio Estevam &lt;<=
a href=3D"mailto:fabio.estevam@freescale.com">fabio.estevam@freescale.com</=
a>&gt;</div>
<div>+ *</div><div>+ * This program is free software; you can redistribute =
it and/or modify</div><div>+ * it under the terms of the GNU General Public=
 License version 2 as</div><div>+ * published by the Free Software Foundati=
on.</div>
<div>+ *</div><div>+ */</div><div>+</div><div>+#include &quot;imx6qdl-wandb=
oard.dtsi&quot;</div><div>+</div><div>+&amp;iomuxc {</div><div>+<span class=
=3D"" style=3D"white-space:pre">	</span>pinctrl-0 =3D &lt;&amp;pinctrl_hog&=
gt;;</div>
<div>+</div><div>+<span class=3D"" style=3D"white-space:pre">	</span>imx6qd=
l-wandboard {</div><div>+<span class=3D"" style=3D"white-space:pre">		</spa=
n>pinctrl_hog: hoggrp {</div><div>+<span class=3D"" style=3D"white-space:pr=
e">			</span>fsl,pins =3D &lt;</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_GPIO=
_0__CCM_CLKO1<span class=3D"" style=3D"white-space:pre">		</span>0x130b0<sp=
an class=3D"" style=3D"white-space:pre">		</span>/* GPIO_0_CLKO */</div><di=
v>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_GPIO_2_=
_GPIO1_IO02<span class=3D"" style=3D"white-space:pre">		</span>0x80000000<s=
pan class=3D"" style=3D"white-space:pre">	</span>/* uSDHC1 CD */</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_EIM_=
DA9__GPIO3_IO09<span class=3D"" style=3D"white-space:pre">		</span>0x800000=
00<span class=3D"" style=3D"white-space:pre">	</span>/* uSDHC3 CD */</div><=
div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_EIM_E=
B1__GPIO2_IO29<span class=3D"" style=3D"white-space:pre">		</span>0x8000000=
0<span class=3D"" style=3D"white-space:pre">	</span>/* WL_REF_ON */</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_EIM_=
A25__GPIO5_IO02<span class=3D"" style=3D"white-space:pre">		</span>0x800000=
00<span class=3D"" style=3D"white-space:pre">	</span>/* WL_RST_N */</div><d=
iv>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_ENET_R=
XD1__GPIO1_IO26<span class=3D"" style=3D"white-space:pre">	</span>0x8000000=
0<span class=3D"" style=3D"white-space:pre">	</span>/* WL_REG_ON */</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_ENET=
_TXD1__GPIO1_IO29<span class=3D"" style=3D"white-space:pre">	</span>0x80000=
000<span class=3D"" style=3D"white-space:pre">	</span>/* WL_HOST_WAKE */</d=
iv><div>
+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_ENET_TXD0=
__GPIO1_IO30<span class=3D"" style=3D"white-space:pre">	</span>0x80000000<s=
pan class=3D"" style=3D"white-space:pre">	</span>/* WL_WAKE */</div><div>+<=
span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_EIM_D29__GP=
IO3_IO29<span class=3D"" style=3D"white-space:pre">		</span>0x80000000<span=
 class=3D"" style=3D"white-space:pre">	</span>/* RGMII_nRST */</div>
<div>+<span class=3D"" style=3D"white-space:pre">			</span>&gt;;</div><div>=
+<span class=3D"" style=3D"white-space:pre">		</span>};</div><div>+<span cl=
ass=3D"" style=3D"white-space:pre">	</span>};</div><div>+};</div><div>+</di=
v><div>+&amp;usdhc2 {</div>
<div>+<span class=3D"" style=3D"white-space:pre">	</span>pinctrl-names =3D =
&quot;default&quot;;</div><div>+<span class=3D"" style=3D"white-space:pre">=
	</span>pinctrl-0 =3D &lt;&amp;pinctrl_usdhc2&gt;;</div><div>+<span class=
=3D"" style=3D"white-space:pre">	</span>non-removable;</div>
<div>+<span class=3D"" style=3D"white-space:pre">	</span>status =3D &quot;o=
kay&quot;;</div><div>+};</div><div>diff --git a/arch/arm/boot/dts/imx6qdl-w=
andboard-revc1.dtsi b/arch/arm/boot/dts/imx6qdl-wandboard-revc1.dtsi</div><=
div>
new file mode 100644</div><div>index 0000000..1d9b1db</div><div>--- /dev/nu=
ll</div><div>+++ b/arch/arm/boot/dts/imx6qdl-wandboard-revc1.dtsi</div><div=
>@@ -0,0 +1,41 @@</div><div>+/*</div><div>+ * Copyright 2013 Freescale Semi=
conductor, Inc.</div>
<div>+ *</div><div>+ * Author: Fabio Estevam &lt;<a href=3D"mailto:fabio.es=
tevam@freescale.com">fabio.estevam@freescale.com</a>&gt;</div><div>+ *</div=
><div>+ * This program is free software; you can redistribute it and/or mod=
ify</div>
<div>+ * it under the terms of the GNU General Public License version 2 as<=
/div><div>+ * published by the Free Software Foundation.</div><div>+ *</div=
><div>+ */</div><div>+</div><div>+#include &quot;imx6qdl-wandboard.dtsi&quo=
t;</div>
<div>+</div><div>+&amp;iomuxc {</div><div>+<span class=3D"" style=3D"white-=
space:pre">	</span>pinctrl-0 =3D &lt;&amp;pinctrl_hog&gt;;</div><div>+</div=
><div>+<span class=3D"" style=3D"white-space:pre">	</span>imx6qdl-wandboard=
 {</div>
<div>+<span class=3D"" style=3D"white-space:pre">		</span>pinctrl_hog: hogg=
rp {</div><div>+<span class=3D"" style=3D"white-space:pre">			</span>fsl,pi=
ns =3D &lt;</div><div>+<span class=3D"" style=3D"white-space:pre">				</spa=
n>MX6QDL_PAD_GPIO_0__CCM_CLKO1<span class=3D"" style=3D"white-space:pre">		=
</span>0x130b0<span class=3D"" style=3D"white-space:pre">		</span>/* GPIO_0=
_CLKO */</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_GPIO=
_2__GPIO1_IO02<span class=3D"" style=3D"white-space:pre">		</span>0x8000000=
0<span class=3D"" style=3D"white-space:pre">	</span>/* uSDHC1 CD */</div><d=
iv>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_EIM_DA=
9__GPIO3_IO09<span class=3D"" style=3D"white-space:pre">		</span>0x80000000=
<span class=3D"" style=3D"white-space:pre">	</span>/* uSDHC3 CD */</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_CSI0=
_DAT14__GPIO6_IO00<span class=3D"" style=3D"white-space:pre">	</span>0x8000=
0000<span class=3D"" style=3D"white-space:pre">	</span>/* WIFI_ON (reset, a=
ctive low) */</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_ENET=
_RXD1__GPIO1_IO26<span class=3D"" style=3D"white-space:pre">	</span>0x80000=
000<span class=3D"" style=3D"white-space:pre">	</span>/* WL_REG_ON (unused)=
 */</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_ENET=
_TXD1__GPIO1_IO29<span class=3D"" style=3D"white-space:pre">	</span>0x80000=
000<span class=3D"" style=3D"white-space:pre">	</span>/* WL_HOST_WAKE, inpu=
t */</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_CSI0=
_DAT13__GPIO5_IO31<span class=3D"" style=3D"white-space:pre">	</span>0x8000=
0000<span class=3D"" style=3D"white-space:pre">	</span>/* GPIO5_IO31 (Wifi =
Power Enable) */</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_ENET=
_TXD0__GPIO1_IO30<span class=3D"" style=3D"white-space:pre">	</span>0x80000=
000<span class=3D"" style=3D"white-space:pre">	</span>/* WL_WAKE (unused) *=
/</div><div>
+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_CSI0_VSYN=
C__GPIO5_IO21<span class=3D"" style=3D"white-space:pre">	</span>0x80000000<=
span class=3D"" style=3D"white-space:pre">	</span>/* BT_ON */</div><div>+<s=
pan class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_CSI0_DAT12__=
GPIO5_IO30<span class=3D"" style=3D"white-space:pre">	</span>0x80000000<spa=
n class=3D"" style=3D"white-space:pre">	</span>/* BT_WAKE */</div>
<div>+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_CSI0=
_DATA_EN__GPIO5_IO20<span class=3D"" style=3D"white-space:pre">	</span>0x80=
000000<span class=3D"" style=3D"white-space:pre">	</span>/* BT_HOST_WAKE */=
</div><div>
+<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_EIM_D29__=
GPIO3_IO29<span class=3D"" style=3D"white-space:pre">		</span>0x80000000<sp=
an class=3D"" style=3D"white-space:pre">	</span>/* RGMII_nRST */</div><div>=
+<span class=3D"" style=3D"white-space:pre">			</span>&gt;;</div>
<div>+<span class=3D"" style=3D"white-space:pre">		</span>};</div><div>+<sp=
an class=3D"" style=3D"white-space:pre">	</span>};</div><div>+};</div><div>=
+</div><div>+&amp;usdhc2 {</div><div>+<span class=3D"" style=3D"white-space=
:pre">	</span>pinctrl-names =3D &quot;default&quot;;</div>
<div>+<span class=3D"" style=3D"white-space:pre">	</span>pinctrl-0 =3D &lt;=
&amp;pinctrl_usdhc2&gt;;</div><div>+<span class=3D"" style=3D"white-space:p=
re">	</span>status =3D &quot;okay&quot;;</div><div>+};</div><div>diff --git=
 a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/imx6qdl-wan=
dboard.dtsi</div>
<div>index bdfdf89..2aa9fbf 100644</div><div>--- a/arch/arm/boot/dts/imx6qd=
l-wandboard.dtsi</div><div>+++ b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi</=
div><div>@@ -79,22 +79,8 @@</div><div>=C2=A0</div><div>=C2=A0&amp;iomuxc {<=
/div><div>
=C2=A0<span class=3D"" style=3D"white-space:pre">	</span>pinctrl-names =3D =
&quot;default&quot;;</div><div>-<span class=3D"" style=3D"white-space:pre">=
	</span>pinctrl-0 =3D &lt;&amp;pinctrl_hog&gt;;</div><div>=C2=A0</div><div>=
=C2=A0<span class=3D"" style=3D"white-space:pre">	</span>imx6qdl-wandboard =
{</div>
<div>-<span class=3D"" style=3D"white-space:pre">		</span>pinctrl_hog: hogg=
rp {</div><div>-<span class=3D"" style=3D"white-space:pre">			</span>fsl,pi=
ns =3D &lt;</div><div>-<span class=3D"" style=3D"white-space:pre">				</spa=
n>MX6QDL_PAD_GPIO_0__CCM_CLKO1 <span class=3D"" style=3D"white-space:pre">	=
</span> 0x130b0</div>
<div>-<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_GPIO=
_2__GPIO1_IO02<span class=3D"" style=3D"white-space:pre">	</span> 0x8000000=
0</div><div>-<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_P=
AD_EIM_DA9__GPIO3_IO09<span class=3D"" style=3D"white-space:pre">	</span> 0=
x80000000</div>
<div>-<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_EIM_=
EB1__GPIO2_IO29 =C2=A0 0x80000000 /* WL_REF_ON */</div><div>-<span class=3D=
"" style=3D"white-space:pre">				</span>MX6QDL_PAD_EIM_A25__GPIO5_IO02 =C2=
=A0 0x80000000 /* WL_RST_N */</div>
<div>-<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_ENET=
_RXD1__GPIO1_IO26 0x80000000 /* WL_REG_ON */</div><div>-<span class=3D"" st=
yle=3D"white-space:pre">				</span>MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x80000=
000 /* WL_HOST_WAKE */</div>
<div>-<span class=3D"" style=3D"white-space:pre">				</span>MX6QDL_PAD_ENET=
_TXD0__GPIO1_IO30 0x80000000 /* WL_WAKE */</div><div>-<span class=3D"" styl=
e=3D"white-space:pre">				</span>MX6QDL_PAD_EIM_D29__GPIO3_IO29 =C2=A0 0x80=
000000</div>
<div>-<span class=3D"" style=3D"white-space:pre">			</span>&gt;;</div><div>=
-<span class=3D"" style=3D"white-space:pre">		</span>};</div><div>=C2=A0</d=
iv><div>=C2=A0<span class=3D"" style=3D"white-space:pre">		</span>pinctrl_a=
udmux: audmuxgrp {</div>
<div>=C2=A0<span class=3D"" style=3D"white-space:pre">			</span>fsl,pins =
=3D &lt;</div><div>@@ -250,13 +236,6 @@</div><div>=C2=A0<span class=3D"" st=
yle=3D"white-space:pre">	</span>status =3D &quot;okay&quot;;</div><div>=C2=
=A0};</div><div>=C2=A0</div><div>
-&amp;usdhc2 {</div><div>-<span class=3D"" style=3D"white-space:pre">	</spa=
n>pinctrl-names =3D &quot;default&quot;;</div><div>-<span class=3D"" style=
=3D"white-space:pre">	</span>pinctrl-0 =3D &lt;&amp;pinctrl_usdhc2&gt;;</di=
v><div>-<span class=3D"" style=3D"white-space:pre">	</span>non-removable;</=
div>
<div>-<span class=3D"" style=3D"white-space:pre">	</span>status =3D &quot;o=
kay&quot;;</div><div>-};</div><div>-</div><div>=C2=A0&amp;usdhc3 {</div><di=
v>=C2=A0<span class=3D"" style=3D"white-space:pre">	</span>pinctrl-names =
=3D &quot;default&quot;;</div>
<div>=C2=A0<span class=3D"" style=3D"white-space:pre">	</span>pinctrl-0 =3D=
 &lt;&amp;pinctrl_usdhc3&gt;;</div></div><div><br></div></div>

--001a113a0b224a60c104fda48a91--
