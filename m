From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v2 2/2] input: clps711x-keypad: dts: Add bindings documentation
Date: Mon, 10 Feb 2014 08:22:14 +0400
Message-ID: <1392006134-10265-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: devicetree@vger.kernel.org

This patch adds the devicetree documentation for the Cirrus Logic
CLPS711X keypad.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/input/clps711x-keypad.txt  | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/clps711x-keypad.txt

diff --git a/Documentation/devicetree/bindings/input/clps711x-keypad.txt b/Documentation/devicetree/bindings/input/clps711x-keypad.txt
new file mode 100644
index 0000000..bcf5f02
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/clps711x-keypad.txt
@@ -0,0 +1,29 @@
+* Cirrus Logic CLPS711X matrix keypad device tree bindings
+
+Required Properties:
+- compatible:    Should be "cirrus,clps711x-keypad".
+- syscon:        phandle to syscon device node which control keypad (SYSCON1).
+- row-gpios:     List of GPIOs used as row lines.
+- poll-interval: Poll interval time in milliseconds.
+- linux,keymap:  The definition can be found at
+                 bindings/input/matrix-keymap.txt.
+
+Optional Properties:
+- autorepeat:    Enable autorepeat feature.
+
+Example:
+	keypad {
+		compatible = "cirrus,clps711x-keypad";
+		syscon = <&syscon1>;
+		autorepeat;
+		poll-interval = <120>;
+		row-gpios = <&porta 0 0>,
+			    <&porta 1 0>;
+
+		linux,keymap = <
+			MATRIX_KEY(0, 0, KEY_UP)
+			MATRIX_KEY(0, 1, KEY_DOWN)
+			MATRIX_KEY(1, 0, KEY_LEFT)
+			MATRIX_KEY(1, 1, KEY_RIGHT)
+		>;
+	};
-- 
1.8.3.2

