From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v3 3/9] ARM: dts: Put Cygnus core components under core bus
Date: Mon, 21 Sep 2015 15:12:44 -0700
Message-ID: <1442873570-20947-4-git-send-email-rjui@broadcom.com>
References: <1442873570-20947-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442873570-20947-1-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Put all Cygnus core components into "core" node of type "simple-bus" in
bcm-cygnus.dtsi

Signed-off-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 54 ++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 30903ba..97fd305 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -58,6 +58,36 @@
 
 	/include/ "bcm-cygnus-clock.dtsi"
 
+	core {
+		compatible = "simple-bus";
+		ranges = <0x00000000 0x19000000 0x1000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		timer@20200 {
+			compatible = "arm,cortex-a9-global-timer";
+			reg = <0x20200 0x100>;
+			interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&periph_clk>;
+		};
+
+		gic: interrupt-controller@21000 {
+			compatible = "arm,cortex-a9-gic";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x21000 0x1000>,
+			      <0x20100 0x100>;
+		};
+
+		L2: l2-cache {
+			compatible = "arm,pl310-cache";
+			reg = <0x22000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+		};
+	};
+
 	pinctrl: pinctrl@0x0301d0c8 {
 		compatible = "brcm,cygnus-pinmux";
 		reg = <0x0301d0c8 0x30>,
@@ -227,28 +257,4 @@
 
 		brcm,nand-has-wp;
 	};
-
-	gic: interrupt-controller@19021000 {
-		compatible = "arm,cortex-a9-gic";
-		#interrupt-cells = <3>;
-		#address-cells = <0>;
-		interrupt-controller;
-		reg = <0x19021000 0x1000>,
-		      <0x19020100 0x100>;
-	};
-
-	L2: l2-cache {
-		compatible = "arm,pl310-cache";
-		reg = <0x19022000 0x1000>;
-		cache-unified;
-		cache-level = <2>;
-	};
-
-	timer@19020200 {
-		compatible = "arm,cortex-a9-global-timer";
-		reg = <0x19020200 0x100>;
-		interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&periph_clk>;
-	};
-
 };
-- 
1.9.1
