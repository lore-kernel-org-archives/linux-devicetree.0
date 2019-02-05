From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH 1/2] dt-bindings: usb-xhci: Add usb-phy-port-reset property
Date: Tue,  5 Feb 2019 11:48:53 +0530
Message-ID: <1549347534-11320-2-git-send-email-srinath.mannam@broadcom.com>
References: <1549347534-11320-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549347534-11320-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add usb-phy-port-reset optional property to set quirk in xhci platform
driver which forces USB port PHY reset on port disconnect event.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index fea8b15..ecbdb15 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -40,6 +40,7 @@ Optional properties:
   - usb3-lpm-capable: determines if platform is USB3 LPM capable
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
   - imod-interval-ns: default interrupt moderation interval is 5000ns
+  - usb-phy-port-reset: set this to do USB PORT PHY reset while disconnect
   - phys : see usb-hcd.txt in the current directory
 
 additionally the properties from usb-hcd.txt (in the current directory) are
-- 
2.7.4
