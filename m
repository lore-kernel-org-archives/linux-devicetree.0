From: Benoit Cousson <b-cousson@ti.com>
Subject: [PATCH 3/4] arm/dts: OMAP3: Add interrupt-controller bindings for INTC
Date: Wed, 7 Dec 2011 21:50:48 +0100
Message-ID: <1323291049-24964-4-git-send-email-b-cousson@ti.com>
References: <1323291049-24964-1-git-send-email-b-cousson@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1323291049-24964-1-git-send-email-b-cousson@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: tony@atomide.com, rob.herring@calxeda.com
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benoit Cousson <b-cousson@ti.com>
List-Id: devicetree@vger.kernel.org

Update the DTS with the proper information required by the
INTC bindings.

- Add the number of interrupt lines
- Add the reg and the compatible entries.

Signed-off-by: Benoit Cousson <b-cousson@ti.com>
Cc: Rob Herring <rob.herring@calxeda.com>
---
 arch/arm/boot/dts/omap3.dtsi |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index d202bb5..6866dc7 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -54,10 +54,12 @@
 		ranges;
 		ti,hwmods = "l3_main";
 
-		intc: interrupt-controller@1 {
-			compatible = "ti,omap3-intc";
+		intc: interrupt-controller@48200000 {
+			compatible = "ti,omap2-intc";
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			ti,intc-size = <96>;
+			reg = <0x48200000 0x1000>;
 		};
 	};
 };
-- 
1.7.0.4

