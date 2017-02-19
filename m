From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 3/3] DT: i2c: add sht21 to trivial-devices
Date: Sun, 19 Feb 2017 16:00:09 +0100
Message-ID: <20170219150009.22825-1-tduszyns@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
List-Id: devicetree@vger.kernel.org

Add binding for Sensirion sht21 relative humidity and temperature
sensor driver.

Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
---
 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index 539874490492..919a763dcc23 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -79,6 +79,7 @@ ricoh,rv5c386		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
 ricoh,rv5c387a		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
 samsung,24ad0xd1	S524AD0XF1 (128K/256K-bit Serial EEPROM for Low Power)
 sgx,vz89x		SGX Sensortech VZ89X Sensors
+sensirion,sht21		Relative humidity and temperature sensor
 sii,s35390a		2-wire CMOS real-time clock
 skyworks,sky81452	Skyworks SKY81452: Six-Channel White LED Driver with Touch Panel Bias Supply
 st-micro,24c256		i2c serial eeprom  (24cxx)
--
2.11.1
