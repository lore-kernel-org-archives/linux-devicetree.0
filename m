From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v5 01/20] dt-bindings: mailbox: add support for mailbox client shared memory
Date: Mon, 12 Feb 2018 18:45:05 +0000
Message-ID: <1518461124-17371-2-git-send-email-sudeep.holla@arm.com>
References: <1518461124-17371-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518461124-17371-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ALKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Alexey Klimov <klimov.linux@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Many users of the mailbox controllers depend on the shared memory
between the two end points to exchange the main data while using simple
doorbell mechanism to alert the end points of the presence of a message.

This patch defines device tree bindings to represent such shared memory
in a generic way.

Cc: Mark Rutland <mark.rutland@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
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
