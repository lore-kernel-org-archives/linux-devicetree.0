From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/8] doc: DT: vidc: binding document for Qualcomm video driver
Date: Mon, 22 Aug 2016 16:13:32 +0300
Message-ID: <1471871619-25873-2-git-send-email-stanimir.varbanov@linaro.org>
References: <1471871619-25873-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471871619-25873-1-git-send-email-stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adds binding document for vidc video encoder/decoder driver

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/media/qcom,vidc.txt        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,vidc.txt

diff --git a/Documentation/devicetree/bindings/media/qcom,vidc.txt b/Documentation/devicetree/bindings/media/qcom,vidc.txt
new file mode 100644
index 000000000000..0d50a7b2e3ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,vidc.txt
@@ -0,0 +1,61 @@
+* Qualcomm video encoder/decoder accelerator
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: Value should contain
+			- "qcom,vidc-msm8916"
+			- "qcom,vidc-msm8996"
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: Register ranges as listed in the reg-names property
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition:
+
+- power-domains:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: A phandle and power domain specifier pairs to the
+		    power domain which is responsible for collapsing
+		    and restoring power to the peripheral
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: List of phandle and clock specifier pairs as listed
+		    in clock-names property
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: Should contain the following entries
+			- "core"  Core video accelerator clock
+			- "iface" Video accelerator AHB clock
+			- "bus"	  Video accelerator AXI clock
+- rproc:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: A phandle to remote processor responsible for
+		    firmware loading
+
+- iommus:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: A list of phandle and IOMMU specifier pairs
+
+* An Example
+	qcom,vidc@1d00000 {
+		compatible = "qcom,vidc-msm8916";
+		reg = <0x01d00000 0xff000>;
+		clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+			 <&gcc GCC_VENUS0_AHB_CLK>,
+			 <&gcc GCC_VENUS0_AXI_CLK>;
+		clock-names = "core", "iface", "bus";
+		interrupts = <GIC_SPI 44 0>;
+		power-domains = <&gcc VENUS_GDSC>;
+		rproc = <&vidc_rproc>;
+		iommus = <&apps_iommu 5>;
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
