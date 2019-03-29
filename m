From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 2/4] ARM: dts: imx7s: Specify #io-channel-cells in ADC nodes
Date: Fri, 29 Mar 2019 01:38:56 -0700
Message-ID: <20190329083858.9988-2-andrew.smirnov@gmail.com>
References: <20190329083858.9988-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329083858.9988-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Specify #io-channel-cells in ADC nodes. Needed to be able to reference
them by phandle.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 arch/arm/boot/dts/imx7s.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index e88f53a4c7f4..0e1723c95978 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -628,6 +628,7 @@
 				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX7D_ADC_ROOT_CLK>;
 				clock-names = "adc";
+				#io-channel-cells = <1>;
 				status = "disabled";
 			};
 
@@ -637,6 +638,7 @@
 				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX7D_ADC_ROOT_CLK>;
 				clock-names = "adc";
+				#io-channel-cells = <1>;
 				status = "disabled";
 			};
 
-- 
2.20.1
