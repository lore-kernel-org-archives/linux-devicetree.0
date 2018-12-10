Return-Path: <SRS0=EUt7=OT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57134 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727027AbeLJRXb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Dec 2018 12:23:31 -0500
Date: Mon, 10 Dec 2018 09:23:27 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
Message-ID: <20181210172327.GE6707@atomide.com>
References: <20181205230356.38855-1-tony@atomide.com>
 <3f44b350-17a9-bdf7-33b4-130b6eeae5f0@ti.com>
 <48ee14e0-1361-4840-42c6-f676f2911ce6@ti.com>
 <20181210144851.GZ6707@atomide.com>
 <20181210154426.GB6707@atomide.com>
 <7e50de23-10d3-511b-a16d-4c32ba58a842@ti.com>
 <20181210162123.GC6707@atomide.com>
 <20181210163830.GD6707@atomide.com>
 <2b736366-7d16-3cd5-0216-1072784a5d36@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b736366-7d16-3cd5-0216-1072784a5d36@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

* Peter Ujfalusi <peter.ujfalusi@ti.com> [181210 17:00]:
> On 10/12/2018 18.38, Tony Lindgren wrote:
> > OK so to prevent the hwmod code from resetting gpios very
> > early, this now might become necessary. Care to try with
> > this also applied?
> 
> With this applied there is life on the console, however it ends up badly:

OK thanks for testing. I'll take a look on how to skip
early reset for omap_hwmod.c for the dts case instead of
dropping the sysc platform data.

For the LCDC, does the following revert fix it? If so,
I need to check the flags for am33xx_lcdc_hwmod
HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY.

Regards,

Tony

8< -------------------------
diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -2053,13 +2053,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xe000 0x1000>;
-
-			lcdc: lcdc@0 {
-				compatible = "ti,am33xx-tilcdc";
-				reg = <0x0 0x1000>;
-				interrupts = <36>;
-				status = "disabled";
-			};
+			status = "disabled";
 		};
 
 		target-module@10000 {			/* 0x48310000, ap 76 4e.1 */
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -393,6 +393,14 @@
 			};
 		};
 
+		lcdc: lcdc@4830e000 {
+			compatible = "ti,am33xx-tilcdc";
+			reg = <0x4830e000 0x1000>;
+			interrupts = <36>;
+			ti,hwmods = "lcdc";
+			status = "disabled";
+		};
+
 		emif: emif@4c000000 {
 			compatible = "ti,emif-am3352";
 			reg = <0x4c000000 0x1000000>;
