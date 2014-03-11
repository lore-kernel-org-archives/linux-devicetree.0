From: RongJun Ying <rjying-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] Documentation: Describe the SiRF audio Device Tree bindings
Date: Tue, 11 Mar 2014 10:36:27 +0800
Message-ID: <1394505387-13665-3-git-send-email-rongjun.ying@csr.com>
References: <1394505387-13665-1-git-send-email-rongjun.ying@csr.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394505387-13665-1-git-send-email-rongjun.ying-kQvG35nSl+M@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, workgroup.linux-kQvG35nSl+M@public.gmane.org, Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>

Signed-off-by: Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
---
 .../devicetree/bindings/mfd/sirf-audio.txt         |   51 ++++++++++++++++++++
 1 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/sirf-audio.txt

diff --git a/Documentation/devicetree/bindings/mfd/sirf-audio.txt b/Documentation/devicetree/bindings/mfd/sirf-audio.txt
new file mode 100644
index 0000000..ff05cb2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/sirf-audio.txt
@@ -0,0 +1,51 @@
+SiRF SoC audio modules
+
+The audio modules inside the consist of an internal audio codec, internal
+audio port and i2s controller
+
+Required properties:
+- compatible: Must be "sirf,audio"
+- reg : The register address of the device
+- #address-cells: Must be 1
+- #size-cells: Must be 1
+
+Nodes:
+Internal audio codec:
+  - compatible : "sirf,atlas6-audio-codec" or "sirf,prima2-audio-codec"
+  - clocks: A phandle reference to the SiRF internal audio codec clock
+
+Internal audio port:
+- compatible: "sirf,audio-port"
+
+I2S controller:
+- compatible: "sirf,prima2-i2s"
+- clocks: A phandle reference to the SiRF I2S controller clock
+
+Example:
+sirfaudio: sirfaudio@b0040000 {
+	compatible = "sirf,atlas6-audio";
+	reg = <0xb0040000 0x10000>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	audiocodec: audiocodec {
+		compatible = "sirf,atlas6-audio-codec";
+		interrupts = <35>;
+		clocks = <&clks 27>;
+	};
+
+	audioport: audioport {
+		compatible = "sirf,audio-port";
+		dmas = <&dmac1 3>, <&dmac1 8>;
+		dma-names = "rx", "tx";
+	};
+
+	i2s: i2s {
+		compatible = "sirf,prima2-i2s";
+		dmas = <&dmac1 6>, <&dmac1 12>;
+		dma-names = "rx", "tx";
+		clocks = <&clks 27>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s_pins_a>;
+	};
+};
-- 
1.7.5.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
