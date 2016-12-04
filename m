From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 19/19] staging: iio: isl29028: remove legacy device tree
 binding
Date: Sat,  3 Dec 2016 21:19:43 -0500
Message-ID: <1480817983-32359-20-git-send-email-masneyb@onstation.org>
References: <1480817983-32359-1-git-send-email-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1480817983-32359-1-git-send-email-masneyb@onstation.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: jic23@kernel.org, linux-iio@vger.kernel.org
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, ldewangan@nvidia.com, pmeerw@pmeerw.net, knaack.h@gmx.de, Mark Rutland <Mark.Rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The isl29028 staging driver contains a legacy binding of "isl,isl29028"
that is marked as legacy and to not use. There are no in tree references
to that binding. This patch removes the legacy binding in preparation
for moving the driver out of staging. Otherwise, we will have to support
this binding indefinitely.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>
---
 drivers/staging/iio/light/isl29028.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/iio/light/isl29028.c b/drivers/staging/iio/light/isl29028.c
index ae6896f..6be9aa7 100644
--- a/drivers/staging/iio/light/isl29028.c
+++ b/drivers/staging/iio/light/isl29028.c
@@ -611,7 +611,6 @@ static const struct i2c_device_id isl29028_id[] = {
 MODULE_DEVICE_TABLE(i2c, isl29028_id);
 
 static const struct of_device_id isl29028_of_match[] = {
-	{ .compatible = "isl,isl29028", }, /* for backward compat., don't use */
 	{ .compatible = "isil,isl29028", },
 	{ },
 };
-- 
2.7.4
