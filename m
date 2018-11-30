From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 6/6] char: fastrpc: Add support for compat ioctls
Date: Fri, 30 Nov 2018 10:46:57 +0000
Message-ID: <20181130104657.14875-7-srinivas.kandagatla@linaro.org>
References: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Thierry Escande <thierry.escande@linaro.org>

This patch adds support for compat ioctl from 32 bits userland to
Qualcomm fastrpc driver.

Supported ioctls in this change are INIT, INVOKE, and ALLOC/FREE_DMA.

Most of the work is derived from various downstream Qualcomm kernels.
Credits to various Qualcomm authors who have contributed to this code.
Specially Tharun Kumar Merugu <mtharu@codeaurora.org>

Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/char/fastrpc.c | 279 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/drivers/char/fastrpc.c b/drivers/char/fastrpc.c
index 3c52502eae9f..0b99a13109ea 100644
--- a/drivers/char/fastrpc.c
+++ b/drivers/char/fastrpc.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2018, Linaro Limited
 
 #include <linux/cdev.h>
+#include <linux/compat.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
@@ -1207,10 +1208,288 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	return err;
 }
 
+#ifdef CONFIG_COMPAT
+
+#define FASTRPC_COMPAT_IOCTL_ALLOC_DMA_BUFF \
+		_IOWR('R', 1, struct fastrpc_compat_ioctl_alloc_dma_buf)
+#define FASTRPC_COMPAT_IOCTL_FREE_DMA_BUFF \
+		_IOWR('R', 2, uint32_t)
+#define FASTRPC_COMPAT_IOCTL_INVOKE \
+		_IOWR('R', 3, struct fastrpc_compat_ioctl_invoke)
+#define FASTRPC_COMPAT_IOCTL_INIT \
+		_IOWR('R', 4, struct fastrpc_compat_ioctl_init)
+
+struct compat_remote_buf {
+	compat_uptr_t pv;	/* buffer pointer */
+	compat_size_t len;	/* length of buffer */
+};
+
+union compat_remote_arg {
+	struct compat_remote_buf buf;
+	compat_uint_t h;
+};
+
+struct fastrpc_compat_ioctl_alloc_dma_buf {
+	compat_int_t   fd;
+	compat_ssize_t size;
+	compat_uint_t  flags;
+};
+
+struct fastrpc_compat_ioctl_invoke {
+	compat_uint_t handle;	/* remote handle */
+	compat_uint_t sc;	/* scalars describing the data */
+	compat_uptr_t pra;	/* remote arguments list */
+	compat_uptr_t fds;	/* fd list */
+	compat_uptr_t attrs;	/* attribute list */
+	compat_uptr_t crc;	/* crc list */
+};
+
+struct fastrpc_compat_ioctl_init {
+	compat_uint_t flags;	/* one of FASTRPC_INIT_* macros */
+	compat_uptr_t file;	/* pointer to elf file */
+	compat_int_t filelen;	/* elf file length */
+	compat_int_t filefd;	/* dmabuf fd for the file */
+	compat_uptr_t mem;	/* mem for the PD */
+	compat_int_t memlen;	/* mem length */
+	compat_int_t memfd;	/* dmabuf fd for the mem */
+	compat_int_t attrs;	/* attributes to init process */
+	compat_int_t siglen;	/* test signature file length */
+};
+
+static int fastrpc_compat_get_ioctl_alloc_dma_buf(
+			struct fastrpc_compat_ioctl_alloc_dma_buf __user *buf32,
+			struct fastrpc_ioctl_alloc_dma_buf __user *buf)
+{
+	compat_size_t size;
+	compat_uint_t flags;
+	int err;
+
+	err = put_user(0, &buf->fd);
+	err |= get_user(size, &buf32->size);
+	err |= put_user(size, &buf->size);
+	err |= get_user(flags, &buf32->flags);
+	err |= put_user(flags, &buf->flags);
+
+	return err;
+}
+
+static int fastrpc_compat_put_ioctl_alloc_dma_buf(
+			struct fastrpc_compat_ioctl_alloc_dma_buf __user *buf32,
+			struct fastrpc_ioctl_alloc_dma_buf __user *buf)
+{
+	compat_int_t fd;
+	int err;
+
+	err = get_user(fd, &buf->fd);
+	err |= put_user(fd, &buf32->fd);
+
+	return err;
+}
+
+static int compat_get_fastrpc_ioctl_invoke(
+			struct fastrpc_compat_ioctl_invoke __user *inv32,
+			struct fastrpc_ioctl_invoke __user **inva)
+{
+	compat_uint_t u, sc;
+	compat_size_t s;
+	compat_uptr_t p;
+	struct fastrpc_ioctl_invoke *inv;
+	union compat_remote_arg *pra32;
+	union remote_arg *pra;
+	int err, len, j;
+
+	err = get_user(sc, &inv32->sc);
+	if (err)
+		return err;
+
+	len = REMOTE_SCALARS_LENGTH(sc);
+	inv = compat_alloc_user_space(sizeof(*inv) + len * sizeof(*pra));
+	if (!inv)
+		return -EFAULT;
+
+	pra = (union remote_arg *)(inv + 1);
+	err = put_user(pra, &inv->pra);
+	err |= put_user(sc, &inv->sc);
+	err |= get_user(u, &inv32->handle);
+	err |= put_user(u, &inv->handle);
+	err |= get_user(p, &inv32->pra);
+	if (err)
+		return err;
+
+	pra32 = compat_ptr(p);
+	pra = (union remote_arg *)(inv + 1);
+	for (j = 0; j < len; j++) {
+		err |= get_user(p, &pra32[j].buf.pv);
+		err |= put_user(p, (uintptr_t *)&pra[j].buf.pv);
+		err |= get_user(s, &pra32[j].buf.len);
+		err |= put_user(s, &pra[j].buf.len);
+	}
+
+	err |= put_user(NULL, &inv->fds);
+	if (inv32->fds) {
+		err |= get_user(p, &inv32->fds);
+		err |= put_user(p, (compat_uptr_t *)&inv->fds);
+	}
+
+	err |= put_user(NULL, &inv->attrs);
+	if (inv32->attrs) {
+		err |= get_user(p, &inv32->attrs);
+		err |= put_user(p, (compat_uptr_t *)&inv->attrs);
+	}
+
+	err |= put_user(NULL, (compat_uptr_t __user **)&inv->crc);
+	if (inv32->crc) {
+		err |= get_user(p, &inv32->crc);
+		err |= put_user(p, (compat_uptr_t __user *)&inv->crc);
+	}
+
+	*inva = inv;
+
+	return err;
+}
+
+static int compat_get_fastrpc_ioctl_init(
+				struct fastrpc_compat_ioctl_init __user *init32,
+				struct fastrpc_ioctl_init __user *init)
+{
+	compat_uint_t u;
+	compat_uptr_t p;
+	compat_int_t i;
+	int err;
+
+	err = get_user(u, &init32->flags);
+	err |= put_user(u, &init->flags);
+	err |= get_user(p, &init32->file);
+	err |= put_user(p, &init->file);
+	err |= get_user(i, &init32->filelen);
+	err |= put_user(i, &init->filelen);
+	err |= get_user(i, &init32->filefd);
+	err |= put_user(i, &init->filefd);
+	err |= get_user(p, &init32->mem);
+	err |= put_user(p, &init->mem);
+	err |= get_user(i, &init32->memlen);
+	err |= put_user(i, &init->memlen);
+	err |= get_user(i, &init32->memfd);
+	err |= put_user(i, &init->memfd);
+
+	err |= put_user(0, &init->attrs);
+	if (init32->attrs) {
+		err |= get_user(i, &init32->attrs);
+		err |= put_user(i, &init->attrs);
+	}
+
+	err |= put_user(0, &init->siglen);
+	if (init32->siglen) {
+		err |= get_user(i, &init32->siglen);
+		err |= put_user(i, &init->siglen);
+	}
+
+	return err;
+}
+
+static long fastrpc_compat_device_ioctl(struct file *filp, unsigned int cmd,
+					unsigned long arg)
+{
+	int err;
+
+	if (!filp->f_op || !filp->f_op->unlocked_ioctl)
+		return -ENOTTY;
+
+	switch (cmd) {
+	case FASTRPC_COMPAT_IOCTL_ALLOC_DMA_BUFF: {
+		struct fastrpc_compat_ioctl_alloc_dma_buf __user *buf32;
+		struct fastrpc_ioctl_alloc_dma_buf __user *buf;
+
+		buf32 = compat_ptr(arg);
+		buf = compat_alloc_user_space(sizeof(*buf));
+		if (!buf) {
+			err = -EFAULT;
+			break;
+		}
+
+		err = fastrpc_compat_get_ioctl_alloc_dma_buf(buf32, buf);
+		if (err)
+			break;
+
+		err = filp->f_op->unlocked_ioctl(filp,
+						 FASTRPC_IOCTL_ALLOC_DMA_BUFF,
+						 (unsigned long)buf);
+		if (err)
+			break;
+
+		err = fastrpc_compat_put_ioctl_alloc_dma_buf(buf32, buf);
+		break;
+	}
+	case FASTRPC_COMPAT_IOCTL_FREE_DMA_BUFF: {
+		compat_uptr_t __user *info32;
+		uint32_t __user *info;
+		compat_uint_t u;
+
+		info32 = compat_ptr(arg);
+		info = compat_alloc_user_space(sizeof(*info));
+		if (!info) {
+			err = -EFAULT;
+			break;
+		}
+
+		err = get_user(u, info32);
+		err |= put_user(u, info);
+		if (err)
+			break;
+
+		err = filp->f_op->unlocked_ioctl(filp,
+						 FASTRPC_IOCTL_FREE_DMA_BUFF,
+						 (unsigned long)info);
+		break;
+	}
+	case FASTRPC_COMPAT_IOCTL_INVOKE: {
+		struct fastrpc_compat_ioctl_invoke __user *inv32;
+		struct fastrpc_ioctl_invoke __user *inv;
+
+		inv32 = compat_ptr(arg);
+
+		err = compat_get_fastrpc_ioctl_invoke(inv32, &inv);
+		if (err)
+			break;
+
+		err = filp->f_op->unlocked_ioctl(filp,
+				FASTRPC_IOCTL_INVOKE, (unsigned long)inv);
+		break;
+	}
+	case FASTRPC_COMPAT_IOCTL_INIT: {
+		struct fastrpc_compat_ioctl_init __user *init32;
+		struct fastrpc_ioctl_init __user *init;
+
+		init32 = compat_ptr(arg);
+		init = compat_alloc_user_space(sizeof(*init));
+		if (!init)
+			return -EFAULT;
+
+		err = compat_get_fastrpc_ioctl_init(init32, init);
+		if (err)
+			return err;
+
+		err = filp->f_op->unlocked_ioctl(filp, FASTRPC_IOCTL_INIT,
+						 (unsigned long)init);
+		break;
+	}
+	default:
+		err = -ENOTTY;
+		pr_info("bad ioctl: %d\n", cmd);
+		break;
+	}
+
+	return err;
+}
+#endif /* CONFIG_COMPAT */
+
 static const struct file_operations fastrpc_fops = {
 	.open = fastrpc_device_open,
 	.release = fastrpc_device_release,
 	.unlocked_ioctl = fastrpc_device_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = fastrpc_compat_device_ioctl,
+#endif
 };
 
 static int fastrpc_cb_probe(struct platform_device *pdev)
-- 
2.19.2
