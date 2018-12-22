Return-Path: <SRS0=Q9PW=O7=mail.ru=shc_work@kernel.org>
From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 2/2] dt-bindings: input: Update documentation for clps711x-keypad
Date: Sat, 22 Dec 2018 18:55:20 +0300
Message-Id: <20181222155520.8156-1-shc_work@mail.ru>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shiyan <shc_work@mail.ru>
List-ID: <devicetree@vger.kernel.org>

Since the driver switched to using the syscon_regmap_lookup_by_phandle()
function, we need to specify the phandle for the driver. This patch
updates the driver binding documentation for these changes.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 Documentation/devicetree/bindings/input/clps711x-keypad.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/clps711x-keypad.txt b/Documentation/devicetree/bindings/input/clps711x-keypad.txt
index 3eed881..aebedc3 100644
--- a/Documentation/devicetree/bindings/input/clps711x-keypad.txt
+++ b/Documentation/devicetree/bindings/input/clps711x-keypad.txt
@@ -6,6 +6,7 @@ Required Properties:
 - poll-interval: Poll interval time in milliseconds.
 - linux,keymap:  The definition can be found at
                  bindings/input/matrix-keymap.txt.
+- syscon:        Phandle that points to the CPU syscon1 node.
 
 Optional Properties:
 - autorepeat:    Enable autorepeat feature.
@@ -17,6 +18,7 @@ Example:
 		poll-interval = <120>;
 		row-gpios = <&porta 0 0>,
 			    <&porta 1 0>;
+		syscon = <&syscon1>;
 
 		linux,keymap = <
 			MATRIX_KEY(0, 0, KEY_UP)
-- 
2.10.2
