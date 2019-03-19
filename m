From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 3/5] ARM: dts: imx50: Add PHY node for usbotg and adjust clocks
Date: Tue, 19 Mar 2019 16:24:18 +0100
Message-ID: <20190319152421.16179-4-j.neuschaefer@gmx.net>
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

Even though the ChipIdea USB controller binding[1] doesn't specify the
properties that reference a PHY as required, the Linux driver
requires[2] such a reference.

The clock situation is like on i.MX53: The USB controller is clocked
from IMX5_CLK_USBOH3_GATE and the PHY from IMX5_CLK_USB_PHY1_GATE.

[1]: Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
[2]: Search for EINVAL in drivers/usb/chipidea/ci_hdrc_imx.c

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/imx50.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx50.dtsi b/arch/arm/boot/dts/imx50.dtsi
index ee1e3e8bf4ec..e5632ce24ba0 100644
=2D-- a/arch/arm/boot/dts/imx50.dtsi
+++ b/arch/arm/boot/dts/imx50.dtsi
@@ -76,6 +76,14 @@
 		};
 	};

+	usbphy0: usbphy-0 {
+		compatible =3D "usb-nop-xceiv";
+		clocks =3D <&clks IMX5_CLK_USB_PHY1_GATE>;
+		clock-names =3D "main_clk";
+		#phy-cells =3D <0>;
+		status =3D "okay";
+	};
+
 	soc {
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
@@ -187,7 +195,8 @@
 				compatible =3D "fsl,imx50-usb", "fsl,imx27-usb";
 				reg =3D <0x53f80000 0x0200>;
 				interrupts =3D <18>;
-				clocks =3D <&clks IMX5_CLK_USB_PHY1_GATE>;
+				clocks =3D <&clks IMX5_CLK_USBOH3_GATE>;
+				fsl,usbphy =3D <&usbphy0>;
 				status =3D "disabled";
 			};

=2D-
2.20.1
