From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 04/21] media: ti-vpe: vpe: Remove unnecessary use of container_of
Date: Mon, 7 Oct 2019 10:09:52 -0500
Message-ID: <20191007151009.22095-5-bparrot@ti.com>
References: <20191007151009.22095-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007151009.22095-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

Instead of saving a pointer to the 'fh' member of struct vpe_ctx to
later have to use container_of to retrieve the actual pointer to the
context structure, which seems to confuse static code analysis tool
anyways, just save the pointer to the actual structure and then retrieve
it directly.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 56f60dbea15c..0e9cb0319a92 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -900,14 +900,6 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
 	return 0;
 }
 
-/*
- * Return the vpe_ctx structure for a given struct file
- */
-static struct vpe_ctx *file2ctx(struct file *file)
-{
-	return container_of(file->private_data, struct vpe_ctx, fh);
-}
-
 /*
  * mem2mem callbacks
  */
@@ -1527,7 +1519,7 @@ static int vpe_enum_fmt(struct file *file, void *priv,
 static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 	struct vb2_queue *vq;
 	struct vpe_q_data *q_data;
 	int i;
@@ -1689,7 +1681,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 
 static int vpe_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 	struct vpe_fmt *fmt = find_format(f);
 
 	if (V4L2_TYPE_IS_OUTPUT(f->type))
@@ -1762,7 +1754,7 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 static int vpe_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	int ret;
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 
 	ret = vpe_try_fmt(file, priv, f);
 	if (ret)
@@ -1847,7 +1839,7 @@ static int __vpe_try_selection(struct vpe_ctx *ctx, struct v4l2_selection *s)
 static int vpe_g_selection(struct file *file, void *fh,
 		struct v4l2_selection *s)
 {
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 	struct vpe_q_data *q_data;
 	bool use_c_rect = false;
 
@@ -1908,7 +1900,7 @@ static int vpe_g_selection(struct file *file, void *fh,
 static int vpe_s_selection(struct file *file, void *fh,
 		struct v4l2_selection *s)
 {
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 	struct vpe_q_data *q_data;
 	struct v4l2_selection sel = *s;
 	int ret;
@@ -2275,7 +2267,7 @@ static int vpe_open(struct file *file)
 	init_adb_hdrs(ctx);
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
+	file->private_data = ctx;
 
 	hdl = &ctx->hdl;
 	v4l2_ctrl_handler_init(hdl, 1);
@@ -2360,7 +2352,7 @@ static int vpe_open(struct file *file)
 static int vpe_release(struct file *file)
 {
 	struct vpe_dev *dev = video_drvdata(file);
-	struct vpe_ctx *ctx = file2ctx(file);
+	struct vpe_ctx *ctx = file->private_data;
 
 	vpe_dbg(dev, "releasing instance %p\n", ctx);
 
-- 
2.17.1
