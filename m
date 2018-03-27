From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [net-next PATCH v2 00/10] Add support for netcp driver on K2G SoC
Date: Tue, 27 Mar 2018 12:31:39 -0400
Message-ID: <1522168309-12338-1-git-send-email-m-karicheri2@ti.com>
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

Change history:
  v2 - Addressed following comments on initial version
       - split patch 3/5 to multiple patches from Andrew Lunn

Murali Karicheri (10):
  soc: ti: K2G: enhancement to support QMSS in NSS
  soc: ti: K2G: provide APIs to support driver probe deferral
  net: netcp: ethss: make call to gbe_sgmii_config() conditional
  net: netcp: ethss: add support for handling sgmii link interface
  net: netcp: ethss: use rgmii link status for 2u cpsw hardware
  net: netcp: ethss: map vlan priorities to zero flow
  net: netcp: ethss: re-use stats handling code for 2u hardware
  net: netcp: ethss: use of_get_phy_mode() to support different RGMII
    modes
  Revert "net: netcp: remove dead code from the driver"
  net: netcp: support probe deferral

 .../bindings/soc/ti/keystone-navigator-qmss.txt    |  7 ++
 drivers/net/ethernet/ti/netcp.h                    |  2 +
 drivers/net/ethernet/ti/netcp_core.c               | 13 +++
 drivers/net/ethernet/ti/netcp_ethss.c              | 75 ++++++++++++++---
 drivers/soc/ti/knav_dma.c                          |  8 ++
 drivers/soc/ti/knav_qmss.h                         |  6 ++
 drivers/soc/ti/knav_qmss_queue.c                   | 98 +++++++++++++++++-----
 include/linux/soc/ti/knav_dma.h                    | 12 +++
 include/linux/soc/ti/knav_qmss.h                   |  1 +
 9 files changed, 189 insertions(+), 33 deletions(-)

-- 
1.9.1
