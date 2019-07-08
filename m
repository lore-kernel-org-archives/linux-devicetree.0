From: <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH V2 6/6] media: platform: mtk-mdp3: Add struct tuning_addr
 to identify user tuning data
Date: Mon, 8 Jul 2019 19:05:00 +0800
Message-ID: <20190708110500.7242-7-frederic.chen@mediatek.com>
References: <20190708110500.7242-1-frederic.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190708110500.7242-1-frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: shik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Allan.Yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, suleiman-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

We added a struct tuning_addr which contains a field "present"
so that the driver can tell the firmware if we have user tuning
dataor not.

Signed-off-by: Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
index 9fabe7e8b71d..0944fe911d97 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
@@ -38,6 +38,12 @@ struct img_addr {
 	u32	iova;	/* Used by IOMMU HW access */
 } __attribute__ ((__packed__));
 
+struct tuning_addr {
+	u32	present;
+	u32	pa;	/* Used by CM4 access */
+	u32	iova;	/* Used by IOMMU HW access */
+} __attribute__ ((__packed__));
+
 struct img_sw_addr {
 	u64	va;	/* Used by APMCU access */
 	u32	pa;	/* Used by CM4 access */
@@ -105,7 +111,7 @@ struct img_ipi_frameparam {
 	u64		drv_data;
 	struct img_input	inputs[IMG_MAX_HW_INPUTS];
 	struct img_output	outputs[IMG_MAX_HW_OUTPUTS];
-	struct img_addr		tuning_data;
+	struct tuning_addr	tuning_data;
 	struct img_addr		subfrm_data;
 	struct img_sw_addr	config_data;
 	struct img_sw_addr  self_data;
-- 
2.18.0
