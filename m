From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v2 23/25] drm/mediatek: add vmap support for mediatek drm
Date: Wed, 27 Mar 2019 14:19:19 +0800
Message-ID: <1553667561-25447-24-git-send-email-yongqiang.niu@mediatek.com>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add add vmap support for mediatek drm

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 7 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_gem.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 84c6626..942789d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -370,6 +370,7 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 	.gem_prime_get_sg_table = mtk_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
 	.gem_prime_mmap = mtk_drm_gem_mmap_buf,
+	.gem_prime_vmap = mtk_drm_gem_vmap_buf,
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 259b7b0..c230237 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -165,6 +165,13 @@ int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	return mtk_drm_gem_object_mmap(obj, vma);
 }
 
+void *mtk_drm_gem_vmap_buf(struct drm_gem_object *obj)
+{
+	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
+
+	return mtk_gem->cookie;
+}
+
 int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
index 534639b..3c48af9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
@@ -49,6 +49,7 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj,
 			 struct vm_area_struct *vma);
+void *mtk_drm_gem_vmap_buf(struct drm_gem_object *obj);
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 			struct dma_buf_attachment *attach, struct sg_table *sg);
-- 
1.8.1.1.dirty
