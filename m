From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 01/10] dt-bindings: display: xlnx: Add Xilinx kms bindings
Date: Thu, 4 Jan 2018 18:05:50 -0800
Message-ID: <1515117959-18068-2-git-send-email-hyun.kwon@xilinx.com>
References: <1515117959-18068-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515117959-18068-1-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The dt binding for Xilinx DRM KMS driver.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/display/xlnx/xlnx,kms.txt    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt b/Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt
new file mode 100644
index 0000000..8dcd552
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt
@@ -0,0 +1,20 @@
+Xilinx KMS Pipeline
+-------------------
+
+Xilinx display pipelines can be designed with hardened video IPs and soft video
+IPs in programmable logic. This KMS module provides the common functionality
+of individual subdevice drivers, and glue logics between them.
+
+Required properties:
+
+- compatible: Must be "xlnx,kms".
+
+- ports: phandles for CRTC ports, using the DT bindings defined in
+  Documentation/devicetree/bindings/graph.txt.
+
+Example:
+
+	xlnx_drm: xlnx_drm {
+		compatible = "xlnx,kms";
+		ports = <&crtc_port>;
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
