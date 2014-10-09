From: Iyappan Subramanian <isubramanian@apm.com>
Subject: [PATCH v3 0/6] Add 10GbE support to APM X-Gene SoC ethernet driver
Date: Wed,  8 Oct 2014 20:54:15 -0700
Message-ID: <1412826861-32208-1-git-send-email-isubramanian@apm.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, patches@apm.com, kchudgar@apm.com, Iyappan Subramanian <isubramanian@apm.com>
List-Id: devicetree@vger.kernel.org

Adding 10GbE support to APM X-Gene SoC ethernet driver.

v3: Address comments from v2
* dtb: changed to use all-zeros for the mac address

v2: Address comments from v1
* created preparatory patch to review before adding new functionality
* dtb: updated to use tabs consistently

v1:
* Initial version
---

Iyappan Subramanian (6):
  MAINTAINERS: Update APM X-Gene section
  Documentation: dts: Update section header for APM X-Gene
  dtb: Add 10GbE node to APM X-Gene SoC device tree
  drivers: net: xgene: Preparing for adding 10GbE support
  drivers: net: xgene: Add 10GbE support
  drivers: net: xgene: Add 10GbE ethtool support

 .../devicetree/bindings/net/apm-xgene-enet.txt     |   4 +-
 MAINTAINERS                                        |   1 -
 arch/arm64/boot/dts/apm-mustang.dts                |   4 +
 arch/arm64/boot/dts/apm-storm.dtsi                 |  28 +-
 drivers/net/ethernet/apm/xgene/Makefile            |   3 +-
 .../net/ethernet/apm/xgene/xgene_enet_ethtool.c    |  28 +-
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.c     |  44 ++-
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.h     |  30 +-
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c   |  86 ++++--
 drivers/net/ethernet/apm/xgene/xgene_enet_main.h   |  24 +-
 drivers/net/ethernet/apm/xgene/xgene_enet_xgmac.c  | 331 +++++++++++++++++++++
 drivers/net/ethernet/apm/xgene/xgene_enet_xgmac.h  |  57 ++++
 12 files changed, 566 insertions(+), 74 deletions(-)
 create mode 100644 drivers/net/ethernet/apm/xgene/xgene_enet_xgmac.c
 create mode 100644 drivers/net/ethernet/apm/xgene/xgene_enet_xgmac.h

-- 
1.9.1
