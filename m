From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] media: mtk-mdp: fix build warning in arch x86
Date: Mon, 19 Sep 2016 14:34:42 +0800
Message-ID: <1474266883-51155-2-git-send-email-minghsiu.tsai@mediatek.com>
References: <1474266883-51155-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474266883-51155-1-git-send-email-minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fix build warning in arch x86

Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c |    1 +
 drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c |   10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
index a90972e..9a747e7 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
@@ -17,6 +17,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/pm_runtime.h>
+#include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c b/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
index fb07bf3..39188e5 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
@@ -25,7 +25,8 @@ static inline struct mtk_mdp_ctx *vpu_to_ctx(struct mtk_mdp_vpu *vpu)
 
 static void mtk_mdp_vpu_handle_init_ack(struct mdp_ipi_comm_ack *msg)
 {
-	struct mtk_mdp_vpu *vpu = (struct mtk_mdp_vpu *)msg->ap_inst;
+	struct mtk_mdp_vpu *vpu = (struct mtk_mdp_vpu *)
+					(unsigned long)msg->ap_inst;
 
 	/* mapping VPU address to kernel virtual address */
 	vpu->vsi = (struct mdp_process_vsi *)
@@ -37,7 +38,8 @@ static void mtk_mdp_vpu_ipi_handler(void *data, unsigned int len, void *priv)
 {
 	unsigned int msg_id = *(unsigned int *)data;
 	struct mdp_ipi_comm_ack *msg = (struct mdp_ipi_comm_ack *)data;
-	struct mtk_mdp_vpu *vpu = (struct mtk_mdp_vpu *)msg->ap_inst;
+	struct mtk_mdp_vpu *vpu = (struct mtk_mdp_vpu *)
+					(unsigned long)msg->ap_inst;
 	struct mtk_mdp_ctx *ctx;
 
 	vpu->failure = msg->status;
@@ -108,7 +110,7 @@ static int mtk_mdp_vpu_send_ap_ipi(struct mtk_mdp_vpu *vpu, uint32_t msg_id)
 	msg.msg_id = msg_id;
 	msg.ipi_id = IPI_MDP;
 	msg.vpu_inst_addr = vpu->inst_addr;
-	msg.ap_inst = (uint64_t)vpu;
+	msg.ap_inst = (unsigned long)vpu;
 	err = mtk_mdp_vpu_send_msg((void *)&msg, sizeof(msg), vpu, IPI_MDP);
 	if (!err && vpu->failure)
 		err = -EINVAL;
@@ -126,7 +128,7 @@ int mtk_mdp_vpu_init(struct mtk_mdp_vpu *vpu)
 
 	msg.msg_id = AP_MDP_INIT;
 	msg.ipi_id = IPI_MDP;
-	msg.ap_inst = (uint64_t)vpu;
+	msg.ap_inst = (unsigned long)vpu;
 	err = mtk_mdp_vpu_send_msg((void *)&msg, sizeof(msg), vpu, IPI_MDP);
 	if (!err && vpu->failure)
 		err = -EINVAL;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
