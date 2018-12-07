From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/6] misc: fastrpc: Add support for create remote init process
Date: Fri,  7 Dec 2018 16:35:11 +0000
Message-ID: <20181207163513.16412-5-srinivas.kandagatla@linaro.org>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds support to create or attach remote shell process.
The shell process called fastrpc_shell_0 is usually loaded on the DSP
when a user process is spawned.

Most of the work is derived from various downstream Qualcomm kernels.
Credits to various Qualcomm authors who have contributed to this code.
Specially Tharun Kumar Merugu <mtharu@codeaurora.org>

Co-developed-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c      | 140 ++++++++++++++++++++++++++++++++++++
 include/uapi/misc/fastrpc.h |  12 ++++
 2 files changed, 152 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 46435813785d..fda674e9efe2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -29,7 +29,10 @@
 #define FASTRPC_MAX_CRCLIST	64
 #define FASTRPC_PHYS(p)	((p) & 0xffffffff)
 #define FASTRPC_CTX_MAX (256)
+#define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_CTXID_MASK (0xFF0)
+#define INIT_FILELEN_MAX (2 * 1024 * 1024)
+#define INIT_MEMLEN_MAX  (8 * 1024 * 1024)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 
 /* Retrives number of input buffers from the scalars parameter */
@@ -60,6 +63,13 @@
 #define FASTRPC_SCALARS(method, in, out) \
 		FASTRPC_BUILD_SCALARS(0, method, in, out, 0, 0)
 
+/* Remote Method id table */
+#define FASTRPC_RMID_INIT_ATTACH	0
+#define FASTRPC_RMID_INIT_RELEASE	1
+#define FASTRPC_RMID_INIT_CREATE	6
+#define FASTRPC_RMID_INIT_CREATE_ATTR	7
+#define FASTRPC_RMID_INIT_CREATE_STATIC	8
+
 #define miscdev_to_cctx(d) container_of(d, struct fastrpc_channel_ctx, miscdev)
 
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
@@ -676,6 +686,94 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,
 	return err;
 }
 
+static long fastrpc_init_create_process(struct fastrpc_user *fl,
+					char __user *argp)
+{
+	struct fastrpc_init_create init;
+	struct fastrpc_invoke_args args[6];
+	struct fastrpc_phy_page pages[1];
+	struct fastrpc_invoke inv;
+	struct fastrpc_map *map = NULL;
+	struct fastrpc_buf *imem = NULL;
+	int err, memlen;
+	struct {
+		int pgid;
+		unsigned int namelen;
+		unsigned int filelen;
+		unsigned int pageslen;
+		int attrs;
+		int siglen;
+	} inbuf;
+
+	err = copy_from_user(&init, argp, sizeof(init));
+	if (err)
+		goto bail;
+
+	if (init.filelen > INIT_FILELEN_MAX ||
+	    init.memlen > INIT_MEMLEN_MAX)
+		goto bail;
+
+	inbuf.pgid = fl->tgid;
+	inbuf.namelen = strlen(current->comm) + 1;
+	inbuf.filelen = init.filelen;
+	inbuf.pageslen = 1;
+	inbuf.attrs = init.attrs;
+	inbuf.siglen = init.siglen;
+	fl->pd = 1;
+
+	if (init.filelen && init.filefd) {
+		err = fastrpc_map_create(fl, init.filefd, init.filelen, &map);
+		if (err)
+			goto bail;
+	}
+	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
+		       1024 * 1024);
+	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
+				&imem);
+	if (err)
+		goto bail;
+
+	fl->init_mem = imem;
+	args[0].ptr = &inbuf;
+	args[0].length = sizeof(inbuf);
+	args[0].fd = -1;
+
+	args[1].ptr = current->comm;
+	args[1].length = inbuf.namelen;
+	args[1].fd = -1;
+
+	args[2].ptr = (void *)init.file;
+	args[2].length = inbuf.filelen;
+	args[2].fd = init.filefd;
+
+	pages[0].addr = imem->phys;
+	pages[0].size = imem->size;
+
+	args[3].ptr = pages;
+	args[3].length = 1 * sizeof(*pages);
+	args[3].fd = -1;
+
+	args[4].ptr = &inbuf.attrs;
+	args[4].length = sizeof(inbuf.attrs);
+	args[4].fd = -1;
+
+	args[5].ptr = &inbuf.siglen;
+	args[5].length = sizeof(inbuf.siglen);
+	args[5].fd = -1;
+
+	inv.handle = 1;
+	inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
+	if (init.attrs)
+		inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 6, 0);
+	inv.args = &args[0];
+	err = fastrpc_internal_invoke(fl, 1, &inv);
+bail:
+	if (map)
+		fastrpc_map_put(map);
+
+	return err;
+}
+
 static struct fastrpc_session_ctx *fastrpc_session_alloc(
 					struct fastrpc_channel_ctx *cctx,
 					int secure)
@@ -705,6 +803,23 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
 	spin_unlock(&cctx->lock);
 }
 
+static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
+{
+	struct fastrpc_invoke inv;
+	struct fastrpc_invoke_args args[1];
+	int tgid = 0;
+
+	tgid = fl->tgid;
+	args[0].ptr = &tgid;
+	args[0].length = sizeof(tgid);
+	args[0].fd = -1;
+	inv.handle = 1;
+	inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
+	inv.args = &args[0];
+
+	return fastrpc_internal_invoke(fl, 1, &inv);
+}
+
 static int fastrpc_device_release(struct inode *inode, struct file *file)
 {
 	struct fastrpc_user *fl = (struct fastrpc_user *)file->private_data;
@@ -712,6 +827,8 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	struct fastrpc_invoke_ctx *ctx, *n;
 	struct fastrpc_map *map, *m;
 
+	fastrpc_release_current_dsp_process(fl);
+
 	spin_lock(&cctx->lock);
 	list_del(&fl->user);
 	spin_unlock(&cctx->lock);
@@ -759,6 +876,23 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static long fastrpc_init_attach(struct fastrpc_user *fl)
+{
+	struct fastrpc_invoke_args args[1];
+	struct fastrpc_invoke inv;
+	int tgid = fl->tgid;
+
+	args[0].ptr = &tgid;
+	args[0].length = sizeof(tgid);
+	args[0].fd = -1;
+	inv.handle = FASTRPC_INIT_HANDLE;
+	inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
+	inv.args = &args[0];
+	fl->pd = 0;
+
+	return fastrpc_internal_invoke(fl, 1, &inv);
+}
+
 static long fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_invoke_args *args = NULL;
@@ -799,6 +933,12 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_INVOKE:
 		err = fastrpc_invoke(fl, argp);
 		break;
+	case FASTRPC_IOCTL_INIT_ATTACH:
+		err = fastrpc_init_attach(fl);
+		break;
+	case FASTRPC_IOCTL_INIT_CREATE:
+		err = fastrpc_init_create_process(fl, argp);
+		break;
 	default:
 		err = -ENOTTY;
 		dev_err(fl->sctx->dev, "bad ioctl: %d\n", cmd);
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index 0b408ba62482..2f0afa5dab1f 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -6,6 +6,8 @@
 #include <linux/types.h>
 
 #define FASTRPC_IOCTL_INVOKE		_IOWR('R', 3, struct fastrpc_invoke)
+#define FASTRPC_IOCTL_INIT_ATTACH	_IO('R', 4)
+#define FASTRPC_IOCTL_INIT_CREATE	_IOWR('R', 5, struct fastrpc_init_create)
 
 struct fastrpc_invoke_args {
 	__s32 fd;
@@ -19,4 +21,14 @@ struct fastrpc_invoke {
 	struct fastrpc_invoke_args *args;
 };
 
+struct fastrpc_init_create {
+	__u32 filelen;	/* elf file length */
+	__u32 filefd;	/* fd for the file */
+	__u32 memlen;	/* mem length */
+	__u32 memfd;	/* fd for the mem */
+	__u32 attrs;
+	__u32 siglen;
+	__u64 file;	/* pointer to elf file */
+};
+
 #endif /* __QCOM_FASTRPC_H__ */
-- 
2.19.2
