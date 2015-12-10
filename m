From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: [PATCH linux-next (v3) 1/2] reset: Add brcm,bcm6345-reset device tree
 binding
Date: Thu, 10 Dec 2015 21:28:38 +0000
Message-ID: <5669EE86.8030406@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding for the BCM6345 soft reset controller.

The BCM6345 contains a soft-reset controller activated by setting
a bit (that must previously have been cleared).

Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
---
v3: Resend. Example has changed because usbh now has two compatible
    strings and uses a power domain instead of a regulator.

v2: Renamed to bcm6345, removed "mask" property.
    Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

 .../bindings/reset/brcm,bcm6345-reset.txt          | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt
new file mode 100644
index 0000000..0313040
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt
@@ -0,0 +1,33 @@
+Broadcom BCM6345 reset controller
+
+The BCM6345 contains a basic soft reset controller in the perf register
+set which resets components using a bit in a register.
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+Required properties:
+- compatible:	Should be "brcm,bcm<soc>-reset", "brcm,bcm6345-reset"
+- regmap:	The register map phandle
+- offset:	Offset in the register map for the reset register (in bytes)
+- #reset-cells:	Must be set to 1
+
+Example:
+
+periph_soft_rst: reset-controller {
+	compatible = "brcm,bcm63168-reset", "brcm,bcm6345-reset";
+	regmap = <&periph_cntl>;
+	offset = <0x10>;
+
+	#reset-cells = <1>;
+};
+
+usbh: usbphy@10002700 {
+	compatible = "brcm,bcm63168-usbh", "brcm,bcm6328-usbh";
+	reg = <0x10002700 0x38>;
+	clocks = <&periph_clk 13>, <&timer_clk 18>;
+	resets = <&periph_soft_rst 6>;
+	power-domains = <&misc_iddq_ctrl 4>;
+	#phy-cells = <0>;
+};
+
-- 
2.1.4

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
