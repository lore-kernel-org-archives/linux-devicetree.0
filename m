From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: [PATCH v2 3/4] DT: i2c: Trivial: Add sii,s35390a, fix ricoh vendor prefix
Date: Sat, 15 Feb 2014 12:01:33 +0100
Message-ID: <1392462094-25097-4-git-send-email-andrew@lunn.ch>
References: <1392462094-25097-1-git-send-email-andrew@lunn.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392462094-25097-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the Seiko Instruments Inc S35390a to the list of trivial i2c
devices. At the same time, correct the vendor prefix for ricoh, which
should be the ticker symbol ricoy.

Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
---
 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index 1a1ac2e560e9..5f371914a93b 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -56,8 +56,9 @@ ovti,ov5642		OV5642: Color CMOS QSXGA (5-megapixel) Image Sensor with OmniBSI an
 pericom,pt7c4338	Real-time Clock Module
 plx,pex8648		48-Lane, 12-Port PCI Express Gen 2 (5.0 GT/s) Switch
 ramtron,24c64		i2c serial eeprom  (24cxx)
-ricoh,rs5c372a		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
+ricoy,rs5c372a		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
 samsung,24ad0xd1	S524AD0XF1 (128K/256K-bit Serial EEPROM for Low Power)
+sii,s35390a		2-wire CMOS real-time clock
 st-micro,24c256		i2c serial eeprom  (24cxx)
 stm,m41t00		Serial Access TIMEKEEPER
 stm,m41t62		Serial real-time clock (RTC) with alarm
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
