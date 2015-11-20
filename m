From: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH v4 1/3] Documentation: dt-bindings: add async_irq to msm_hsusb
Date: Fri, 20 Nov 2015 15:47:18 -0800
Message-ID: <1448063240-2739-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add optional async_irq to msm_hsusb binding doc.

Signed-off-by: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/msm-hsusb.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
index 8654a3e..2d13c1c 100644
--- a/Documentation/devicetree/bindings/usb/msm-hsusb.txt
+++ b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
@@ -23,7 +23,12 @@ Required properties:
   "qcom,usb-otg-snps" for chipsets with Synopsys 28nm PHY
 
 - regs:         Offset and length of the register set in the memory map
-- interrupts:   interrupt-specifier for the OTG interrupt.
+- interrupts:   interrupt-specifier for the OTG interrupts
+
+- interrupt-names: Should contain the following:
+  "core"        USB core interrupt
+  "async"       Asynchronous interrupt to wake up from low power mode
+                (optional)
 
 - clocks:       A list of phandle + clock-specifier pairs for the
                 clocks listed in clock-names
@@ -89,7 +94,8 @@ Example HSUSB OTG controller device node:
     usb@f9a55000 {
         compatible = "qcom,usb-otg-snps";
         reg = <0xf9a55000 0x400>;
-        interrupts = <0 134 0>;
+        interrupts = <0 134 0>, <0 140 0>;
+        interrupt-names = "core", "async";
         dr_mode = "peripheral";
 
         clocks = <&gcc GCC_XO_CLK>, <&gcc GCC_USB_HS_SYSTEM_CLK>,
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
