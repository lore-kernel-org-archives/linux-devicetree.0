Return-Path: <SRS0=L0hH=T5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55773 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfE2Jyj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 May 2019 05:54:39 -0400
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 2/9] media: hantro: print video device name in addition to device node
Date: Wed, 29 May 2019 11:54:17 +0200
Message-Id: <20190529095424.23614-3-p.zabel@pengutronix.de>
In-Reply-To: <20190529095424.23614-1-p.zabel@pengutronix.de>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

It can be helpful to know which video device was registered at which
device node.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/hantro/hantro_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index f01d1ed10d4a..e4390aa5c213 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -606,7 +606,8 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 		goto err_unreg_dev;
 	}
 
-	v4l2_info(&vpu->v4l2_dev, "registered as /dev/video%d\n", vfd->num);
+	v4l2_info(&vpu->v4l2_dev, "registered %s as /dev/video%d\n", vfd->name,
+		  vfd->num);
 
 	return 0;
 
-- 
2.20.1
