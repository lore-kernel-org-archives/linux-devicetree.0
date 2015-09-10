From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 3/3] ARM: bcm2835: Add the auxiliary clocks to the device tree.
Date: Thu, 10 Sep 2015 15:22:30 -0700
Message-ID: <1441923750-19404-4-git-send-email-eric@anholt.net>
References: <1441923750-19404-1-git-send-email-eric@anholt.net>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1441923750-19404-1-git-send-email-eric@anholt.net>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

These will be used for enabling UART1, SPI1, and SPI2.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm2835.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index a6a55b7..7c37956 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -73,6 +73,13 @@
 			clocks = <&clk_osc>;
 		};
 
+		aux_clocks: aux-clocks@0x7e215004 {
+			compatible = "brcm,bcm2835-aux-clock";
+			#clock-cells = <1>;
+			reg = <0x7e215004 0x4>;
+			clocks = <&clocks BCM2835_CLOCK_VPU>;
+		};
+
 		rng@7e104000 {
 			compatible = "brcm,bcm2835-rng";
 			reg = <0x7e104000 0x10>;
-- 
2.1.4

