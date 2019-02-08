From: Sugaya Taichi <sugaya.taichi@socionext.com>
Subject: [PATCH v2 03/15] dt-bindings: Add documentation for Milbeaut SoCs
Date: Fri,  8 Feb 2019 21:26:04 +0900
Message-ID: <1549628764-30587-1-git-send-email-sugaya.taichi@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Sugaya Taichi <sugaya.taichi@socionext.com>
List-Id: devicetree@vger.kernel.org

This adds a DT binding documentation for the M10V and its evaluation
board.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
---
 Documentation/devicetree/bindings/arm/milbeaut.txt | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/milbeaut.txt

diff --git a/Documentation/devicetree/bindings/arm/milbeaut.txt b/Documentation/devicetree/bindings/arm/milbeaut.txt
new file mode 100644
index 0000000..9fd053a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/milbeaut.txt
@@ -0,0 +1,6 @@
+Milbeaut platforms device tree bindings
+---------------------------------------
+
+- Milbeaut M10V Evaluation Board
+    Required root node properties:
+      - compatible = "socionext,milbeaut-m10v-evb", "socionext,sc2000a";
-- 
1.9.1
