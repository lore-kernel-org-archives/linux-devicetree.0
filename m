From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH] usb: Document clocks in samsung,exynos4210-ehci/ohci bindings
Date: Thu, 14 Mar 2013 16:00:46 -0700
Message-ID: <1363302046-31684-1-git-send-email-dianders@chromium.org>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.abraham@linaro.org>, Vivek Gautam <gautam.vivek@samsung.com>, Doug Anderson <dianders@chromium.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Jingoo Han <jg1.han@samsung.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The exynox4210-ehci and exynos4210-ohci nodes need a clock specified
using the common clock framework.  Document it.

Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 Documentation/devicetree/bindings/usb/exynos-usb.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index f66fcdd..d557cf7 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -10,6 +10,8 @@ Required properties:
  - reg: physical base address of the controller and length of memory mapped
    region.
  - interrupts: interrupt number to the cpu.
+ - clocks: from common clock binding: handle to adc clock.
+ - clock-names: from common clock binding: Shall be "usbhost".
 
 Optional properties:
  - samsung,vbus-gpio:  if present, specifies the GPIO that
@@ -22,6 +24,9 @@ Example:
 		reg = <0x12110000 0x100>;
 		interrupts = <0 71 0>;
 		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
+
+		clocks = <&clock 285>;
+		clock-names = "usbhost";
 	};
 
 OHCI
@@ -31,10 +36,15 @@ Required properties:
  - reg: physical base address of the controller and length of memory mapped
    region.
  - interrupts: interrupt number to the cpu.
+ - clocks: from common clock binding: handle to adc clock.
+ - clock-names: from common clock binding: Shall be "usbhost".
 
 Example:
 	usb@12120000 {
 		compatible = "samsung,exynos4210-ohci";
 		reg = <0x12120000 0x100>;
 		interrupts = <0 71 0>;
+
+		clocks = <&clock 285>;
+		clock-names = "usbhost";
 	};
-- 
1.8.1.3

