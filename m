From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/8] dt-bindings: mailbox: add binding doc for
 the ARM SMC mailbox
Date: Fri, 30 Jun 2017 10:56:02 +0100
Message-ID: <20170630095608.24943-3-andre.przywara@arm.com>
References: <20170630095608.24943-1-andre.przywara@arm.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBHOC3DFAKGQEMB6ECWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170630095608.24943-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for the generic ARM SMC mailbox.
This is not describing hardware, but a firmware interface.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 .../devicetree/bindings/mailbox/arm-smc.txt        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/arm-smc.txt

diff --git a/Documentation/devicetree/bindings/mailbox/arm-smc.txt b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
new file mode 100644
index 0000000..90c5926
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
@@ -0,0 +1,61 @@
+ARM SMC Mailbox Driver
+======================
+
+This mailbox uses the ARM smc (secure monitor call) instruction to
+trigger a mailbox-connected activity in firmware, executing on the very same
+core as the caller. By nature this operation is synchronous and this
+mailbox provides no way for asynchronous messages to be delivered the other
+way round, from firmware to the OS. However the value of r0/w0/x0 the firmware
+returns after the smc call is delivered as a received message to the
+mailbox framework, so a synchronous communication can be established.
+
+One use case of this mailbox is the SCP interface, which uses shared memory
+to transfer commands and parameters, and a mailbox to trigger a function
+call. This allows SoCs without a separate management processor (or
+when such a processor is not available or used) to use this standardized
+interface anyway.
+
+This binding describes no hardware, but establishes a firmware interface.
+The communication follows the ARM SMC calling convention[1].
+Any core which supports the SMC or HVC instruction can be used, as long as
+a firmware component running in EL3 or EL2 is handling these calls.
+
+Mailbox Device Node:
+====================
+
+Required properties:
+--------------------
+- compatible:		Shall be "arm,smc-mbox"
+- #mbox-cells		Shall be 1 - the index of the channel needed.
+- arm,smc-func-ids	An array of 32-bit values specifying the function
+			IDs used by each mailbox channel. Those function IDs
+			follow the ARM SMC calling convention standard [1].
+			There is one identifier per channel and the number
+			of supported channels is determined by the length
+			of this array.
+
+Optional properties:
+--------------------
+- method:		A string, either:
+			"hvc": if the driver shall use an HVC call, or
+			"smc": if the driver shall use an SMC call
+			If omitted, defaults to an SMC call.
+
+Example:
+--------
+
+	mailbox: smc_mbox {
+		#mbox-cells = <1>;
+		compatible = "arm,smc-mbox";
+		identifiers = <0x82000001>, <0x82000002>;
+	};
+
+	scpi {
+		compatible = "arm,scpi";
+		mboxes = <&mailbox 0>;
+		shmem = <&cpu_scp_shmem>;
+	};
+
+
+[1]
+http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.den0028a/index.html
-- 
2.9.0
