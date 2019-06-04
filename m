From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 00/14] Add mediatek mipicsi driver for Mediatek SOC MT2712
Date: Tue, 4 Jun 2019 18:11:41 +0800
Message-ID: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Add mediatek mipicsi driver for Mediatek SOC MT2712

Change in v4:
- remove soc_camera framework dependence in v3
- add some error handle and of_node_put() in patch
  "[media] mtk-mipicsi: add mediatek mipicsi driver for mt2712"
- remove some useless variable

Stu Hsieh (14):
  dt-bindings: Add binding for MT2712 MIPI-CSI2
  dt-bindings: media: Add mipicsi common node binding for MT2712
    MIPI-CSI2
  dt-bindings: media: Add camsv binding for MT2712 MIPI-CSI2
  [media] mtk-mipicsi: add mediatek mipicsi driver for mt2712
  [media] mtk-mipicsi: register the v4l2 device for mt2712 mipicsi
  [media] mtk-mipicsi: enable/disable ana clk
  [media] mtk-mipicsi: add function to get the number of subdev link
  [media] mtk-mipicsi: enable/disable cmos for mt2712
  [media] mtk-mipicsi: add ISR for writing the data to buffer
  [media] mtk-mipicsi: set the output address in HW reg
  [media] mtk-mipicsi: add function to get the format
  [media] mtk-mipicsi: add debug message for mipicsi driver
  [media] mtk-mipicsi: add debugfs for mipicsi driver
  [media] mtk-mipicsi: add function to support SerDes for link number

 .../bindings/media/mediatek-mipicsi-camsv.txt |   55 +
 .../media/mediatek-mipicsi-common.txt         |   19 +
 .../bindings/media/mediatek-mipicsi.txt       |   58 +
 drivers/media/platform/mtk-mipicsi/Makefile   |    4 +
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 1734 +++++++++++++++++
 5 files changed, 1870 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
 create mode 100644 drivers/media/platform/mtk-mipicsi/Makefile
 create mode 100644 drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c

-- 
2.18.0
