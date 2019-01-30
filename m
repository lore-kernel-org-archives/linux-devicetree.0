From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH 1/2] dt-bindings: MIPS: Add doc about Ingenic CPU node.
Date: Wed, 30 Jan 2019 21:14:03 +0800
Message-ID: <1548854044-56483-2-git-send-email-zhouyanjie@zoho.com>
References: <1548854044-56483-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548854044-56483-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org, robh+dt@kernel.org, ezequiel@collabora.co.uk, paul@crapouillou.net, mark.rutland@arm.com, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com, ulf.hansson@linaro.org, malat@debian.org
List-Id: devicetree@vger.kernel.org

Dt-bindings doc about CPU node of Ingenic XBurst based SOCs.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 .../devicetree/bindings/mips/ingenic/ingenic,cpu.txt    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt

diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
new file mode 100644
index 0000000..38e3cd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
@@ -0,0 +1,17 @@
+Ingenic Soc CPU
+
+Required properties:
+- device_type: Must be "cpu".
+- compatible: One of:
+  - "ingenic,xburst".
+- reg: The number of the CPU.
+- next-level-cache: If there is a next level cache, point to it.
+
+Example:
+cpu0: cpu@0 {
+	device_type = "cpu";
+	compatible = "ingenic,xburst";
+	reg = <0>;
+	next-level-cache = <&l2c>;
+};
+
-- 
2.7.4
