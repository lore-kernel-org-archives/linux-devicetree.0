From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 2/5] DT: mailbox: add binding doc for the
 ARM SMC mailbox
Date: Tue,  9 Aug 2016 12:53:00 +0100
Message-ID: <20160809115303.17032-3-andre.przywara@arm.com>
References: <20160809115303.17032-1-andre.przywara@arm.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBZMHU66QKGQEHADMWBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160809115303.17032-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 .../devicetree/bindings/mailbox/arm-smc.txt        | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/arm-smc.txt

diff --git a/Documentation/devicetree/bindings/mailbox/arm-smc.txt b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
new file mode 100644
index 0000000..9919a12
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
@@ -0,0 +1,53 @@
+ARM SMC Mailbox Driver
+======================
+
+This mailbox driver uses the ARM smc (secure monitor call) instruction to
+trigger a mailbox-connected activity in firmware running on the very same
+core as the caller. By nature this operation is synchronous and this
+driver provides no way for asynchronous messages to be delivered the other
+way round, from firmware to the OS. However the value of r0/w0 the firmware
+returns after the smc call is delivered as a received message to the
+mailbox framework, so a synchronous communication can be established.
+
+One usecase of this mailbox is the SCP interface, which uses shared memory
+to transfer commands and parameters and mailboxes to trigger a function
+call. This driver allows SoC without a separate management processor (or
+when such a processor is not available or used) to use this standardized
+interface anyway.
+
+The driver requires no special hardware, any core which supports the SMC
+instruction can be used. This requires firmware in monitor mode/EL3 to
+handle the mailbox message.
+
+Mailbox Device Node:
+====================
+
+Required properties:
+--------------------
+- compatible:		Shall be "arm,smc-mbox"
+- #mbox-cells		Shall be 1 - the index of the channel needed.
+- identifiers		An array of 32-bit values specifying the function
+			IDs used by each mailbox channel. Those function IDs
+			follow the ARM SMC calling convention standard [1].
+			There is one identifier per channel and the number
+			of supported channels is determined by the length
+			of this array.
+
+Example:
+--------
+
+	mailbox: smc_mbox {
+		#mbox-cells = <1>;
+		compatible = "arm,smc-mbox";
+		identifiers = <0x82000001 0x82000002>;
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
