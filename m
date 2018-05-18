From: David Veenstra <davidjulianveenstra@gmail.com>
Subject: [PATCH v4 11/12] staging: iio: ad2s1200: Add copyright
Date: Fri, 18 May 2018 20:23:25 +0200
Message-ID: <8e02a6b4147ebceee1412ee521b4f4be6886cdaa.1526667118.git.davidjulianveenstra@gmail.com>
References: <cover.1526667118.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cover.1526667118.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: jic23@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Michael.Hennerich@analog.com, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

Add David Veenstra as a copyright holders and as an author,
for all of the staging clean ups of the ad2s1200 driver.

Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
---
Changes in v4:
 - Introduced in this version.

 drivers/staging/iio/resolver/ad2s1200.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
index 10d6d79dce79..28e618af9939 100644
--- a/drivers/staging/iio/resolver/ad2s1200.c
+++ b/drivers/staging/iio/resolver/ad2s1200.c
@@ -2,6 +2,7 @@
  * ad2s1200.c simple support for the ADI Resolver to Digital Converters:
  * AD2S1200/1205
  *
+ * Copyright (c) 2018-2018 David Veenstra <davidjulianveenstra@gmail.com>
  * Copyright (c) 2010-2010 Analog Devices Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -203,6 +204,7 @@ static struct spi_driver ad2s1200_driver = {
 };
 module_spi_driver(ad2s1200_driver);
 
+MODULE_AUTHOR("David Veenstra <davidjulianveenstra@gmail.com>");
 MODULE_AUTHOR("Graff Yang <graff.yang@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices AD2S1200/1205 Resolver to Digital SPI driver");
 MODULE_LICENSE("GPL v2");
-- 
2.17.0
