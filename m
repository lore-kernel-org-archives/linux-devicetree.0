From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH v3 20/21] ARM: dts: imx6ull-colibri: Add touchscreen used with
 Eval Board
Date: Wed, 7 Aug 2019 08:26:46 +0000
Message-ID: <20190807082556.5013-21-philippe.schenker@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-1-philippe.schenker@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Michal_Vok=E1=E8?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This adds the common touchscreen that is used with Toradex's
Eval Boards.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

---

Changes in v3: None
Changes in v2:
- Removed f0710a, that is downstream only
- Changed to generic node name
- Better comment

 .../arm/boot/dts/imx6ull-colibri-eval-v3.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi b/arch/arm/boot=
/dts/imx6ull-colibri-eval-v3.dtsi
index d3c4809f140e..78e74bfeca1b 100644
--- a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
@@ -112,6 +112,21 @@
 &i2c1 {
 	status =3D "okay";
=20
+	/*
+	 * Touchscreen is using SODIMM 28/30, also used for PWM<B>, PWM<C>,
+	 * aka pwm2, pwm3. so if you enable touchscreen, disable the pwms
+	 */
+	touchscreen@4a {
+		compatible =3D "atmel,maxtouch";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_gpiotouch>;
+		reg =3D <0x4a>;
+		interrupt-parent =3D <&gpio4>;
+		interrupts =3D <16 IRQ_TYPE_EDGE_FALLING>;	/* SODIMM 28 */
+		reset-gpios =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;	/* SODIMM 30 */
+		status =3D "disabled";
+	};
+
 	/* M41T0M6 real time clock on carrier board */
 	m41t0m6: rtc@68 {
 		compatible =3D "st,m41t0";
@@ -188,3 +203,12 @@
 	sd-uhs-sdr104;
 	status =3D "okay";
 };
+
+&iomuxc {
+	pinctrl_gpiotouch: touchgpios {
+		fsl,pins =3D <
+			MX6UL_PAD_NAND_DQS__GPIO4_IO16		0x74
+			MX6UL_PAD_ENET1_TX_EN__GPIO2_IO05	0x14
+		>;
+	};
+};
--=20
2.22.0
