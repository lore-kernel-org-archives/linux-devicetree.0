From: Argus Lin <argus.lin@mediatek.com>
Subject: [PATCH 0/3] Pwrap: Mediatek pwrap driver for MT6779
Date: Thu, 3 Oct 2019 15:48:18 +0800
Message-ID: <1570088901-23211-1-git-send-email-argus.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Chenglin Xu <chenglin.xu@mediatek.com>, argus.lin@mediatek.com, Sean Wang <sean.wang@mediatek.com>, wsd_upstream@mediatek.com, henryc.chen@mediatek.com, flora.fu@mediatek.com, Chen Zhong <chen.zhong@mediatek.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Here's version 1 of the patch series, include 3 patches:
1. Add compatible for MT6779 pwrap
2. Add pwrap driver for MT6779 SoCs. Keep PWRAP_HIPRIO_ARB_EN,
PWRAP_WDT_UNIT, and PWRAP_WDT_SRC_EN value if it has initialized.
When we enable interrupt flag, read current value then do logical
OR opersion with wrp->master->int_en_all.
3. Add MT6359 support for MT6779 SoCs.

Argus Lin (3):
  dt-bindings: pwrap: mediatek: add pwrap support for MT6779
  soc: mediatek: pwrap: add pwrap driver for MT6779 SoCs
  soc: mediatek: pwrap: add support for MT6359 PMIC

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 157 +++++++++++++++++++--
 2 files changed, 150 insertions(+), 8 deletions(-)

--
1.8.1.1.dirty
