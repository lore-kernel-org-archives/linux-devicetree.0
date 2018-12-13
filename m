From: Dianlong Li <long17.cool@163.com>
Subject: [PATCH 2/3] dt-bindings: rtc: sd3078: add device tree documentation
Date: Thu, 13 Dec 2018 18:13:49 +0800
Message-ID: <1544696030-17159-2-git-send-email-long17.cool@163.com>
References: <1544696030-17159-1-git-send-email-long17.cool@163.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544696030-17159-1-git-send-email-long17.cool@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: alexandre.belloni@bootlin.com, a.zummo@towertech.it, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dianlong Li <long17.cool@163.com>
List-Id: devicetree@vger.kernel.org

The devicetree documentation for the SD3078 device tree.

Signed-off-by: Dianlong Li <long17.cool@163.com>
---
 Documentation/devicetree/bindings/rtc/rtc.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
index 7c8da69..e46edab 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc.txt
@@ -62,3 +62,4 @@ ricoh,rs5c372b		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
 ricoh,rv5c386		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
 ricoh,rv5c387a		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
 sii,s35390a		2-wire CMOS real-time clock
+whwave,sd3078		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-- 
1.7.9.5
