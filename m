From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH 4/4] MAINTAINERS: add maintainer for maxbotix ultrasonic
 driver
Date: Sun, 24 Feb 2019 17:23:33 +0100
Message-ID: <20190224162332.xhh6cgenejq66fsu@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jic23@kernel.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh+dt@kernel.org, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com
List-Id: devicetree@vger.kernel.org

add a maintainer for the newly created ultrasonic driver familiy of
maxbotix

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9919840d54cd..bbf1860d4227 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9226,6 +9226,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/max9860.txt
 F:	sound/soc/codecs/max9860.*
 
+MAXBOTIX ULTRASONIC RANGER IIO DRIVER
+M:	Andreas Klinger <ak@it-klinger.de>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb12x2.txt
+F:	drivers/iio/proximity/mb12x2.c
+
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
 M:	Javier Martinez Canillas <javier@dowhile0.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.11.0
