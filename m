From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sl: vddpu is NOT an always-on regulator
Date: Tue, 6 Nov 2018 09:19:41 +0000
Message-ID: <1541495675-14706-2-git-send-email-Anson.Huang@nxp.com>
References: <1541495675-14706-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541495675-14706-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Remove "regulator-always-on" property for vddpu regulator
since it can be OFF when GPU power domain is OFF.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sl.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 9bbc5b0..557d3fd 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -588,7 +588,6 @@
 					regulator-name =3D "vddpu";
 					regulator-min-microvolt =3D <725000>;
 					regulator-max-microvolt =3D <1450000>;
-					regulator-always-on;
 					anatop-reg-offset =3D <0x140>;
 					anatop-vol-bit-shift =3D <9>;
 					anatop-vol-bit-width =3D <5>;
--=20
2.7.4
