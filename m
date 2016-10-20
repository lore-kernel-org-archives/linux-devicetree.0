From: James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH v9 0/4] Mediatek MT2701 SCPSYS power domain support
Date: Thu, 20 Oct 2016 16:56:34 +0800
Message-ID: <1476953798-23263-1-git-send-email-jamesjj.liao@mediatek.com>
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
To: Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>
Cc: srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series is based on v4.9-rc1 and adds scpsys power domain support
for Mediatek MT2701.

To share the code between MT2701 and MT8173, this patchset also refined
original mtk-scpsys.c to separate common codes and platform codes, so
that mtk-scpsys.c can support new SoCs more easily.

MT8173 and MT2701 scpsys init level are now subsys_init. Please refer to [1]
to see discussion details.

changes since v8:
- Rebase to v4.9-rc1.
- Refine implementation in init_clks() and init_scp().

changes since v7:
- Add clk_id for each scp_domain_data define.
- Minor coding style changes.

changes since v6:
- Minor changes in the dt-binding document.

changes since v5:
- Rebase to v4.6-rc1.
- Add dependent clocks for MFG, ISP, ETH and HIF power domains.
- Add "ethif" as a dependent clock in scpsys dt-binding document.

changes since v4:
- Rebase to v4.5-rc4.
- Remove mtk-scpsys.h and Merge its code into mtk-scpsys.c.
- Add names for every controlling registers and bits.
- Include dt-bindings headers at the beginning of mtk-scpsys.c.
- Sort compatible string in dt-binding documents.

changes since v3:
- Implement MT8173 and MT2701 scpsys drivers in a signle file.
- Remove naming of registers that can't be shared among SoCs.

changes since v2:
- Rebase to mbgg/linux-mediatek v4.4-next/soc [1].
- Remove MTK_SCPSYS_MT8173 and MTK_SCPSYS_MT2701.
- Modify scpsys dt-binding document to support MT2701.

changes since v1:
- Make MTK_SCPSYS in Kconfig invisible from users.
- Add comments for changing scpsys init level to subsys_init.

[1] http://lists.infradead.org/pipermail/linux-mediatek/2015-December/003416.html

James Liao (2):
  soc: mediatek: Refine scpsys to support multiple platform
  soc: mediatek: Init MT8173 scpsys driver earlier

Shunli Wang (2):
  soc: mediatek: Add MT2701 power dt-bindings
  soc: mediatek: Add MT2701 scpsys driver

 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  13 +-
 drivers/soc/mediatek/Kconfig                       |   2 +-
 drivers/soc/mediatek/mtk-scpsys.c                  | 484 +++++++++++++++------
 include/dt-bindings/power/mt2701-power.h           |  27 ++
 4 files changed, 380 insertions(+), 146 deletions(-)
 create mode 100644 include/dt-bindings/power/mt2701-power.h

--
1.9.1
