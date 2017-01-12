From: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] Documentation: dt: mailbox: Add Aspeed ast2400/2500 bindings
Date: Thu, 12 Jan 2017 11:29:07 +1100
Message-ID: <20170112002910.3650-2-cyrilbur@gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170112002910.3650-1-cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/mailbox/aspeed-mbox.txt    | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
new file mode 100644
index 000000000000..633cd534d91c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
@@ -0,0 +1,44 @@
+ASpeed Mailbox Driver
+=====================
+
+The ASpeed mailbox allows for communication between different
+processors. The mailbox on the ASpeed ast2400 and ast2500 is a set of
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
+information. This does not have to be the case, provided the reg
+property can give the full address of the mbox registers.
+
+Required Properties:
+--------------------
+- compatible:	Should be one of the following,
+				"aspeed,ast2400-mbox" for ast2400 SoCs
+				"aspeed,ast2500-mbox" for ast2500 SoCs
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
