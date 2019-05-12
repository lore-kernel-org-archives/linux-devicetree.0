From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND] ARM: dts: imx6ul: add clock-frequency to CPU node
Date: Sun, 12 May 2019 08:57:16 +0000
Message-ID: <1557651135-12109-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <6D9007DE5A2E53489B735BE3A21E20B6@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add clock-frequency property to CPU node. Avoids warnings like
"/cpus/cpu@0 missing clock-frequency property" for "arm,cortex-a7".

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No code change, just resend patch using correct encoding.
---
 arch/arm/boot/dts/imx6ul.dtsi  | 1 +
 arch/arm/boot/dts/imx6ull.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index bbf010c..fc388b8 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -59,6 +59,7 @@
 			compatible =3D "arm,cortex-a7";
 			device_type =3D "cpu";
 			reg =3D <0>;
+			clock-frequency =3D <696000000>;
 			clock-latency =3D <61036>; /* two CLK32 periods */
 			#cooling-cells =3D <2>;
 			operating-points =3D <
diff --git a/arch/arm/boot/dts/imx6ull.dtsi b/arch/arm/boot/dts/imx6ull.dts=
i
index 22e4a30..727b92f 100644
--- a/arch/arm/boot/dts/imx6ull.dtsi
+++ b/arch/arm/boot/dts/imx6ull.dtsi
@@ -12,6 +12,7 @@
 /delete-node/ &crypto;
=20
 &cpu0 {
+	clock-frequency =3D <900000000>;
 	operating-points =3D <
 		/* kHz	uV */
 		900000	1275000
--=20
2.7.4
