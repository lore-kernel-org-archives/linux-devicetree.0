From: Darshana Padmadas <darshanapadmadas@gmail.com>
Subject: [PATCH v5 3/4] Staging: iio: light: Added correct vendor-prefix for
 device isl29028
Date: Sat,  8 Nov 2014 22:52:07 +0530
Message-ID: <1415467328-9745-4-git-send-email-darshanapadmadas@gmail.com>
References: <1415467328-9745-1-git-send-email-darshanapadmadas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415467328-9745-1-git-send-email-darshanapadmadas@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: devicetree@vger.kernel.org
Cc: devel@driverdev.osuosl.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, opw-kernel@googlegroups.com, Darshana Padmadas <darshanapadmadas@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the correct vendor-prefix for device isl29028 and
maintains deprecated vendor-prefix found by checkpatch warning
for older kernel releases.

Signed-off-by: Darshana Padmadas <darshanapadmadas@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Acked-by: Jonathan Cameron <jic23@kernel.org>
---
 drivers/staging/iio/light/isl29028.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/light/isl29028.c b/drivers/staging/iio/light/isl29028.c
index 6014625..e969107 100644
--- a/drivers/staging/iio/light/isl29028.c
+++ b/drivers/staging/iio/light/isl29028.c
@@ -537,7 +537,8 @@ static const struct i2c_device_id isl29028_id[] = {
 MODULE_DEVICE_TABLE(i2c, isl29028_id);
 
 static const struct of_device_id isl29028_of_match[] = {
-	{ .compatible = "isil,isl29028", },
+	{ .compatible = "isl,isl29028", },
+	{ .compatible = "isil,isl29028", },/* deprecated, don't use */
 	{ },
 };
 MODULE_DEVICE_TABLE(of, isl29028_of_match);
-- 
1.9.1
