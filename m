From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [net-next PATCH 0/5] Add support for netcp driver on K2G SoC
Date: Mon, 26 Mar 2018 16:15:07 -0400
Message-ID: <1522095312-23249-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ssantosh@kernel.org, malat@debian.org, w-kwok2@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, davem@davemloft.net, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

K2G SoC is another variant of Keystone family of SoCs. This patch
series add support for NetCP driver on this SoC. The QMSS found on
K2G SoC is a cut down version of the QMSS found on other keystone
devices with less number of queues, internal link ram etc. The patch
series has 2 patch sets that goes into the drivers/soc and the
rest has to be applied to net sub system. Please review and merge
if this looks good.

Thanks

The boot logs on K2G ICE board (tftp boot over Ethernet)
is at https://pastebin.ubuntu.com/p/VQTv3c2XBS/

The boot logs on K2G GP board (tftp boot over Ethernet)
is at https://pastebin.ubuntu.com/p/6Vh55DW8vT/

This series applies to net-next master branch.

Murali Karicheri (5):
  soc: ti: K2G: enhancement to support QMSS in NSS
  soc: ti: K2G: provide APIs to support driver probe deferral
  net: netcp: ethss enhancements to support 2u cpsw h/w on K2G SoC
  Revert "net: netcp: remove dead code from the driver"
  net: netcp: support probe deferral

 .../bindings/soc/ti/keystone-navigator-qmss.txt    |  7 ++
 drivers/net/ethernet/ti/netcp.h                    |  3 +
 drivers/net/ethernet/ti/netcp_core.c               | 13 +++
 drivers/net/ethernet/ti/netcp_ethss.c              | 75 ++++++++++++++---
 drivers/soc/ti/knav_dma.c                          |  8 ++
 drivers/soc/ti/knav_qmss.h                         |  6 ++
 drivers/soc/ti/knav_qmss_queue.c                   | 98 +++++++++++++++++-----
 include/linux/soc/ti/knav_dma.h                    | 12 +++
 include/linux/soc/ti/knav_qmss.h                   |  1 +
 9 files changed, 190 insertions(+), 33 deletions(-)

-- 
1.9.1
