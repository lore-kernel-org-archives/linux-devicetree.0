From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 3/3] ARM: bcm2835: Add the auxiliary clocks to the device tree.
Date: Tue, 15 Dec 2015 15:35:59 -0800
Message-ID: <1450222559-22461-3-git-send-email-eric@anholt.net>
References: <1450222559-22461-1-git-send-email-eric@anholt.net>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1450222559-22461-1-git-send-email-eric@anholt.net>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

These will be used for enabling UART1, SPI1, and SPI2.

Signed-off-by: Eric Anholt <eric@anholt.net>
---

v2: Make the binding cover both the IRQ and clock enable registers.

 arch/arm/boot/dts/bcm2835.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index aef64de..a27d40b 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -73,6 +73,13 @@
 			clocks = <&clk_osc>;
 		};
 
+		aux: aux@0x7e215000 {
+			compatible = "brcm,bcm2835-aux";
+			#clock-cells = <1>;
+			reg = <0x7e215000 0x8>;
+			clocks = <&clocks BCM2835_CLOCK_VPU>;
+		};
+
 		rng@7e104000 {
 			compatible = "brcm,bcm2835-rng";
 			reg = <0x7e104000 0x10>;
-- 
2.6.2

