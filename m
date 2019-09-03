From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 03/14] iommu/mediatek: Add device_link between the consumer
	and the larb devices
Date: Tue, 3 Sep 2019 17:37:25 +0800
Message-ID: <1567503456-24725-4-git-send-email-yong.wu@mediatek.com>
References: <1567503456-24725-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <1567503456-24725-1-git-send-email-yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chao.hao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ming-fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

MediaTek IOMMU don't have its power-domain. all the consumer connect
with smi-larb, then connect with smi-common.

        M4U
         |
    smi-common
         |
  -------------
  |         |    ...
  |         |
larb1     larb2
  |         |
vdec       venc

When the consumer works, it should enable the smi-larb's power which
also need enable the smi-common's power firstly.

Thus, First of all, use the device link connect the consumer and the
smi-larbs. then add device link between the smi-larb and smi-common.

This patch adds device_link between the consumer and the larbs.

When device_link_add, I add the flag DL_FLAG_STATELESS to avoid calling
pm_runtime_xx to keep the original status of clocks. It can avoid two
issues:
1) Display HW show fastlogo abnormally reported in [1]. At the beggining,
all the clocks are enabled before entering kernel, but the clocks for
display HW(always in larb0) will be gated after clk_enable and clk_disable
called from device_link_add(->pm_runtime_resume) and rpm_idle. The clock
operation happened before display driver probe. At that time, the display
HW will be abnormal.

2) A deadlock issue reported in [2]. Use DL_FLAG_STATELESS to skip
pm_runtime_xx to avoid the deadlock.

Corresponding, DL_FLAG_AUTOREMOVE_CONSUMER can't be added, then
device_link_removed should be added explicitly.

[1] http://lists.infradead.org/pipermail/linux-mediatek/2019-July/
021500.html
[2] https://lore.kernel.org/patchwork/patch/1086569/

Suggested-by: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/iommu/mtk_iommu.c    | 17 +++++++++++++++++
 drivers/iommu/mtk_iommu_v1.c | 18 +++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b138b94..2511b3c 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -450,6 +450,9 @@ static int mtk_iommu_add_device(struct device *dev)
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct mtk_iommu_data *data;
 	struct iommu_group *group;
+	struct device_link *link;
+	struct device *larbdev;
+	unsigned int larbid;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return -ENODEV; /* Not a iommu client device */
@@ -461,6 +464,14 @@ static int mtk_iommu_add_device(struct device *dev)
 	if (IS_ERR(group))
 		return PTR_ERR(group);
 
+	/* Link the consumer device with the smi-larb device(supplier) */
+	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
+	larbdev = data->larb_imu[larbid].dev;
+	link = device_link_add(dev, larbdev,
+			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	if (!link)
+		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
+
 	iommu_group_put(group);
 	return 0;
 }
@@ -469,6 +480,8 @@ static void mtk_iommu_remove_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct mtk_iommu_data *data;
+	struct device *larbdev;
+	unsigned int larbid;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return;
@@ -476,6 +489,10 @@ static void mtk_iommu_remove_device(struct device *dev)
 	data = fwspec->iommu_priv;
 	iommu_device_unlink(&data->iommu, dev);
 
+	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
+	larbdev = data->larb_imu[larbid].dev;
+	device_link_remove(dev, larbdev);
+
 	iommu_group_remove_device(dev);
 	iommu_fwspec_free(dev);
 }
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 2034d72..a7f22a2 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -423,7 +423,9 @@ static int mtk_iommu_add_device(struct device *dev)
 	struct of_phandle_iterator it;
 	struct mtk_iommu_data *data;
 	struct iommu_group *group;
-	int err;
+	struct device_link *link;
+	struct device *larbdev;
+	int err, larbid;
 
 	of_for_each_phandle(&it, err, dev->of_node, "iommus",
 			"#iommu-cells", 0) {
@@ -466,6 +468,14 @@ static int mtk_iommu_add_device(struct device *dev)
 		return err;
 	}
 
+	/* Link the consumer device with the smi-larb device(supplier) */
+	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
+	larbdev = data->larb_imu[larbid].dev;
+	link = device_link_add(dev, larbdev,
+			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	if (!link)
+		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
+
 	return iommu_device_link(&data->iommu, dev);
 }
 
@@ -473,6 +483,8 @@ static void mtk_iommu_remove_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct mtk_iommu_data *data;
+	struct device *larbdev;
+	unsigned int larbid;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return;
@@ -480,6 +492,10 @@ static void mtk_iommu_remove_device(struct device *dev)
 	data = fwspec->iommu_priv;
 	iommu_device_unlink(&data->iommu, dev);
 
+	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
+	larbdev = data->larb_imu[larbid].dev;
+	device_link_remove(dev, larbdev);
+
 	iommu_group_remove_device(dev);
 	iommu_fwspec_free(dev);
 }
-- 
1.9.1
