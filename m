From: <honghui.zhang@mediatek.com>
Subject: [PATCH v2 0/2] PCI: mediatek: Fixups for the IRQ handle routine and MT7622's class code
Date: Thu, 21 Dec 2017 10:11:15 +0800
Message-ID: <1513822277-18329-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, ryder.lee@mediatek.com, lorenzo.pieralisi@arm.com
Cc: honghui.zhang@mediatek.com, hongkun.cao@mediatek.com, youlin.pei@mediatek.com, yong.wu@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

Two fixups for mediatek's host bridge:
The first patch fixup the IRQ handle routine to avoid IRQ reentry which
may exist for both MT2712 and MT7622.
The second patch fixup class type for MT7622.

Change Since v1:
 - Add the second patch.
 - Make the first patch's commit message more standard.

Honghui Zhang (2):
  PCI: mediatek: Clear IRQ status after IRQ dispatched to avoid reentry
  PCI: mediatek: Fixup class type for MT7622

 drivers/pci/host/pcie-mediatek.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

-- 
2.6.4
