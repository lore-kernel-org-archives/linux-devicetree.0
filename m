From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/9] ARM: dts: imx7d-pico: Pass the USBOTG1_PWR pinctrl
Date: Sun,  2 Dec 2018 19:25:15 -0200
Message-ID: <20181202212520.16650-5-otavio@ossystems.com.br>
References: <20181202212520.16650-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181202212520.16650-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <festevam@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

Pass the USBOTG1_PWR pinctrl description in the USBOTG GPIO
controlled regulator.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/imx7d-pico.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-pico.dtsi b/arch/arm/boot/dts/imx7d-pico.dtsi
index 7319e2ecec5c..cb30bded1e4a 100644
--- a/arch/arm/boot/dts/imx7d-pico.dtsi
+++ b/arch/arm/boot/dts/imx7d-pico.dtsi
@@ -41,6 +41,8 @@
 	};
 
 	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbotg1_pwr>;
 		compatible = "regulator-fixed";
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
-- 
2.19.2
