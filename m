From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v2 4/5] dt-bindings: usb-xhci: Add platform specific compatible for Stingray xHCI
Date: Wed, 31 Jul 2019 15:49:54 +0530
Message-ID: <1564568395-9980-5-git-send-email-srinath.mannam@broadcom.com>
References: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add Platform specific compatible, because xHCI of this SoC has an issue
with HS port which has to reset on disconnect event.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 97400e8..ee1f051 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -22,6 +22,7 @@ Required properties:
       device
     - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 or RZ/G2 compatible
       device
+    - "brcm,sr-xhci" for Stingray SoC
     - "xhci-platform" (deprecated)
 
     When compatible with the generic version, nodes must list the
-- 
2.7.4
