From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v11 02/19] doc: DT: venus: binding document for Qualcomm video driver
Date: Thu, 15 Jun 2017 19:31:43 +0300
Message-ID: <1497544320-2269-3-git-send-email-stanimir.varbanov@linaro.org>
References: <1497544320-2269-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497544320-2269-1-git-send-email-stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding document for Venus video encoder/decoder driver

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/media/qcom,venus.txt       | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt

diff --git a/Documentation/devicetree/bindings/media/qcom,venus.txt b/Documentation/devicetree/bindings/media/qcom,venus.txt
new file mode 100644
index 000000000000..2693449daf73
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,venus.txt
@@ -0,0 +1,107 @@
+* Qualcomm Venus video encoder/decoder accelerators
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: Value should contain one of:
+		- "qcom,msm8916-venus"
+		- "qcom,msm8996-venus"
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: Register base address and length of the register map.
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: Should contain interrupt line number.
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: A List of phandle and clock specifier pairs as listed
+		    in clock-names property.
+- clock-names:
+	Usage: required for msm8916
+	Value type: <stringlist>
+	Definition: Should contain the following entries:
+		- "core"	Core video accelerator clock
+		- "iface"	Video accelerator AHB clock
+		- "bus"		Video accelerator AXI clock
+- clock-names:
+	Usage: required for msm8996
+	Value type: <stringlist>
+	Definition: Should contain the following entries:
+		- "core"	Core video accelerator clock
+		- "iface"	Video accelerator AHB clock
+		- "bus"		Video accelerator AXI clock
+		- "mbus"	Video MAXI clock
+- power-domains:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: A phandle and power domain specifier pairs to the
+		    power domain which is responsible for collapsing
+		    and restoring power to the peripheral.
+- iommus:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: A list of phandle and IOMMU specifier pairs.
+- memory-region:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the reserved-memory for the firmware
+		    memory region.
+
+* Subnodes
+The Venus video-codec node must contain two subnodes representing
+video-decoder and video-encoder.
+
+Every of video-encoder or video-decoder subnode should have:
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: Value should contain "venus-decoder" or "venus-encoder"
+- clocks:
+	Usage: required for msm8996
+	Value type: <prop-encoded-array>
+	Definition: A List of phandle and clock specifier pairs as listed
+		    in clock-names property.
+- clock-names:
+	Usage: required for msm8996
+	Value type: <stringlist>
+	Definition: Should contain the following entries:
+		- "core"	Subcore video accelerator clock
+
+- power-domains:
+	Usage: required for msm8996
+	Value type: <prop-encoded-array>
+	Definition: A phandle and power domain specifier pairs to the
+		    power domain which is responsible for collapsing
+		    and restoring power to the subcore.
+
+* An Example
+	video-codec@1d00000 {
+		compatible = "qcom,msm8916-venus";
+		reg = <0x01d00000 0xff000>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+			 <&gcc GCC_VENUS0_AHB_CLK>,
+			 <&gcc GCC_VENUS0_AXI_CLK>;
+		clock-names = "core", "iface", "bus";
+		power-domains = <&gcc VENUS_GDSC>;
+		iommus = <&apps_iommu 5>;
+		memory-region = <&venus_mem>;
+
+		video-decoder {
+			compatible = "venus-decoder";
+			clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+			clock-names = "core";
+			power-domains = <&mmcc VENUS_CORE0_GDSC>;
+		};
+
+		video-encoder {
+			compatible = "venus-encoder";
+			clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+			clock-names = "core";
+			power-domains = <&mmcc VENUS_CORE1_GDSC>;
+		};
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
