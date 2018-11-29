Return-Path: <bunk@kernel.org>
From: Adrian Bunk <bunk@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: eeprom: at24: add "atmel,24c2048"
Date: Thu, 29 Nov 2018 21:58:57 +0200
Message-Id: <20181129195858.32367-1-bunk@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c <linux-i2c@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Adrian Bunk <bunk@kernel.org>
---
 Documentation/devicetree/bindings/eeprom/at24.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
index aededdbc262b..f9a7c984274c 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.txt
+++ b/Documentation/devicetree/bindings/eeprom/at24.txt
@@ -27,6 +27,7 @@ Required properties:
                 "atmel,24c256",
                 "atmel,24c512",
                 "atmel,24c1024",
+                "atmel,24c2048",
 
                 If <manufacturer> is not "atmel", then a fallback must be used
                 with the same <model> and "atmel" as manufacturer.
-- 
2.11.0
