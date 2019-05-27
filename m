Return-Path: <SRS0=MGmW=T3=klsmartin.com=Leif.Middelschulte@kernel.org>
From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 08/10] Input: stmpe-ts - axes inversion and swapping
Date: Mon, 27 May 2019 18:19:36 +0200
Message-ID: <20190527161938.31871-4-leif.middelschulte@klsmartin.com>
In-Reply-To: <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Leif Middelschulte <leif.middelschulte@klsmartin.com>
List-ID: <devicetree@vger.kernel.org>

This implements inversion and swapping of the reported X and Y input
values, configurable via the corresponding devicetree properties binding.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 drivers/input/touchscreen/stmpe-ts.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 152aac8b3ab7..1d114278e7e9 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -217,8 +217,12 @@ static irqreturn_t stmpe_ts_handler(int irq, void *data)
 		goto _skip_input_events;
 	}
 
-	input_report_abs(ts->idev, ABS_X, x);
-	input_report_abs(ts->idev, ABS_Y, y);
+	if (ts->props.invert_x)
+		x -= ts->min.x;
+	if (ts->props.invert_y)
+		y -= ts->min.y;
+
+	touchscreen_report_pos(ts->idev, &ts->props, x, y, false);
 	if (report_pressure)
 		input_report_abs(ts->idev, ABS_PRESSURE, z);
 	input_report_key(ts->idev, BTN_TOUCH, 1);
-- 
2.21.0
