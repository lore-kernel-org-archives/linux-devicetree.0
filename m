From: Sugaya Taichi <sugaya.taichi@socionext.com>
Subject: [PATCH v4 01/10] dt-bindings: sram: milbeaut: Add binding for Milbeaut smp-sram
Date: Wed, 27 Feb 2019 13:51:49 +0900
Message-ID: <1551243109-10559-1-git-send-email-sugaya.taichi@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Sugaya Taichi <sugaya.taichi@socionext.com>
List-Id: devicetree@vger.kernel.org

The Milbeaut M10V SoC needs a part of sram for smp, so this adds the
M10V sram compatible and binding.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sram/milbeaut-smp-sram.txt | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sram/milbeaut-smp-sram.txt

diff --git a/Documentation/devicetree/bindings/sram/milbeaut-smp-sram.txt b/Documentation/devicetree/bindings/sram/milbeaut-smp-sram.txt
new file mode 100644
index 0000000..194f6a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sram/milbeaut-smp-sram.txt
@@ -0,0 +1,24 @@
+Milbeaut SRAM for smp bringup
+
+Milbeaut SoCs use a part of the sram for the bringup of the secondary cores.
+Once they get powered up in the bootloader, they stay at the specific part
+of the sram.
+Therefore the part needs to be added as the sub-node of mmio-sram.
+
+Required sub-node properties:
+- compatible : should be "socionext,milbeaut-smp-sram"
+
+Example:
+
+        sram: sram@0 {
+                compatible = "mmio-sram";
+                reg = <0x0 0x10000>;
+                #address-cells = <1>;
+                #size-cells = <1>;
+                ranges = <0 0x0 0x10000>;
+
+                smp-sram@f100 {
+                        compatible = "socionext,milbeaut-smp-sram";
+                        reg = <0xf100 0x20>;
+                };
+        };
-- 
1.9.1
