From: Keiji Hayashibara <hayashibara.keiji@socionext.com>
Subject: [PATCH V3 1/3] dt-bindings: watchdog: add description for UniPhier WDT controller
Date: Tue, 13 Jun 2017 10:14:57 +0900
Message-ID: <1497316499-22254-2-git-send-email-hayashibara.keiji@socionext.com>
References: <1497316499-22254-1-git-send-email-hayashibara.keiji@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497316499-22254-1-git-send-email-hayashibara.keiji@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: wim@iguana.be, linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org, yamada.masahiro@socionext.com, hayashi.kunihiko@socionext.com, owada.kiyoshi@socionext.com, Keiji Hayashibara <hayashibara.keiji@socionext.com>
List-Id: devicetree@vger.kernel.org

Add uniphier-wdt dt-bindings documentation.

Signed-off-by: Keiji Hayashibara <hayashibara.keiji@socionext.com>
---
 .../devicetree/bindings/watchdog/uniphier-wdt.txt    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt b/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
new file mode 100644
index 0000000..bf63375
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
@@ -0,0 +1,20 @@
+UniPhier watchdog timer controller
+
+This UniPhier watchdog timer controller must be under sysctrl node.
+
+Required properties:
+- compatible: should be "socionext,uniphier-wdt"
+
+Example:
+
+	sysctrl@61840000 {
+		compatible = "socionext,uniphier-ld11-sysctrl",
+			     "simple-mfd", "syscon";
+		reg = <0x61840000 0x4000>;
+
+		watchdog {
+			compatible = "socionext,uniphier-wdt";
+		}
+
+		other nodes ...
+	};
-- 
2.7.4
