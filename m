From: Qii Wang <qii.wang@mediatek.com>
Subject: [PATCH v3 0/2] Add MediaTek I3C master controller driver
Date: Tue, 9 Jul 2019 21:09:20 +0800
Message-ID: <1562677762-24067-1-git-send-email-qii.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bbrezillon@kernel.org
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com, liguo.zhang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

This series are based on 5.2-rc1, we provide two patches to
support MediaTek I3C master controller.

Main changes compared to v2:
--modify the description of clock and interrupt in bindings
--use correct cells for I2C device in bindings

Main changes compared to v1:
--remove clock-div, let clock driver handle it
--let sample_cnt and step_cnt start from two

Qii Wang (2):
  dt-bindings: i3c: Document MediaTek I3C master bindings
  i3c: master: Add driver for MediaTek IP

 .../devicetree/bindings/i3c/mtk,i3c-master.txt     |   48 +
 drivers/i3c/master/Kconfig                         |   10 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/i3c-master-mtk.c                | 1239 ++++++++++++++++++++
 4 files changed, 1298 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
 create mode 100644 drivers/i3c/master/i3c-master-mtk.c

-- 
1.7.9.5
