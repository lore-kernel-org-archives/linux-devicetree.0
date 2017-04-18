From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 5/7] ARM: dts: imx7d-sdb: Add GPIO expander node
Date: Tue, 18 Apr 2017 08:01:31 -0700
Message-ID: <20170418150133.31679-6-andrew.smirnov@gmail.com>
References: <20170418150133.31679-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170418150133.31679-1-andrew.smirnov@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org, yurovsky@gmail.com
List-Id: devicetree@vger.kernel.org

Add node for U38, a 74LV595PW serial-in shift register that acts as a
GPIO expander on the board.

Cc: yurovsky@gmail.com
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 arch/arm/boot/dts/imx7d-sdb.dts | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index 5be01a1..d6f2dda 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -52,6 +52,27 @@
 		reg = <0x80000000 0x80000000>;
 	};
 
+	spi4 {
+		compatible = "spi-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_spi4>;
+		gpio-sck = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		extended_io: gpio-expander@0 {
+			compatible = "fairchild,74hc595";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0>;
+			registers-number = <1>;
+			spi-max-frequency = <100000>;
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -642,5 +663,13 @@
 		fsl,pins = <
 			MX7D_PAD_LPSR_GPIO1_IO01__PWM1_OUT		0x110b0
 		>;
+
+		pinctrl_spi4: spi4grp {
+			fsl,pins = <
+				MX7D_PAD_GPIO1_IO09__GPIO1_IO9	0x59
+				MX7D_PAD_GPIO1_IO12__GPIO1_IO12	0x59
+				MX7D_PAD_GPIO1_IO13__GPIO1_IO13	0x59
+			>;
+		};
 	};
 };
-- 
2.9.3
