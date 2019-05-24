Return-Path: <SRS0=qDds=TY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54209 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403864AbfEXOFa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 May 2019 10:05:30 -0400
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 03/10] media: hantro: print video device name in addition to device node
Date: Fri, 24 May 2019 16:04:52 +0200
Message-Id: <20190524140459.4002-4-p.zabel@pengutronix.de>
In-Reply-To: <20190524140459.4002-1-p.zabel@pengutronix.de>
References: <20190524140459.4002-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/hantro/hantro_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index c1ed3a2eda3f..1d4d5ec8ab19 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -608,7 +608,8 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 		goto err_unreg_dev;
 	}
 
-	v4l2_info(&vpu->v4l2_dev, "registered as /dev/video%d\n", vfd->num);
+	v4l2_info(&vpu->v4l2_dev, "registered %s as /dev/video%d\n", vfd->name,
+		  vfd->num);
 
 	return 0;
 
-- 
2.20.1
