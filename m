From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 05/13] media: am437x-vpfe: fix start streaming error path
Date: Thu, 19 Sep 2019 15:41:17 -0500
Message-ID: <20190919204125.15254-6-bparrot@ti.com>
References: <20190919204125.15254-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919204125.15254-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

When start_streaming fails the h/w module might be left enabled
inadvertently. Make sure it is disabled in the error path.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 66df87d310a2..e0a4c8920df8 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -2008,6 +2008,7 @@ static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
 	}
 
+	vpfe_pcr_enable(&vpfe->ccdc, 0);
 	return ret;
 }
 
-- 
2.17.1
