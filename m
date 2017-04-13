From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 8/8] ARM: dts: imx7d-sdb: Enable PCIe peripheral
Date: Thu, 13 Apr 2017 06:32:42 -0700
Message-ID: <20170413133242.5068-9-andrew.smirnov@gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170413133242.5068-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, yurovsky@gmail.com, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable PCIe peripheral on this board.

Cc: yurovsky@gmail.com
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
 arch/arm/boot/dts/imx7d-sdb.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index e0ff276..f77e26a 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -352,6 +352,13 @@
 	};
 };
 
+&pcie {
+	pinctrl-names = "default";
+	reset-gpio = <&gpio_spi 1 GPIO_ACTIVE_LOW>;
+	disable-gpio = <&gpio_spi 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
-- 
2.9.3
