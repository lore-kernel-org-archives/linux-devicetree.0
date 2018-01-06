From: jassisinghbrar@gmail.com
Subject: [PATCH net-next v6 0/3] Socionext Synquacer NETSEC driver
Date: Sat,  6 Jan 2018 19:43:19 +0530
Message-ID: <1515247999-4041-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: davem@davemloft.net, arnd.bergmann@linaro.org, andrew@lunn.ch, ard.biesheuvel@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, masami.hiramatsu@linaro.org, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

Changes since v5
	# Removed helper macros
	# Removed 'inline' qualifier
	# Changed multiline empty comment to single line
	# Added 'clock-names' property in DT binding example
	# Ignore 'clock-names' property in driver until f/ws in the wild are
	  upgraded or we support instance that take in more than one clock.
	# Rebased the patchset onto net-next

Changes since v4
        # Fixed ucode indexing as a word, instead of byte
        # Removed redundant clocks, keep only phy rate reference clock
          and expect it to be 'phy_ref_clk'

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

 .../devicetree/bindings/net/socionext-netsec.txt   |   53 +
 MAINTAINERS                                        |    7 +
 drivers/net/ethernet/socionext/Kconfig             |   12 +
 drivers/net/ethernet/socionext/Makefile            |    1 +
 drivers/net/ethernet/socionext/netsec.c            | 1775 ++++++++++++++++++++
 5 files changed, 1848 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt
 create mode 100644 drivers/net/ethernet/socionext/netsec.c

-- 
2.7.4
