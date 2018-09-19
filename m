From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH 0/4] Add PMIC wrapper support for Mediatek MT8183 SoC IC
Date: Wed, 19 Sep 2018 15:25:57 +0800
Message-ID: <1537341961-20736-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com
Cc: argus.lin@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, chenglin.xu@mediatek.com, chen.zhong@mediatek.com, srv_heupstream@mediatek.com, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

This series adds support for a new PMIC MT6358 and a new SoC
MT8183 to the pmic-wrap driver.

Hsin-Hsiung Wang (4):
  dt-bindings: mediatek: add compatible for mt8183 pwrap
  soc: mediatek: use group of bits for pwrap capability
  soc: mediatek: add mt8183 pwrap support
  arm64: dts: mediatek: add pwrap device node for mt8183

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  10 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 439 +++++++++++++++------
 3 files changed, 329 insertions(+), 121 deletions(-)

-- 
1.9.1
