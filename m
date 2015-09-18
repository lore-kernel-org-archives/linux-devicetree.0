From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 4/9] ARM: dts: Put Cygnus core components under core bus
Date: Fri, 18 Sep 2015 14:24:09 -0700
Message-ID: <1442611454-16331-5-git-send-email-rjui@broadcom.com>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442611454-16331-1-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Put all Cygnus core components into "core" node of type "simple-bus" in
bcm-cygnus.dtsi

Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 54 ++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 0a5898b..d4e2d04 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -58,6 +58,36 @@
 
 	/include/ "bcm-cygnus-clock.dtsi"
 
+	core {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		timer@19020200 {
+			compatible = "arm,cortex-a9-global-timer";
+			reg = <0x19020200 0x100>;
+			interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&periph_clk>;
+		};
+
+		gic: interrupt-controller@19021000 {
+			compatible = "arm,cortex-a9-gic";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x19021000 0x1000>,
+			      <0x19020100 0x100>;
+		};
+
+		L2: l2-cache {
+			compatible = "arm,pl310-cache";
+			reg = <0x19022000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+		};
+	};
+
 	pinctrl: pinctrl@0x0301d0c8 {
 		compatible = "brcm,cygnus-pinmux";
 		reg = <0x0301d0c8 0x30>,
@@ -225,28 +255,4 @@
 
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
