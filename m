From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 1/5] mailbox: dt: Supply bindings for ST's Mailbox IP
Date: Wed, 19 Aug 2015 15:22:51 +0100
Message-ID: <1439994175-13360-2-git-send-email-lee.jones@linaro.org>
References: <1439994175-13360-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439994175-13360-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/mailbox/sti-mailbox.txt    | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/sti-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
new file mode 100644
index 0000000..9fb4400
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
@@ -0,0 +1,52 @@
+ST Microelectronics Mailbox Driver
+
+Each ST Mailbox IP currently consists of 4 instances of 32 channels.  Messages
+are passed between Application and Remote processors using shared memory.
+
+Controller
+----------
+
+Required properties:
+- compatible		: Should be "st,stih407-mailbox"
+- reg			: Offset and length of the device's register set
+- mbox-name		: Name of the mailbox
+- #mbox-cells:		: Must be 2
+			  <&phandle instance channel direction>
+			    phandle   : Label name of controller
+			    instance  : Instance number
+			    channel   : Channel number
+
+Optional properties
+- interrupts		: Contains the IRQ line for a Rx mailbox
+- tx-only		: Denotes Mailbox cannot receive messages
+
+Example:
+
+mailbox0: mailbox@0  {
+	compatible	= "st,stih407-mailbox";
+	reg		= <0x08f00000 0x1000>;
+	interrupts	= <GIC_SPI 1 IRQ_TYPE_NONE>;
+	#mbox-cells	= <2>;
+	mbox-name	= "a9";
+};
+
+Client
+------
+
+Required properties:
+- compatible		: Many (See the client docs)
+- reg			: Shared (between Application and Remote) memory address
+- mboxes		: Standard property to specify a Mailbox (See ./mailbox.txt)
+			  Cells must match 'mbox-cells' (See Controller docs above)
+
+Optional properties
+- mbox-names		: Name given to channels seen in the 'mboxes' property.
+
+Example:
+
+mailbox_test {
+	compatible	= "mailbox_test";
+	reg		= <0x[shared_memory_address], [shared_memory_size]>;
+	mboxes		= <&mailbox2 0 1>, <&mailbox0 2 1>;
+	mbox-names	= "tx",	"rx";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
