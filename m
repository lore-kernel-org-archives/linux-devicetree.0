From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/6] misc: fastrpc: Add Qualcomm fastrpc basic driver model
Date: Fri,  7 Dec 2018 16:35:09 +0000
Message-ID: <20181207163513.16412-3-srinivas.kandagatla@linaro.org>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds basic driver model for qualcomm fastrpc.
Each DSP rpmsg channel is represented as fastrpc channel context and
is exposed as a character driver for userspace interface.
Each compute context bank is represented as fastrpc-session-context,
which are dynamically managed by the channel context char device.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
---
 drivers/misc/Kconfig   |  10 ++
 drivers/misc/Makefile  |   1 +
 drivers/misc/fastrpc.c | 319 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 330 insertions(+)
 create mode 100644 drivers/misc/fastrpc.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 3726eacdf65d..ad1f8f93a413 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -295,6 +295,16 @@ config QCOM_COINCELL
 	  to maintain PMIC register and RTC state in the absence of
 	  external power.
 
+config QCOM_FASTRPC
+	tristate "Qualcomm FastRPC"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on RPMSG
+	help
+	  Provides a communication mechanism that allows for clients to
+	  make remote method invocations across processor boundary to
+	  applications DSP processor. Say M if you want to enable this
+	  module.
+
 config SGI_GRU
 	tristate "SGI GRU driver"
 	depends on X86_UV && SMP
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index af22bbc3d00c..6f9a79d86c7d 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
 obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
 obj-$(CONFIG_PHANTOM)		+= phantom.o
 obj-$(CONFIG_QCOM_COINCELL)	+= qcom-coincell.o
+obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
 obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
 obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
 obj-$(CONFIG_SGI_IOC4)		+= ioc4.o
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
new file mode 100644
index 000000000000..7fc2b381074d
--- /dev/null
+++ b/drivers/misc/fastrpc.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2011-2018, The Linux Foundation. All rights reserved.
+// Copyright (c) 2018, Linaro Limited
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+#include <linux/list.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/rpmsg.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+
+#define ADSP_DOMAIN_ID (0)
+#define MDSP_DOMAIN_ID (1)
+#define SDSP_DOMAIN_ID (2)
+#define CDSP_DOMAIN_ID (3)
+#define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
+#define FASTRPC_MAX_SESSIONS	9 /*8 compute, 1 cpz*/
+#define FASTRPC_CTX_MAX (256)
+#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_DEVICE_NAME	"fastrpc"
+
+#define miscdev_to_cctx(d) container_of(d, struct fastrpc_channel_ctx, miscdev)
+
+static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
+						"sdsp", "cdsp"};
+
+struct fastrpc_session_ctx {
+	struct device *dev;
+	int sid;
+	bool used;
+	bool valid;
+	bool secure;
+};
+
+struct fastrpc_channel_ctx {
+	int domain_id;
+	int sesscount;
+	struct rpmsg_device *rpdev;
+	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
+	spinlock_t lock;
+	struct idr ctx_idr;
+	struct list_head users;
+	struct miscdevice miscdev;
+};
+
+struct fastrpc_user {
+	struct list_head user;
+	struct list_head maps;
+	struct list_head pending;
+
+	struct fastrpc_channel_ctx *cctx;
+	struct fastrpc_session_ctx *sctx;
+
+	int tgid;
+	int pd;
+	/* Lock for lists */
+	spinlock_t lock;
+	/* lock for allocations */
+	struct mutex mutex;
+};
+
+static struct fastrpc_session_ctx *fastrpc_session_alloc(
+					struct fastrpc_channel_ctx *cctx,
+					int secure)
+{
+	struct fastrpc_session_ctx *session = NULL;
+	int i;
+
+	spin_lock(&cctx->lock);
+	for (i = 0; i < cctx->sesscount; i++) {
+		if (!cctx->session[i].used && cctx->session[i].valid &&
+		    cctx->session[i].secure == secure) {
+			cctx->session[i].used = true;
+			session = &cctx->session[i];
+			break;
+		}
+	}
+	spin_unlock(&cctx->lock);
+
+	return session;
+}
+
+static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
+				 struct fastrpc_session_ctx *session)
+{
+	spin_lock(&cctx->lock);
+	session->used = false;
+	spin_unlock(&cctx->lock);
+}
+
+static int fastrpc_device_release(struct inode *inode, struct file *file)
+{
+	struct fastrpc_user *fl = (struct fastrpc_user *)file->private_data;
+	struct fastrpc_channel_ctx *cctx = fl->cctx;
+
+	spin_lock(&cctx->lock);
+	list_del(&fl->user);
+	spin_unlock(&cctx->lock);
+
+	fastrpc_session_free(fl->cctx, fl->sctx);
+
+	mutex_destroy(&fl->mutex);
+	kfree(fl);
+	file->private_data = NULL;
+
+	return 0;
+}
+
+static int fastrpc_device_open(struct inode *inode, struct file *filp)
+{
+	struct fastrpc_channel_ctx *cctx = miscdev_to_cctx(filp->private_data);
+	struct fastrpc_user *fl = NULL;
+
+	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
+	if (!fl)
+		return -ENOMEM;
+
+	filp->private_data = fl;
+	spin_lock_init(&fl->lock);
+	mutex_init(&fl->mutex);
+	INIT_LIST_HEAD(&fl->pending);
+	INIT_LIST_HEAD(&fl->maps);
+	INIT_LIST_HEAD(&fl->user);
+	fl->tgid = current->tgid;
+	fl->cctx = cctx;
+	spin_lock(&cctx->lock);
+	list_add_tail(&fl->user, &cctx->users);
+	spin_unlock(&cctx->lock);
+	fl->sctx = fastrpc_session_alloc(cctx, 0);
+
+	return 0;
+}
+
+static const struct file_operations fastrpc_fops = {
+	.open = fastrpc_device_open,
+	.release = fastrpc_device_release,
+};
+
+static int fastrpc_cb_probe(struct platform_device *pdev)
+{
+	struct fastrpc_channel_ctx *cctx;
+	struct fastrpc_session_ctx *sess;
+	struct device *dev = &pdev->dev;
+	int i, sessions = 0;
+
+	cctx = dev_get_drvdata(dev->parent);
+	if (!cctx)
+		return -EINVAL;
+
+	of_property_read_u32(dev->of_node, "nsessions", &sessions);
+
+	spin_lock(&cctx->lock);
+	sess = &cctx->session[cctx->sesscount];
+	sess->used = false;
+	sess->valid = true;
+	sess->dev = dev;
+	dev_set_drvdata(dev, sess);
+	sess->secure = of_property_read_bool(dev->of_node, "secured");
+
+	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
+		dev_err(dev, "FastRPC Session ID not specified in DT\n");
+
+	if (sessions > 0) {
+		struct fastrpc_session_ctx *dup_sess;
+
+		for (i = 1; i < sessions; i++) {
+			if (cctx->sesscount++ >= FASTRPC_MAX_SESSIONS)
+				break;
+			dup_sess = &cctx->session[cctx->sesscount];
+			memcpy(dup_sess, sess, sizeof(*dup_sess));
+		}
+	}
+	cctx->sesscount++;
+	spin_unlock(&cctx->lock);
+	dma_set_mask(dev, DMA_BIT_MASK(32));
+
+	return 0;
+}
+
+static int fastrpc_cb_remove(struct platform_device *pdev)
+{
+	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(pdev->dev.parent);
+	struct fastrpc_session_ctx *sess = dev_get_drvdata(&pdev->dev);
+	int i;
+
+	spin_lock(&cctx->lock);
+	for (i = 1; i < FASTRPC_MAX_SESSIONS; i++) {
+		if (cctx->session[i].sid == sess->sid) {
+			cctx->session[i].valid = false;
+			cctx->sesscount--;
+		}
+	}
+	spin_unlock(&cctx->lock);
+
+	return 0;
+}
+
+static const struct of_device_id fastrpc_match_table[] = {
+	{ .compatible = "qcom,fastrpc-compute-cb", },
+	{}
+};
+
+static struct platform_driver fastrpc_cb_driver = {
+	.probe = fastrpc_cb_probe,
+	.remove = fastrpc_cb_remove,
+	.driver = {
+		.name = "qcom,fastrpc-cb",
+		.of_match_table = fastrpc_match_table,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct device *rdev = &rpdev->dev;
+	struct fastrpc_channel_ctx *data;
+	int err, domain_id;
+
+	data = devm_kzalloc(rdev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	err = of_property_read_u32(rdev->of_node, "reg", &domain_id);
+	if (err) {
+		dev_err(rdev, "FastRPC Domain ID not specified in DT\n");
+		return err;
+	}
+
+	if (domain_id > CDSP_DOMAIN_ID) {
+		dev_err(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
+		return -EINVAL;
+	}
+
+	data->miscdev.minor = MISC_DYNAMIC_MINOR;
+	data->miscdev.name = kasprintf(GFP_KERNEL, "fastrpc-%s",
+				domains[domain_id]);
+	data->miscdev.fops = &fastrpc_fops;
+	err = misc_register(&data->miscdev);
+	if (err)
+		return err;
+
+	dev_set_drvdata(&rpdev->dev, data);
+	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
+	INIT_LIST_HEAD(&data->users);
+	spin_lock_init(&data->lock);
+	idr_init(&data->ctx_idr);
+	data->domain_id = domain_id;
+	data->rpdev = rpdev;
+
+	return of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+}
+
+static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
+
+	misc_deregister(&cctx->miscdev);
+	of_platform_depopulate(&rpdev->dev);
+	kfree(cctx);
+}
+
+static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
+				  int len, void *priv, u32 addr)
+{
+	return 0;
+}
+
+static const struct of_device_id fastrpc_rpmsg_of_match[] = {
+	{ .compatible = "qcom,fastrpc" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, fastrpc_rpmsg_of_match);
+
+static struct rpmsg_driver fastrpc_driver = {
+	.probe = fastrpc_rpmsg_probe,
+	.remove = fastrpc_rpmsg_remove,
+	.callback = fastrpc_rpmsg_callback,
+	.drv = {
+		.name = "qcom,fastrpc",
+		.of_match_table = fastrpc_rpmsg_of_match,
+	},
+};
+
+static int fastrpc_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&fastrpc_cb_driver);
+	if (ret < 0) {
+		pr_err("fastrpc: failed to register cb driver\n");
+		return ret;
+	}
+
+	ret = register_rpmsg_driver(&fastrpc_driver);
+	if (ret < 0) {
+		pr_err("fastrpc: failed to register rpmsg driver\n");
+		platform_driver_unregister(&fastrpc_cb_driver);
+		return ret;
+	}
+
+	return 0;
+}
+module_init(fastrpc_init);
+
+static void fastrpc_exit(void)
+{
+	platform_driver_unregister(&fastrpc_cb_driver);
+	unregister_rpmsg_driver(&fastrpc_driver);
+}
+module_exit(fastrpc_exit);
+
+MODULE_ALIAS("fastrpc:fastrpc");
+MODULE_LICENSE("GPL v2");
-- 
2.19.2
