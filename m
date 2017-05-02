From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 2/6] Documentation: devicetree: add bindings to support ARM MHU subchannels
Date: Tue,  2 May 2017 14:55:49 +0100
Message-ID: <1493733353-25812-3-git-send-email-sudeep.holla@arm.com>
References: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Alexey Klimov <alexey.klimov@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The ARM MHU has mechanism to assert interrupt signals to facilitate
inter-processor message based communication. It drives the signal using
a 32-bit register, with all 32-bits logically ORed together. It also
enables software to set, clear and check the status of each of the bits
of this register independently. Each bit of the register can be
associated with a type of event that can contribute to raising the
interrupt thereby allowing it to be used as independent subchannels.

Since the first version of this binding can't support sub-channels,
this patch extends the existing binding to support them.

Cc: Alexey Klimov <alexey.klimov@arm.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 .../devicetree/bindings/mailbox/arm-mhu.txt        | 44 ++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
index 4971f03f0b33..86a66f7918e2 100644
--- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
+++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
@@ -10,21 +10,40 @@ STAT register and the remote clears it after having read the data.
 The last channel is specified to be a 'Secure' resource, hence can't be
 used by Linux running NS.
 
+The MHU drives the interrupt signal using a 32-bit register, with all
+32-bits logically ORed together. It provides a set of registers to
+enable software to set, clear and check the status of each of the bits
+of this register independently. The use of 32 bits per interrupt line
+enables software to provide more information about the source of the
+interrupt. For example, each bit of the register can be associated with
+a type of event that can contribute to raising the interrupt.
+
 Mailbox Device Node:
 ====================
 
 Required properties:
 --------------------
-- compatible:		Shall be "arm,mhu" & "arm,primecell"
+- compatible:		Shall be "arm,primecell" and one of the below:
+			"arm,mhu" - if the controller doesn't support
+				    subchannels
+			"arm,mhu-v2" - if the controller supports subchannels
 - reg:			Contains the mailbox register address range (base
 			address and length)
-- #mbox-cells		Shall be 1 - the index of the channel needed.
+- #mbox-cells		Shall be 1 - the index of the channel needed when
+			compatible is "arm,mhu"
+			Shall be 2 - the index of the channel needed, and
+			the index of the subchannel with the channel when
+			compatible is "arm,mhu-v2"
 - interrupts:		Contains the interrupt information corresponding to
-			each of the 3 links of MHU.
+			each of the 3 physical channels of MHU namely low
+			priority non-secure, high priority non-secure and
+			secure channels.
 
 Example:
 --------
 
+1. Controller which doesn't support subchannels
+
 	mhu: mailbox@2b1f0000 {
 		#mbox-cells = <1>;
 		compatible = "arm,mhu", "arm,primecell";
@@ -41,3 +60,22 @@ used by Linux running NS.
 		reg = <0 0x2e000000 0x4000>;
 		mboxes = <&mhu 1>; /* HP-NonSecure */
 	};
+
+2. Controller which supports subchannels
+
+	mhu: mailbox@2b1f0000 {
+		#mbox-cells = <2>;
+		compatible = "arm,mhu-v2", "arm,primecell";
+		reg = <0 0x2b1f0000 0x1000>;
+		interrupts = <0 36 4>, /* LP-NonSecure */
+			     <0 35 4>, /* HP-NonSecure */
+			     <0 37 4>; /* Secure */
+		clocks = <&clock 0 2 1>;
+		clock-names = "apb_pclk";
+	};
+
+	mhu_client: scb@2e000000 {
+		compatible = "arm,scpi";
+		reg = <0 0x2e000000 0x200>;
+		mboxes = <&mhu 1 4>; /* HP-NonSecure 5th sub-channel */
+	};
-- 
2.7.4
