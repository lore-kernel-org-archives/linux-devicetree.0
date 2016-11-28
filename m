From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH v7 2/8] drm/sun8i: Add DT bindings documentation
 of Allwinner DE2
Date: Mon, 28 Nov 2016 19:02:39 +0100
Message-ID: <92fc53084274d5ab04fe28f2dc0b16cf5d94481e.1480414715.git.moinejf@free.fr>
References: <cover.1480414715.git.moinejf@free.fr>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBVWQ6XAQKGQEKBDWCBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1480414715.git.moinejf-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
---
 .../bindings/display/sunxi/sun8i-de2.txt           | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sunxi/sun8i-de2.txt

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun8i-de2.txt b/Documentation/devicetree/bindings/display/sunxi/sun8i-de2.txt
new file mode 100644
index 0000000..edf38b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sunxi/sun8i-de2.txt
@@ -0,0 +1,121 @@
+Allwinner sun8i Display Engine 2 subsystem
+==========================================
+
+The Allwinner DE2 subsystem contains a display controller (DE2),
+one or two LCD controllers (Timing CONtrollers) and their external
+interfaces (encoders/connectors).
+
+          +-----------+
+          | DE2       |
+          |           |
+          | +-------+ |
+  plane --->|       | |   +------+
+          | | mixer |---->| TCON |---> encoder  ---> display
+  plane --->|       | |   +------+     connector     device
+          | +-------+ |
+          |           |
+          | +-------+ |
+  plane --->|       | |   +------+
+          | | mixer |---->| TCON |---> encoder  ---> display
+  plane --->|       | |   +------+     connector     device
+          | +-------+ |
+          +-----------+
+
+The DE2 contains a processor which mixes the input planes and creates
+the images which are sent to the TCONs.
+From the software point of vue, there are 2 independent real-time
+mixers, each one being statically associated to one TCON.
+
+The TCONs adjust the image format to the one of the display device.
+
+Display controller (DE2)
+========================
+
+Required properties:
+
+- compatible: value should be one of the following
+		"allwinner,sun8i-a83t-display-engine"
+		"allwinner,sun8i-h3-display-engine"
+
+- reg: base address and size of the I/O memory
+
+- clocks: must include clock specifiers corresponding to entries in the
+		clock-names property.
+
+- clock-names: must contain
+		"bus": bus gate
+		"clock": clock
+
+- resets: phandle to the reset of the device
+
+- ports: must contain a list of 2 phandles, indexed by mixer number,
+	and pointing to display interface ports of TCONs
+
+LCD controller (TCON)
+=====================
+
+Required properties:
+
+- compatible: should be
+		"allwinner,sun8i-a83t-tcon"
+
+- reg: base address and size of the I/O memory
+
+- clocks: must include clock specifiers corresponding to entries in the
+		clock-names property.
+
+- clock-names: must contain
+		"bus": bus gate
+		"clock": pixel clock
+
+- resets: phandle to the reset of the device
+
+- interrupts: interrupt number for the TCON
+
+- port: port node with endpoint definitions as defined in
+	Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	de: de-controller@01000000 {
+		compatible = "allwinner,sun8i-h3-display-engine";
+		reg = <0x01000000 0x400000>;
+		clocks = <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
+		clock-names = "bus", "clock";
+		resets = <&ccu RST_BUS_DE>;
+		ports = <&tcon0_p>, <&tcon1_p>;
+	};
+
+	tcon0: lcd-controller@01c0c000 {
+		compatible = "allwinner,sun8i-a83t-tcon";
+		reg = <0x01c0c000 0x400>;
+		clocks = <&ccu CLK_BUS_TCON0>, <&ccu CLK_TCON0>;
+		clock-names = "bus", "clock";
+		resets = <&ccu RST_BUS_TCON0>;
+		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		tcon0_p: port {
+			tcon0_hdmi: endpoint {
+				remote-endpoint = <&hdmi_tcon0>;
+			};
+		};
+	};
+
+	/* not used */
+	tcon1: lcd-controller@01c0d000 {
+		compatible = "allwinner,sun8i-h3-tcon";
+		reg = <0x01c0d000 0x400>;
+		clocks = <&ccu CLK_BUS_TCON1>,
+			 <&ccu CLK_TCON0>;	/* no clock */
+		clock-names = "bus", "clock";
+		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		tcon1_p: port {
+			endpoint {
+				/* empty */
+			};
+		};
+	};
-- 
2.10.2
