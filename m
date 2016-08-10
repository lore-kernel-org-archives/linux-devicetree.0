From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt-binding: remoteproc: Document generic properties
Date: Wed, 10 Aug 2016 10:37:02 -0700
Message-ID: <1470850622-29816-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This documents the generic properties "rprocs" and "rproc-names", used
for consumer drivers to reference a remoteproc node.

Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/remoteproc/remoteproc.txt   | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc.txt b/Documentation/devicetree/bindings/remoteproc/remoteproc.txt
new file mode 100644
index 000000000000..0b1d8183be87
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc.txt
@@ -0,0 +1,21 @@
+Common remoteproc properties
+
+A remoteproc node represents the mechanism and resources needed for controlling
+a co-processor's life cycle; including loading firmware, booting, shutting down
+and handling exceptions.
+
+
+= Consumer properties
+A consumer node referencing a remoteproc node, so that it can requests life
+cycle transitions can use the following properties:
+
+- rprocs:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: a list of phandle references to remoteproc nodes
+
+- rproc-names:
+	Usage: optional
+	Value type: <stringlist>
+	Definition: a list of strings naming each entry in "rprocs", allowing
+		    consumer drivers to look up remoteprocs by name
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
