From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v6 0/7] Add endpoint driver for Rockchip PCIe controller
Date: Fri, 27 Apr 2018 10:38:17 +0800
Message-ID: <1524796697-160764-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi Lorenzo,

This's the 6th try to upstream endpoint driver for Rockchip PCIe
controller. V6 is rebased by droping the rename change.

Thanks.


Changes in v6:
- rebase

Changes in v5:
- export symbol to fix error reported by Kbuild robot
- PCIE_ROCKCHIP depends on PCI

Changes in v4:
- remove empty line
- keep rockchip's order next to cadence and dwc, but
  we will try to resort it later when reconstructing
  the directories

Shawn Lin (7):
  PCI: rockchip: Separate common code from RC driver
  PCI: rockchip: Split out common function to parse DT
  PCI: rockchip: Split out common function to init controller
  dt-bindings: PCI: rockchip: Rename rockchip-pcie.txt to
    rockchip-pcie-host.txt
  PCI: rockchip: Add Endpoint controller driver for Rockchip PCIe
    controller
  dt-bindings: PCI: rockchip: Add DT bindings for Rockchip PCIe endpoint
    controller
  arm64: defconfig: update config for Rockchip PCIe

 .../devicetree/bindings/pci/rockchip-pcie-ep.txt   |   62 +
 .../{rockchip-pcie.txt => rockchip-pcie-host.txt}  |    0
 MAINTAINERS                                        |    4 +-
 arch/arm64/configs/defconfig                       |    3 +-
 drivers/pci/host/Kconfig                           |   19 +-
 drivers/pci/host/Makefile                          |    2 +
 drivers/pci/host/pcie-rockchip-ep.c                |  642 ++++++++
 drivers/pci/host/pcie-rockchip-host.c              | 1141 +++++++++++++
 drivers/pci/host/pcie-rockchip.c                   | 1683 +++-----------------
 drivers/pci/host/pcie-rockchip.h                   |  338 ++++
 10 files changed, 2406 insertions(+), 1488 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/rockchip-pcie-ep.txt
 rename Documentation/devicetree/bindings/pci/{rockchip-pcie.txt => rockchip-pcie-host.txt} (100%)
 create mode 100644 drivers/pci/host/pcie-rockchip-ep.c
 create mode 100644 drivers/pci/host/pcie-rockchip-host.c
 create mode 100644 drivers/pci/host/pcie-rockchip.h

-- 
1.9.1
