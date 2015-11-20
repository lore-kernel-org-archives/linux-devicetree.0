From: Tim Bird <tim.bird@sonymobile.com>
Subject: [PATCH v3 1/3] Documentation: dt-bindings: add async_irq to msm_hsusb
Date: Fri, 20 Nov 2015 15:20:39 -0800
Message-ID: <1448061641-31672-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Peter.Chen@freescale.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, balbi@ti.com, Bjorn.Andersson@sonymobile.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, tbird20d@gmail.com, tim.bird@sonymobile.com
List-Id: devicetree@vger.kernel.org

Add optional async_irq to msm_hsusb binding doc.

Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/msm-hsusb.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
index 8654a3e..bb2b304 100644
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
+        interrupt-names = "core_irq", "async_irq";
         dr_mode = "peripheral";
 
         clocks = <&gcc GCC_XO_CLK>, <&gcc GCC_USB_HS_SYSTEM_CLK>,
-- 
1.8.2.2
