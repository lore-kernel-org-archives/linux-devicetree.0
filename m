From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v2 5/7] [media] ir-lirc-codec: don't wait any transmitting time
 for tx only devices
Date: Fri, 02 Sep 2016 02:16:27 +0900
Message-ID: <20160901171629.15422-6-andi.shyti@samsung.com>
References: <20160901171629.15422-1-andi.shyti@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <20160901171629.15422-1-andi.shyti@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Sean Young <sean@mess.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>
List-Id: devicetree@vger.kernel.org

Transmitters do not need to wait until the data has been sent
(and of course received). Return before waiting.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 drivers/media/rc/ir-lirc-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir-lirc-codec.c b/drivers/media/rc/ir-lirc-codec.c
index c327730..d8953fb 100644
--- a/drivers/media/rc/ir-lirc-codec.c
+++ b/drivers/media/rc/ir-lirc-codec.c
@@ -153,7 +153,7 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
 	}
 
 	ret = dev->tx_ir(dev, txbuf, count);
-	if (ret < 0)
+	if (ret < 0 || dev->driver_type == RC_DRIVER_IR_RAW_TX)
 		goto out;
 
 	for (duration = i = 0; i < ret; i++)
-- 
2.9.3
