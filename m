Return-Path: <SRS0=C5ln=FY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:51780 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424880AbeCBObK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 2 Mar 2018 09:31:10 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: at24: Add Renesas R1EX24128
Date: Fri,  2 Mar 2018 15:31:07 +0100
Message-Id: <1520001067-12111-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Document the compatible value for the Renesas R1EX24128ASAS0A two-wire
serial interface EEPROM, so it can be used in DTS files without causing
checkpatch warnings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2:
  - Add Acked-by,
  - Rebase on top of commit 6da28acf745fe253 ("dt-bindings: at24:
    consistently document the compatible property").
---
 Documentation/devicetree/bindings/eeprom/at24.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
index 1812c848e369e2a2..0bd685f0cff1b7fa 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.txt
+++ b/Documentation/devicetree/bindings/eeprom/at24.txt
@@ -47,6 +47,7 @@ Required properties:
                 variants of the above. Known such exceptions are listed below:
 
                 "renesas,r1ex24002" - the fallback is "atmel,24c02"
+                "renesas,r1ex24128" - the fallback is "atmel,24c128"
 
   - reg: The I2C address of the EEPROM.
 
-- 
2.7.4

