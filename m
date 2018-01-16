From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH] dts-bindings: usb-uhci: Document newly added properties
Date: Tue, 16 Jan 2018 11:06:15 +1100
Message-ID: <1516061175.31850.140.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 4642d34a439f80e16af0d56ed6258a33abae257a
"usb/uhci: Add support for Aspeed BMC SoCs" added
support for a new #ports property, along with
Aspeed specific compatible strings. This adds
documentation for them.

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-uhci.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-uhci.txt b/Documentation/devicetree/bindings/usb/usb-uhci.txt
index 298133416c97..c1153eb38a9a 100644
--- a/Documentation/devicetree/bindings/usb/usb-uhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-uhci.txt
@@ -3,8 +3,14 @@ Generic Platform UHCI Controller
 
 Required properties:
 - compatible : "generic-uhci" (deprecated: "platform-uhci")
+  supports additional Aspeed specific workarounds by also
+  including the "aspeed,ast2400-uhci" or "aspeed,ast2500-uhci"
+  string.
 - reg : Should contain 1 register ranges(address and length)
 - interrupts : UHCI controller interrupt
+- #ports: (optional) 1 cell, number of ports (overrides
+  auto-detection which is needed among others on some Aspeed
+  parts).
 
 Example:
 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
