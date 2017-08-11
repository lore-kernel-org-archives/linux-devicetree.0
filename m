Return-Path: <SRS0=tBDe=7N=votarytech.com=github.raspberrypi@kernel.org>
Date: Fri, 11 Aug 2017 11:30:58 +0000 (UTC)
From: VOTARY GITHUB <github.raspberrypi@votarytech.com>
Reply-To: VOTARY GITHUB <github.raspberrypi@votarytech.com>
Message-ID: <534636301.409284.1502451058701@mail.yahoo.com>
Subject: [PATCH] arm64: bcm2837 dts: enable bcm2708 frambuffer driver for
 the  raspberry pi-3
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_409283_1275492672.1502451058700"
References: <534636301.409284.1502451058701.ref@mail.yahoo.com>
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "lee@kernel.org" <lee@kernel.org>, "eric@anholt.net" <eric@anholt.net>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "rjui@broadcom.com" <rjui@broadcom.com>, "sbranden@broadcom.com" <sbranden@broadcom.com>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "github.raspberrypi@votarytech.com" <github.raspberrypi@votarytech.com>, "ijc@hellion.org.uk" <ijc@hellion.org.uk>, "andrea.merello@gmail.com" <andrea.merello@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

------=_Part_409283_1275492672.1502451058700
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>From 3200cb6fd787390df1bccf1bb1f7a67ca04136fd Mon Sep 17 00:00:00 2001
From: VT-Github-Raspberrypi <github.raspberrypi@votarytech.com>
Date: Tue, 8 Aug 2017 16:57:15 +0530
Subject: [PATCH] arm64: bcm2837 dts: enable bcm2708 frambuffer driver for t=
he
=C2=A0raspberry pi-3

This fb drivers to make rendering full boot up logs on the screen.

Fixed: https://github.com/raspberrypi/linux/issues/2156

Signed-off-by: VT-Github-Raspberrypi <github.raspberrypi@votarytech.com>
---
=C2=A0arch/arm/boot/dts/bcm2835-rpi.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++++
=C2=A0arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts | 5 +++++
=C2=A02 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835=
-rpi.dtsi
index a7b5ce1..344bd20 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -27,6 +27,13 @@
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0firmware =3D=
 <&firmware>;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0#power-domai=
n-cells =3D <1>;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0};
+
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0fb: fb {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0compatible =3D "b=
rcm,bcm2708-fb";
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0firmware =3D <&fi=
rmware>;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0status =3D "disab=
led";
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0};
+
=C2=A0=C2=A0=C2=A0 =C2=A0};
=C2=A0};
=C2=A0
diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts b/arch/arm64/=
boot/dts/broadcom/bcm2837-rpi-3-b.dts
index 19449d9..d02d9bc 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
@@ -22,6 +22,11 @@
=C2=A0&uart1 {
=C2=A0=C2=A0=C2=A0 =C2=A0status =3D "okay";
=C2=A0};
+
+&fb {
+=C2=A0=C2=A0 =C2=A0status =3D "okay";
+};
+
=C2=A0&sdhost {
=C2=A0=C2=A0=C2=A0 =C2=A0pinctrl-names =3D "default";
=C2=A0=C2=A0=C2=A0 =C2=A0pinctrl-0 =3D <&sdhost_gpio48>;
--=20
2.7.4

------=_Part_409283_1275492672.1502451058700
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:=E6=A8=99=E6=A5=B7=E9=AB=94, dfkai-sb;font-size:16px"><div id=3D=
"yui_3_16_0_ym19_1_1502450758561_11915">From 3200cb6fd787390df1bccf1bb1f7a6=
7ca04136fd Mon Sep 17 00:00:00 2001<br id=3D"yui_3_16_0_ym19_1_150245075856=
1_15043">From: VT-Github-Raspberrypi &lt;github.raspberrypi@votarytech.com&=
gt;<br id=3D"yui_3_16_0_ym19_1_1502450758561_15044">Date: Tue, 8 Aug 2017 1=
6:57:15 +0530<br id=3D"yui_3_16_0_ym19_1_1502450758561_15045">Subject: [PAT=
CH] arm64: bcm2837 dts: enable bcm2708 frambuffer driver for the<br id=3D"y=
ui_3_16_0_ym19_1_1502450758561_15046">&nbsp;raspberry pi-3<br id=3D"yui_3_1=
6_0_ym19_1_1502450758561_15047"><br id=3D"yui_3_16_0_ym19_1_1502450758561_1=
5048">This fb drivers to make rendering full boot up logs on the screen.<br=
 id=3D"yui_3_16_0_ym19_1_1502450758561_15049"><br id=3D"yui_3_16_0_ym19_1_1=
502450758561_15050">Fixed: https://github.com/raspberrypi/linux/issues/2156=
<br id=3D"yui_3_16_0_ym19_1_1502450758561_15051"><br id=3D"yui_3_16_0_ym19_=
1_1502450758561_15052">Signed-off-by: VT-Github-Raspberrypi &lt;github.rasp=
berrypi@votarytech.com&gt;<br id=3D"yui_3_16_0_ym19_1_1502450758561_15053">=
---<br id=3D"yui_3_16_0_ym19_1_1502450758561_15054">&nbsp;arch/arm/boot/dts=
/bcm2835-rpi.dtsi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 7 +++++++<br id=3D"yui_3_16_0_ym19_1_150245075=
8561_15055">&nbsp;arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts | 5 ++++=
+<br id=3D"yui_3_16_0_ym19_1_1502450758561_15056">&nbsp;2 files changed, 12=
 insertions(+)<br id=3D"yui_3_16_0_ym19_1_1502450758561_15057"><br id=3D"yu=
i_3_16_0_ym19_1_1502450758561_15058">diff --git a/arch/arm/boot/dts/bcm2835=
-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi<br id=3D"yui_3_16_0_ym19_1_1=
502450758561_15059">index a7b5ce1..344bd20 100644<br id=3D"yui_3_16_0_ym19_=
1_1502450758561_15060">--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi<br id=3D"yu=
i_3_16_0_ym19_1_1502450758561_15061">+++ b/arch/arm/boot/dts/bcm2835-rpi.dt=
si<br id=3D"yui_3_16_0_ym19_1_1502450758561_15062">@@ -27,6 +27,13 @@<br id=
=3D"yui_3_16_0_ym19_1_1502450758561_15063">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; &nbsp;firmware =3D &lt;&amp;firmware&gt;;<br id=3D=
"yui_3_16_0_ym19_1_1502450758561_15064">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; &nbsp;#power-domain-cells =3D &lt;1&gt;;<br id=3D"yui=
_3_16_0_ym19_1_1502450758561_15065">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &=
nbsp;};<br id=3D"yui_3_16_0_ym19_1_1502450758561_15066">+<br id=3D"yui_3_16=
_0_ym19_1_1502450758561_15067">+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;fb: f=
b {<br id=3D"yui_3_16_0_ym19_1_1502450758561_15068">+&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;compatible =3D "brcm,bcm2708-fb";<br id=
=3D"yui_3_16_0_ym19_1_1502450758561_15069">+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp; &nbsp;firmware =3D &lt;&amp;firmware&gt;;<br id=3D"yui_=
3_16_0_ym19_1_1502450758561_15070">+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; &nbsp;status =3D "disabled";<br id=3D"yui_3_16_0_ym19_1_1502450=
758561_15071">+&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;};<br id=3D"yui_3_16_0=
_ym19_1_1502450758561_15072">+<br id=3D"yui_3_16_0_ym19_1_1502450758561_150=
73">&nbsp;&nbsp;&nbsp; &nbsp;};<br id=3D"yui_3_16_0_ym19_1_1502450758561_15=
074">&nbsp;};<br id=3D"yui_3_16_0_ym19_1_1502450758561_15075">&nbsp;<br id=
=3D"yui_3_16_0_ym19_1_1502450758561_15076">diff --git a/arch/arm64/boot/dts=
/broadcom/bcm2837-rpi-3-b.dts b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-=
b.dts<br id=3D"yui_3_16_0_ym19_1_1502450758561_15077">index 19449d9..d02d9b=
c 100644<br id=3D"yui_3_16_0_ym19_1_1502450758561_15078">--- a/arch/arm64/b=
oot/dts/broadcom/bcm2837-rpi-3-b.dts<br id=3D"yui_3_16_0_ym19_1_15024507585=
61_15079">+++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts<br id=3D"y=
ui_3_16_0_ym19_1_1502450758561_15080">@@ -22,6 +22,11 @@<br id=3D"yui_3_16_=
0_ym19_1_1502450758561_15081">&nbsp;&amp;uart1 {<br id=3D"yui_3_16_0_ym19_1=
_1502450758561_15082">&nbsp;&nbsp;&nbsp; &nbsp;status =3D "okay";<br id=3D"=
yui_3_16_0_ym19_1_1502450758561_15083">&nbsp;};<br id=3D"yui_3_16_0_ym19_1_=
1502450758561_15084">+<br id=3D"yui_3_16_0_ym19_1_1502450758561_15085">+&am=
p;fb {<br id=3D"yui_3_16_0_ym19_1_1502450758561_15086">+&nbsp;&nbsp; &nbsp;=
status =3D "okay";<br id=3D"yui_3_16_0_ym19_1_1502450758561_15087">+};<br i=
d=3D"yui_3_16_0_ym19_1_1502450758561_15088">+<br id=3D"yui_3_16_0_ym19_1_15=
02450758561_15089">&nbsp;&amp;sdhost {<br id=3D"yui_3_16_0_ym19_1_150245075=
8561_15090">&nbsp;&nbsp;&nbsp; &nbsp;pinctrl-names =3D "default";<br id=3D"=
yui_3_16_0_ym19_1_1502450758561_15091">&nbsp;&nbsp;&nbsp; &nbsp;pinctrl-0 =
=3D &lt;&amp;sdhost_gpio48&gt;;<br id=3D"yui_3_16_0_ym19_1_1502450758561_15=
092">-- <br id=3D"yui_3_16_0_ym19_1_1502450758561_15093">2.7.4<br id=3D"yui=
_3_16_0_ym19_1_1502450758561_15095"></div></div></body></html>
------=_Part_409283_1275492672.1502451058700--
