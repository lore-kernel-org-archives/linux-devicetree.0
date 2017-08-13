From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] drm/tve200: Add DT bindings
Date: Sun, 13 Aug 2017 17:11:29 +0200
Message-ID: <20170813151132.24736-2-linus.walleij@linaro.org>
References: <20170813151132.24736-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170813151132.24736-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the Faraday TVE200 IP block.
This IP block is present in the Gemini ARM SoC and also in some
Grain Media GMxxxx SoCs.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/display/faraday,tve200.txt | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.txt

diff --git a/Documentation/devicetree/bindings/display/faraday,tve200.txt b/Documentation/devicetree/bindings/display/faraday,tve200.txt
new file mode 100644
index 000000000000..95d588fbb2f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/faraday,tve200.txt
@@ -0,0 +1,41 @@
+* Faraday TV Encoder TVE200
+
+Required properties:
+
+- compatible: must be one of:
+	"faraday,tve200"
+	"cortina,gemini-tvc", "faraday,tve200"
+
+- reg: base address and size of the control registers block
+
+- interrupts: contains an interrupt specifier for the interrupt
+	line from the TVE200
+
+- clock-names: should contain "PCLK" for the clock line clocking the
+	silicon and "TVE" for the 27MHz clock to the video driver
+
+- clocks: contains phandle and clock specifier pairs for the entries
+	in the clock-names property. See
+	Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Optional properties:
+
+- resets: contains the reset line phandle for the block
+
+Required sub-nodes:
+
+- port: describes LCD panel signals, following the common binding
+	for video transmitter interfaces; see
+	Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+tvc@6a000000 {
+	compatible = "faraday,tve200";
+	reg = <0x6a000000 0x1000>;
+	interrupts = <13 IRQ_TYPE_EDGE_RISING>;
+	resets = <&syscon GEMINI_RESET_TVC>;
+	clocks = <&syscon GEMINI_CLK_GATE_TVC>,
+		 <&syscon GEMINI_CLK_TVC>;
+	clock-names = "PCLK", "TVE";
+};
-- 
2.13.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
