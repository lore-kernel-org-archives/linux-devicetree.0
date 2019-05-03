Return-Path: <SRS0=1IWS=TD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38737 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727699AbfECMUO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 May 2019 08:20:14 -0400
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v5 1/5] videobuf2-v4l2: set last_buffer_dequeued in dqbuf
Date: Fri,  3 May 2019 14:20:06 +0200
Message-Id: <20190503122010.16663-2-m.tretter@pengutronix.de>
In-Reply-To: <20190503122010.16663-1-m.tretter@pengutronix.de>
References: <20190503122010.16663-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl, Hans Verkuil <hverkuil-cisco@xs4all.nl>
List-ID: <devicetree@vger.kernel.org>

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

last_buffer_dequeued was set to true in __fill_v4l2_buffer, but this
is called for qbuf as well. Move it to vb2_dqbuf.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index fb9ac7696fc6..40d76eb4c2fe 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -563,11 +563,6 @@ static void __fill_v4l2_buffer(struct vb2_buffer *vb, void *pb)
 		b->flags |= V4L2_BUF_FLAG_REQUEST_FD;
 		b->request_fd = vbuf->request_fd;
 	}
-
-	if (!q->is_output &&
-		b->flags & V4L2_BUF_FLAG_DONE &&
-		b->flags & V4L2_BUF_FLAG_LAST)
-		q->last_buffer_dequeued = true;
 }
 
 /*
@@ -786,6 +781,11 @@ int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking)
 
 	ret = vb2_core_dqbuf(q, NULL, b, nonblocking);
 
+	if (!q->is_output &&
+	    b->flags & V4L2_BUF_FLAG_DONE &&
+	    b->flags & V4L2_BUF_FLAG_LAST)
+		q->last_buffer_dequeued = true;
+
 	/*
 	 *  After calling the VIDIOC_DQBUF V4L2_BUF_FLAG_DONE must be
 	 *  cleared.
-- 
2.20.1
