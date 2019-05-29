Return-Path: <SRS0=L0hH=T5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35403 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfE2Jyh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 May 2019 05:54:37 -0400
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 6/9] media: hantro: add support for separate control block
Date: Wed, 29 May 2019 11:54:21 +0200
Message-Id: <20190529095424.23614-7-p.zabel@pengutronix.de>
In-Reply-To: <20190529095424.23614-1-p.zabel@pengutronix.de>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On i.MX8MQ/MM a separate control block contains registers for per-core
resets, clock gating, and fuse register control.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/hantro/hantro.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index b796867808d5..c0d58143ed0d 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -160,6 +160,7 @@ hantro_vdev_to_func(struct video_device *vdev)
  * @base:		Mapped address of VPU registers.
  * @enc_base:		Mapped address of VPU encoder register for convenience.
  * @dec_base:		Mapped address of VPU decoder register for convenience.
+ * @ctrl_base:		Mapped address of VPU control block.
  * @vpu_mutex:		Mutex to synchronize V4L2 calls.
  * @irqlock:		Spinlock to synchronize access to data structures
  *			shared with interrupt handlers.
@@ -178,6 +179,7 @@ struct hantro_dev {
 	void __iomem *base[HANTRO_MAX_REG_RANGES];
 	void __iomem *enc_base;
 	void __iomem *dec_base;
+	void __iomem *ctrl_base;
 
 	struct mutex vpu_mutex;	/* video_device lock */
 	spinlock_t irqlock;
-- 
2.20.1
