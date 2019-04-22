From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v3 0/3] MIPS: ath79: add ag71xx support
Date: Mon, 22 Apr 2019 08:40:43 +0200
Message-ID: <20190422064046.2822-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

2019.04.22 v3:
- ag71xx: use phy_modes() instead of ag71xx_get_phy_if_mode_name()
- ag71xx: remove .ndo_poll_controller support
- ag71xx: unregister_netdev before disconnecting phy.

2019.04.18 v2:
- ag71xx: add list of openwrt authors
- ag71xx: remove redundant PHY_POLL assignment
- ag71xx: use phy_attached_info instead of netif_info
- ag71xx: remove redundant netif_carrier_off() on .stop.
- DT: use "ethernet" instead of "eth"

This patch series provide ethernet support for many Atheros/QCA
MIPS based SoCs.

I reworked ag71xx driver which was previously maintained within OpenWRT
repository. So far, following changes was made to make upstreaming
easier:
- everything what can be some how used in user space was removed. Most
  of it was debug functionality.
- most of deficetree bindings was removed. Not every thing made sense
  and most of it is SoC specific, so it is possible to detect it by
  compatible.
- mac and mdio parts are merged in to one driver. It makes easier to
  maintaine SoC specific quirks.

Oleksij Rempel (3):
  dt-bindings: net: add qca,ar71xx.txt documentation
  MIPS: ath79: ar9331: add Ethernet nodes
  net: ethernet: add ag71xx driver

 .../devicetree/bindings/net/qca,ar71xx.txt    |   44 +
 arch/mips/boot/dts/qca/ar9331.dtsi            |   25 +
 arch/mips/boot/dts/qca/ar9331_dpt_module.dts  |    8 +
 drivers/net/ethernet/atheros/Kconfig          |   11 +-
 drivers/net/ethernet/atheros/Makefile         |    1 +
 drivers/net/ethernet/atheros/ag71xx.c         | 1946 +++++++++++++++++
 6 files changed, 2034 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/qca,ar71xx.txt
 create mode 100644 drivers/net/ethernet/atheros/ag71xx.c

-- 
2.20.1
