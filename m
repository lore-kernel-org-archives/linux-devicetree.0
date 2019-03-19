From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 4/5] ARM: dts: imx50-kobo-aura: Enable USB support
Date: Tue, 19 Mar 2019 16:24:19 +0100
Message-ID: <20190319152421.16179-5-j.neuschaefer@gmx.net>
References: <20190319152421.16179-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319152421.16179-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

Enable the USBOTG controller in device mode, and also enable the
corresponding PHY. The presence of Vbus is detected via a GPIO.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/imx50-kobo-aura.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/imx50-kobo-aura.dts b/arch/arm/boot/dts/imx=
50-kobo-aura.dts
index e778a677c752..d0dc20d99d99 100644
=2D-- a/arch/arm/boot/dts/imx50-kobo-aura.dts
+++ b/arch/arm/boot/dts/imx50-kobo-aura.dts
@@ -87,6 +87,12 @@
 		>;
 	};

+	pinctrl_usbphy: usbphy {
+		fsl,pins =3D <
+			MX50_PAD_ECSPI2_SS0__GPIO4_19		0x0
+		>;
+	};
+
 	pinctrl_i2c1: i2c1 {
 		fsl,pins =3D <
 			MX50_PAD_I2C1_SCL__I2C1_SCL		0x400001fd
@@ -180,6 +186,18 @@
 	status =3D "okay";
 };

+&usbotg {
+	status =3D "okay";
+	phy_type =3D "utmi_wide";
+	dr_mode =3D "peripheral";
+};
+
+&usbphy0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usbphy>;
+	vbus-detect-gpio =3D <&gpio4 19 GPIO_ACTIVE_LOW>;
+};
+
 &i2c1 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_i2c1>;
=2D-
2.20.1
