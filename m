From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 11/15] [NOT FOR MERGE] dt-bindings: Add a
 binding for a mailbox-backed interrupt controller
Date: Fri,  1 Mar 2019 22:29:47 -0600
Message-ID: <20190302042951.53671-12-samuel@sholland.org>
References: <20190302042951.53671-1-samuel@sholland.org>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDA2PU6QWEARBSEN5DRQKGQEAJ3CA4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190302042951.53671-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a somewhat generic binding for an interrupt controller/forwarder
implemented in firmware and communicated with using a mailbox.

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
---
 .../interrupt-controller/mbox-intc.txt        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mbox-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mbox-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/mbox-intc.txt
new file mode 100644
index 000000000000..a0eb7904ca83
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mbox-intc.txt
@@ -0,0 +1,33 @@
+Mailbox-backed Interrupt Controller
+===================================
+
+This binding represents an interrupt controller implemented in firmware,
+that uses a mailbox channel to signal and acknowledge interrupts.
+
+Device Node:
+============
+
+Required properties:
+--------------------
+- compatible:		Must be one of the following strings:
+			- allwinner,sunxi-msgbox-intc
+- interrupt-controller:	Signifies that this node is an interrupt controller.
+- #interrupt-cells:	Must be 1.
+- mboxes:		phandle for the mailbox controller and channel
+			specifier. If the mailbox controller has unidirectional
+			channels, two entries are required (see below).
+- mbox-names:		Only required for unidirectional mailbox channels. In
+			that case, it must contain the strings "tx" and "rx"
+			(where "tx" and "rx" are from Linux's perspective, not
+			the direction the interrupts are traveling).
+
+Example:
+--------
+
+	msgbox_intc: interrupt-controller {
+		compatible = "allwinner,sunxi-msgbox-intc";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		mboxes = <&msgbox 6>, <&msgbox 7>;
+		mbox-names = "tx", "rx";
+	};
-- 
2.19.2
