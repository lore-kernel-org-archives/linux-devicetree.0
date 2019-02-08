From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 5/5] misc: fastrpc: Add support for dmabuf exporter
Date: Fri,  8 Feb 2019 13:23:06 +0000
Message-ID: <20190208132306.12571-6-srinivas.kandagatla@linaro.org>
References: <20190208132306.12571-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208132306.12571-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, arnd@arndb.de
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Thierry Escande <thierry.escande@linaro.org>
List-Id: devicetree@vger.kernel.org

User process can involve dealing with big buffer sizes, and also passing
buffers from one compute context bank to other compute context bank for
complex dsp algorithms.

This patch adds support to fastrpc to make it a proper dmabuf exporter
to avoid making copies of buffers.

Co-developed-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c      | 183 ++++++++++++++++++++++++++++++++++++
 include/uapi/misc/fastrpc.h |   8 ++
 2 files changed, 191 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ddd9fa9b238e..357c29e5a779 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -107,10 +107,20 @@ struct fastrpc_invoke_rsp {
 
 struct fastrpc_buf {
 	struct fastrpc_user *fl;
+	struct dma_buf *dmabuf;
 	struct device *dev;
 	void *virt;
 	u64 phys;
 	u64 size;
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
@@ -247,6 +257,9 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	if (!buf)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&buf->attachments);
+	mutex_init(&buf->lock);
+
 	buf->fl = fl;
 	buf->virt = NULL;
 	buf->phys = 0;
@@ -361,6 +374,111 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	return ERR_PTR(ret);
 }
 
+static struct sg_table *
+fastrpc_map_dma_buf(struct dma_buf_attachment *attachment,
+		    enum dma_data_direction dir)
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
+				  struct sg_table *table,
+				  enum dma_data_direction dir)
+{
+	dma_unmap_sg(attach->dev, table->sgl, table->nents, dir);
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
+				  struct dma_buf_attachment *attachment)
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
+			struct vm_area_struct *vma)
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
 static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 			      u64 len, struct fastrpc_map **ppmap)
 {
@@ -893,6 +1011,65 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static int fastrpc_dmabuf_free(struct fastrpc_user *fl, char __user *argp)
+{
+	struct dma_buf *buf;
+	int info;
+
+	if (copy_from_user(&info, argp, sizeof(info)))
+		return -EFAULT;
+
+	buf = dma_buf_get(info);
+	if (IS_ERR_OR_NULL(buf))
+		return -EINVAL;
+	/*
+	 * one for the last get and other for the ALLOC_DMA_BUFF ioctl
+	 */
+	dma_buf_put(buf);
+	dma_buf_put(buf);
+
+	return 0;
+}
+
+static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_alloc_dma_buf bp;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct fastrpc_buf *buf = NULL;
+	int err;
+
+	if (copy_from_user(&bp, argp, sizeof(bp)))
+		return -EFAULT;
+
+	err = fastrpc_buf_alloc(fl, fl->sctx->dev, bp.size, &buf);
+	if (err)
+		return err;
+	exp_info.ops = &fastrpc_dma_buf_ops;
+	exp_info.size = bp.size;
+	exp_info.flags = O_RDWR;
+	exp_info.priv = buf;
+	buf->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(buf->dmabuf)) {
+		fastrpc_buf_free(buf);
+		return PTR_ERR(buf->dmabuf);
+	}
+
+	bp.fd = dma_buf_fd(buf->dmabuf, O_ACCMODE);
+	if (bp.fd < 0) {
+		dma_buf_put(buf->dmabuf);
+		return -EINVAL;
+	}
+
+	if (copy_to_user(argp, &bp, sizeof(bp))) {
+		dma_buf_put(buf->dmabuf);
+		return -EFAULT;
+	}
+
+	get_dma_buf(buf->dmabuf);
+
+	return 0;
+}
+
 static int fastrpc_init_attach(struct fastrpc_user *fl)
 {
 	struct fastrpc_invoke_args args[1];
@@ -965,6 +1142,12 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_INIT_CREATE:
 		err = fastrpc_init_create_process(fl, argp);
 		break;
+	case FASTRPC_IOCTL_FREE_DMA_BUFF:
+		err = fastrpc_dmabuf_free(fl, argp);
+		break;
+	case FASTRPC_IOCTL_ALLOC_DMA_BUFF:
+		err = fastrpc_dmabuf_alloc(fl, argp);
+		break;
 	default:
 		err = -ENOTTY;
 		break;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index 32d191c3b7bc..6d701af9fc42 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -5,6 +5,8 @@
 
 #include <linux/types.h>
 
+#define FASTRPC_IOCTL_ALLOC_DMA_BUFF	_IOWR('R', 1, struct fastrpc_alloc_dma_buf)
+#define FASTRPC_IOCTL_FREE_DMA_BUFF	_IOWR('R', 2, __u32)
 #define FASTRPC_IOCTL_INVOKE		_IOWR('R', 3, struct fastrpc_invoke)
 #define FASTRPC_IOCTL_INIT_ATTACH	_IO('R', 4)
 #define FASTRPC_IOCTL_INIT_CREATE	_IOWR('R', 5, struct fastrpc_init_create)
@@ -30,4 +32,10 @@ struct fastrpc_init_create {
 	__u64 file;	/* pointer to elf file */
 };
 
+struct fastrpc_alloc_dma_buf {
+	__s32 fd;	/* fd */
+	__u32 flags;	/* flags to map with */
+	__u64 size;	/* size */
+};
+
 #endif /* __QCOM_FASTRPC_H__ */
-- 
2.20.1
