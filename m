From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 6/7] ARM: dts: aspeed: Add XDMA Engine
Date: Mon, 20 May 2019 15:19:24 -0500
Message-ID: <1558383565-11821-7-git-send-email-eajames@linux.ibm.com>
References: <1558383565-11821-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558383565-11821-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Add a node for the XDMA engine with all the necessary information.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 4345c31..f9e9730 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -238,6 +238,14 @@
 				interrupts = <0x19>;
 			};
 
+			xdma: xdma@1e6e7000 {
+				compatible = "aspeed,ast2500-xdma";
+				reg = <0x1e6e7000 0x100>;
+				resets = <&syscon ASPEED_RESET_XDMA>;
+				interrupts = <6>;
+				status = "disabled";
+			};
+
 			adc: adc@1e6e9000 {
 				compatible = "aspeed,ast2500-adc";
 				reg = <0x1e6e9000 0xb0>;
-- 
1.8.3.1
