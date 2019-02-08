Return-Path: <SRS0=4zMx=QP=gmail.com=akinobu.mita@kernel.org>
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH] dt-bindings: display: add missing semicolon in example
Date: Fri,  8 Feb 2019 16:51:33 +0900
Message-Id: <1549612293-5674-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Rob Herring <robh@kernel.org>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
List-ID: <devicetree@vger.kernel.org>

Add missing semicolon in example for Sitronix ST7735R display panels.

Cc: Rob Herring <robh@kernel.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 Documentation/devicetree/bindings/display/sitronix,st7735r.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
index f0a5090..cd5c718 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
@@ -20,7 +20,7 @@ Example:
 	backlight: backlight {
 		compatible = "gpio-backlight";
 		gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
-	}
+	};
 
 	...
 
-- 
2.7.4
