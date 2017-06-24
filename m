From: Ziping Chen <techping.chan@gmail.com>
Subject: [PATCH v3 3/3] ARM: dts: sunxi: Add R_LRADC support for A83T
Date: Sat, 24 Jun 2017 10:45:15 +0800
Message-ID: <20170624024515.4669-4-techping.chan@gmail.com>
References: <20170624024515.4669-1-techping.chan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170624024515.4669-1-techping.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@free-electrons.com, wens@csie.org, robh@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Ziping Chen <techping.chan@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Ziping Chen <techping.chan@gmail.com>

Allwinner A83T SoC has a low res adc like the one
in Allwinner A10 SoC. Now the driver has been
modified to support it.

Add support for it.

Signed-off-by: Ziping Chen <techping.chan@gmail.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 8923ba625b76..ccee83cc0610 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -301,5 +301,12 @@
 			interrupt-controller;
 			#interrupt-cells = <3>;
 		};
+
+		r_lradc: lradc@01f03c00 {
+			compatible = "allwinner,sun8i-a83t-r-lradc-keys";
+			reg = <0x01f03c00 0x100>;
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.11.0
