From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: [PATCH RESEND 05/16] Documentation: dt-bindings: regulator: add LM363x regulator binding information
Date: Mon, 2 Nov 2015 14:24:24 +0900
Message-ID: <1446441875-1256-6-git-send-email-milo.kim@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446441875-1256-1-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This binding supports LM3631 and LM3632 regulator configuration.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
---
 .../bindings/regulator/lm363x-regulator.txt        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/lm363x-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt b/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
new file mode 100644
index 0000000..597716f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
@@ -0,0 +1,28 @@
+TI LMU LM363x regulator device tree bindings
+
+LM363x regulator driver supports LM3631 and LM3632.
+LM3631 has five regulators and LM3632 supports three regulators.
+
+Required properties:
+  - compatible: "ti,lm363x-regulator"
+
+Child nodes:
+  LM3631
+  - vboost
+  - vcont
+  - voref
+  - vpos
+  - vneg
+
+  LM3632
+  - vboost
+  - vpos
+  - vneg
+
+  Optional properties of each node:
+  Please refer to [1].
+
+Examples: Please refer to ti-lmu dt-bindings [2].
+
+[1] Documentation/devicetree/bindings/regulator/regulator.txt
+[2] Documentation/devicetree/bindings/mfd/ti-lmu.txt
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
