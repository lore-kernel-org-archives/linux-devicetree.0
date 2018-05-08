From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: [PATCH 4/4] rtc: ds1307: add frequency-test property to check calibration on m41txx
Date: Tue,  8 May 2018 16:56:11 +0200
Message-ID: <20180508145611.49072-4-giulio.benetti@micronovasrl.com>
References: <20180508145611.49072-1-giulio.benetti@micronovasrl.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180508145611.49072-1-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Giulio Benetti <giulio.benetti@micronovasrl.com>
List-Id: devicetree@vger.kernel.org

On m41txx you can enable open-drain OUT pin to check if calibration is ok.
Enabling OUT pin with frequency-test bool property, OUT pin will tick
512 times faster than 1s tick base.

Enable FT bit on CONTROL register if calibration is active.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 3 +++
 drivers/rtc/rtc-ds1307.c                             | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
index d3d70a5495c5..72a5f8cdc306 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
@@ -36,6 +36,9 @@ Optional properties:
 	Should be given if internal trickle charger diode should be disabled
 - calibration: m41t0, m41t00, m41t11 only
 	Set calibration value to correct external bias, ranging between (-31) and 31.
+- frequency-test: m41t0, m41t00, m41t11 only
+	Enable open-drain OUT pin 512 times faster than 1 second tick.
+	This allows to check calibration value.
 
 Example:
 	rtc1: ds1339@68 {
diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 9cda52589c0f..a727ced157df 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1485,6 +1485,10 @@ static int ds1307_probe(struct i2c_client *client,
 			if (calib >= 0)
 				out_byte |= M41TXX_BIT_CALIB_SIGN;
 
+			if (of_property_read_bool(client->dev.of_node,
+					"frequency-test"))
+				out_byte |= M41TXX_BIT_FT;
+
 			regmap_write(ds1307->regmap, M41TXX_REG_CONTROL,
 					out_byte);
 		}
-- 
2.17.0
