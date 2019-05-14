From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v3 00/13] Add mediatek mipicsi driver for Mediatek SOC MT2712
Date: Tue, 14 May 2019 14:13:37 +0800
Message-ID: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Add mediatek mipicsi driver for Mediatek SOC MT2712

Change in v3:
- Move register setting to the bottom of this patch series
  and merge the patch "[media] mtk-mipicsi: add pm function" to
  "[media] mtk-mipicsi: add mediatek mipicsi driver for mt2712"
- Remove the patch
  "[media] mtk-mipicsi: add the function for Get/Set PARM for application"
- Add max width/heigh condition in patch
  "[media] mtk-mipicsi: get the w/h/bytepwerline for mtk_mipicsi"
- Rename the patch name from
  "[media] mtk-mipicsi: add mediatek mipicsi driver for mt2712" to
  "[media] mtk-mipicsi: add the check for non-supported color format"

Stu Hsieh (13):
  dt-bindings: media: Add binding for MT2712 MIPI-CSI2
  [media] mtk-mipicsi: add mediatek mipicsi driver for mt2712
  [media] mtk-mipicsi: register the soc_camera host
  [media] mtk-mipicsi: add the check for non-supported color format
  [media] mtk-mipicsi: get the w/h/bytepwerline for mtk_mipicsi
  [media] mtk-mipicsi: add function to support SerDes for link number
  [media] mtk-mipicsi: enable/disable ana clk
  [media] mtk-mipicsi: enable/disable cmos for mt2712
  [media] mtk-mipicsi: add ISR for writing the data to buffer
  [media] mtk-mipicsi: set the output address in HW reg
  [media] mtk-mipicsi: add function to get the format
  [media] mtk-mipicsi: add debug message for mipicsi driver
  [media] mtk-mipicsi: add debugfs for mipicsi driver

 .../bindings/media/mediatek-mipicsi-camsv.txt |   53 +
 .../media/mediatek-mipicsi-common.txt         |   19 +
 .../bindings/media/mediatek-mipicsi.txt       |   54 +
 drivers/media/platform/mtk-mipicsi/Makefile   |    4 +
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 1627 +++++++++++++++++
 5 files changed, 1757 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
 create mode 100644 drivers/media/platform/mtk-mipicsi/Makefile
 create mode 100644 drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c

-- 
2.18.0
