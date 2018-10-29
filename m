Return-Path: <SRS0=pxxc=NJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 2/6] media: mt9m111: add streaming check to set_fmt
Date: Mon, 29 Oct 2018 19:24:06 +0100
Message-Id: <20181029182410.18783-3-m.felsch@pengutronix.de>
In-Reply-To: <20181029182410.18783-1-m.felsch@pengutronix.de>
References: <20181029182410.18783-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: enrico.scholz@sigma-chemnitz.de, akinobu.mita@gmail.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Michael Grzeschik <m.grzeschik@pengutronix.de>, graphics@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

From: Michael Grzeschik <m.grzeschik@pengutronix.de>

Currently set_fmt don't care about the streaming status, so the format
can be changed during streaming. This can lead into wrong behaviours.

Check if the device is already streaming and return -EBUSY to avoid
wrong behaviours.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/i2c/mt9m111.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index e0ac5aa6ea64..1f8789fe28af 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -560,6 +560,9 @@ static int mt9m111_set_fmt(struct v4l2_subdev *sd,
 	bool bayer;
 	int ret;
 
+	if (mt9m111->is_streaming)
+		return -EBUSY;
+
 	if (format->pad)
 		return -EINVAL;
 
-- 
2.19.1
