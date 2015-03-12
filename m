From: Jens Thiele <karme-k/3wkfGq5Xs@public.gmane.org>
Subject: [PATCH] Input: sun4i-ts - allow to adjust some settings
 via device-tree properties.
Date: Thu, 12 Mar 2015 16:45:50 +0100
Message-ID: <1426175150-27005-1-git-send-email-karme@karme.de>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDG2NNODTIMBB27JQ2UAKGQERQHPRTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Jens Thiele <karme-k/3wkfGq5Xs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit introduces two new optional device-tree properties:
"tp-sensitive-adjust": adjust sensitivity of pen down detection
"filter-type": select median and averaging filter

The previous fixed defaults, didn't work well for the Olimex
A13-LCD10TS (I have).

Signed-off-by: Jens Thiele <karme-k/3wkfGq5Xs@public.gmane.org>
---
 .../devicetree/bindings/input/touchscreen/sun4i.txt |   19 +++++++++++++++++--
 drivers/input/touchscreen/sun4i-ts.c                |   17 +++++++++++++----
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt b/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
index 433332d..c93edfa 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
@@ -8,8 +8,20 @@ Required properties:
  - #thermal-sensor-cells: shall be 0
 
 Optional properties:
- - allwinner,ts-attached: boolean indicating that an actual touchscreen is
-			  attached to the controller
+ - allwinner,ts-attached	 : boolean indicating that an actual touchscreen
+				   is attached to the controller
+ - allwinner,tp-sensitive-adjust : integer (4 bits)
+				   adjust sensitivity of pen down detection
+				   between 0 (least sensitive) and 15
+				   (defaults to 15)
+ - allwinner,filter-type 	 : integer (2 bits)
+   				   select median and averaging filter
+				   samples used for median / averaging filter
+				   0: 4/2
+				   1: 5/3
+				   2: 8/4
+				   3: 16/8
+				   (defaults to 1)
 
 Example:
 
@@ -19,4 +31,7 @@ Example:
 		interrupts = <29>;
 		allwinner,ts-attached;
 		#thermal-sensor-cells = <0>;
+		/* sensitive/noisy touch panel */
+		allwinner,tp-sensitive-adjust = <0>;
+		allwinner,filter-type = <3>;
 	};
diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
index b93a28b..d1cf847 100644
--- a/drivers/input/touchscreen/sun4i-ts.c
+++ b/drivers/input/touchscreen/sun4i-ts.c
@@ -30,6 +30,10 @@
  * These kinds of heuristics are just asking for trouble (and don't belong
  * in the kernel). So this driver offers straight forward, reliable single
  * touch functionality only.
+ *
+ * s.a. A20 User Manual "1.15 TP" (Documentation/arm/sunxi/README)
+ * (looks like the description in the A20 User Manual v1.3 is better
+ * than the one in the A10 User Manual v.1.5)
  */
 
 #include <linux/err.h>
@@ -246,6 +250,9 @@ static int sun4i_ts_probe(struct platform_device *pdev)
 	int error;
 	u32 reg;
 	bool ts_attached;
+	/* optional device-tree properties, use old fixed values as default */
+	u32 tp_sensitive_adjust = 15;
+	u32 filter_type = 1;
 
 	ts = devm_kzalloc(dev, sizeof(struct sun4i_ts_data), GFP_KERNEL);
 	if (!ts)
@@ -313,14 +320,16 @@ static int sun4i_ts_probe(struct platform_device *pdev)
 	       ts->base + TP_CTRL0);
 
 	/*
-	 * sensitive_adjust = 15 : max, which is not all that sensitive,
+	 * tp_sensitive_adjust is an optional property
 	 * tp_mode = 0 : only x and y coordinates, as we don't use dual touch
 	 */
-	writel(TP_SENSITIVE_ADJUST(15) | TP_MODE_SELECT(0),
+	of_property_read_u32(np, "allwinner,tp-sensitive-adjust", &tp_sensitive_adjust);
+	writel(TP_SENSITIVE_ADJUST(tp_sensitive_adjust) | TP_MODE_SELECT(0),
 	       ts->base + TP_CTRL2);
 
-	/* Enable median filter, type 1 : 5/3 */
-	writel(FILTER_EN(1) | FILTER_TYPE(1), ts->base + TP_CTRL3);
+	/* Enable median and averaging filter, optional property for filter type */
+	of_property_read_u32(np, "allwinner,filter-type", &filter_type);
+	writel(FILTER_EN(1) | FILTER_TYPE(filter_type), ts->base + TP_CTRL3);
 
 	/* Enable temperature measurement, period 1953 (2 seconds) */
 	writel(TEMP_ENABLE(1) | TEMP_PERIOD(1953), ts->base + TP_TPR);
-- 
1.7.10.4
