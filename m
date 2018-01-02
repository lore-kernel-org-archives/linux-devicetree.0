From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v5 01/20] dt-bindings: mailbox: add support for mailbox client shared memory
Date: Tue,  2 Jan 2018 14:42:23 +0000
Message-ID: <1514904162-11201-2-git-send-email-sudeep.holla@arm.com>
References: <1514904162-11201-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514904162-11201-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Many users of the mailbox controllers depend on the shared memory
between the two end points to exchange the main data while using simple
doorbell mechanism to alert the end points of the presence of a message.

This patch defines device tree bindings to represent such shared memory
in a generic way.

Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 .../devicetree/bindings/mailbox/mailbox.txt        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
index be05b9746c69..af8ecee2ac68 100644
--- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/mailbox.txt
@@ -23,6 +23,11 @@ assign appropriate mailbox channel to client drivers.
 
 Optional property:
 - mbox-names: List of identifier strings for each mailbox channel.
+- shmem : List of phandle pointing to the shared memory(SHM) area between the
+	  users of these mailboxes for IPC, one for each mailbox. This shared
+	  memory can be part of any memory reserved for the purpose of this
+	  communication between the mailbox client and the remote.
+
 
 Example:
 	pwr_cntrl: power {
@@ -30,3 +35,26 @@ assign appropriate mailbox channel to client drivers.
 		mbox-names = "pwr-ctrl", "rpc";
 		mboxes = <&mailbox 0 &mailbox 1>;
 	};
+
+Example with shared memory(shmem):
+
+	sram: sram@50000000 {
+		compatible = "mmio-sram";
+		reg = <0x50000000 0x10000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x50000000 0x10000>;
+
+		cl_shmem: shmem@0 {
+			compatible = "client-shmem";
+			reg = <0x0 0x200>;
+		};
+	};
+
+	client@2e000000 {
+		...
+		mboxes = <&mailbox 0>;
+		shmem = <&cl_shmem>;
+		..
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
