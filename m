From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/3] Add device tree probe support for imx fec driver
Date: Tue, 5 Jul 2011 23:13:56 +0800
Message-ID: <1309878839-25743-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

The first two patches are a little off topic.  Patch #1 adds a helper
function of_get_phy_mode into of_net, and #2 converts ibm_newemac net
driver to use this helper function.  Patch #3 is the actual one adding
tree probe support for imx fec driver, with of_get_phy_mode being used.

Changes since v1:
 * Address review comments given by Grant
 * Add patch #1 and #2

Shawn Guo (3):
      dt/net: add helper function of_get_phy_mode
      net: ibm_newemac: convert it to use of_get_phy_mode
      net/fec: add device tree probe support

 Documentation/devicetree/bindings/net/fsl-fec.txt |   24 +++++
 drivers/net/fec.c                                 |   99 +++++++++++++++++++-
 drivers/net/ibm_newemac/core.c                    |   33 +------
 drivers/net/ibm_newemac/emac.h                    |   19 ++--
 drivers/net/ibm_newemac/phy.c                     |    7 +-
 drivers/of/of_net.c                               |   45 +++++++++
 include/linux/of_net.h                            |    1 +
 include/linux/phy.h                               |    4 +-
 8 files changed, 186 insertions(+), 46 deletions(-)

