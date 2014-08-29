From: Laurentiu Palcu <laurentiu.palcu@intel.com>
Subject: [PATCH 1/3] staging: iio: light: isl29018: fix typo
Date: Fri, 29 Aug 2014 17:26:20 +0300
Message-ID: <1409322382-30021-2-git-send-email-laurentiu.palcu@intel.com>
References: <1409322382-30021-1-git-send-email-laurentiu.palcu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1409322382-30021-1-git-send-email-laurentiu.palcu@intel.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Jonathan Cameron <jic23@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@intel.com>, Jingoo Han <jg1.han@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, devicetree@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Derek Basehore <dbasehore@chromium.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Teodora Baluta <teodora.baluta@intel.com>, Peter Meerwald <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

isl29108 was used, instead of isl29018.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 drivers/staging/iio/light/isl29018.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/iio/light/isl29018.c b/drivers/staging/iio/light/isl29018.c
index 86cc8f9..63c70be 100644
--- a/drivers/staging/iio/light/isl29018.c
+++ b/drivers/staging/iio/light/isl29018.c
@@ -447,7 +447,7 @@ static struct attribute *isl29018_attributes[] = {
 	NULL
 };
 
-static const struct attribute_group isl29108_group = {
+static const struct attribute_group isl29018_group = {
 	.attrs = isl29018_attributes,
 };
 
@@ -510,8 +510,8 @@ static int isl29018_chip_init(struct isl29018_chip *chip)
 	return 0;
 }
 
-static const struct iio_info isl29108_info = {
-	.attrs = &isl29108_group,
+static const struct iio_info isl29018_info = {
+	.attrs = &isl29018_group,
 	.driver_module = THIS_MODULE,
 	.read_raw = &isl29018_read_raw,
 	.write_raw = &isl29018_write_raw,
@@ -579,7 +579,7 @@ static int isl29018_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	indio_dev->info = &isl29108_info;
+	indio_dev->info = &isl29018_info;
 	indio_dev->channels = isl29018_channels;
 	indio_dev->num_channels = ARRAY_SIZE(isl29018_channels);
 	indio_dev->name = id->name;
-- 
1.9.1
