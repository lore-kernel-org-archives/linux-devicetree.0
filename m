From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH 3/3] ARM: dts: NSP: Add TWD Support to DT
Date: Wed, 21 Oct 2015 19:08:53 -0400
Message-ID: <1445468933-25933-4-git-send-email-jonmason@broadcom.com>
References: <1445468933-25933-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445468933-25933-1-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Add support for the ARM TWD Timer and Watchdog to the Northstar Plus
device tree.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 62bc86f..4bcdd28 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -80,6 +80,22 @@
 			interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&periph_clk>;
 		};
+
+		twd-timer@19020600 {
+			compatible = "arm,cortex-a9-twd-timer";
+			reg = <0x0600 0x20>;
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
+						  IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&periph_clk>;
+		};
+
+		twd-watchdog@19020620 {
+			compatible = "arm,cortex-a9-twd-wdt";
+			reg = <0x0620 0x20>;
+			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
+						  IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&periph_clk>;
+		};
 	};
 
 	clocks {
-- 
1.9.1
