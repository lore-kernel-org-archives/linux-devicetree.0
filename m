Return-Path: <SRS0=+a0w=QF=denx.de=marex@kernel.org>
From: Marek Vasut <marex@denx.de>
Subject: [PATCH] Documentation: bindings: Add RV1805 to abracon,abx80x bindings
Date: Tue, 29 Jan 2019 12:39:50 +0100
Message-Id: <20190129113950.18575-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add compatible string for Microcrystal RV1805 RTC, which is compatible
with AB1805. The RV1805 uses smaller 10 pin package, while the AB1805
uses larger 16pin package, however the die inside the chip is the same.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>
To: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/rtc/abracon,abx80x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
index 18b892d010d8..2405e35a1bc0 100644
--- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
+++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
@@ -16,6 +16,7 @@ Required properties:
         "abracon,ab1803"
         "abracon,ab1804"
         "abracon,ab1805"
+        "microcrystal,rv1805"
 	Using "abracon,abx80x" will enable chip autodetection.
  - "reg": I2C bus address of the device
 
-- 
2.19.2
