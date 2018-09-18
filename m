Return-Path: <SRS0=TIsf=MA=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 2/9] media: tvp5150: fix irq_request error path during probe
Date: Tue, 18 Sep 2018 15:14:46 +0200
Message-Id: <20180918131453.21031-3-m.felsch@pengutronix.de>
In-Reply-To: <20180918131453.21031-1-m.felsch@pengutronix.de>
References: <20180918131453.21031-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, p.zabel@pengutronix.de, javierm@redhat.com, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, afshin.nasser@gmail.com, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Commit 37c65802e76a ("media: tvp5150: Add sync lock interrupt handling")
introduced the interrupt handling. But we have to free the
v4l2_ctrl_handler before we can return the error code.

Fixes: 37c65802e76a ("media: tvp5150: Add sync lock interrupt handling")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/i2c/tvp5150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 133073518744..40aaa8ca0b63 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1650,7 +1650,7 @@ static int tvp5150_probe(struct i2c_client *c,
 						tvp5150_isr, IRQF_TRIGGER_HIGH |
 						IRQF_ONESHOT, "tvp5150", core);
 		if (res)
-			return res;
+			goto err;
 	}
 
 	res = v4l2_async_register_subdev(sd);
-- 
2.19.0
