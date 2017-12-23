From: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCHv4 0/3] Socionext Synquacer NETSEC driver
Date: Sat, 23 Dec 2017 11:14:36 +0530
Message-ID: <1514007876-16617-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hi,

Changes since v3
	# Discard 'socionext,snq-mdio', and simply use 'mdio' subnode.
	# Use ioremap on ucode region as well, instead of memremap.

Changes since v2
        # Use 'mdio' subnode in DT bindings.
        # Use phy_interface_mode_is_rgmii(), instead of open coding the check.
        # Use readl/b with eeprom_base pointer.
        # Unregister mdio bus upon failure in probe.

Changes since v1
        # Switched from using memremap to ioremap
        # Implemented ndo_do_ioctl callback
        # Defined optional 'dma-coherent' DT property

Jassi Brar (3):
  dt-bindings: net: Add DT bindings for Socionext Netsec
  net: socionext: Add Synquacer NetSec driver
  MAINTAINERS: Add entry for Socionext ethernet driver

 .../devicetree/bindings/net/socionext-netsec.txt   |   55 +
 MAINTAINERS                                        |    7 +
 drivers/net/ethernet/Kconfig                       |    1 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/socionext/Kconfig             |   29 +
 drivers/net/ethernet/socionext/Makefile            |    1 +
 drivers/net/ethernet/socionext/netsec.c            | 1844 ++++++++++++++++++++
 7 files changed, 1938 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt
 create mode 100644 drivers/net/ethernet/socionext/Kconfig
 create mode 100644 drivers/net/ethernet/socionext/Makefile
 create mode 100644 drivers/net/ethernet/socionext/netsec.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
