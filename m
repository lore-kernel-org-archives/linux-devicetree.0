Return-Path: <SRS0=Paxx=RQ=mediatek.com=stanley.chu@kernel.org>
From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v4 0/7] scsi: ufs-mediatek: Add ufshci and ufsphy support for Mediatek SoC chips
Date: Wed, 13 Mar 2019 12:10:04 +0800
Message-ID: <1552450211-7149-2-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1552450211-7149-1-git-send-email-stanley.chu@mediatek.com>
References: <1552450211-7149-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, chunfeng.yun@mediatek.com, kishon@ti.com, martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, pedrom.sousa@synopsys.com
Cc: vivek.gautam@codeaurora.org, subhashj@codeaurora.org, liwei213@huawei.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuohong.wang@mediatek.com, peter.wang@mediatek.com, chun-hung.wu@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

Hello,

This patch series adds UFS M-PHY and UFS host driver support in MediaTek chipsets.

In the meantime, re-factors ufshcd_get_pwr_dev_param in vendors' drivers. This function is for vendors to decide finally agreed attributes for power mode change if vendors define
their host capability in struct ufs_dev_params. Because it is using by both ufs-qcom and ufs-hisi and also used in ufs-mediatek in this serious, simply re-factor it and then every vendors can reuse it.

Changes since v3:
-	dt-bindings: Use specific compatible name for both ufs-mediatek and phy-mtk-ufs, remove interrupt-parent and lanes-per-direction in ufs-mediatek, and fix descriptions.

Changes since v2:
-	Fix header style with SPDX-License-Identifier declaration used.
-	Simplify ufs-phy-mtk to single source file since we has one MPHY version now, and do fixes according to Chunfeng Yun's comments.
-	Add dt-bindings of ufs-phy-mtk.

Changes since v1:
-	Re-factor ufshcd_get_pwr_dev_param in mediatek/qcom/hisi vendor drivers.
-	Introduce ufs-phy-mtk to have a good extension capability for different power control flows in future different MPHY versions.
-	Bind ufs-phy-mtk and hook suitable callbacks in ufs-mediatek driver.
-	Use PA_LOCAL_TX_LCC_ENABLE attribute defined in unipro.h instead.
-	Do some minor format fixes.

Stanley Chu (7):
  scsi: ufs: Introduce ufshcd_get_pwr_dev_param
  scsi: ufs-qcom: Re-factor ufshcd_get_pwr_dev_param
  scsi: ufs-hisi: Re-factor ufshcd_get_pwr_dev_param
  dt-bindings: phy: Add document for phy-mtk-ufs
  dt-bindings: scsi: ufs: Add document for ufs-mediatek
  phy: mediatek: Add UFS M-PHY driver
  scsi: ufs-mediatek: Add UFS support for Mediatek SoC chips

 .../devicetree/bindings/phy/phy-mtk-ufs.txt   |  36 ++
 .../devicetree/bindings/ufs/ufs-mediatek.txt  |  44 +++
 drivers/phy/mediatek/Kconfig                  |   9 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-ufs.c            | 239 ++++++++++++
 drivers/scsi/ufs/Kconfig                      |  14 +
 drivers/scsi/ufs/Makefile                     |   1 +
 drivers/scsi/ufs/ufs-hisi.c                   | 109 +-----
 drivers/scsi/ufs/ufs-mediatek.c               | 368 ++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h               |  54 +++
 drivers/scsi/ufs/ufs-qcom.c                   | 106 +----
 drivers/scsi/ufs/ufshcd-pltfrm.c              |  98 +++++
 drivers/scsi/ufs/ufshcd-pltfrm.h              |  21 +
 13 files changed, 893 insertions(+), 207 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
 create mode 100644 drivers/phy/mediatek/phy-mtk-ufs.c
 create mode 100644 drivers/scsi/ufs/ufs-mediatek.c
 create mode 100644 drivers/scsi/ufs/ufs-mediatek.h

-- 
2.18.0
