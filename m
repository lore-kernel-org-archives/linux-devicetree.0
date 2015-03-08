From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] touchscreen: sun4i-ts: A10 (sun4i) has a
 different temperature curve
Date: Sun,  8 Mar 2015 21:53:40 +0100
Message-ID: <1425848022-18001-2-git-send-email-hdegoede@redhat.com>
References: <1425848022-18001-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBZHN6KTQKGQEBMJ233Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1425848022-18001-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tong Zhang <lovewilliam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olliver Schinagl <o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Testing has revealed that the temperature in the rtp controller of the A10
(sun4i) SoC has a different curve then on the A13 (sun5i) and later models.

Add a new sun5i-a13-ts compatible to differentiate the newer models and
set the curve based on the compatible string.

The new curve is still not ideal on all A10-s, that seems to have to
do with there being a large spread between different A10-s out there,
the new curve us based on callibration results on 4 completely different
models:
                        raw min raw max temp min temp max stepsize offset
Tong Zhang's hackberry    2402    2680    45.0     80.0    0.125   -255.3
Hansg's Cubieboard        2207    2300    36.0     45.0    0.096   -175.8
Olliver's lime 1 (*):     2258    2537    48.3     87.1    0.139   -265.7
Olliver's lime 2 (*):     2222    2486    46.7     91.7    0.170   -331.0
*) from: http://linux-sunxi.org/Temperature_Calibration

Average all 4:                                             0.133   -257.0
Average without outliers (middle 2):                       0.132   -261.0

Since it is better to slightly overreport the temperature this patch uses
the average of all 4 as curve.

This fixes the temperature reported on the A10 being much higher then
expected.

Cc: Tong Zhang <lovewilliam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olliver Schinagl <o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org>
Reported-by: Tong Zhang <lovewilliam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/input/touchscreen/sun4i.txt      |  3 ++-
 drivers/input/touchscreen/sun4i-ts.c                     | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt b/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
index 433332d..d59d252 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
@@ -2,7 +2,8 @@ sun4i resistive touchscreen controller
 --------------------------------------
 
 Required properties:
- - compatible: "allwinner,sun4i-a10-ts" or "allwinner,sun6i-a31-ts"
+ - compatible: "allwinner,sun4i-a10-ts", "allwinner,sun5i-a13-ts" or
+   "allwinner,sun6i-a31-ts"
  - reg: mmio address range of the chip
  - interrupts: interrupt to which the chip is connected
  - #thermal-sensor-cells: shall be 0
diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
index b93a28b..66ccd5a 100644
--- a/drivers/input/touchscreen/sun4i-ts.c
+++ b/drivers/input/touchscreen/sun4i-ts.c
@@ -258,6 +258,15 @@ static int sun4i_ts_probe(struct platform_device *pdev)
 		/* Allwinner SDK has temperature = -271 + (value / 6) (C) */
 		ts->temp_offset = 1626;
 		ts->temp_step = 167;
+	} else if (of_device_is_compatible(np, "allwinner,sun4i-a10-ts")) {
+		/*
+		 * The A10 temperature sensor has quite a wide spread, these
+		 * parameters are based on the averaging of the calibration
+		 * results of 4 completely different boards, with a spread of
+		 * temp_step from 96 - 170 and temp_offset from 1758 - 3310.
+		 */
+		ts->temp_offset = 2570;
+		ts->temp_step = 133;
 	} else {
 		/*
 		 * The user manuals do not contain the formula for calculating
@@ -330,10 +339,10 @@ static int sun4i_ts_probe(struct platform_device *pdev)
 	 * finally enable tp mode.
 	 */
 	reg = STYLUS_UP_DEBOUN(5) | STYLUS_UP_DEBOUN_EN(1);
-	if (of_device_is_compatible(np, "allwinner,sun4i-a10-ts"))
-		reg |= TP_MODE_EN(1);
-	else
+	if (of_device_is_compatible(np, "allwinner,sun6i-a31-ts"))
 		reg |= SUN6I_TP_MODE_EN(1);
+	else
+		reg |= TP_MODE_EN(1);
 	writel(reg, ts->base + TP_CTRL1);
 
 	/*
@@ -383,6 +392,7 @@ static int sun4i_ts_remove(struct platform_device *pdev)
 
 static const struct of_device_id sun4i_ts_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-ts", },
+	{ .compatible = "allwinner,sun5i-a13-ts", },
 	{ .compatible = "allwinner,sun6i-a31-ts", },
 	{ /* sentinel */ }
 };
-- 
2.3.1
