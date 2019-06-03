From: Qii Wang <qii.wang@mediatek.com>
Subject: [PATCH 0/2] Add MediaTek I3C master controller driver
Date: Mon, 3 Jun 2019 11:51:01 +0800
Message-ID: <1559533863-10292-1-git-send-email-qii.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bbrezillon@kernel.org
Cc: matthias.bgg@gmail.com, linux-i3c@lists.infradead.org, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com, liguo.zhang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

This series are based on 5.2-rc1, we provide two patches to
support MediaTek I3C master controller.

Qii Wang (2):
  dt-bindings: i3c: Document MediaTek I3C master bindings
  i3c: master: Add driver for MediaTek IP

 .../devicetree/bindings/i3c/mtk,i3c-master.txt     |   50 +
 drivers/i3c/master/Kconfig                         |   10 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/i3c-master-mtk.c                | 1246 ++++++++++++++++++++
 4 files changed, 1307 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
 create mode 100644 drivers/i3c/master/i3c-master-mtk.c

-- 
1.7.9.5
