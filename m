From: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Subject: [PATCH v4 0/3] Fix mdp device tree
Date: Tue, 23 May 2017 11:24:08 +0800
Message-ID: <1495509851-29159-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans Verkuil <hans.verkuil@cisco.com>, daniel.thompson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Pawel Osciak <posciak@chromium.org>, Houlong Wei <houlong.wei@mediatek.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Wu-Cheng Li <wuchengli@google.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changes in v4:
- Add backwards compability if dts is out-of-date

Changes in v3:
- Upload patches again because forget to add v2 in title

Changes in v2:
- Update commit message

If the mdp_* nodes are under an mdp sub-node, their corresponding
platform device does not automatically get its iommu assigned properly.

Fix this by moving the mdp component nodes up a level such that they are
siblings of mdp and all other SoC subsystems.  This also simplifies the
device tree.

Although it fixes iommu assignment issue, it also break compatibility
with old device tree. So, the patch in driver is needed to iterate over
sibling mdp device nodes, not child ones, to keep driver work properly.

Daniel Kurtz (2):
  arm64: dts: mt8173: Fix mdp device tree
  media: mtk-mdp: Fix mdp device tree

Minghsiu Tsai (1):
  dt-bindings: mt8173: Fix mdp device tree

 .../devicetree/bindings/media/mediatek-mdp.txt     |  12 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 126 ++++++++++-----------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c      |  12 +-
 3 files changed, 73 insertions(+), 77 deletions(-)

-- 
1.9.1
