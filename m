From: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCHv5 0/5] GEHC Bx50 Switch Support
Date: Tue, 23 Jan 2018 16:03:45 +0100
Message-ID: <20180123150350.11031-1-sebastian.reichel@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-81qHHgoATdEGFh7si24rbyp2UmYkHbXO@public.gmane.org, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This adds support for the internal switch found in GE Healthcare
B450v3, B650v3 and B850v3. All devices use a GPIO bitbanged MDIO
bus to communicate with the switch and a PCIe based network card
for exchanging network data. The cpu network data link requires,
that the switch's internal phy interface is enabled, so support
for that is added by the first patch in this series.

The patch series is based on v4.15-rc8.

Changes since PATCHv4:
 * Introduce dsa_port_link_(un)register_of and mark the fixed
   variant static.
 * Update patch description to describe the phy<->phy connection
   from i210 to the Marvell switch
Changes since PATCHv3:
 * Enable the phy in dsa_port_setup() instead of abusing the
   fixed link setup function
Changes since PATCHv2:
 * Add phy nodes to switch in bx50.dtsi and reference them
   from switch ports
 * Enable cpu-port's phy based on 'phy-handle' instead of 'phy-mode'
Changes since PATCHv1:
 * Use 'marvell,mv88e6085' instead of introducing compatible
   string for mv88e6240.
 * Fix indention of DT nodes
 * Only enable 'cpu' phy, if explicitly set to "internal".

-- Sebastian

Sebastian Reichel (5):
  net: dsa: Support internal phy on 'cpu' port
  ARM: dts: imx6q-bx50v3: Add internal switch
  ARM: dts: imx6q-b850v3: Add switch port configuration
  ARM: dts: imx6q-b650v3: Add switch port configuration
  ARM: dts: imx6q-b450v3: Add switch port configuration

 arch/arm/boot/dts/imx6q-b450v3.dts  |  52 ++++++++++++++++++
 arch/arm/boot/dts/imx6q-b650v3.dts  |  52 ++++++++++++++++++
 arch/arm/boot/dts/imx6q-b850v3.dts  |  75 ++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-bx50v3.dtsi |  62 ++++++++++++++++++++++
 net/dsa/dsa2.c                      |   7 ++-
 net/dsa/dsa_priv.h                  |   4 +-
 net/dsa/legacy.c                    |   4 +-
 net/dsa/port.c                      | 103 +++++++++++++++++++++++++++---------
 8 files changed, 327 insertions(+), 32 deletions(-)

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
