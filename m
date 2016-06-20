From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 1/8] regmap: Support bulk writes for devices
 without raw formatting
Date: Mon, 20 Jun 2016 10:52:11 +0800
Message-ID: <1466391138-12862-2-git-send-email-wens@csie.org>
References: <1466391138-12862-1-git-send-email-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCMILY6JWQBBB2NUTW5QKGQELJVG3QY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1466391138-12862-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When doing a bulk writes from a device which lacks raw I/O support we
fall back to doing register at a time reads but we still use the raw
formatters in order to render the data into the word size used by the
device (since bulk reads still operate on the device word size rather
than unsigned ints).  This means that devices without raw formatting
such as those that provide reg_read() are not supported.  Provide
handling for them by copying the values read into native endian values
of the appropriate size.

This complements commit d5b98eb12420 ("regmap: Support bulk reads for
devices without raw formatting").

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes since v2: none
Changes since v1: none
---
 drivers/base/regmap/regmap.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index df2d2ef5d6b3..51fa7d66a393 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1777,8 +1777,6 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 	size_t val_bytes = map->format.val_bytes;
 	size_t total_size = val_bytes * val_count;
 
-	if (map->bus && !map->format.parse_inplace)
-		return -EINVAL;
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
@@ -1789,7 +1787,8 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 	 *
 	 * The first if block is used for memory mapped io. It does not allow
 	 * val_bytes of 3 for example.
-	 * The second one is used for busses which do not have this limitation
+	 * The second one is for busses that do not provide raw I/O.
+	 * The third one is used for busses which do not have these limitations
 	 * and can write arbitrary value lengths.
 	 */
 	if (!map->bus) {
@@ -1825,6 +1824,32 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 		}
 out:
 		map->unlock(map->lock_arg);
+	} else if (map->bus && !map->format.parse_inplace) {
+		const u8 *u8 = val;
+		const u16 *u16 = val;
+		const u32 *u32 = val;
+		unsigned int ival;
+
+		for (i = 0; i < val_count; i++) {
+			switch (map->format.val_bytes) {
+			case 4:
+				ival = u32[i];
+				break;
+			case 2:
+				ival = u16[i];
+				break;
+			case 1:
+				ival = u8[i];
+				break;
+			default:
+				return -EINVAL;
+			}
+
+			ret = regmap_write(map, reg + (i * map->reg_stride),
+					   ival);
+			if (ret)
+				return ret;
+		}
 	} else if (map->use_single_write ||
 		   (map->max_raw_write && map->max_raw_write < total_size)) {
 		int chunk_stride = map->reg_stride;
-- 
2.8.1

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
