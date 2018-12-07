From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 6/6] misc: fastrpc: Add support for compat ioctls
Date: Fri,  7 Dec 2018 16:35:13 +0000
Message-ID: <20181207163513.16412-7-srinivas.kandagatla@linaro.org>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for compat ioctl from 32 bits userland to
Qualcomm fastrpc driver.

Supported ioctls in this change are INIT, INVOKE, and ALLOC/FREE_DMA.

Most of the work is derived from various downstream Qualcomm kernels.
Credits to various Qualcomm authors who have contributed to this code.
Specially Tharun Kumar Merugu <mtharu@codeaurora.org>

Co-developed-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 71 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5ea2bba1e4bd..f36657263183 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2011-2018, The Linux Foundation. All rights reserved.
 // Copyright (c) 2018, Linaro Limited
 
+#include <linux/compat.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
@@ -194,6 +195,22 @@ struct fastrpc_user {
 	struct mutex mutex;
 };
 
+#ifdef CONFIG_COMPAT
+
+#define FASTRPC_IOCTL_INVOKE32		_IOWR('R', 3, struct fastrpc_invoke32)
+struct fastrpc_invoke_args32 {
+	__s32 fd;
+	compat_size_t length;
+	compat_caddr_t ptr;
+};
+
+struct fastrpc_invoke32 {
+	__u32 handle;
+	__u32 sc;
+	compat_uptr_t args;
+};
+#endif
+
 static void fastrpc_free_map(struct kref *ref)
 {
 	struct fastrpc_map *map;
@@ -1092,6 +1109,52 @@ static long fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
 	return err;
 }
 
+#ifdef CONFIG_COMPAT
+static long fastrpc_invoke32(struct fastrpc_user *fl, compat_uptr_t arg)
+{
+	struct fastrpc_invoke_args32 *args32 = NULL;
+	struct fastrpc_invoke_args *args = NULL;
+	struct fastrpc_invoke32 inv32;
+	struct fastrpc_invoke inv;
+	int i, ret, nscalars;
+
+	if (copy_from_user(&inv32, compat_ptr(arg), sizeof(inv32)))
+		return -EFAULT;
+
+	inv.handle = inv32.handle;
+	inv.sc = inv32.sc;
+	inv.args = NULL;
+	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
+
+	if (nscalars) {
+		args32 = kcalloc(nscalars, sizeof(*args32), GFP_KERNEL);
+		if (!args32)
+			return -ENOMEM;
+
+		if (copy_from_user(args32, compat_ptr(inv32.args),
+				   nscalars * sizeof(*args32)))
+			return -EFAULT;
+
+		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
+		if (!args)
+			return -ENOMEM;
+
+		for (i = 0; i < nscalars; i++) {
+			args[i].length = args32[i].length;
+			args[i].ptr = (void *)(unsigned long)args32[i].ptr;
+			args[i].fd = args32[i].fd;
+		}
+		inv.args = &args[0];
+	}
+
+	ret = fastrpc_internal_invoke(fl, 0, &inv);
+	kfree(args32);
+	kfree(args);
+
+	return ret;
+}
+#endif
+
 static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 				 unsigned long arg)
 {
@@ -1103,6 +1166,11 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_INVOKE:
 		err = fastrpc_invoke(fl, argp);
 		break;
+#ifdef CONFIG_COMPAT
+	case FASTRPC_IOCTL_INVOKE32:
+		err = fastrpc_invoke32(fl, ptr_to_compat(argp));
+		break;
+#endif
 	case FASTRPC_IOCTL_INIT_ATTACH:
 		err = fastrpc_init_attach(fl);
 		break;
@@ -1131,6 +1199,9 @@ static const struct file_operations fastrpc_fops = {
 	.open = fastrpc_device_open,
 	.release = fastrpc_device_release,
 	.unlocked_ioctl = fastrpc_device_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = fastrpc_device_ioctl,
+#endif
 };
 
 static int fastrpc_cb_probe(struct platform_device *pdev)
-- 
2.19.2
