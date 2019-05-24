Return-Path: <SRS0=qDds=TY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53733 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404065AbfEXOFa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 May 2019 10:05:30 -0400
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 01/10] rockchip/vpu: remove unused declarations
Date: Fri, 24 May 2019 16:04:50 +0200
Message-Id: <20190524140459.4002-2-p.zabel@pengutronix.de>
In-Reply-To: <20190524140459.4002-1-p.zabel@pengutronix.de>
References: <20190524140459.4002-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Remove unused function and struct declarations from the
rockchip_vpu_common.h header file.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../media/rockchip/vpu/rockchip_vpu_common.h  | 25 -------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h
index 0b6a3fb1a48e..96948ec49c18 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h
@@ -18,31 +18,6 @@
 
 #include "rockchip_vpu.h"
 
-extern const struct v4l2_ioctl_ops rockchip_vpu_enc_ioctl_ops;
-extern const struct vb2_ops rockchip_vpu_enc_src_queue_ops;
-extern const struct vb2_ops rockchip_vpu_enc_dst_queue_ops;
-extern const struct v4l2_ioctl_ops rockchip_vpu_dec_ioctl_ops;
-extern const struct vb2_ops rockchip_vpu_dec_src_queue_ops;
-extern const struct vb2_ops rockchip_vpu_dec_dst_queue_ops;
-
-void rockchip_vpu_buf_queue(struct vb2_buffer *vb);
-int rockchip_vpu_src_queue_setup(struct vb2_queue *vq,
-				 unsigned int *num_buffers,
-				 unsigned int *num_planes,
-				 unsigned int sizes[],
-				 struct device *alloc_devs[]);
-int rockchip_vpu_dst_queue_setup(struct vb2_queue *vq,
-				 unsigned int *num_buffers,
-				 unsigned int *num_planes,
-				 unsigned int sizes[],
-				 struct device *alloc_devs[]);
-void rockchip_vpu_buf_request_complete(struct vb2_buffer *vb);
-int rockchip_vpu_buf_out_validate(struct vb2_buffer *vb);
-int rockchip_vpu_src_buf_prepare(struct vb2_buffer *vb);
-int rockchip_vpu_dst_buf_prepare(struct vb2_buffer *vb);
-int rockchip_vpu_start(struct vb2_queue *q, unsigned int count);
-void rockchip_vpu_stop(struct vb2_queue *q);
-
 void *rockchip_vpu_get_ctrl(struct rockchip_vpu_ctx *ctx, u32 id);
 dma_addr_t rockchip_vpu_get_ref(struct vb2_queue *q, u64 ts);
 
-- 
2.20.1
