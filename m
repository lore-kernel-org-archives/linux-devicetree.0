From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 2/6] arm: dts: aspeed-g4: Add gpio controller to devicetree
Date: Tue,  6 Dec 2016 14:53:44 +1100
Message-ID: <20161206035348.29948-3-andrew@aj.id.au>
References: <20161206035348.29948-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161206035348.29948-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index b00dfc7a3bf7..20b75667286f 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -822,6 +822,16 @@
 				reg = <0x1e720000 0x8000>;	// 32K
 			};
 
+			gpio: gpio@1e780000 {
+				#gpio-cells = <2>;
+				gpio-controller;
+				compatible = "aspeed,ast2400-gpio";
+				reg = <0x1e780000 0x1000>;
+				interrupts = <20>;
+				gpio-ranges = <&pinctrl 0 0 220>;
+				interrupt-controller;
+			};
+
 			timer: timer@1e782000 {
 				compatible = "aspeed,ast2400-timer";
 				reg = <0x1e782000 0x90>;
-- 
2.9.3
