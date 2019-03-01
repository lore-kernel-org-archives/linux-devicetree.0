From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v2 4/4] MAINTAINERS: add maintainer for maxbotix ultrasonic
 driver
Date: Fri, 1 Mar 2019 14:43:23 +0100
Message-ID: <20190301134322.p5pouwmiw6lp5unh@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

add a maintainer for the newly created ultrasonic driver family of maxbotix

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9919840d54cd..0807d9239e1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9226,6 +9226,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/max9860.txt
 F:	sound/soc/codecs/max9860.*
 
+MAXBOTIX ULTRASONIC RANGER IIO DRIVER
+M:	Andreas Klinger <ak@it-klinger.de>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,i2cxl.txt
+F:	drivers/iio/proximity/mb12x2.c
+
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
 M:	Javier Martinez Canillas <javier@dowhile0.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.11.0
