From: Artem Panfilov <panfilov.artyom@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: rtc: add ABEOZ9 support
Date: Thu, 17 Jan 2019 21:47:54 +0300
Message-ID: <20190117184755.21179-1-panfilov.artyom@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: panfilov.artyom@gmail.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
---
 Documentation/devicetree/bindings/rtc/rtc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
index 7c8da6926095..0ac93f2dcedc 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc.txt
@@ -39,6 +39,7 @@ possibly an interrupt line.
 Compatible		Vendor / Chip
 ==========		=============
 abracon,abb5zes3	AB-RTCMC-32.768kHz-B5ZE-S3: Real Time Clock/Calendar Module with I2C Interface
+abracon,abeoz9		AB-RTCMC-32.768kHz-EOZ9: Real Time Clock/Calendar Module with I2C Interface
 dallas,ds1374		I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
 dallas,ds1672		Dallas DS1672 Real-time Clock
 dallas,ds3232		Extremely Accurate I²C RTC with Integrated Crystal and SRAM
-- 
2.19.1
