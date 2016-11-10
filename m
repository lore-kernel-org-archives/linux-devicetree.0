From: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv3 1/2] gpio: xilinx: dt-binding: Add clock node
Date: Thu, 10 Nov 2016 11:26:04 +0530
Message-ID: <1478757365-3311-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the clock node to the dt binding.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
v2: 
Make clocks optional
Add clock name
v3:
No change

 .../devicetree/bindings/gpio/gpio-xilinx.txt       |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
index 63bf4be..1372007 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
@@ -25,12 +25,16 @@ Optional properties:
 - xlnx,dout-default-2 : as above but the second channel
 - xlnx,gpio2-width : as above but for the second channel
 - xlnx,tri-default-2 : as above but for the second channel
+- clocks: Input clock specifier. Refer to common clock bindings.
+- clock-names: Input clock name, should be s_axi_aclk.
 
 
 Example:
 gpio: gpio@40000000 {
 	#gpio-cells = <2>;
 	compatible = "xlnx,xps-gpio-1.00.a";
+	clocks = <&clkc 15>;
+	clock-names = "s_axi_aclk";
 	gpio-controller ;
 	interrupt-parent = <&microblaze_0_intc>;
 	interrupts = < 6 2 >;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
