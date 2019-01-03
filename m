Return-Path: <SRS0=TXGq=PL=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 2/5] Input: edt-ft5x06 - add support for Evervision FT5726
Date: Thu,  3 Jan 2019 20:23:24 +0100
Message-Id: <20190103192327.6170-3-m.felsch@pengutronix.de>
In-Reply-To: <20190103192327.6170-1-m.felsch@pengutronix.de>
References: <20190103192327.6170-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, hdegoede@redhat.com, simon.budig@kernelconcepts.de
List-ID: <devicetree@vger.kernel.org>

Evervision displays are using different Focaltech touchscreen
controllers. This commit adds the initial support for the ones using the
FT5726 controller. Receiving the touch data is the same as for the
GENERIC_FT but the x and y cooridnates are swapped. The main differences
are the register addresses where the GAIN and THRESHOLD parameters are
stored.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/edt-ft5x06.c | 44 ++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 1e18ca0d1b4e..1cd5b804a456 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -31,6 +31,7 @@
 #include <linux/interrupt.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
+#include <linux/kernel.h>
 #include <linux/uaccess.h>
 #include <linux/delay.h>
 #include <linux/debugfs.h>
@@ -53,6 +54,9 @@
 #define M09_REGISTER_NUM_X		0x94
 #define M09_REGISTER_NUM_Y		0x95
 
+#define EV_REGISTER_THRESHOLD		0x40
+#define EV_REGISTER_GAIN		0x41
+
 #define NO_REGISTER			0xff
 
 #define WORK_REGISTER_OPMODE		0x3c
@@ -73,6 +77,7 @@ enum edt_ver {
 	EDT_M06,
 	EDT_M09,
 	EDT_M12,
+	EV_FT,
 	GENERIC_FT,
 };
 
@@ -190,6 +195,7 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 
 	case EDT_M09:
 	case EDT_M12:
+	case EV_FT:
 	case GENERIC_FT:
 		cmd = 0x0;
 		offset = 3;
@@ -242,6 +248,10 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 
 		x = ((buf[0] << 8) | buf[1]) & 0x0fff;
 		y = ((buf[2] << 8) | buf[3]) & 0x0fff;
+		/* The FT5x26 send the y coordinate first */
+		if (tsdata->version == EV_FT)
+			swap(x, y);
+
 		id = (buf[2] >> 4) & 0x0f;
 		down = type != TOUCH_EVENT_UP;
 
@@ -275,8 +285,10 @@ static int edt_ft5x06_register_write(struct edt_ft5x06_ts_data *tsdata,
 		wrbuf[3] = wrbuf[0] ^ wrbuf[1] ^ wrbuf[2];
 		return edt_ft5x06_ts_readwrite(tsdata->client, 4,
 					wrbuf, 0, NULL);
+	/* fallthrough */
 	case EDT_M09:
 	case EDT_M12:
+	case EV_FT:
 	case GENERIC_FT:
 		wrbuf[0] = addr;
 		wrbuf[1] = value;
@@ -315,8 +327,10 @@ static int edt_ft5x06_register_read(struct edt_ft5x06_ts_data *tsdata,
 		}
 		break;
 
+	/* fallthrough */
 	case EDT_M09:
 	case EDT_M12:
+	case EV_FT:
 	case GENERIC_FT:
 		wrbuf[0] = addr;
 		error = edt_ft5x06_ts_readwrite(tsdata->client, 1,
@@ -605,8 +619,9 @@ static int edt_ft5x06_work_mode(struct edt_ft5x06_ts_data *tsdata)
 				  tsdata->threshold);
 	edt_ft5x06_register_write(tsdata, reg_addr->reg_gain,
 				  tsdata->gain);
-	edt_ft5x06_register_write(tsdata, reg_addr->reg_offset,
-				  tsdata->offset);
+	if (reg_addr->reg_offset != NO_REGISTER)
+		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset,
+					  tsdata->offset);
 	if (reg_addr->reg_report_rate != NO_REGISTER)
 		edt_ft5x06_register_write(tsdata, reg_addr->reg_report_rate,
 				  tsdata->report_rate);
@@ -867,6 +882,16 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 		case 0x5a:   /* Solomon Goldentek Display */
 			snprintf(model_name, EDT_NAME_LEN, "GKTW50SCED1R0");
 			break;
+		case 0x59:  /* Evervision Display with FT5xx6 TS */
+			tsdata->version = EV_FT;
+			error = edt_ft5x06_ts_readwrite(client, 1, "\x53",
+							1, rdbuf);
+			if (error)
+				return error;
+			strlcpy(fw_version, rdbuf, 1);
+			snprintf(model_name, EDT_NAME_LEN,
+				 "EVERVISION-FT5726NEi");
+			break;
 		default:
 			snprintf(model_name, EDT_NAME_LEN,
 				 "generic ft5x06 (%02x)",
@@ -912,7 +937,9 @@ edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
 	tsdata->threshold = edt_ft5x06_register_read(tsdata,
 						     reg_addr->reg_threshold);
 	tsdata->gain = edt_ft5x06_register_read(tsdata, reg_addr->reg_gain);
-	tsdata->offset = edt_ft5x06_register_read(tsdata, reg_addr->reg_offset);
+	if (reg_addr->reg_offset != NO_REGISTER)
+		tsdata->offset =
+			edt_ft5x06_register_read(tsdata, reg_addr->reg_offset);
 	if (reg_addr->reg_report_rate != NO_REGISTER)
 		tsdata->report_rate = edt_ft5x06_register_read(tsdata,
 						reg_addr->reg_report_rate);
@@ -954,6 +981,15 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 		reg_addr->reg_num_y = M09_REGISTER_NUM_Y;
 		break;
 
+	case EV_FT:
+		reg_addr->reg_threshold = EV_REGISTER_THRESHOLD;
+		reg_addr->reg_gain = EV_REGISTER_GAIN;
+		reg_addr->reg_offset = NO_REGISTER;
+		reg_addr->reg_num_x = NO_REGISTER;
+		reg_addr->reg_num_y = NO_REGISTER;
+		reg_addr->reg_report_rate = NO_REGISTER;
+		break;
+
 	case GENERIC_FT:
 		/* this is a guesswork */
 		reg_addr->reg_threshold = M09_REGISTER_THRESHOLD;
@@ -1155,6 +1191,7 @@ static const struct edt_i2c_chip_data edt_ft6236_data = {
 static const struct i2c_device_id edt_ft5x06_ts_id[] = {
 	{ .name = "edt-ft5x06", .driver_data = (long)&edt_ft5x06_data },
 	{ .name = "edt-ft5506", .driver_data = (long)&edt_ft5506_data },
+	{ .name = "ev-ft5726", .driver_data = (long)&edt_ft5506_data },
 	/* Note no edt- prefix for compatibility with the ft6236.c driver */
 	{ .name = "ft6236", .driver_data = (long)&edt_ft6236_data },
 	{ /* sentinel */ }
@@ -1167,6 +1204,7 @@ static const struct of_device_id edt_ft5x06_of_match[] = {
 	{ .compatible = "edt,edt-ft5306", .data = &edt_ft5x06_data },
 	{ .compatible = "edt,edt-ft5406", .data = &edt_ft5x06_data },
 	{ .compatible = "edt,edt-ft5506", .data = &edt_ft5506_data },
+	{ .compatible = "evervision,ev-ft5726", .data = &edt_ft5506_data },
 	/* Note focaltech vendor prefix for compatibility with ft6236.c */
 	{ .compatible = "focaltech,ft6236", .data = &edt_ft6236_data },
 	{ /* sentinel */ }
-- 
2.19.1
