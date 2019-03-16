From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v5 08/11] staging: iio: ad7780: add SPDX identifier
Date: Fri, 15 Mar 2019 23:15:13 -0300
Message-ID: <4344b002e730538b737e576b7d262687ab62473c.1552700652.git.renatogeh@gmail.com>
References: <cover.1552700652.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1552700652.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add SPDX identifier (GPL-2.0) to the AD7780 driver.

Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
---
 drivers/staging/iio/adc/ad7780.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
index 568c5b4472ff..ff61ffa0da9f 100644
--- a/drivers/staging/iio/adc/ad7780.c
+++ b/drivers/staging/iio/adc/ad7780.c
@@ -1,9 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * AD7170/AD7171 and AD7780/AD7781 SPI ADC driver
  *
  * Copyright 2011 Analog Devices Inc.
- *
- * Licensed under the GPL-2.
  */
 
 #include <linux/interrupt.h>
-- 
2.21.0
