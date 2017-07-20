From: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Subject: [PATCH 1/1] staging: pi433: fix problem with division in
 rf69_set_deviation
Date: Thu, 20 Jul 2017 17:56:36 +0200 (CEST)
Message-ID: <255867683.7064.1500566196444@ox.hosteurope.de>
References: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
 <201707172156.DCyTyWc2%fengguang.wu@intel.com>
 <652336354.3806.1500549785404@ox.hosteurope.de>
 <20170720113705.d65hxm3jbki2ynqd@mwanda>
 <CAMuHMdVgw=V6f8wzcXvS3gk8GK0bOpdgs_jxL6Y_X9idJD_x3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAMuHMdVgw=V6f8wzcXvS3gk8GK0bOpdgs_jxL6Y_X9idJD_x3Q@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: driverdevel <devel@driverdev.osuosl.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "kbuild-all@01.org" <kbuild-all@01.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Fixes problem with division in rf69_set_deviation

Fixes: 874bcba65f9a ("staging: pi433: New driver")
Signed-off-by: Marcus Wolf <linux@wolf-entwicklungen.de>

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -221,7 +221,7 @@ int rf69_set_frequency(struct spi_device *spi, u32
frequency)
 int rf69_set_frequency(struct spi_device *spi, u32 frequency)
 {
 	int retval;
-	u32 f_max;
+	u64 f_max;
 	u64 f_reg;
 	u64 f_step;
 	u8 msb;
@@ -238,7 +238,8 @@ int rf69_set_frequency(struct spi_device *spi, u32
frequency)
 	do_div(f_step, 524288); //  524288 = 2^19
 
 	// check input value
-	f_max = f_step * 8388608 / factor;
+	f_max = f_step * 8388608;
+	do_div(f_max, factor);
 	if (frequency > f_max)
 	{
 		dev_dbg(&spi->dev, "setFrequency: illegal input param");
