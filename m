Return-Path: <SRS0=TXGq=PL=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 3/5] Input: edt-ft5x06 - Add support to update ev-ft5726 registers
Date: Thu,  3 Jan 2019 20:23:25 +0100
Message-Id: <20190103192327.6170-4-m.felsch@pengutronix.de>
In-Reply-To: <20190103192327.6170-1-m.felsch@pengutronix.de>
References: <20190103192327.6170-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, hdegoede@redhat.com, simon.budig@kernelconcepts.de
List-ID: <devicetree@vger.kernel.org>

Currently only the threshold and gain parameters can be read.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/edt-ft5x06.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 1cd5b804a456..a67915535b47 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -353,9 +353,10 @@ struct edt_ft5x06_attribute {
 	u8 limit_high;
 	u8 addr_m06;
 	u8 addr_m09;
+	u8 addr_ev;
 };
 
-#define EDT_ATTR(_field, _mode, _addr_m06, _addr_m09,			\
+#define EDT_ATTR(_field, _mode, _addr_m06, _addr_m09, _addr_ev,		\
 		_limit_low, _limit_high)				\
 	struct edt_ft5x06_attribute edt_ft5x06_attr_##_field = {	\
 		.dattr = __ATTR(_field, _mode,				\
@@ -364,6 +365,7 @@ struct edt_ft5x06_attribute {
 		.field_offset = offsetof(struct edt_ft5x06_ts_data, _field), \
 		.addr_m06 = _addr_m06,					\
 		.addr_m09 = _addr_m09,					\
+		.addr_ev  = _addr_ev,					\
 		.limit_low = _limit_low,				\
 		.limit_high = _limit_high,				\
 	}
@@ -400,6 +402,10 @@ static ssize_t edt_ft5x06_setting_show(struct device *dev,
 		addr = attr->addr_m09;
 		break;
 
+	case EV_FT:
+		addr = attr->addr_ev;
+		break;
+
 	default:
 		error = -ENODEV;
 		goto out;
@@ -471,6 +477,10 @@ static ssize_t edt_ft5x06_setting_store(struct device *dev,
 		addr = attr->addr_m09;
 		break;
 
+	case EV_FT:
+		addr = attr->addr_ev;
+		break;
+
 	default:
 		error = -ENODEV;
 		goto out;
@@ -494,16 +504,16 @@ static ssize_t edt_ft5x06_setting_store(struct device *dev,
 
 /* m06, m09: range 0-31, m12: range 0-5 */
 static EDT_ATTR(gain, S_IWUSR | S_IRUGO, WORK_REGISTER_GAIN,
-		M09_REGISTER_GAIN, 0, 31);
+		M09_REGISTER_GAIN, EV_REGISTER_GAIN, 0, 31);
 /* m06, m09: range 0-31, m12: range 0-16 */
 static EDT_ATTR(offset, S_IWUSR | S_IRUGO, WORK_REGISTER_OFFSET,
-		M09_REGISTER_OFFSET, 0, 31);
+		M09_REGISTER_OFFSET, NO_REGISTER, 0, 31);
 /* m06: range 20 to 80, m09: range 0 to 30, m12: range 1 to 255... */
 static EDT_ATTR(threshold, S_IWUSR | S_IRUGO, WORK_REGISTER_THRESHOLD,
-		M09_REGISTER_THRESHOLD, 0, 255);
+		M09_REGISTER_THRESHOLD, EV_REGISTER_THRESHOLD, 0, 255);
 /* m06: range 3 to 14, m12: (0x64: 100Hz) */
 static EDT_ATTR(report_rate, S_IWUSR | S_IRUGO, WORK_REGISTER_REPORT_RATE,
-		NO_REGISTER, 0, 255);
+		NO_REGISTER, NO_REGISTER, 0, 255);
 
 static struct attribute *edt_ft5x06_attrs[] = {
 	&edt_ft5x06_attr_gain.dattr.attr,
-- 
2.19.1
