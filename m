From: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Subject: [PATCH 0/3] Fix mdp device tree
Date: Thu, 13 Apr 2017 15:33:04 +0800
Message-ID: <1492068787-17838-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hans.verkuil@cisco.com>, daniel.thompson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Pawel Osciak <posciak@chromium.org>, Houlong Wei <houlong.wei@mediatek.com>
Cc: srv_heupstream@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Wu-Cheng Li <wuchengli@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fix this by moving the mdp component nodes up a level such that they are
siblings of mdp and all other SoC subsystems.  This also simplifies the
device tree.

Daniel Kurtz (2):
  arm64: dts: mt8173: Fix mdp device tree
  media: mtk-mdp: Fix mdp device tree

Minghsiu Tsai (1):
  dt-bindings: mt8173: Fix mdp device tree

 .../devicetree/bindings/media/mediatek-mdp.txt     |  12 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 126 ++++++++++-----------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c      |   2 +-
 3 files changed, 64 insertions(+), 76 deletions(-)

-- 
1.9.1
