From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 04/10] dt-bindings: mailbox: Add a sunxi
 message box binding
Date: Thu, 28 Feb 2019 23:29:41 -0600
Message-ID: <20190301052947.32032-5-samuel@sholland.org>
References: <20190301052947.32032-1-samuel@sholland.org>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDA2PU6QWEARBUEG4PRQKGQED2RTVLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190301052947.32032-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This mailbox hardware is present in Allwinner sun8i, sun9i, and sun50i
SoCs. Add a device tree binding for it.

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
---
 .../bindings/mailbox/sunxi-msgbox.txt         | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/sunxi-msgbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/sunxi-msgbox.txt b/Documentation/devicetree/bindings/mailbox/sunxi-msgbox.txt
new file mode 100644
index 000000000000..4560ab8efeca
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/sunxi-msgbox.txt
@@ -0,0 +1,44 @@
+Allwinner sun6i Message Box
+===========================
+
+The hardware message box on sun6i and newer sunxi SoCs is a two-user mailbox
+controller containing 8 unidirectional FIFOs. An interrupt is raised for
+received messages, but software must poll to know when a transmitted message has
+been acknowledged by the remote user.
+
+Refer to ./mailbox.txt for generic information about mailbox device-tree
+bindings.
+
+Mailbox Device Node:
+====================
+
+Required properties:
+--------------------
+- compatible:		Must contain at least "allwinner,sun6i-a31-msgbox".
+			Should also contain another SoC-specific string when
+			used on other SoCs which are compatible, e.g.
+			- allwinner,sun6i-a31-msgbox
+			- allwinner,sun8i-a83t-msgbox, allwinner,sun6i-a31-msgbox
+			- allwinner,sun8i-h3-msgbox, allwinner,sun6i-a31-msgbox
+			- allwinner,sun9i-a80-msgbox, allwinner,sun6i-a31-msgbox
+			- allwinner,sun50i-a64-msgbox, allwinner,sun6i-a31-msgbox
+			- allwinner,sun50i-h6-msgbox, allwinner,sun6i-a31-msgbox
+- reg:			Contains the mailbox register address range (base
+			address and length).
+- clocks:		phandle for the bus clock controller and specifier.
+- resets:		phandle for the bus reset controller and specifier.
+- interrupts:		Contains interrupt information for the mailbox.
+- #mbox-cells:		Must be 1.
+
+Example:
+--------
+
+	msgbox: mailbox@1c17000 {
+		compatible = "allwinner,sun8i-h3-msgbox",
+		             "allwinner,sun6i-a31-msgbox";
+		reg = <0x01c17000 0x1000>;
+		clocks = <&ccu CLK_BUS_MSGBOX>;
+		resets = <&ccu RST_BUS_MSGBOX>;
+		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <1>;
+	};
-- 
2.19.2
