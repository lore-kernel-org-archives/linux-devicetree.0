From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC 1/3] dt-binding: soc: qcom: Add binding for RFSA
Date: Sat, 22 Apr 2017 10:35:17 -0700
Message-ID: <20170422173519.5782-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds the binding for describing shared memory buffers for
implementing the remote filesystem protocol.

Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

My initial attempt was to mimic the ramoops of just adding the compatible to
the reserved-memory node, but I have not been able to figure out a sane way of
getting hold of the base address in the case that the memory region is
described my a "size" only (done on some platforms).

The problem is that we create the reserved_mem objects (and remove the
memblocks) while we're still operating on the flattened representation, so
without a phandle it doesn't seem like we have anything to perform the
comparison with later on.

 .../devicetree/bindings/soc/qcom/qcom,rfsa.txt     | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt
new file mode 100644
index 000000000000..b4de0de74e46
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt
@@ -0,0 +1,43 @@
+Qualcomm Remote File System Access binding
+
+This binding describes the Qualcomm RFSA, which serves the purpose of managing
+the shared memory region used for remote processors to access block device data
+using the Remote Filesystem protocol.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be:
+		    "qcom,rfsa"
+
+- memory-region:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: handle to memory reservation the associated rfsa region.
+
+- qcom,client-id:
+	Usage: required
+	Value type: <u32>
+	Definition: identifier of the client to use this region for buffers.
+
+= EXAMPLE
+The following example shows the RFSA setup for APQ8016, with the RFSA region
+for the Hexagon DSP (id #1) located at 0x86700000.
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		rmtfs: rmtfs@86700000 {
+			reg = <0x0 0x86700000 0x0 0xe0000>;
+			no-map;
+		};
+	};
+
+	hexagon-rfsa {
+		compatible = "qcom,rfsa";
+		memory-region = <&rmtfs>;
+
+		qcom,client-id = <1>;
+	};
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
