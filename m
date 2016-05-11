From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH v2 1/3] ARM: dts: bcm5301x: Add TWD WD Support to DT
Date: Wed, 11 May 2016 19:19:08 -0400
Message-ID: <1463008750-13902-2-git-send-email-jonmason@broadcom.com>
References: <1463008750-13902-1-git-send-email-jonmason@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463008750-13902-1-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for the ARM TWD Watchdog to the bcm5301x device tree.  The
ARM TWD timer allocated the register space for the WDT, so this patch
necessitated shrinking that.  Also, the GIC masks were added for these.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
---
 arch/arm/boot/dts/bcm5301x.dtsi | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 65a1309..4b9887f 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -66,10 +66,19 @@
 			clocks = <&periph_clk>;
 		};
 
-		local-timer@20600 {
+		timer@20600 {
 			compatible = "arm,cortex-a9-twd-timer";
-			reg = <0x20600 0x100>;
-			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x20600 0x20>;
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
+						  IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&periph_clk>;
+		};
+
+		watchdog@20620 {
+			compatible = "arm,cortex-a9-twd-wdt";
+			reg = <0x20620 0x20>;
+			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
+						  IRQ_TYPE_LEVEL_HIGH)>;
 			clocks = <&periph_clk>;
 		};
 
-- 
1.9.1
