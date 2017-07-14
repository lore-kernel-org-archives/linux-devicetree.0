From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RFC PATCH 0/6] Reconstruct rockchip's PCIe and PCIe-PHY driver for per-lane PHY model
Date: Fri, 14 Jul 2017 11:48:15 +0800
Message-ID: <1500004101-240296-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


This patchset is trying to reconstruct PCIe and PCIe-PHY driver
for rockchip platform in order to support per-lane PHY mode. And
we could idle the inactive lane(s) finally.

We deprecate the legacy PHY mode but the code could still support
it in order not to break backware compatibility of DTB. And I organize
the patches carefully so that we don't introduce git-bisect issue.

Hi Brian & Jeffy,

I tested it by backporting all things into my kernel 4.4 tree, and it
works fine for both legacy PHY mode and per-lane PHY model. However I
couldn't run 4.12 for my rk3399-evb now, so could you please help test
it on your Chromebook devices which can run 4.12?

Hi Rob,

Does the changes for rockchip-pcie.txt in patch 6 look good to you
from the perspective of DT?



Shawn Lin (6):
  PCI: rockchip: split out rockchip_pcie_get_phys
  PCI: rockchip: introduce per-lanes PHYs support
  phy: rockcip-pcie: reconstruct driver to support per-lane PHYs
  PCI: rockchip: idle the inactive PHY(s)
  arm64: dts: rockchip: convert PCIe to use per-lane PHYs for rk3339-evb
  dt-bindings: PCI: rockchip: convert to use per-lane PHY model

 .../devicetree/bindings/pci/rockchip-pcie.txt      |  25 +++-
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |   2 +
 drivers/pci/host/pcie-rockchip.c                   | 162 ++++++++++++++++++---
 drivers/phy/rockchip/phy-rockchip-pcie.c           | 116 +++++++++++++--
 4 files changed, 269 insertions(+), 36 deletions(-)

-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
