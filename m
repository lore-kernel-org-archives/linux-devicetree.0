From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 5/6] char: fastrpc: Add support for dmabuf exporter
Date: Fri, 30 Nov 2018 10:46:56 +0000
Message-ID: <20181130104657.14875-6-srinivas.kandagatla@linaro.org>
References: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

User process can involve dealing with big buffer sizes, and also passing
buffers from one compute context bank to other compute context bank for
complex dsp algorithms.

This patch adds support to fastrpc to make it a proper dmabuf exporter
to avoid making copies of buffers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/char/fastrpc.c       | 173 ++++++++++++++++++++++++++++++++++-
 include/uapi/linux/fastrpc.h |   8 ++
 2 files changed, 180 insertions(+), 1 deletion(-)

diff --git a/drivers/char/fastrpc.c b/drivers/char/fastrpc.c
index 3630e883d3f4..3c52502eae9f 100644
--- a/drivers/char/fastrpc.c
+++ b/drivers/char/fastrpc.c
@@ -110,10 +110,20 @@ struct fastrpc_invoke_rsp {
 
 struct fastrpc_buf {
 	struct fastrpc_user *fl;
+	struct dma_buf *dmabuf;
 	struct device *dev;
 	void *virt;
 	uint64_t phys;
 	size_t size;
+	/* Lock for dma buf attachments */
+	struct mutex lock;
+	struct list_head attachments;
+};
+
+struct fastrpc_dma_buf_attachment {
+	struct device *dev;
+	struct sg_table sgt;
+	struct list_head node;
 };
 
 struct fastrpc_map {
@@ -256,6 +266,9 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	if (!buf)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&buf->attachments);
+	mutex_init(&buf->lock);
+
 	buf->fl = fl;
 	buf->virt = NULL;
 	buf->phys = 0;
@@ -394,6 +407,109 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	return ERR_PTR(err);
 }
 
+static struct sg_table *fastrpc_map_dma_buf(struct dma_buf_attachment
+			*attachment, enum dma_data_direction dir)
+{
+	struct fastrpc_dma_buf_attachment *a = attachment->priv;
+	struct sg_table *table;
+
+	table = &a->sgt;
+
+	if (!dma_map_sg(attachment->dev, table->sgl, table->nents, dir))
+		return ERR_PTR(-ENOMEM);
+
+	return table;
+}
+
+static void fastrpc_unmap_dma_buf(struct dma_buf_attachment *attach,
+				     struct sg_table *table,
+				     enum dma_data_direction dir)
+{
+}
+
+static void fastrpc_release(struct dma_buf *dmabuf)
+{
+	struct fastrpc_buf *buffer = dmabuf->priv;
+
+	fastrpc_buf_free(buffer);
+}
+
+static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
+			      struct dma_buf_attachment *attachment)
+{
+	struct fastrpc_dma_buf_attachment *a;
+	struct fastrpc_buf *buffer = dmabuf->priv;
+	int ret;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
+			      FASTRPC_PHYS(buffer->phys), buffer->size);
+	if (ret < 0) {
+		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
+		return -EINVAL;
+	}
+
+	a->dev = attachment->dev;
+	INIT_LIST_HEAD(&a->node);
+	attachment->priv = a;
+
+	mutex_lock(&buffer->lock);
+	list_add(&a->node, &buffer->attachments);
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static void fastrpc_dma_buf_detatch(struct dma_buf *dmabuf,
+				    struct dma_buf_attachment *attachment)
+{
+	struct fastrpc_dma_buf_attachment *a = attachment->priv;
+	struct fastrpc_buf *buffer = dmabuf->priv;
+
+	mutex_lock(&buffer->lock);
+	list_del(&a->node);
+	mutex_unlock(&buffer->lock);
+	kfree(a);
+}
+
+static void *fastrpc_kmap(struct dma_buf *dmabuf, unsigned long pgnum)
+{
+	struct fastrpc_buf *buf = dmabuf->priv;
+
+	return buf->virt ? buf->virt + pgnum * PAGE_SIZE : NULL;
+}
+
+static void *fastrpc_vmap(struct dma_buf *dmabuf)
+{
+	struct fastrpc_buf *buf = dmabuf->priv;
+
+	return buf->virt;
+}
+
+static int fastrpc_mmap(struct dma_buf *dmabuf,
+			       struct vm_area_struct *vma)
+{
+	struct fastrpc_buf *buf = dmabuf->priv;
+	size_t size = vma->vm_end - vma->vm_start;
+
+	return dma_mmap_coherent(buf->dev, vma, buf->virt,
+				 FASTRPC_PHYS(buf->phys), size);
+}
+
+static const struct dma_buf_ops fastrpc_dma_buf_ops = {
+	.attach = fastrpc_dma_buf_attach,
+	.detach = fastrpc_dma_buf_detatch,
+	.map_dma_buf = fastrpc_map_dma_buf,
+	.unmap_dma_buf = fastrpc_unmap_dma_buf,
+	.mmap = fastrpc_mmap,
+	.map = fastrpc_kmap,
+	.vmap = fastrpc_vmap,
+	.release = fastrpc_release,
+};
+
 static int fastrpc_map_create(struct fastrpc_user *fl, int fd, uintptr_t va,
 			       size_t len, struct fastrpc_map **ppmap)
 {
@@ -989,7 +1105,8 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	char __user *argp = (char __user *)arg;
 	int err;
 
-	if (!fl->sctx) {
+	if (!fl->sctx && cmd != FASTRPC_IOCTL_ALLOC_DMA_BUFF &&
+			cmd != FASTRPC_IOCTL_FREE_DMA_BUFF) {
 		fl->sctx = fastrpc_session_alloc(cctx, 0);
 		if (!fl->sctx)
 			return -ENOENT;
@@ -1027,6 +1144,60 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 			goto bail;
 		}
 		break;
+
+	case FASTRPC_IOCTL_FREE_DMA_BUFF: {
+		struct dma_buf *buf;
+		uint32_t info;
+
+		err = copy_from_user(&info, argp, sizeof(info));
+		if (err)
+			goto bail;
+
+		buf = dma_buf_get(info);
+		if (IS_ERR_OR_NULL(buf)) {
+			err = -EINVAL;
+			goto bail;
+		}
+		/*
+		 * one for the last get and other for the ALLOC_DMA_BUFF ioctl
+		 */
+		dma_buf_put(buf);
+		dma_buf_put(buf);
+	}
+	break;
+	case FASTRPC_IOCTL_ALLOC_DMA_BUFF: {
+		struct fastrpc_ioctl_alloc_dma_buf bp;
+		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+		struct fastrpc_buf *buf = NULL;
+
+		err = copy_from_user(&bp, argp, sizeof(bp));
+		if (err)
+			goto bail;
+
+		err = fastrpc_buf_alloc(fl, fl->dev, bp.size, &buf);
+		exp_info.ops = &fastrpc_dma_buf_ops;
+		exp_info.size = bp.size;
+		exp_info.flags = O_RDWR;
+		exp_info.priv = buf;
+		buf->dmabuf = dma_buf_export(&exp_info);
+		if (IS_ERR(buf->dmabuf)) {
+			err = PTR_ERR(buf->dmabuf);
+			goto bail;
+		}
+		get_dma_buf(buf->dmabuf);
+		bp.fd = dma_buf_fd(buf->dmabuf, O_ACCMODE);
+		if (bp.fd < 0) {
+			dma_buf_put(buf->dmabuf);
+			err = -EINVAL;
+			goto bail;
+		}
+
+		err = copy_to_user(argp, &bp, sizeof(bp));
+		if (err)
+			goto bail;
+
+		}
+		break;
 default:
 		err = -ENOTTY;
 		pr_info("bad ioctl: %d\n", cmd);
diff --git a/include/uapi/linux/fastrpc.h b/include/uapi/linux/fastrpc.h
index 6b596fc7ddf3..6b1ca29867fd 100644
--- a/include/uapi/linux/fastrpc.h
+++ b/include/uapi/linux/fastrpc.h
@@ -5,6 +5,8 @@
 
 #include <linux/types.h>
 
+#define FASTRPC_IOCTL_ALLOC_DMA_BUFF _IOWR('R', 1, struct fastrpc_ioctl_alloc_dma_buf)
+#define FASTRPC_IOCTL_FREE_DMA_BUFF _IOWR('R', 2, uint32_t)
 #define FASTRPC_IOCTL_INVOKE	_IOWR('R', 3, struct fastrpc_ioctl_invoke)
 #define FASTRPC_IOCTL_INIT	_IOWR('R', 4, struct fastrpc_ioctl_init)
 
@@ -71,4 +73,10 @@ struct fastrpc_ioctl_init {
 	unsigned int siglen;
 };
 
+struct fastrpc_ioctl_alloc_dma_buf {
+	int     fd;	/* fd */
+	ssize_t size;	/* size */
+	uint32_t flags;	/* flags to map with */
+};
+
 #endif /* __QCOM_FASTRPC_H__ */
-- 
2.19.2
