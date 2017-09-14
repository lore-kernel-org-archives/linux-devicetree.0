From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v4 2/6] iio: adc: sun4i-gpadc-iio: rename
 A33-specified registers to contain A33
Date: Thu, 14 Sep 2017 22:52:47 +0800
Message-ID: <20170914145251.21784-3-icenowy@aosc.io>
References: <20170914145251.21784-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB35P5LGQKGQE7NQ7SCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170914145251.21784-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the H3 SoC, which is also in sun8i line, has totally different
register map for the thermal sensor (a cut down version of GPADC), we
should rename A23/A33-specified registers to contain A33, in order to
prevent obfuscation with H3 registers. Currently these registers are
only prefixed "SUN8I", not "SUN8I_A33".

Add "_A33" after "SUN8I" on the register names.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes in v4:
- Change A23 to A33, as the driver never supports A23.

 drivers/iio/adc/sun4i-gpadc-iio.c | 2 +-
 include/linux/mfd/sun4i-gpadc.h   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 137f577d9432..68926b986cd0 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -88,7 +88,7 @@ static const struct gpadc_data sun6i_gpadc_data = {
 static const struct gpadc_data sun8i_a33_gpadc_data = {
 	.temp_offset = -1662,
 	.temp_scale = 162,
-	.tp_mode_en = SUN8I_GPADC_CTRL1_CHOP_TEMP_EN,
+	.tp_mode_en = SUN8I_A33_GPADC_CTRL1_CHOP_TEMP_EN,
 };
 
 struct sun4i_gpadc_iio {
diff --git a/include/linux/mfd/sun4i-gpadc.h b/include/linux/mfd/sun4i-gpadc.h
index 139872c2e0fe..78d31984a222 100644
--- a/include/linux/mfd/sun4i-gpadc.h
+++ b/include/linux/mfd/sun4i-gpadc.h
@@ -38,9 +38,9 @@
 #define SUN6I_GPADC_CTRL1_ADC_CHAN_SELECT(x)		(GENMASK(3, 0) & BIT(x))
 #define SUN6I_GPADC_CTRL1_ADC_CHAN_MASK			GENMASK(3, 0)
 
-/* TP_CTRL1 bits for sun8i SoCs */
-#define SUN8I_GPADC_CTRL1_CHOP_TEMP_EN			BIT(8)
-#define SUN8I_GPADC_CTRL1_GPADC_CALI_EN			BIT(7)
+/* TP_CTRL1 bits for A33 */
+#define SUN8I_A33_GPADC_CTRL1_CHOP_TEMP_EN		BIT(8)
+#define SUN8I_A33_GPADC_CTRL1_GPADC_CALI_EN		BIT(7)
 
 #define SUN4I_GPADC_CTRL2				0x08
 
-- 
2.13.5
