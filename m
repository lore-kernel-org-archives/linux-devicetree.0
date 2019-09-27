From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 4/4] ARM: dts: aspeed: ast2600: Add SCU interrupt controllers
Date: Fri, 27 Sep 2019 15:58:49 -0500
Message-ID: <1569617929-29055-5-git-send-email-eajames@linux.ibm.com>
References: <1569617929-29055-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569617929-29055-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org, maz@kernel.org, jason@lakedaemon.net, tglx@linutronix.de, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Add nodes for the interrupt controllers provided by the SCU.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 3a1422f..d89f1e6 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -159,6 +159,24 @@
 					compatible = "aspeed,ast2600-smpmem";
 					reg = <0x180 0x40>;
 				};
+
+				scu_ic0: interrupt-controller@0 {
+					#interrupt-cells = <1>;
+					compatible = "aspeed,ast2600-scu-ic0";
+					reg = <0x560 0x4>;
+					interrupt-parent = <&gic>;
+					interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-controller;
+				};
+
+				scu_ic1: interrupt-controller@1 {
+					#interrupt-cells = <1>;
+					compatible = "aspeed,ast2600-scu-ic1";
+					reg = <0x570 0x4>;
+					interrupt-parent = <&gic>;
+					interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-controller;
+				};
 			};
 
 			rng: hwrng@1e6e2524 {
-- 
1.8.3.1
