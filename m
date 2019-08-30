Return-Path: <SRS0=oaLE=W2=pengutronix.de=bst@kernel.org>
From: Bastian Krause <bst@pengutronix.de>
Subject: [PATCH] dt-bindings: rtc: add missing rx8130 compatible
Date: Fri, 30 Aug 2019 15:47:55 +0200
Message-Id: <20190830134755.1121-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-rtc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, devicetree@vger.kernel.org, kernel@pengutronix.de, Bastian Krause <bst@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

The required OF entries were added with 47dd47292828
("rtc: ds1307: add OF and ACPI entries for Epson RX8130").

Cc: devicetree@vger.kernel.org
Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
index eaee19b60960..66f0a31ae9ce 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
@@ -19,6 +19,7 @@ Required properties:
 	"pericom,pt7c4338",
 	"epson,rx8025",
 	"isil,isl12057"
+	"epson,rx8130"
 - reg: I2C bus address of the device
 
 Optional properties:
-- 
2.23.0
