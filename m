From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2 2/9] staging: iio: tsl2x7x: add device tree documentation
Date: Thu,  6 Jul 2017 18:56:19 -0400
Message-ID: <20170706225626.6716-3-masneyb@onstation.org>
References: <20170706225626.6716-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170706225626.6716-1-masneyb@onstation.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: jic23@kernel.org, linux-iio@vger.kernel.org
Cc: devel@driverdev.osuosl.org, Mark Rutland <mark.rutland@arm.com>, lars@metafoo.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jon.Brenner@ams.com, pmeerw@pmeerw.net, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

Add device tree documentation for the tsl2x7x IIO driver.

Signed-off-by: Brian Masney <masneyb@onstation.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/trivial-devices.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
index 35f406d..0e6e953 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -21,6 +21,16 @@ adi,adt7490		+/-1C TDM Extended Temp Range I.C
 adi,adxl345		Three-Axis Digital Accelerometer
 adi,adxl346		Three-Axis Digital Accelerometer (backward-compatibility value "adi,adxl345" must be listed too)
 ams,iaq-core		AMS iAQ-Core VOC Sensor
+amstaos,tsl2571		AMS/TAOS ALS and proximity sensor
+amstaos,tsl2671		AMS/TAOS ALS and proximity sensor
+amstaos,tmd2671		AMS/TAOS ALS and proximity sensor
+amstaos,tsl2771		AMS/TAOS ALS and proximity sensor
+amstaos,tmd2771		AMS/TAOS ALS and proximity sensor
+amstaos,tsl2572		AMS/TAOS ALS and proximity sensor
+amstaos,tsl2672		AMS/TAOS ALS and proximity sensor
+amstaos,tmd2672		AMS/TAOS ALS and proximity sensor
+amstaos,tsl2772		AMS/TAOS ALS and proximity sensor
+amstaos,tmd2772		AMS/TAOS ALS and proximity sensor
 at,24c08		i2c serial eeprom  (24cxx)
 atmel,at97sc3204t	i2c trusted platform module (TPM)
 capella,cm32181		CM32181: Ambient Light Sensor
-- 
2.9.4
