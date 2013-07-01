From: Richard Genoud <richard.genoud@gmail.com>
Subject: [RFC PATCH 11/13] sound: atmel-pcm-dma: check pointer before dereference
Date: Mon,  1 Jul 2013 10:39:36 +0200
Message-ID: <1372667978-4718-12-git-send-email-richard.genoud@gmail.com>
References: <1372667978-4718-1-git-send-email-richard.genoud@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372667978-4718-1-git-send-email-richard.genoud@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>
List-Id: devicetree@vger.kernel.org

If platform_data is NULL, filter() is called with a NULL slave
parameter.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 sound/soc/atmel/atmel-pcm-dma.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
index 1d38fd0..b20dbba 100644
--- a/sound/soc/atmel/atmel-pcm-dma.c
+++ b/sound/soc/atmel/atmel-pcm-dma.c
@@ -96,6 +96,9 @@ static bool filter(struct dma_chan *chan, void *slave)
 {
 	struct at_dma_slave *sl = slave;
 
+	if (!sl)
+		return false;
+
 	if (sl->dma_dev == chan->device->dev) {
 		chan->private = sl;
 		return true;
-- 
1.7.10.4
