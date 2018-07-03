Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: usb-xhci: Add r8a77990 support
Date: Tue,  3 Jul 2018 19:51:47 +0900
Message-Id: <1530615107-7733-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds r8a77990 xhci support. The driver will use
the fallback compatible string "renesas,rcar-gen3-xhci".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 After we applied the following patches, the driver will use
the fallback compatible string "renesas,rcar-gen3-xhci" on
r8a77990. (If we doesn't apply the patches, the driver cannot
get the firmware name, and then the probe on r8a77990 failed.)

 https://patchwork.kernel.org/patch/10503777/
 https://patchwork.kernel.org/patch/10503781/

 Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index bd1dd31..ac4cd0d 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -14,6 +14,7 @@ Required properties:
     - "renesas,xhci-r8a7795" for r8a7795 SoC
     - "renesas,xhci-r8a7796" for r8a7796 SoC
     - "renesas,xhci-r8a77965" for r8a77965 SoC
+    - "renesas,xhci-r8a77990" for r8a77990 SoC
     - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compatible
       device
     - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 compatible device
-- 
1.9.1
