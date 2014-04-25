From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 11/18] xhci-platform: Add a new controller using xhci: Armada 375
Date: Fri, 25 Apr 2014 16:07:09 +0200
Message-ID: <1398434836-18908-12-git-send-email-gregory.clement@free-electrons.com>
References: <1398434836-18908-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398434836-18908-1-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Extend the compatible string list with armada-375-xhci. It is used to
describe xhci controller which is in the Armada 375 SoC.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index cbc91414fd59..87d150ca58cc 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -2,7 +2,8 @@ USB xHCI controllers
 
 Required properties:
   - compatible: should be on of "generic-xhci",
-    "marvell,armada-380-xhci" (deprecated: "xhci-platform").
+    "marvell,armada-375-xhci", "marvell,armada-380-xhci" (deprecated:
+    "xhci-platform").
   - reg: should contain address and length of the standard XHCI
     register set for the device.
   - interrupts: one XHCI interrupt should be described here.
-- 
1.8.1.2
