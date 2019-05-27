Return-Path: <SRS0=MGmW=T3=klsmartin.com=Leif.Middelschulte@kernel.org>
From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 04/10] Input: stmpe-ts - implement resolution support
Date: Mon, 27 May 2019 18:07:30 +0200
Message-ID: <20190527160736.30569-5-leif.middelschulte@klsmartin.com>
In-Reply-To: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Leif Middelschulte <leif.middelschulte@klsmartin.com>
List-ID: <devicetree@vger.kernel.org>

The resolution is calculated based on the devicetree property
`touchscreen-{x,y}-mm`. It matches the prosa definition given in
uapi/linux/input.h.

Beware that the resolution is affected, if window-tracking
parameters are applied.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 drivers/input/touchscreen/stmpe-ts.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 6917237bd6c6..1f11043a04df 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -102,7 +102,7 @@ struct stmpe_touch {
 	struct {
 		u32 x;
 		u32 y;
-	}	min;
+	}	size_in_mm, min;
 };
 
 static int __stmpe_reset_fifo(struct stmpe *stmpe)
@@ -346,6 +346,10 @@ static void stmpe_ts_get_platform_info(struct platform_device *pdev,
 	u32 val;
 	u16 wdw[4];
 
+	// use sensible (with regards to calculations) default values
+	ts->size_in_mm.x = 1;
+	ts->size_in_mm.y = 1;
+
 	if (np) {
 		if (!of_property_read_u32(np, "st,sample-time", &val))
 			ts->stmpe->sample_time = val;
@@ -373,6 +377,10 @@ static void stmpe_ts_get_platform_info(struct platform_device *pdev,
 			ts->wdw.bottom_left.y = wdw[3] & XY_MASK;
 			ts->wdw_from_dt = true;
 		}
+		if (!of_property_read_u32(np, "touchscreen-x-mm", &val))
+			ts->size_in_mm.x = val;
+		if (!of_property_read_u32(np, "touchscreen-y-mm", &val))
+			ts->size_in_mm.y = val;
 		touchscreen_parse_properties(ts->idev, false, &ts->props);
 	}
 }
@@ -384,6 +392,7 @@ static int stmpe_input_probe(struct platform_device *pdev)
 	struct input_dev *idev;
 	int error;
 	int ts_irq;
+	int resolution;
 
 	ts_irq = platform_get_irq_byname(pdev, "FIFO_TH");
 	if (ts_irq < 0)
@@ -430,8 +439,12 @@ static int stmpe_input_probe(struct platform_device *pdev)
 	input_set_capability(idev, EV_KEY, BTN_TOUCH);
 	input_set_abs_params(idev,
 		ABS_X, ts->min.x, ts->props.max_x, 0, 0);
+	resolution = (ts->props.max_x - ts->min.x) / ts->size_in_mm.x;
+	input_abs_set_res(idev, ABS_X, resolution);
 	input_set_abs_params(idev,
 		ABS_Y, ts->min.y, ts->props.max_y, 0, 0);
+	resolution = (ts->props.max_y - ts->min.y) / ts->size_in_mm.y;
+	input_abs_set_res(idev, ABS_Y, resolution);
 	input_set_abs_params(idev, ABS_PRESSURE, 0x0, 0xff, 0, 0);
 
 	error = input_register_device(idev);
-- 
2.21.0
