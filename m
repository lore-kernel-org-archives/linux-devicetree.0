From: Loys Ollivier <lollivier@baylibre.com>
Subject: [PATCH 2/4] dt-bindings: gnss: add gtop binding
Date: Fri, 28 Dec 2018 11:50:33 +0100
Message-ID: <1545994235-8309-3-git-send-email-lollivier@baylibre.com>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc: Loys Ollivier <lollivier@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add binding for GlobalTop GNSS receivers.

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---
 Documentation/devicetree/bindings/gnss/gtop.txt | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/gtop.txt

diff --git a/Documentation/devicetree/bindings/gnss/gtop.txt b/Documentation/devicetree/bindings/gnss/gtop.txt
new file mode 100644
index 000000000000..24c86703aa46
--- /dev/null
+++ b/Documentation/devicetree/bindings/gnss/gtop.txt
@@ -0,0 +1,33 @@
+GlobalTop GNSS Receiver DT binding
+
+The GlobalTop GNSS receivers uses UART interfaces.
+
+Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
+properties.
+
+Required properties:
+
+- compatible	: Must be
+
+			"globaltop,pa6h"
+
+- vcc-supply	: Main voltage regulator
+
+Optional properties:
+
+- timepulse-gpios	: Time pulse GPIO
+- v-bckp-supply	: Backup voltage regulator
+
+Example:
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>;
+	pinctrl-names = "default";
+
+	gnss {
+		compatible = "globaltop,pa6h";
+		vcc-supply = <&vcc_3v3>;
+		current-speed = <9600>;
+	};
+};
-- 
2.7.4
