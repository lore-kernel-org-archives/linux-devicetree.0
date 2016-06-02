From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 2/8] MAINTAINERS: Add Altera Arria10 System Resource Chip
Date: Thu, 2 Jun 2016 12:52:22 -0500
Message-ID: <1464889948-28793-3-git-send-email-tthayer@opensource.altera.com>
References: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Thor Thayer <tthayer@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Add maintainer for the Altera Arria10 Max5 System Resource chip files.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
Acked-by: Lee Jones <lee.jones@linaro.org>i
---
v2  Remove altera-a10sr-hwmon.c file.
---
 MAINTAINERS |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f74a5f..7683240 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -607,6 +607,13 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-altera.c
 
+ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
+M:	Thor Thayer <tthayer@opensource.altera.com>
+S:	Maintained
+F:	drivers/gpio/gpio-altera-a10sr.c
+F:	drivers/mfd/altera-a10sr.c
+F:	include/linux/mfd/altera-a10sr.h
+
 ALTERA TRIPLE SPEED ETHERNET DRIVER
 M:	Vince Bridgers <vbridger@opensource.altera.com>
 L:	netdev@vger.kernel.org
-- 
1.7.9.5

