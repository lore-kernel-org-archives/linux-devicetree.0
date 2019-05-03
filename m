Return-Path: <SRS0=1IWS=TD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:34386 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfECQPH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 May 2019 12:15:07 -0400
From: Iker Perez <iker.perez@codethink.co.uk>
Subject: [PATCH v4 2/2] dt-bindings: hwmon: Add tmp75b to lm75.txt
Date: Fri,  3 May 2019 17:15:01 +0100
Message-Id: <20190503161501.29489-3-iker.perez@codethink.co.uk>
In-Reply-To: <20190503161501.29489-1-iker.perez@codethink.co.uk>
References: <20190503161501.29489-1-iker.perez@codethink.co.uk>
Sender: devicetree-owner@vger.kernel.org
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, devicetree@vger.kernel.org, Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
List-ID: <devicetree@vger.kernel.org>

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

Update the LM75's devicetree definition to allow Texas Instruments
TMP75B be probed.

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 Documentation/devicetree/bindings/hwmon/lm75.txt | 1 +
 1 file changed, 1 insertion(+)

Version log:                                                                     
                                                                                 
- V4:                                                                            
  - Improve the commit description message.                                      
- V3:                                                                            
  - Separate dt-bindings and driver-documentation into different                 
    commits. 

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
index 12d8cf7cf592..586b5ed70be7 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.txt
+++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
@@ -25,6 +25,7 @@ Required properties:
 		"ti,tmp175",
 		"ti,tmp275",
 		"ti,tmp75",
+		"ti,tmp75b",
 		"ti,tmp75c",
 
 - reg: I2C bus address of the device
-- 
2.11.0
