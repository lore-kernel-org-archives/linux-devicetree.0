Return-Path: <SRS0=FTfk=PL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50043 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbfACTXs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 3 Jan 2019 14:23:48 -0500
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 5/5] Input: edt-ft5x06 - add offset support for ev-ft5726
Date: Thu,  3 Jan 2019 20:23:27 +0100
Message-Id: <20190103192327.6170-6-m.felsch@pengutronix.de>
In-Reply-To: <20190103192327.6170-1-m.felsch@pengutronix.de>
References: <20190103192327.6170-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, hdegoede@redhat.com, simon.budig@kernelconcepts.de
List-ID: <devicetree@vger.kernel.org>

Unfortunately the evervision focaltech implementation uses two offset
registers, one for the x coordinate and one for y.

This patch extends the driver to handle those offset registers only for
devices that support these.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/edt-ft5x06.c | 46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index a67915535b47..702bfda7ee77 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -56,6 +56,8 @@
 
 #define EV_REGISTER_THRESHOLD		0x40
 #define EV_REGISTER_GAIN		0x41
+#define EV_REGISTER_OFFSET_Y		0x45
+#define EV_REGISTER_OFFSET_X		0x46
 
 #define NO_REGISTER			0xff
 
@@ -86,6 +88,8 @@ struct edt_reg_addr {
 	int reg_report_rate;
 	int reg_gain;
 	int reg_offset;
+	int reg_offset_x;
+	int reg_offset_y;
 	int reg_num_x;
 	int reg_num_y;
 };
@@ -111,6 +115,8 @@ struct edt_ft5x06_ts_data {
 	int threshold;
 	int gain;
 	int offset;
+	int offset_x;
+	int offset_y;
 	int report_rate;
 	int max_support_points;
 
@@ -508,6 +514,12 @@ static EDT_ATTR(gain, S_IWUSR | S_IRUGO, WORK_REGISTER_GAIN,
 /* m06, m09: range 0-31, m12: range 0-16 */
 static EDT_ATTR(offset, S_IWUSR | S_IRUGO, WORK_REGISTER_OFFSET,
 		M09_REGISTER_OFFSET, NO_REGISTER, 0, 31);
+/* m06, m09, m12: no supported, ev_ft: range 0-80 */
+static EDT_ATTR(offset_x, S_IWUSR | S_IRUGO, NO_REGISTER, NO_REGISTER,
+		EV_REGISTER_OFFSET_X, 0, 80);
+/* m06, m09, m12: no supported, ev_ft: range 0-80 */
+static EDT_ATTR(offset_y, S_IWUSR | S_IRUGO, NO_REGISTER, NO_REGISTER,
+		EV_REGISTER_OFFSET_Y, 0, 80);
 /* m06: range 20 to 80, m09: range 0 to 30, m12: range 1 to 255... */
 static EDT_ATTR(threshold, S_IWUSR | S_IRUGO, WORK_REGISTER_THRESHOLD,
 		M09_REGISTER_THRESHOLD, EV_REGISTER_THRESHOLD, 0, 255);
@@ -518,6 +530,8 @@ static EDT_ATTR(report_rate, S_IWUSR | S_IRUGO, WORK_REGISTER_REPORT_RATE,
 static struct attribute *edt_ft5x06_attrs[] = {
 	&edt_ft5x06_attr_gain.dattr.attr,
 	&edt_ft5x06_attr_offset.dattr.attr,
+	&edt_ft5x06_attr_offset_x.dattr.attr,
+	&edt_ft5x06_attr_offset_y.dattr.attr,
 	&edt_ft5x06_attr_threshold.dattr.attr,
 	&edt_ft5x06_attr_report_rate.dattr.attr,
 	NULL
@@ -632,6 +646,12 @@ static int edt_ft5x06_work_mode(struct edt_ft5x06_ts_data *tsdata)
 	if (reg_addr->reg_offset != NO_REGISTER)
 		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset,
 					  tsdata->offset);
+	if (reg_addr->reg_offset_x != NO_REGISTER)
+		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset_x,
+					  tsdata->offset_x);
+	if (reg_addr->reg_offset_y != NO_REGISTER)
+		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset_y,
+					  tsdata->offset_y);
 	if (reg_addr->reg_report_rate != NO_REGISTER)
 		edt_ft5x06_register_write(tsdata, reg_addr->reg_report_rate,
 				  tsdata->report_rate);
@@ -937,6 +957,18 @@ static void edt_ft5x06_ts_get_defaults(struct device *dev,
 		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset, val);
 		tsdata->offset = val;
 	}
+
+	error = device_property_read_u32(dev, "offset-x", &val);
+	if (!error) {
+		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset_x, val);
+		tsdata->offset_x = val;
+	}
+
+	error = device_property_read_u32(dev, "offset-y", &val);
+	if (!error) {
+		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset_y, val);
+		tsdata->offset_y = val;
+	}
 }
 
 static void
@@ -950,6 +982,12 @@ edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
 	if (reg_addr->reg_offset != NO_REGISTER)
 		tsdata->offset =
 			edt_ft5x06_register_read(tsdata, reg_addr->reg_offset);
+	if (reg_addr->reg_offset_x != NO_REGISTER)
+		tsdata->offset_x = edt_ft5x06_register_read(tsdata,
+						reg_addr->reg_offset_x);
+	if (reg_addr->reg_offset_y != NO_REGISTER)
+		tsdata->offset_y = edt_ft5x06_register_read(tsdata,
+						reg_addr->reg_offset_y);
 	if (reg_addr->reg_report_rate != NO_REGISTER)
 		tsdata->report_rate = edt_ft5x06_register_read(tsdata,
 						reg_addr->reg_report_rate);
@@ -977,6 +1015,8 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 		reg_addr->reg_report_rate = WORK_REGISTER_REPORT_RATE;
 		reg_addr->reg_gain = WORK_REGISTER_GAIN;
 		reg_addr->reg_offset = WORK_REGISTER_OFFSET;
+		reg_addr->reg_offset_x = NO_REGISTER;
+		reg_addr->reg_offset_y = NO_REGISTER;
 		reg_addr->reg_num_x = WORK_REGISTER_NUM_X;
 		reg_addr->reg_num_y = WORK_REGISTER_NUM_Y;
 		break;
@@ -987,6 +1027,8 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 		reg_addr->reg_report_rate = NO_REGISTER;
 		reg_addr->reg_gain = M09_REGISTER_GAIN;
 		reg_addr->reg_offset = M09_REGISTER_OFFSET;
+		reg_addr->reg_offset_x = NO_REGISTER;
+		reg_addr->reg_offset_y = NO_REGISTER;
 		reg_addr->reg_num_x = M09_REGISTER_NUM_X;
 		reg_addr->reg_num_y = M09_REGISTER_NUM_Y;
 		break;
@@ -995,6 +1037,8 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 		reg_addr->reg_threshold = EV_REGISTER_THRESHOLD;
 		reg_addr->reg_gain = EV_REGISTER_GAIN;
 		reg_addr->reg_offset = NO_REGISTER;
+		reg_addr->reg_offset_x = EV_REGISTER_OFFSET_X;
+		reg_addr->reg_offset_y = EV_REGISTER_OFFSET_Y;
 		reg_addr->reg_num_x = NO_REGISTER;
 		reg_addr->reg_num_y = NO_REGISTER;
 		reg_addr->reg_report_rate = NO_REGISTER;
@@ -1005,6 +1049,8 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 		reg_addr->reg_threshold = M09_REGISTER_THRESHOLD;
 		reg_addr->reg_gain = M09_REGISTER_GAIN;
 		reg_addr->reg_offset = M09_REGISTER_OFFSET;
+		reg_addr->reg_offset_x = NO_REGISTER;
+		reg_addr->reg_offset_y = NO_REGISTER;
 		break;
 	}
 }
-- 
2.19.1
