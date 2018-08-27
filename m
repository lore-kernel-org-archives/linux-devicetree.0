From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/9] of: fix compatible-child-node lookups
Date: Mon, 27 Aug 2018 10:21:44 +0200
Message-ID: <20180827082153.22537-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Ulf Hansson <ulf.hansson@linaro.org>, Josh Wu <rainyfeeling@outlook.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Doug Berger <opendmb@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Samuel Ortiz <sameo@linux.intel.com>, Sebastian Reichel <sre@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Several drivers currently use of_find_compatible_node() to lookup child
nodes while failing to notice that the of_find_ functions search the
entire tree depth-first (from a given start node) and therefore can
match unrelated nodes.

The fact that these functions also drop a reference to the node they
start searching from (e.g. the parent node) is typically also
overlooked, something which can lead to use-after-free bugs (e.g. after
probe deferrals).

This series adds a new helper, similar to of_get_child_by_name(), 
that can be used to lookup compatible child nodes, and uses the new
helper to fix child-node lookups throughout the tree.

This is related to the fixes I posted about a year ago, which addressed
a similar anti-pattern when looking up child nodes by name. Since it
took me more than a year to get all those fixes into Linus' tree (one
fix is still pending), and as these fixes depend on the new helper, I'm
suggesting that these all go in through Rob's or Greg's trees.

Alternatively, the helper could go into to -rc2, and I'll be pinging
submaintainers for the coming year as well. ;)

Johan


Changes in v2
 - fix !CONFIG_OF build by adding missing inline keyword
 - amend commit messages and explicitly mention that the of_find
   functions search the entire tree from a given start node
 - add Sebastian's and Martin's Reviewed-by and Acked-by to patches 4/9
   and 9/9 respectively
 - drop or fix a couple of CC addresses that bounced


Johan Hovold (9):
  of: add helper to lookup compatible child node
  drm/mediatek: fix OF sibling-node lookup
  drm/msm: fix OF child-node lookup
  mmc: meson-mx-sdio: fix OF child-node lookup
  mtd: nand: atmel: fix OF child-node lookup
  net: bcmgenet: fix OF child-node lookup
  net: stmmac: dwmac-sun8i: fix OF child-node lookup
  NFC: nfcmrvl_uart: fix OF child-node lookup
  power: supply: twl4030-charger: fix OF sibling-node lookup

 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  5 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  5 ++--
 drivers/mmc/host/meson-mx-sdio.c              |  8 ++++--
 drivers/mtd/nand/raw/atmel/nand-controller.c  | 11 +++++---
 drivers/net/ethernet/broadcom/genet/bcmmii.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 12 +++++++--
 drivers/nfc/nfcmrvl/uart.c                    |  5 ++--
 drivers/of/base.c                             | 25 +++++++++++++++++++
 drivers/power/supply/twl4030_charger.c        |  5 ++--
 include/linux/of.h                            |  8 ++++++
 10 files changed, 68 insertions(+), 18 deletions(-)

-- 
2.18.0
