Return-Path: <SRS0=hyxw=T4=pengutronix.de=mtr@kernel.org>
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v8 1/5] videobuf2-v4l2: set last_buffer_dequeued in dqbuf
Date: Tue, 28 May 2019 19:11:16 +0200
Message-Id: <20190528171120.7076-2-m.tretter@pengutronix.de>
In-Reply-To: <20190528171120.7076-1-m.tretter@pengutronix.de>
References: <20190528171120.7076-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
