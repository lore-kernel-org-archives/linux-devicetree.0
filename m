From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 3/4] dt-bindings: display: add Amlogic Meson DRM Bindings
Date: Wed, 30 Nov 2016 16:43:44 +0100
Message-ID: <1480520625-13269-4-git-send-email-narmstrong@baylibre.com>
References: <1480520625-13269-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480520625-13269-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Xing.Xu-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../bindings/display/meson/meson-drm.txt           | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/meson/meson-drm.txt

diff --git a/Documentation/devicetree/bindings/display/meson/meson-drm.txt b/Documentation/devicetree/bindings/display/meson/meson-drm.txt
new file mode 100644
index 0000000..e52869a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/meson/meson-drm.txt
@@ -0,0 +1,101 @@
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
+VPP: Video Post Processing
+--------------------------
+
+The Video Post Processing is in charge of the scaling and blending of the
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
+- compatible: value should be different for each SoC family as :
+	- GXBB (S905) : "amlogic,meson-gxbb-vpu"
+	- GXL (S905X, S905D) : "amlogic,meson-gxl-vpu"
+	- GXM (S912) : "amlogic,meson-gxm-vpu"
+	followed by the common "amlogic,meson-gx-vpu"
+- reg: base address and size of he following memory-mapped regions :
+	- vpu
+	- hhi
+	- dmc
+- reg-names: should contain the names of the previous memory regions
+- interrupts: should contain the VENC Vsync interrupt number
+
+- ports: A ports node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+  The first port should be connected to a CVBS connector endpoint if available.
+
+Example:
+
+tv: connector {
+	compatible = "composite-video-connector";
+	label = "cvbs";
+
+	port {
+		tv_connector_in: endpoint {
+			remote-endpoint = <&cvbs_vdac_out>;
+		};
+	};
+};
+
+vpu: vpu@d0100000 {
+	compatible = "amlogic,meson-gxbb-vpu";
+	reg = <0x0 0xd0100000 0x0 0x100000>,
+	      <0x0 0xc883c000 0x0 0x1000>,
+	      <0x0 0xc8838000 0x0 0x1000>;
+	reg-names = "vpu", "hhi", "dmc";
+	interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* CVBS VDAC output port */
+	port@0 {
+		cvbs_vdac_out: endpoint {
+			reg = <0>;
+			remote-endpoint = <&tv_connector_in>;
+		};
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
