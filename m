From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH v4 06/21] ARM: dts: imx7-colibri: add GPIO wakeup key
Date: Mon, 12 Aug 2019 14:21:23 +0000
Message-ID: <20190812142105.1995-7-philippe.schenker@toradex.com>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812142105.1995-1-philippe.schenker@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Michal_Vok=E1=E8?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>, Philippe Schenker <philippe.schenker@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Stefan Agner <stefan.agner@toradex.com>

Add wakeup GPIO key which is able to wake the system from sleep
modes (e.g. Suspend-to-Memory).

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v4:
- Add Marcel Ziswiler's Ack

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/imx7-colibri.dtsi         |  7 ++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi b/arch/arm/boot/dt=
s/imx7-colibri-eval-v3.dtsi
index 3f2746169181..d4dbc4fc1adf 100644
--- a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
@@ -52,6 +52,20 @@
 		clock-frequency =3D <16000000>;
 	};
=20
+	gpio-keys {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_gpiokeys>;
+
+		power {
+			label =3D "Wake-Up";
+			gpios =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
+			linux,code =3D <KEY_WAKEUP>;
+			debounce-interval =3D <10>;
+			gpio-key,wakeup;
+		};
+	};
+
 	panel: panel {
 		compatible =3D "edt,et057090dhu";
 		backlight =3D <&bl>;
diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-c=
olibri.dtsi
index cab40d22d24e..5347ed38acb2 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -741,12 +741,17 @@
=20
 	pinctrl_gpio_lpsr: gpio1-grp {
 		fsl,pins =3D <
-			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1	0x59
 			MX7D_PAD_LPSR_GPIO1_IO02__GPIO1_IO2	0x59
 			MX7D_PAD_LPSR_GPIO1_IO03__GPIO1_IO3	0x59
 		>;
 	};
=20
+	pinctrl_gpiokeys: gpiokeysgrp {
+		fsl,pins =3D <
+			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1	0x19
+		>;
+	};
+
 	pinctrl_i2c1: i2c1-grp {
 		fsl,pins =3D <
 			MX7D_PAD_LPSR_GPIO1_IO05__I2C1_SDA	0x4000007f
--=20
2.22.0
