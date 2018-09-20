Return-Path: <SRS0=lNwp=MC=pengutronix.de=l.stach@kernel.org>
From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 4/4] Input: egalax_ts - add support for new protocol version
Date: Thu, 20 Sep 2018 16:22:56 +0200
Message-Id: <20180920142256.2788-4-l.stach@pengutronix.de>
In-Reply-To: <20180920142256.2788-1-l.stach@pengutronix.de>
References: <20180920142256.2788-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
List-ID: <devicetree@vger.kernel.org>

This implements support for the new protocol that supports up to
10 touch slots spread over up to 2 i2c messages.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/touchscreen/egalax_ts.c | 132 +++++++++++++++++++++-----
 1 file changed, 106 insertions(+), 26 deletions(-)

diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index 0f924d8c17c8..ef25aec71d56 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -41,6 +41,7 @@
 #define REPORT_MODE_VENDOR		0x3
 /* Multiple Touch Mode */
 #define REPORT_MODE_MTTOUCH		0x4
+#define REPORT_MODE_MTTOUCH_NEW		0x6
 
 #define MAX_SUPPORT_POINTS		5
 
@@ -51,8 +52,9 @@
 #define EVENT_IN_RANGE		(0x1 << 1)
 #define EVENT_DOWN_UP		(0X1 << 0)
 
-#define MAX_I2C_DATA_LEN	10
+#define MAX_I2C_DATA_LEN	(64 + 2)
 
+#define EGALAX_POINT_SIZE	10
 #define EGALAX_MAX_TRIES 100
 
 struct egalax_ts {
@@ -62,41 +64,66 @@ struct egalax_ts {
 	struct touchscreen_properties	props;
 };
 
-static irqreturn_t egalax_ts_interrupt(int irq, void *dev_id)
+static int egalax_ts_handle_points(struct egalax_ts *ts, u8 *msg,
+				   int num_points)
 {
-	struct egalax_ts *ts = dev_id;
 	struct input_dev *input_dev = ts->input_dev;
 	struct i2c_client *client = ts->client;
-	u8 buf[MAX_I2C_DATA_LEN];
-	int id, ret, x, y, z;
-	int tries = 0;
-	bool down, valid;
-	u8 state;
+	bool down;
+	int i, id, x, y;
+
+	for (i = 0; i < min(MAX_SUPPORT_POINTS, num_points);
+	     i++, msg += EGALAX_POINT_SIZE, num_points--) {
+		down = !!(msg[0] & EVENT_DOWN_UP);
+		id = msg[1];
+		x = (msg[3] << 8) | msg[2];
+		y = (msg[5] << 8) | msg[4];
+
+		if (id > 10) {
+			dev_warn(&client->dev,
+				 "dropping out of range event %d\n", id);
+			continue;
+		}
+
+		input_mt_slot(input_dev, id);
+		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, down);
+
+		dev_dbg(&client->dev, "%s id:%d x:%d y:%d",
+			down ? "down" : "up", id, x, y);
+
+		if (down)
+			touchscreen_report_pos(input_dev, &ts->props,
+					       x, y, true);
+	}
 
-	do {
-		ret = i2c_master_recv(client, buf, MAX_I2C_DATA_LEN);
-	} while (ret == -EAGAIN && tries++ < EGALAX_MAX_TRIES);
+	if (!num_points) {
+		input_mt_sync_frame(input_dev);
+		input_sync(input_dev);
+	}
 
-	if (ret < 0)
-		return IRQ_HANDLED;
+	return num_points;
+}
 
-	if (buf[0] != REPORT_MODE_MTTOUCH) {
-		/* ignore mouse events and vendor events */
-		return IRQ_HANDLED;
-	}
+static void egalax_ts_handle_points_legacy(struct egalax_ts *ts, u8 *msg)
+{
+	struct input_dev *input_dev = ts->input_dev;
+	struct i2c_client *client = ts->client;
+	bool down, valid;
+	int id, x, y, z;
+	u8 state;
 
-	state = buf[1];
-	x = (buf[3] << 8) | buf[2];
-	y = (buf[5] << 8) | buf[4];
-	z = (buf[7] << 8) | buf[6];
+	state = msg[0];
+	x = (msg[2] << 8) | msg[2];
+	y = (msg[4] << 8) | msg[3];
+	z = (msg[6] << 8) | msg[5];
 
 	valid = state & EVENT_VALID_MASK;
 	id = (state & EVENT_ID_MASK) >> EVENT_ID_OFFSET;
 	down = state & EVENT_DOWN_UP;
 
-	if (!valid || id > MAX_SUPPORT_POINTS) {
+	if (!valid || id > 5) {
 		dev_dbg(&client->dev, "point invalid\n");
-		return IRQ_HANDLED;
+		return;
 	}
 
 	input_mt_slot(input_dev, id);
@@ -112,6 +139,52 @@ static irqreturn_t egalax_ts_interrupt(int irq, void *dev_id)
 
 	input_mt_report_pointer_emulation(input_dev, true);
 	input_sync(input_dev);
+}
+
+static irqreturn_t egalax_ts_interrupt(int irq, void *dev_id)
+{
+	struct egalax_ts *ts = dev_id;
+	struct i2c_client *client = ts->client;
+	u8 buf[MAX_I2C_DATA_LEN], *payload;
+	int ret, num_points, tries = 0;
+	int remaining = 0;
+
+again:
+	do {
+		ret = i2c_master_recv(client, buf, MAX_I2C_DATA_LEN);
+	} while (ret == -EAGAIN && tries++ < EGALAX_MAX_TRIES);
+
+	if (ret < 0) {
+		dev_err_ratelimited(&client->dev,
+				    "reading touch info failed: %d\n", ret);
+		return IRQ_HANDLED;
+	}
+
+	if (ts->protocol_version == 0) {
+		payload = &buf[0];
+		num_points = 1;
+	} else {
+		payload = &buf[2];
+		num_points = buf[3];
+
+	}
+
+	switch (payload[0]) {
+	case REPORT_MODE_MTTOUCH:
+		egalax_ts_handle_points_legacy(ts, payload + 1);
+		break;
+	case REPORT_MODE_MTTOUCH_NEW:
+		if (!remaining)
+			remaining = payload[1];
+		remaining = egalax_ts_handle_points(ts, payload + 2, remaining);
+		break;
+	default:
+		/* ignore unknown report IDs */
+		break;
+	}
+
+	if (remaining)
+		goto again;
 
 	return IRQ_HANDLED;
 }
@@ -166,6 +239,7 @@ static int egalax_ts_probe(struct i2c_client *client,
 {
 	struct egalax_ts *ts;
 	struct input_dev *input_dev;
+	unsigned int max_points = MAX_SUPPORT_POINTS;
 	int error;
 
 	ts = devm_kzalloc(&client->dev, sizeof(struct egalax_ts), GFP_KERNEL);
@@ -203,14 +277,20 @@ static int egalax_ts_probe(struct i2c_client *client,
 	input_dev->id.bustype = BUS_I2C;
 
 	touchscreen_parse_properties(ts->input_dev, true, &ts->props);
-	if (!ts->props.max_x && !ts->props.max_y)
-		ts->props.max_x = ts->props.max_y = 32760;
+	if (!ts->props.max_x && !ts->props.max_y) {
+		if (ts->protocol_version == 0)
+			ts->props.max_x = ts->props.max_y = 32760;
+		else
+			ts->props.max_x = ts->props.max_y = 4095;
+	}
+	if (ts->protocol_version != 0)
+		max_points *= 2;
 
 	input_set_abs_params(input_dev, ABS_MT_POSITION_X,
 			     0, ts->props.max_x, 0, 0);
 	input_set_abs_params(input_dev, ABS_MT_POSITION_Y,
 			     0, ts->props.max_y, 0, 0);
-	input_mt_init_slots(input_dev, MAX_SUPPORT_POINTS,
+	input_mt_init_slots(input_dev, max_points,
 			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 
 	error = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-- 
2.19.0
