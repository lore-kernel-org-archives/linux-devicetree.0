Return-Path: <SRS0=p57L=RX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:53034 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfCTKd7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Mar 2019 06:33:59 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: at24: add Renesas R1EX24016
Date: Wed, 20 Mar 2019 11:33:51 +0100
Message-Id: <20190320103351.20609-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Document the compatible value for the Renesas R1EX24128ASAS0A two-wire
serial interface EEPROM, so it can be used in DTS files without causing
checkpatch warnings.

This is a 2 KiB EEPROM.  The first 1 KiB can always be written, the
second 1 KiB cannot be written if the write-protect line is asserted.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/eeprom/at24.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
index 0e456bbc121399b7..22aead844d0f58d6 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.txt
+++ b/Documentation/devicetree/bindings/eeprom/at24.txt
@@ -50,6 +50,7 @@ Required properties:
 
                 "nxp,se97b" - the fallback is "atmel,24c02",
                 "renesas,r1ex24002" - the fallback is "atmel,24c02"
+                "renesas,r1ex24016" - the fallback is "atmel,24c16"
                 "renesas,r1ex24128" - the fallback is "atmel,24c128"
                 "rohm,br24t01" - the fallback is "atmel,24c01"
 
-- 
2.17.1
