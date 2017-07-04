From: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 4/4] dt-bindings: media: Document Synopsys Designware HDMI RX
Date: Tue,  4 Jul 2017 15:11:40 +0100
Message-ID: <d6da0a3ec47a46d30b74e9d41fb4bf9ef392d969.1499176790.git.joabreu@synopsys.com>
References: <cover.1499176790.git.joabreu@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1499176790.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
In-Reply-To: <cover.1499176790.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
References: <cover.1499176790.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Carlos Palminha <CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sylwester Nawrocki <snawrocki-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the bindings for the Synopsys Designware HDMI RX.

Signed-off-by: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Carlos Palminha <palminha-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Sylwester Nawrocki <snawrocki-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Changes from v4:
	- Use "cfg" instead of "cfg-clk" (Rob)
	- Change node names (Rob)
Changes from v3:
	- Document the new DT bindings suggested by Sylwester
Changes from v2:
	- Document edid-phandle property
---
 .../devicetree/bindings/media/snps,dw-hdmi-rx.txt  | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.txt

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.txt b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.txt
new file mode 100644
index 0000000..449b8a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.txt
@@ -0,0 +1,70 @@
+Synopsys DesignWare HDMI RX Decoder
+===================================
+
+This document defines device tree properties for the Synopsys DesignWare HDMI
+RX Decoder (DWC HDMI RX). It doesn't constitute a device tree binding
+specification by itself but is meant to be referenced by platform-specific
+device tree bindings.
+
+When referenced from platform device tree bindings the properties defined in
+this document are defined as follows.
+
+- compatible: Shall be "snps,dw-hdmi-rx".
+
+- reg: Memory mapped base address and length of the DWC HDMI RX registers.
+
+- interrupts: Reference to the DWC HDMI RX interrupt and 5v sense interrupt.
+
+- clocks: Phandle to the config clock block.
+
+- clock-names: Shall be "cfg".
+
+- edid-phandle: phandle to the EDID handler block.
+
+- #address-cells: Shall be 1.
+
+- #size-cells: Shall be 0.
+
+You also have to create a subnode for phy driver. Phy properties are as follows.
+
+- compatible: Shall be "snps,dw-hdmi-phy-e405".
+
+- reg: Shall be JTAG address of phy.
+
+- clocks: Phandle for cfg clock.
+
+- clock-names:Shall be "cfg".
+
+A sample binding is now provided. The compatible string is for a SoC which has
+has a Synopsys DesignWare HDMI RX decoder inside.
+
+Example:
+
+dw_hdmi_soc: dw-hdmi-soc@0 {
+	compatible = "snps,dw-hdmi-soc";
+	reg = <0x11c00 0x1000>; /* EDIDs */
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges;
+
+	hdmi-rx@0 {
+		compatible = "snps,dw-hdmi-rx";
+		reg = <0x0 0x10000>;
+		interrupts = <1 2>;
+		edid-phandle = <&dw_hdmi_soc>;
+
+		clocks = <&dw_hdmi_refclk>;
+		clock-names = "cfg";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hdmi-phy@fc {
+			compatible = "snps,dw-hdmi-phy-e405";
+			reg = <0xfc>;
+
+			clocks = <&dw_hdmi_refclk>;
+			clock-names = "cfg";
+		};
+	};
+};
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
