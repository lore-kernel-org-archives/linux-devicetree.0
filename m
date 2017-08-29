From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: soc: qcom: Extend GLINK to cover SMEM
Date: Tue, 29 Aug 2017 16:13:36 -0700
Message-ID: <20170829231336.24454-2-bjorn.andersson@linaro.org>
References: <20170829231336.24454-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170829231336.24454-1-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In addition to using GLINK for communication with the RPM it can be
used ontop of SMEM for communicating with remoteprocs, extend the
binding to also describe this case and reference the GLINK binding from
the affected remoteproc bindings.

Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt |  7 ++++---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt |  5 +++++
 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt  | 13 +++++++------
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 75ad7b8df0b1..728e4193f7a6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -63,9 +63,10 @@ on the Qualcomm ADSP Hexagon core.
 
 
 = SUBNODES
-The adsp node may have an subnode named "smd-edge" that describes the SMD edge,
-channels and devices related to the ADSP.  See ../soc/qcom/qcom,smd.txt for
-details on how to describe the SMD edge.
+The adsp node may have an subnode named either "smd-edge" or "glink-edge" that
+describes the communication edge, channels and devices related to the ADSP.
+See ../soc/qcom/qcom,smd.txt and ../soc/qcom/qcom,glink.txt for details on how
+to describe these.
 
 
 = EXAMPLE
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 92347fe6890e..7ff3f7903f26 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -90,6 +90,11 @@ the memory regions used by the Hexagon firmware. Each sub-node must contain:
 	Value type: <phandle>
 	Definition: reference to the reserved-memory for the region
 
+The Hexagon node may also have an subnode named either "smd-edge" or
+"glink-edge" that describes the communication edge, channels and devices
+related to the Hexagon.  See ../soc/qcom/qcom,smd.txt and
+../soc/qcom/qcom,glink.txt for details on how to describe these.
+
 = EXAMPLE
 The following example describes the resources needed to boot control the
 Hexagon, as it is found on MSM8974 boards.
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
index 50fc20c6ce91..b277eca861f7 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
@@ -1,11 +1,12 @@
-Qualcomm RPM GLINK binding
+Qualcomm GLINK edge binding
 
-This binding describes the Qualcomm RPM GLINK, a fifo based mechanism for
-communication with the Resource Power Management system on various Qualcomm
-platforms.
+This binding describes a Qualcomm GLINK edge, a fifo based mechanism for
+communication between subsystem-pairs on various Qualcomm platforms. Two types
+of edges can be described by the binding; the GLINK RPM edge and a SMEM based
+edge.
 
 - compatible:
-	Usage: required
+	Usage: required for glink-rpm
 	Value type: <stringlist>
 	Definition: must be "qcom,glink-rpm"
 
@@ -16,7 +17,7 @@ platforms.
 		    signal this processor about communication related events
 
 - qcom,rpm-msg-ram:
-	Usage: required
+	Usage: required for glink-rpm
 	Value type: <prop-encoded-array>
 	Definition: handle to RPM message memory resource
 
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
