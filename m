From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 3/6] dt-bindings: mailbox: add bindings to support ARM MHU doorbells
Date: Fri, 31 May 2019 15:33:17 +0100
Message-ID: <20190531143320.8895-4-sudeep.holla@arm.com>
References: <20190531143320.8895-1-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531143320.8895-1-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jassi Brar <jassisinghbrar@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The ARM MHU has mechanism to assert interrupt signals to facilitate
inter-processor message based communication. It drives the signal using
a 32-bit register, with all 32-bits logically ORed together. It also
enables software to set, clear and check the status of each of the bits
of this register independently. Each bit of the register can be
associated with a type of event that can contribute to raising the
interrupt thereby allowing it to be used as independent doorbells.

Since the first version of this binding can't support doorbells,
this patch extends the existing binding to support them by allowing
"#mbox-cells" to be 2.

Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 .../devicetree/bindings/mailbox/arm-mhu.txt   | 39 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
index 4971f03f0b33..ba659bcc7109 100644
--- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
+++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
@@ -10,6 +10,15 @@ STAT register and the remote clears it after having read the data.
 The last channel is specified to be a 'Secure' resource, hence can't be
 used by Linux running NS.
 
+The MHU drives the interrupt signal using a 32-bit register, with all
+32-bits logically ORed together. It provides a set of registers to
+enable software to set, clear and check the status of each of the bits
+of this register independently. The use of 32 bits per interrupt line
+enables software to provide more information about the source of the
+interrupt. For example, each bit of the register can be associated with
+a type of event that can contribute to raising the interrupt. Each of
+the 32-bits can be used as "doorbell" to alert the remote processor.
+
 Mailbox Device Node:
 ====================
 
@@ -18,13 +27,21 @@ used by Linux running NS.
 - compatible:		Shall be "arm,mhu" & "arm,primecell"
 - reg:			Contains the mailbox register address range (base
 			address and length)
-- #mbox-cells		Shall be 1 - the index of the channel needed.
+- #mbox-cells		Shall be 1 - the index of the channel needed when
+			not used as set of doorbell bits.
+			Shall be 2 - the index of the channel needed, and
+			the index of the doorbell bit within the channel
+			when used in doorbell mode.
 - interrupts:		Contains the interrupt information corresponding to
-			each of the 3 links of MHU.
+			each of the 3 physical channels of MHU namely low
+			priority non-secure, high priority non-secure and
+			secure channels.
 
 Example:
 --------
 
+1. Controller which doesn't support doorbells
+
 	mhu: mailbox@2b1f0000 {
 		#mbox-cells = <1>;
 		compatible = "arm,mhu", "arm,primecell";
@@ -41,3 +58,21 @@ used by Linux running NS.
 		reg = <0 0x2e000000 0x4000>;
 		mboxes = <&mhu 1>; /* HP-NonSecure */
 	};
+
+2. Controller which supports doorbells
+
+	mhu: mailbox@2b1f0000 {
+		#mbox-cells = <2>;
+		compatible = "arm,mhu", "arm,primecell";
+		reg = <0 0x2b1f0000 0x1000>;
+		interrupts = <0 36 4>, /* LP-NonSecure */
+			     <0 35 4>; /* HP-NonSecure */
+		clocks = <&clock 0 2 1>;
+		clock-names = "apb_pclk";
+	};
+
+	mhu_client: scb@2e000000 {
+		compatible = "arm,scpi";
+		reg = <0 0x2e000000 0x200>;
+		mboxes = <&mhu 1 4>; /* HP-NonSecure 5th doorbell bit */
+	};
-- 
2.17.1
