From: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] Documentation: dt: mailbox: Add Aspeed ast2400/2500 bindings
Date: Tue, 24 Jan 2017 15:05:32 +1100
Message-ID: <20170124040533.9144-1-cyrilbur@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
V2:
	s/ASpeed/Aspeed/
	Dropped: "This does not have to be the case, provided the reg
	  property can give the full address of the mbox registers."
	  from the "Device Node" section

 .../devicetree/bindings/mailbox/aspeed-mbox.txt    | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
new file mode 100644
index 000000000000..a447ade4ab35
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
@@ -0,0 +1,43 @@
+Aspeed Mailbox Driver
+=====================
+
+The Aspeed mailbox allows for communication between different
+processors. The mailbox on the Aspeed ast2400 and ast2500 is a set of
+16 single byte data registers along with interrupt and configuration
+registers directly on the SoC. These are memory mapped on the aspeed
+and can be accessed via the SuperIO registers on the other processor.
+
+Device Node:
+============
+This represents the mailbox on the Soc.
+
+As the mailbox registers sit on the LPC bus, it makes most sense for
+the device to be within the LPC host node. See
+Documentation/devicetree/bindings/mfd/aspeed-lpc.txt for more
+information.
+
+Required Properties:
+--------------------
+- compatible:	Should be one of the following,
+				"aspeed,ast2400-mbox" for Aspeed ast2400 SoCs
+				"aspeed,ast2500-mbox" for Aspeed ast2500 SoCs
+
+- reg:			Contains the mailbox address register range (base
+				address and length). Keeping in mind that if the node
+				exists within the LPC host node and that base is
+				relative to that.
+
+- interrupts:	Contains interrupt information for the mailbox device.
+
+- #mbox-cells:	Common property, should be 1.
+
+Example:
+--------
+
+mbox: mbox@180 {
+	compatible = "aspeed,ast2400-mbox";
+	reg = <0x180 0x5c>;
+	interrupts = <46>;
+	#mbox-cells = <1>;
+};
+
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
