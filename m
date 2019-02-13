From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: [PATCH net-next 0/3] enetc: Add mdio support and device tree nodes
Date: Wed, 13 Feb 2019 13:02:20 +0200
Message-ID: <1550055743-15542-1-git-send-email-claudiu.manoil@nxp.com>
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
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>
Cc: devicetree@vger.kernel.org, alexandru.marginean@nxp.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is the missing part to enable PCI probing of the ENETC ethernet
ports on the LS1028A SoC and external traffic on the LS1028A RDB board.
It's one of the first items on the TODO list for the recently merged
ENETC ethernet driver.

Claudiu Manoil (3):
  arm64: dts: fsl: ls1028a: Add PCI IERC node and ENETC endpoints
  arm64: dts: fsl: ls1028a-rdb: Add ENETC external eth ports for the
    LS1028A RDB board
  enetc: Add ENETC PF level external MDIO support

 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts |  15 ++
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi    |  33 ++++
 drivers/net/ethernet/freescale/enetc/Makefile     |   3 +-
 drivers/net/ethernet/freescale/enetc/enetc_mdio.c | 196 ++++++++++++++++++++++
 drivers/net/ethernet/freescale/enetc/enetc_pf.c   |  13 ++
 drivers/net/ethernet/freescale/enetc/enetc_pf.h   |   6 +
 6 files changed, 265 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc_mdio.c

-- 
2.7.4
