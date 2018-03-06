From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 0/6] Add endpoint driver for Rockchip PCIe controller
Date: Tue,  6 Mar 2018 10:42:53 +0800
Message-ID: <1520304173-231081-1-git-send-email-shawn.lin@rock-chips.com>
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
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


Patch 1 firstly move the whole Rockchip PCIe host driver from
drivers/pci/host to a new folder, driver/pci/rockchip/, and rename
pcie-rockchip.c to pcie-rockchip-host.c. It also updates the
Kconfig/Makefile etc to repect this change.

Then patch 2 and patch 3 are trying to spilt out some common code in
preparation for adding endponit controller driver support.

Patch 4 rename rockchip-pcie.txt to rockchip-pcie-host.txt.

Patch 5 adds endpoint controller driver support as well as the new
documentation, rockchip-pcie-ep.txt, introduced by patch 6.


Changes in v2:
- remove rockchip,rk3399-pcie-host compatible(Suggested by Rob)
- fix some error handling
Changes in v3:
- fix all issues suggested by Lorenzo

Shawn Lin (6):
  PCI: rockchip: Create individual folder for rockchip drivers
  PCI: rockchip: Split out common function to parse DT
  PCI: rockchip: Split out common function to init controller
  dt-bindings: PCI: rockchip: Rename rockchip-pcie.txt to
    rockchip-pcie-host.txt
  PCI: rockchip: Add Endpoint controller driver for Rockchip PCIe
    controller
  dt-bindings: PCI: rockchip: Add DT bindings for Rockchip PCIe endpoint
    controller

 .../devicetree/bindings/pci/rockchip-pcie-ep.txt   |  62 ++
 .../{rockchip-pcie.txt => rockchip-pcie-host.txt}  |   0
 MAINTAINERS                                        |   4 +-
 drivers/pci/Kconfig                                |   1 +
 drivers/pci/Makefile                               |   2 +
 drivers/pci/host/Kconfig                           |  11 -
 drivers/pci/host/Makefile                          |   1 -
 drivers/pci/rockchip/Kconfig                       |  32 ++
 drivers/pci/rockchip/Makefile                      |   4 +
 drivers/pci/rockchip/pcie-rockchip-ep.c            | 638 +++++++++++++++++++++
 .../pcie-rockchip-host.c}                          | 594 +------------------
 drivers/pci/rockchip/pcie-rockchip.c               | 417 ++++++++++++++
 drivers/pci/rockchip/pcie-rockchip.h               | 341 +++++++++++
 13 files changed, 1512 insertions(+), 595 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/rockchip-pcie-ep.txt
 rename Documentation/devicetree/bindings/pci/{rockchip-pcie.txt => rockchip-pcie-host.txt} (100%)
 create mode 100644 drivers/pci/rockchip/Kconfig
 create mode 100644 drivers/pci/rockchip/Makefile
 create mode 100644 drivers/pci/rockchip/pcie-rockchip-ep.c
 rename drivers/pci/{host/pcie-rockchip.c => rockchip/pcie-rockchip-host.c} (61%)
 create mode 100644 drivers/pci/rockchip/pcie-rockchip.c
 create mode 100644 drivers/pci/rockchip/pcie-rockchip.h

-- 
1.9.1
