Return-Path: <SRS0=tBDe=7N=votarytech.com=github.raspberrypi@kernel.org>
Date: Fri, 11 Aug 2017 11:27:34 +0000 (UTC)
From: VOTARY GITHUB <github.raspberrypi@votarytech.com>
Reply-To: VOTARY GITHUB <github.raspberrypi@votarytech.com>
Message-ID: <55905056.400126.1502450854825@mail.yahoo.com>
Subject: [PATCH] : ARM64: bcm2837: enable sdhost in device tree for the
 Raspberry Pi 3
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_400125_344035292.1502450854824"
References: <55905056.400126.1502450854825.ref@mail.yahoo.com>
To: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "rjui@broadcom.com" <rjui@broadcom.com>, "sbranden@broadcom.com" <sbranden@broadcom.com>, "github.raspberrypi@votarytech.com" <github.raspberrypi@votarytech.com>, "eric@anholt.net" <eric@anholt.net>, "ijc@hellion.org.uk" <ijc@hellion.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "andrea.merello@gmail.com" <andrea.merello@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

------=_Part_400125_344035292.1502450854824
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>From a0eb079e9913c3290435c435ca00b988a6fe93f5 Mon Sep 17 00:00:00 2001
From: VT-Github-Raspberrypi <github.raspberrypi@votarytech.com>
Date: Mon, 7 Aug 2017 15:24:52 +0530
Subject: [PATCH] ARM64: bcm2837: enable sdhost in device tree for the

Raspberry Pi 3

Fix for https://github.com/raspberrypi/linux/issues/2151

Signed-off-by: VT-Github-Raspberrypi <github.raspberrypi@votarytech.com>
---
=C2=A0arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts | 6 ++++++
=C2=A01 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts b/arch/arm64/=
boot/dts/broadcom/bcm2837-rpi-3-b.dts
index c309633..19449d9 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
@@ -22,3 +22,9 @@
=C2=A0&uart1 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
=C2=A0};
+&sdhost {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&sdhost_gpio48>;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bus-width =3D <4>;
+};
--=20
2.7.4
------=_Part_400125_344035292.1502450854824
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:=E6=A8=99=E6=A5=B7=E9=AB=94, dfkai-sb;font-size:16px"><div id=3D=
"yiv5759316750"><div id=3D"yui_3_16_0_ym19_1_1502450758561_2879"><div style=
=3D"color:#000;background-color:#fff;font-family:=E6=A8=99=E6=A5=B7=E9=AB=
=94, dfkai-sb;font-size:16px;" id=3D"yui_3_16_0_ym19_1_1502450758561_2878">=
<div dir=3D"ltr" id=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_2925">F=
rom a0eb079e9913c3290435c435ca00b988a6fe93f5 Mon Sep 17 00:00:00 2001<br id=
=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_2896">From: VT-Github-Rasp=
berrypi &lt;github.raspberrypi@votarytech.com&gt;<br id=3D"yiv5759316750yui=
_3_16_0_ym19_1_1502448660215_2897">Date: Mon, 7 Aug 2017 15:24:52 +0530<br =
id=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_2898">Subject: [PATCH] A=
RM64: bcm2837: enable sdhost in device tree for the<br id=3D"yiv5759316750y=
ui_3_16_0_ym19_1_1502448660215_2899"><br id=3D"yiv5759316750yui_3_16_0_ym19=
_1_1502448660215_2900">Raspberry Pi 3<br id=3D"yiv5759316750yui_3_16_0_ym19=
_1_1502448660215_2901"><br id=3D"yiv5759316750yui_3_16_0_ym19_1_15024486602=
15_2902">Fix for https://github.com/raspberrypi/linux/issues/2151<br id=3D"=
yiv5759316750yui_3_16_0_ym19_1_1502448660215_2903"><br id=3D"yiv5759316750y=
ui_3_16_0_ym19_1_1502448660215_2904">Signed-off-by: VT-Github-Raspberrypi &=
lt;github.raspberrypi@votarytech.com&gt;<br id=3D"yiv5759316750yui_3_16_0_y=
m19_1_1502448660215_2905">---<br id=3D"yiv5759316750yui_3_16_0_ym19_1_15024=
48660215_2906">&nbsp;arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts | 6 +=
+++++<br id=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_2907">&nbsp;1 f=
ile changed, 6 insertions(+)<br id=3D"yiv5759316750yui_3_16_0_ym19_1_150244=
8660215_2908"><br id=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_2909">=
diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts b/arch/arm64/=
boot/dts/broadcom/bcm2837-rpi-3-b.dts<br id=3D"yiv5759316750yui_3_16_0_ym19=
_1_1502448660215_2910">index c309633..19449d9 100644<br id=3D"yiv5759316750=
yui_3_16_0_ym19_1_1502448660215_2911">--- a/arch/arm64/boot/dts/broadcom/bc=
m2837-rpi-3-b.dts<br id=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_291=
2">+++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts<br id=3D"yiv57593=
16750yui_3_16_0_ym19_1_1502448660215_2913">@@ -22,3 +22,9 @@<br id=3D"yiv57=
59316750yui_3_16_0_ym19_1_1502448660215_2914">&nbsp;&amp;uart1 {<br id=3D"y=
iv5759316750yui_3_16_0_ym19_1_1502448660215_2915">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; status =3D "okay";<br id=3D"yiv5759316750yui_3_16_0_ym19_=
1_1502448660215_2916">&nbsp;};<br id=3D"yiv5759316750yui_3_16_0_ym19_1_1502=
448660215_2917">+&amp;sdhost {<br id=3D"yiv5759316750yui_3_16_0_ym19_1_1502=
448660215_2918">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D "de=
fault";<br id=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_2919">+&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;sdhost_gpio48&gt;;<br=
 id=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_2920">+&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; status =3D "okay";<br id=3D"yiv5759316750yui_3_16_0_ym=
19_1_1502448660215_2921">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bus-width =
=3D &lt;4&gt;;<br id=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_2922">=
+};<br id=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_2923">-- <br id=
=3D"yiv5759316750yui_3_16_0_ym19_1_1502448660215_2924">2.7.4</div></div></d=
iv></div></div></body></html>
------=_Part_400125_344035292.1502450854824--
