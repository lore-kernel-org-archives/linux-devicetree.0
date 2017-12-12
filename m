From: jassisinghbrar@gmail.com
Subject: [PATCHv2 0/3] Socionext Synquacer NETSEC driver
Date: Tue, 12 Dec 2017 22:44:33 +0530
Message-ID: <1513098873-20977-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: davem@davemloft.net, arnd.bergmann@linaro.org, ard.biesheuvel@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

Hi,

Changes since v1
	# Switched from using memremap to ioremap
	# Implemented ndo_do_ioctl callback
	# Defined optional 'dma-coherent' DT property

Jassi Brar (3):
  dt-bindings: net: Add DT bindings for Socionext Netsec
  net: socionext: Add Synquacer NetSec driver
  MAINTAINERS: Add entry for Socionext ethernet driver

 .../devicetree/bindings/net/socionext-netsec.txt   |   43 +
 MAINTAINERS                                        |    7 +
 drivers/net/ethernet/Kconfig                       |    1 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/socionext/Kconfig             |   29 +
 drivers/net/ethernet/socionext/Makefile            |    1 +
 drivers/net/ethernet/socionext/netsec.c            | 1826 ++++++++++++++++++++
 7 files changed, 1908 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt
 create mode 100644 drivers/net/ethernet/socionext/Kconfig
 create mode 100644 drivers/net/ethernet/socionext/Makefile
 create mode 100644 drivers/net/ethernet/socionext/netsec.c

-- 
2.7.4
