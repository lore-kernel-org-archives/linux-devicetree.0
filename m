From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH v7 4/8] drm/sunxi: Add DT bindings documentation
 of Allwinner HDMI
Date: Tue, 29 Nov 2016 10:08:25 +0100
Message-ID: <cd1caff75b6069af98680f78d672546748cb43c5.1480414715.git.moinejf@free.fr>
References: <cover.1480414715.git.moinejf@free.fr>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBV6Q6XAQKGQEHKY5OUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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
 .../devicetree/bindings/display/sunxi/hdmi.txt     | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sunxi/hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/sunxi/hdmi.txt b/Documentation/devicetree/bindings/display/sunxi/hdmi.txt
new file mode 100644
index 0000000..1e107cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sunxi/hdmi.txt
@@ -0,0 +1,56 @@
+Allwinner HDMI Transmitter
+==========================
+
+The Allwinner HDMI transmitters are included in the SoCs.
+They support audio and video.
+
+Required properties:
+ - compatible : should be one of
+		"allwinner,sun8i-a83t-hdmi"
+		"allwinner,sun8i-h3-hdmi"
+ - reg: base address and size of the I/O memory
+ - clocks : phandles to the HDMI clocks as described in
+	Documentation/devicetree/bindings/clock/clock-bindings.txt
+ - clock-names : must be
+		"bus" : bus gate
+		"clock" : streaming clock
+		"ddc-clock" : DDC clock
+ - resets : One or two phandles to the HDMI resets
+ - reset-names : when 2 phandles, must be
+		"hdmi0" and "hdmi1"
+ - #address-cells : should be <1>
+ - #size-cells : should be <0>
+
+Required nodes:
+ - port: Audio and video input port nodes with endpoint definitions
+	as defined in Documentation/devicetree/bindings/graph.txt.
+	port@0 is video and port@1 is audio.
+
+Example:
+
+	hdmi: hdmi@01ee0000 {
+		compatible = "allwinner,sun8i-a83t-hdmi";
+		reg = <0x01ee0000 0x20000>;
+		clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI>,
+			 <&ccu CLK_HDMI_DDC>;
+		clock-names = "bus", "clock", "ddc-clock";
+		resets = <&ccu RST_HDMI0>, <&ccu RST_HDMI1>;
+		reset-names = "hdmi0", "hdmi1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_pins_a>;
+		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {			/* video */
+			reg = <0>;
+			hdmi_tcon1: endpoint {
+				remote-endpoint = <&tcon1_hdmi>;
+			};
+		};
+		port@1 {			/* audio */
+			reg = <1>;
+			hdmi_i2s2: endpoint {
+				remote-endpoint = <&i2s2_hdmi>;
+			};
+		};
+	};
-- 
2.10.2
