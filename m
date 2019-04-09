From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH 3/3] Kconfig: change configuration of srf04 ultrasonic iio
 sensor
Date: Tue, 9 Apr 2019 21:11:28 +0200
Message-ID: <20190409191126.lkjujjnvjyxua3fn@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, songqiang1304521@gmail.com, robh@kernel.org, m.othacehe@gmail.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

reword configuration option for SRF04

list supported types in help text

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 drivers/iio/proximity/Kconfig | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
index 12a3d3d40a91..e9f254ae3892 100644
--- a/drivers/iio/proximity/Kconfig
+++ b/drivers/iio/proximity/Kconfig
@@ -68,12 +68,19 @@ config RFD77402
 	  module will be called rfd77402.
 
 config SRF04
-	tristate "Devantech SRF04 ultrasonic ranger sensor"
+	tristate "GPIO bitbanged ultrasonic ranger sensor (SRF04, MB1000)"
 	depends on GPIOLIB
 	help
-	  Say Y here to build a driver for Devantech SRF04 ultrasonic
+	  Say Y here to build a driver for GPIO bitbanged ultrasonic
 	  ranger sensor. This driver can be used to measure the distance
 	  of objects. It is using two GPIOs.
+	  Actually Supported types are:
+	  - Devantech SRF04
+	  - Maxbotix mb1000
+	  - Maxbotix mb1010
+	  - Maxbotix mb1020
+	  - Maxbotix mb1030
+	  - Maxbotix mb1040
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called srf04.
-- 
2.11.0
