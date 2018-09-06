From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: [PATCH v9 1/9] media: videobuf2-core: Rework and rename
 helper for request buffer count
Date: Fri,  7 Sep 2018 00:24:34 +0200
Message-ID: <20180906222442.14825-2-contact@paulk.fr>
References: <20180906222442.14825-1-contact@paulk.fr>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC75HK6WUAEBBL6TY3OAKGQEV2VCBXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180906222442.14825-1-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The helper indicating whether buffers are associated with the request is
reworked and renamed to return the number of associated buffer objects.

This is useful for drivers that need to check how many buffers are in
the request to validate it.

Existing users of the helper don't need particular adaptation since the
meaning of zero/non-zero remains consistent.

Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
---
 .../media/common/videobuf2/videobuf2-core.c    | 18 ++++++++----------
 .../media/common/videobuf2/videobuf2-v4l2.c    |  2 +-
 include/media/videobuf2-core.h                 |  4 ++--
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index cb86b02afd4a..194b9188ad3e 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1368,23 +1368,21 @@ bool vb2_request_object_is_buffer(struct media_request_object *obj)
 }
 EXPORT_SYMBOL_GPL(vb2_request_object_is_buffer);
 
-bool vb2_request_has_buffers(struct media_request *req)
+unsigned int vb2_request_buffer_cnt(struct media_request *req)
 {
 	struct media_request_object *obj;
 	unsigned long flags;
-	bool has_buffers = false;
+	unsigned int buffer_cnt = 0;
 
 	spin_lock_irqsave(&req->lock, flags);
-	list_for_each_entry(obj, &req->objects, list) {
-		if (vb2_request_object_is_buffer(obj)) {
-			has_buffers = true;
-			break;
-		}
-	}
+	list_for_each_entry(obj, &req->objects, list)
+		if (vb2_request_object_is_buffer(obj))
+			buffer_cnt++;
 	spin_unlock_irqrestore(&req->lock, flags);
-	return has_buffers;
+
+	return buffer_cnt;
 }
-EXPORT_SYMBOL_GPL(vb2_request_has_buffers);
+EXPORT_SYMBOL_GPL(vb2_request_buffer_cnt);
 
 int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
 {
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 6831a2eb1859..a17033ab2c22 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1139,7 +1139,7 @@ int vb2_request_validate(struct media_request *req)
 	struct media_request_object *obj;
 	int ret = 0;
 
-	if (!vb2_request_has_buffers(req))
+	if (!vb2_request_buffer_cnt(req))
 		return -ENOENT;
 
 	list_for_each_entry(obj, &req->objects, list) {
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 6c76b9802589..e86981d615ae 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1191,10 +1191,10 @@ int vb2_verify_memory_type(struct vb2_queue *q,
 bool vb2_request_object_is_buffer(struct media_request_object *obj);
 
 /**
- * vb2_request_has_buffers() - return true if the request contains buffers
+ * vb2_request_buffer_cnt() - return the number of buffers in the request
  *
  * @req:	the request.
  */
-bool vb2_request_has_buffers(struct media_request *req);
+unsigned int vb2_request_buffer_cnt(struct media_request *req);
 
 #endif /* _MEDIA_VIDEOBUF2_CORE_H */
-- 
2.18.0
