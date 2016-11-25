From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH 3/3] dt-bindings: display: add Amlogic Meson DRM Bindings
Date: Fri, 25 Nov 2016 17:03:11 +0100
Message-ID: <1480089791-12517-4-git-send-email-narmstrong@baylibre.com>
References: <1480089791-12517-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480089791-12517-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Xing.Xu-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../bindings/display/meson/meson-drm.txt           | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/meson/meson-drm.txt

diff --git a/Documentation/devicetree/bindings/display/meson/meson-drm.txt b/Documentation/devicetree/bindings/display/meson/meson-drm.txt
new file mode 100644
index 0000000..89c1b5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/meson/meson-drm.txt
@@ -0,0 +1,134 @@
+Amlogic Meson Display Controller
+================================
+
+The Amlogic Meson Display controller is composed of several components
+that are going to be documented below:
+
+DMC|---------------VPU (Video Processing Unit)----------------|------HHI------|
+   | vd1   _______     _____________    _________________     |               |
+D  |-------|      |----|            |   |                |    |   HDMI PLL    |
+D  | vd2   | VIU  |    | Video Post |   | Video Encoders |<---|-----VCLK      |
+R  |-------|      |----| Processing |   |                |    |               |
+   | osd2  |      |    |            |---| Enci ----------|----|-----VDAC------|
+R  |-------| CSC  |----| Scalers    |   | Encp ----------|----|----HDMI-TX----|
+A  | osd1  |      |    | Blenders   |   | Encl ----------|----|---------------|
+M  |-------|______|----|____________|   |________________|    |               |
+___|__________________________________________________________|_______________|
+
+
+VIU: Video Input Unit
+---------------------
+
+The Video Input Unit is in charge of the pixel scanout from the DDR memory.
+It fetches the frames addresses, stride and parameters from the "Canvas" memory.
+This part is also in charge of the CSC (Colorspace Conversion).
+It can handle 2 OSD Planes and 2 Video Planes.
+
+VPP: Video Processing Unit
+--------------------------
+
+The Video Processing Unit is in charge if the scaling and blending of the
+various planes into a single pixel stream.
+There is a special "pre-blending" used by the video planes with a dedicated
+scaler and a "post-blending" to merge with the OSD Planes.
+The OSD planes also have a dedicated scaler for one of the OSD.
+
+VENC: Video Encoders
+--------------------
+
+The VENC is composed of the multiple pixel encoders :
+ - ENCI : Interlace Video encoder for CVBS and Interlace HDMI
+ - ENCP : Progressive Video Encoder for HDMI
+ - ENCL : LCD LVDS Encoder
+The VENC Unit gets a Pixel Clocks (VCLK) from a dedicated HDMI PLL and clock
+tree and provides the scanout clock to the VPP and VIU.
+The ENCI is connected to a single VDAC for Composite Output.
+The ENCI and ENCP are connected to an on-chip HDMI Transceiver.
+
+Device Tree Bindings:
+---------------------
+
+VPU: Video Processing Unit
+--------------------------
+
+Required properties:
+ - compatible: value should be different for each SoC family as :
+ 	- GXBB (S905) : "amlogic,meson-gxbb-vpu"
+ 	- GXL (S905X, S905D) : "amlogic,meson-gxl-vpu"
+ 	- GXM (S912) : "amlogic,meson-gxm-vpu"
+	followed by the common "amlogic,meson-gx-vpu"
+ - reg: base address and size of he following memory-mapped regions :
+	- vpu
+	- hhi
+	- dmc
+ - reg-names: should contain the names of the previous memory regions
+ - interrupts: should contain the VENC Vsync interrupt number
+
+- ports: A ports node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt. The
+  second port should be the output endpoints for VENC connectors.
+
+VENC CBVS Output
+----------------------
+
+The VENC can output Composite/CVBS output via a decicated VDAC.
+
+Required properties:
+  - compatible: value must be one of:
+ - compatible: value should be different for each SoC family as :
+ 	- GXBB (S905) : "amlogic,meson-gxbb-venc-cvbs"
+ 	- GXL (S905X, S905D) : "amlogic,meson-gxl-venc-cvbs"
+ 	- GXM (S912) : "amlogic,meson-gxm-venc-cvbs"
+	followed by the common "amlogic,meson-gx-venc-cvbs"
+
+- ports: A ports node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt. The
+  first port should be the input endpoints, connected ot the VPU node.
+
+Example:
+
+venc_cvbs: venc-cvbs {
+	compatible = "amlogic,meson-gxbb-venc-cvbs";
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		enc_cvbs_in: port@0 {
+			 #address-cells = <1>;
+			 #size-cells = <0>;
+			 reg = <0>;
+
+			 venc_cvbs_in_vpu: endpoint@0 {
+				 reg = <0>;
+				 remote-endpoint = <&vpu_out_venc_cvbs>;
+			};
+		};
+	};
+};
+
+vpu: vpu@d0100000 {
+	compatible = "amlogic,meson-gxbb-vpu";
+	reg = <0x0 0xd0100000 0x0 0x100000>,
+	      <0x0 0xc883c000 0x0 0x1000>,
+	      <0x0 0xc8838000 0x0 0x1000>;
+	reg-names = "base", "hhi", "dmc";
+	interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vpu_out: port@1 {
+			 #address-cells = <1>;
+			 #size-cells = <0>;
+			 reg = <1>;
+
+			 vpu_out_venc_cvbs: endpoint@0 {
+				 reg = <0>;
+				 remote-endpoint = <&venc_cvbs_in_vpu>;
+			 };
+		 };
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
