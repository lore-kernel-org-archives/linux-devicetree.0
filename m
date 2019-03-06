From: Adam Ford <aford173@gmail.com>
Subject: [PATCH 2/3] ARM: DTS: imx6q-logicpd: Reduce inrush current on start
Date: Wed,  6 Mar 2019 08:04:00 -0600
Message-ID: <20190306140402.17122-2-aford173@gmail.com>
References: <20190306140402.17122-1-aford173@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306140402.17122-1-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Adam Ford <aford173@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The main 3.3V regulator sources a series of additional regulators.
This patch adds a small delay, so when the 3.3V regulator comes
on it delays a bit before the subsequent regulators can come on.
This reduces the inrush current a bit on the external DC power
supply.

Fixes: 1c207f911fe9 ("ARM: dts: imx: Add support for Logic PD
i.MX6QD EVM")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
index fb01fa6e4224..e31b6923cb72 100644
--- a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
@@ -99,6 +99,7 @@
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <70000>;
 		enable-active-high;
 		regulator-always-on;
 	};
-- 
2.17.1
