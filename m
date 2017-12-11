From: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v10 1/4] dt-bindings: media: Document Synopsys DesignWare HDMI RX
Date: Mon, 11 Dec 2017 17:41:18 +0000
Message-ID: <befe90fc55bfa4d1dc599270bc0372cf8691247a.1513013948.git.joabreu@synopsys.com>
References: <cover.1513013948.git.joabreu@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1513013948.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
In-Reply-To: <cover.1513013948.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
References: <cover.1513013948.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Joao Pinto <Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sylwester Nawrocki <snawrocki-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the bindings for the Synopsys DesignWare HDMI RX.

Signed-off-by: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (v8)
Cc: Joao Pinto <jpinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Sylwester Nawrocki <snawrocki-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
Changes from v7:
	- Remove SoC specific bindings (Rob)
Changes from v6:
	- Document which properties are required/optional (Sylwester)
	- Drop compatible string for SoC (Sylwester)
	- Reword edid-phandle property (Sylwester)
	- Typo fixes (Sylwester)
Changes from v4:
	- Use "cfg" instead of "cfg-clk" (Rob)
	- Change node names (Rob)
Changes from v3:
	- Document the new DT bindings suggested by Sylwester
Changes from v2:
	- Document edid-phandle property
---
 .../devicetree/bindings/media/snps,dw-hdmi-rx.txt  | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.txt

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.txt b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.txt
new file mode 100644
index 0000000..1dc09c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.txt
@@ -0,0 +1,58 @@
+Synopsys DesignWare HDMI RX Decoder
+===================================
+
+This document defines device tree properties for the Synopsys DesignWare HDMI
+RX Decoder (DWC HDMI RX).
+
+The properties bellow belong to the Synopsys DesignWare HDMI RX Decoder node.
+
+Required properties:
+
+- compatible: Shall be "snps,dw-hdmi-rx".
+- reg: Memory mapped base address and length of the DWC HDMI RX registers.
+- interrupts: Reference to the DWC HDMI RX interrupt and the HDMI 5V sense
+interrupt.
+- clocks: Reference to the config clock.
+- clock-names: Shall be "cfg".
+- #address-cells: Shall be 1.
+- #size-cells: Shall be 0.
+
+Optional properties:
+
+- edid-phandle: Reference to the EDID handler block; if this property is not
+specified it is assumed that EDID is handled by device described by parent
+node of the HDMI RX node. You should not specify this property if your HDMI RX
+controller does not have CEC.
+
+You also have to create a subnode for the PHY device. PHY node properties are
+as follows.
+
+Required properties:
+
+- compatible: Shall be "snps,dw-hdmi-phy-e405".
+- reg: Shall be the JTAG address of the PHY.
+- clocks: Reference to the config clock.
+- clock-names: Shall be "cfg".
+
+Example:
+
+hdmi_rx: hdmi-rx@0 {
+	compatible = "snps,dw-hdmi-rx";
+	reg = <0x0 0x10000>;
+	interrupts = <1 2>;
+	edid-phandle = <&dw_hdmi_edid>;
+
+	clocks = <&dw_hdmi_refclk>;
+	clock-names = "cfg";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi-phy@fc {
+		compatible = "snps,dw-hdmi-phy-e405";
+		reg = <0xfc>;
+
+		clocks = <&dw_hdmi_refclk>;
+		clock-names = "cfg";
+	};
+};
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
