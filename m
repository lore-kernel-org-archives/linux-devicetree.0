From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH 05/16] Documentation: dt-bindings: regulator: add LM363x regulator binding information
Date: Mon, 2 Nov 2015 14:01:12 +0900
Message-ID: <1446440483-6948-6-git-send-email-milo.kim@ti.com>
References: <1446440483-6948-1-git-send-email-milo.kim@ti.com>
 <1446440483-6948-2-git-send-email-milo.kim@ti.com>
 <1446440483-6948-3-git-send-email-milo.kim@ti.com>
 <1446440483-6948-4-git-send-email-milo.kim@ti.com>
 <1446440483-6948-5-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446440483-6948-5-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org
Cc: Milo Kim <milo.kim@ti.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

This binding supports LM3631 and LM3632 regulator configuration.

Cc: devicetree@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
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
