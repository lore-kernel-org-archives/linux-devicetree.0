From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: add entry for plantower pms7003 driver
Date: Wed, 10 Jul 2019 21:21:55 +0200
Message-ID: <20190710192155.11489-3-tduszyns@gmail.com>
References: <20190710192155.11489-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710192155.11489-1-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, robh+dt@kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Add myself as a plantower pms7003 driver maintainer.

Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ad498428b38c..771de33ef737 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12548,6 +12548,12 @@ F:	drivers/i2c/busses/i2c-puv3.c
 F:	drivers/video/fbdev/fb-puv3.c
 F:	drivers/rtc/rtc-puv3.c
 
+PLANTOWER PMS7003 AIR POLLUTION SENSOR DRIVER
+M:	Tomasz Duszynski <tduszyns@gmail.com>
+S:	Maintained
+F:	drivers/iio/chemical/pms7003.c
+F:	Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml
+
 PMBUS HARDWARE MONITORING DRIVERS
 M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-hwmon@vger.kernel.org
-- 
2.22.0
