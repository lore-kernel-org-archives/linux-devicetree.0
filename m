From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v15 0/4] support gce on mt8183 platform
Date: Fri, 27 Sep 2019 19:42:50 +0800
Message-ID: <20190927114254.6258-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>
List-Id: devicetree@vger.kernel.org

Changes since v14:
 - change input argument as pointer in append_commend()

Changes since v13:
 - separate poll function as poll w/ & w/o mask function
 - directly pass inst into append_command function instead
   of returns a pointer
 - fixup coding style
 - rebase onto 5.3-rc1

[... snip ...]

Bibby Hsieh (4):
  soc: mediatek: cmdq: define the instruction struct
  soc: mediatek: cmdq: add polling function
  soc: mediatek: cmdq: add cmdq_dev_get_client_reg function
  arm64: dts: add gce node for mt8183

 arch/arm64/boot/dts/mediatek/mt8183.dtsi |  10 ++
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 176 +++++++++++++++++++----
 include/linux/mailbox/mtk-cmdq-mailbox.h |  11 ++
 include/linux/soc/mediatek/mtk-cmdq.h    |  53 +++++++
 4 files changed, 224 insertions(+), 26 deletions(-)

-- 
2.18.0
