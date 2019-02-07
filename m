From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 4/4] ARM: dts: imx6qdl-sabresd: remove reg_sensors'
 regulator-always-on
Date: Thu, 7 Feb 2019 15:18:42 +0000
Message-ID: <1549552397-22798-4-git-send-email-Anson.Huang@nxp.com>
References: <1549552397-22798-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549552397-22798-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Now that all sensors supplied by reg_sensors have supported
regulator control, reg_sensors does NOT need to be always ON,
remove "regulator-always-on" to save power.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx=
6qdl-sabresd.dtsi
index 80b9901..a070506 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -64,7 +64,6 @@
 		regulator-max-microvolt =3D <3300000>;
 		gpio =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-		regulator-always-on;
 	};
=20
 	gpio-keys {
--=20
2.7.4
