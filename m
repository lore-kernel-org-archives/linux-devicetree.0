From: Feng Kan <fkan@apm.com>
Subject: [PATCH V4 5/5] Documentation: power: reset: Add documentation for generic SYSCON reboot driver
Date: Thu, 23 Jan 2014 11:20:01 -0800
Message-ID: <1390504801-24483-6-git-send-email-fkan@apm.com>
References: <1390504801-24483-1-git-send-email-fkan@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1390504801-24483-1-git-send-email-fkan@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Add documentation for generic SYSCON reboot driver.

Signed-off-by: Feng Kan <fkan@apm.com>
---
 .../bindings/power/reset/syscon-reboot.txt         |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/syscon-reboot.txt

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt b/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
new file mode 100644
index 0000000..e9eb1fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
@@ -0,0 +1,16 @@
+Generic SYSCON mapped register reset driver
+
+Required properties:
+- compatible: should contain "syscon-reboot"
+- regmap: this is phandle to the register map node 
+- offset: offset in the register map for the reboot register
+- mask: the reset value written to the reboot register
+
+Examples:
+
+reboot {
+   compatible = "syscon-reboot";
+   regmap = <&regmapnode>;
+   offset = <0x0>;
+   mask = <0x1>;
+};
-- 
1.7.6.1
