From: Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [RESEND PATCH v2 1/4] media: vb2: Add a helper to get the vb2 buffer
 attached to a request
Date: Fri, 11 Oct 2019 11:33:39 +0200
Message-ID: <20191011093342.3471-2-boris.brezillon@collabora.com>
References: <20191011093342.3471-1-boris.brezillon@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20191011093342.3471-1-boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

vb2_request_get_buf() returns the N-th buffer attached to a media
request.

Signed-off-by: Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
Changes in v2:
* Adjust the kernel doc as suggested by Hans
---
 .../media/common/videobuf2/videobuf2-core.c   | 23 +++++++++++++++++++
 include/media/videobuf2-core.h                | 11 +++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4489744fbbd9..c4c7980dcb0d 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1416,6 +1416,29 @@ unsigned int vb2_request_buffer_cnt(struct media_request *req)
 }
 EXPORT_SYMBOL_GPL(vb2_request_buffer_cnt);
 
+struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
+				       unsigned int n)
+{
+	struct media_request_object *obj;
+	struct vb2_buffer *buf = NULL;
+	unsigned int nbufs = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&req->lock, flags);
+	list_for_each_entry(obj, &req->objects, list) {
+		if (!vb2_request_object_is_buffer(obj) ||
+		    nbufs++ < n)
+			continue;
+
+		buf = container_of(obj, struct vb2_buffer, req_obj);
+		break;
+	}
+	spin_unlock_irqrestore(&req->lock, flags);
+
+	return buf;
+}
+EXPORT_SYMBOL_GPL(vb2_request_get_buf);
+
 int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
 {
 	struct vb2_buffer *vb;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 640aabe69450..d363476712dd 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1222,4 +1222,15 @@ bool vb2_request_object_is_buffer(struct media_request_object *obj);
  */
 unsigned int vb2_request_buffer_cnt(struct media_request *req);
 
+/**
+ * vb2_request_get_buf() - return the buffer at index @idx
+ *
+ * @req:	the request.
+ * @n:		search for the Nth buffer in the req object list
+ *
+ * Return a vb2 buffer or NULL if there's no buffer at the specified position
+ */
+struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
+				       unsigned int n);
+
 #endif /* _MEDIA_VIDEOBUF2_CORE_H */
-- 
2.21.0
