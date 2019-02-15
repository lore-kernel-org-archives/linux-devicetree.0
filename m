Return-Path: <SRS0=n0G4=QW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr700060.outbound.protection.outlook.com ([40.107.70.60]:22944
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727084AbfBOK1O (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Feb 2019 05:27:14 -0500
From: Bogdan Togorean <bogdan.togorean@analog.com>
Subject: [PATCH] dt-bindings: adau1977: Fix reset-gpios typo
Date: Fri, 15 Feb 2019 12:26:33 +0200
Message-ID: <20190215102633.12700-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: alsa-devel@alsa-project.org
Cc: lars@metafoo.de, broonie@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Bogdan Togorean <bogdan.togorean@analog.com>
List-ID: <devicetree@vger.kernel.org>

This change fixes a typo in the dt-binding examples (reset_gpio ->
reset-gpios).
Even though 'reset-gpio' is a valid construct for gpiolib the naming
'reset-gpios' is more suited for dt-bindings documentation.

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
---
 Documentation/devicetree/bindings/sound/adi,adau1977.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1977.txt b/Documentation/devicetree/bindings/sound/adi,adau1977.txt
index e79aeef73f28..11acd94b1665 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau1977.txt
+++ b/Documentation/devicetree/bindings/sound/adi,adau1977.txt
@@ -17,7 +17,7 @@ Required properties:
                 Documentation/devicetree/bindings/regulator/regulator.txt
 
 Optional properties:
- - reset-gpio:  the reset pin for the chip, for more details consult
+ - reset-gpios: the reset pin for the chip, for more details consult
                 Documentation/devicetree/bindings/gpio/gpio.txt
 
  - DVDD-supply: supply voltage for the digital core, please consult
@@ -40,7 +40,7 @@ Examples:
 		AVDD-supply = <&regulator>;
 		DVDD-supply = <&regulator_digital>;
 
-		reset_gpio = <&gpio 10 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
 	};
 
 	adau1977_i2c: adau1977@11 {
@@ -50,5 +50,5 @@ Examples:
 		AVDD-supply = <&regulator>;
 		DVDD-supply = <&regulator_digital>;
 
-		reset_gpio = <&gpio 10 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
 	};
-- 
2.20.1
