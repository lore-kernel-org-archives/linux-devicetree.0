Return-Path: <SRS0=MGmW=T3=klsmartin.com=Leif.Middelschulte@kernel.org>
From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 10/10] Input: stmpe-ts - implement tracking index
Date: Mon, 27 May 2019 18:22:25 +0200
Message-ID: <20190527162225.32136-1-leif.middelschulte@klsmartin.com>
In-Reply-To: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Leif Middelschulte <leif.middelschulte@klsmartin.com>
List-ID: <devicetree@vger.kernel.org>

The tracking index specifies an minimum distance between
two touchpoints so that the latter will be discarded, if
the distance falls short of the configured value.
Beware: When using the XYZ acquisition mode, an increase
in pressure leads to a position report anyway.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 drivers/input/touchscreen/stmpe-ts.c | 5 +++--
 include/linux/mfd/stmpe.h            | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 1d114278e7e9..ec1bbc19562e 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -91,6 +91,7 @@ struct stmpe_touch {
 	u8 fraction_z;
 	u8 i_drive;
 	u8 op_mod;
+	u8 tracking_index;
 	struct {
 	struct {
 		u16 x;
@@ -332,8 +333,8 @@ static int stmpe_init_hw(struct stmpe_touch *ts)
 		return ret;
 	}
 
-	tsc_ctrl = STMPE_OP_MODE(ts->op_mod);
-	tsc_ctrl_mask = STMPE_OP_MODE(0xff);
+	tsc_ctrl = STMPE_TRACK(ts->tracking_index) | STMPE_OP_MODE(ts->op_mod);
+	tsc_ctrl_mask = STMPE_TRACK(0xff) | STMPE_OP_MODE(0xff);
 
 	ret = stmpe_set_bits(stmpe, STMPE_REG_TSC_CTRL,
 			tsc_ctrl_mask, tsc_ctrl);
diff --git a/include/linux/mfd/stmpe.h b/include/linux/mfd/stmpe.h
index 07f55aac9390..4e3217b0237a 100644
--- a/include/linux/mfd/stmpe.h
+++ b/include/linux/mfd/stmpe.h
@@ -16,6 +16,7 @@
 #define STMPE_ADC_FREQ(x)	(x & 0x3)
 #define STMPE_AVE_CTRL(x)	((x & 0x3) << 6)
 #define STMPE_DET_DELAY(x)	((x & 0x7) << 3)
+#define STMPE_TRACK(x)	((x & 0x7) << 4)
 #define STMPE_SETTLING(x)	(x & 0x7)
 #define STMPE_FRACTION_Z(x)	(x & 0x7)
 #define STMPE_I_DRIVE(x)	(x & 0x1)
-- 
2.21.0
