From: Dan O'Donovan <dan@emutex.com>
Subject: [PATCH v3 3/3] iio: adc128s052: use SPDX-License-Identifier
Date: Thu, 25 Oct 2018 16:35:42 +0100
Message-ID: <1540481742-23596-4-git-send-email-dan@emutex.com>
References: <20180423213805.12591-1-javier@emutex.com>
 <1540481742-23596-1-git-send-email-dan@emutex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540481742-23596-1-git-send-email-dan@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>, Dan O'Donovan <dan@emutex.com>
List-Id: devicetree@vger.kernel.org

This updates the ti-adc128s052.c file to use SPDX-License-Identifier
instead of more verbose license text.

Signed-off-by: Dan O'Donovan <dan@emutex.com>
---
 drivers/iio/adc/ti-adc128s052.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
index c2d1453..7d2861f 100644
--- a/drivers/iio/adc/ti-adc128s052.c
+++ b/drivers/iio/adc/ti-adc128s052.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2014 Angelo Compagnucci <angelo.compagnucci@gmail.com>
  *
@@ -6,10 +7,6 @@
  * http://www.ti.com/lit/ds/symlink/adc128s052.pdf
  * http://www.ti.com/lit/ds/symlink/adc122s021.pdf
  * http://www.ti.com/lit/ds/symlink/adc124s021.pdf
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/acpi.h>
-- 
2.7.4


------
This email has been scanned for spam and malware by The Email Laundry.
