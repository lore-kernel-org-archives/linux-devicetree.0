From: Kejian Yan <yankejian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [patch] {1620} net: hns3: add dcb cap flag in init sequence
Date: Wed, 25 Jan 2017 15:26:40 +0800
Message-ID: <1485329200-64453-1-git-send-email-yankejian@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: liguozhu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lipeng321-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yankejian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

If enable DCB feature, we need to add the capacity, and the current
procedure cannot setting the dcb because of no capacity flag and every
ops interface will implement by the capicity flag is enable.

Signed-off-by: Kejian Yan <yankejian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 6 ++++--
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c   | 5 +++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 26b9b46..fffe781 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -314,12 +314,14 @@ static int hclge_configure(struct hclge_dev *hdev)
 		hdev->tx_sch_mode = HCLGE_FLAG_TC_BASE_SCH_MODE;
 #ifdef CONFIG_HNS3_DCB
 		hdev->dcbx_cap = DCB_CAP_DCBX_VER_CEE |
-			DCB_CAP_DCBX_VER_IEEE;
+			DCB_CAP_DCBX_VER_IEEE | DCB_CAP_DCBX_HOST;
+		hdev->flag |= HCLGE_FLAG_DCB_CAPABLE;
 #endif /* #ifdef CONFIG_HNS3_DCB */
 	} else {
 		hdev->tx_sch_mode = HCLGE_FLAG_VNET_BASE_SCH_MODE;
 #ifdef CONFIG_HNS3_DCB
-		hdev->dcbx_cap = DCB_CAP_DCBX_VER_IEEE;
+		hdev->dcbx_cap = DCB_CAP_DCBX_VER_IEEE | DCB_CAP_DCBX_HOST;
+		hdev->flag |= HCLGE_FLAG_DCB_CAPABLE;
 #endif /* #ifdef CONFIG_HNS3_DCB */
 	}
 
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
index 903c413..6b00982 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
@@ -687,6 +687,11 @@ static void hclge_tm_tc_info_init(struct hclge_dev *hdev)
 	hdev->dcb_info_tmp.num_tc = hdev->dcb_info.num_tc;
 	memcpy(hdev->dcb_info_tmp.tc_info, hdev->dcb_info.tc_info,
 	       HNAE3_MAX_TC * sizeof(*hdev->dcb_info.tc_info));
+
+	if (hdev->dcb_info.num_tc > 1)
+		hdev->flag |= HCLGE_FLAG_DCB_ENABLE;
+	else
+		hdev->flag &= ~HCLGE_FLAG_DCB_ENABLE;
 }
 
 static void hclge_tm_pg_info_init(struct hclge_dev *hdev)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
