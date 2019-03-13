Return-Path: <SRS0=DUYD=RQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from carlosaurelio.net ([54.232.250.16]:38956 "EHLO
        carlosaurelio.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfCMOWW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Mar 2019 10:22:22 -0400
Date: Wed, 13 Mar 2019 11:11:26 -0300
From: Carlos Menin <menin@carlosaurelio.net>
Subject: [PATCH] dt-bindings: hwmon: (adc128d818) Specify ti,mode property
 size
Message-ID: <20190313141125.GA26062@carlosaurelio.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

By default, cells in DT are 32-bit in size. The driver reads "ti,mode"
using the function of_property_read_u8() which causes the value to be
read incorrectly in little-endian architectures if the size is not
specified.

Make it explicit in the binding documentation that this prorperty must
be set as a 8-bit value.

Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
---
 Documentation/devicetree/bindings/hwmon/adc128d818.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adc128d818.txt b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
index 08bab0e..d0ae46d 100644
--- a/Documentation/devicetree/bindings/hwmon/adc128d818.txt
+++ b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
@@ -26,7 +26,7 @@ Required node properties:
 
 Optional node properties:
 
- - ti,mode:     Operation mode (see above).
+ - ti,mode:     Operation mode (u8) (see above).
 
 
 Example (operation mode 2):
@@ -34,5 +34,5 @@ Example (operation mode 2):
 	adc128d818@1d {
 		compatible = "ti,adc128d818";
 		reg = <0x1d>;
-		ti,mode = <2>;
+		ti,mode = /bits/ 8 <2>;
 	};
-- 
2.7.4
