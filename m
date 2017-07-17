From: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RFC PATCH v2 0/7] Reconstruct rockchip's PCIe and PCIe-PHY driver
 for per-lane PHY model
Date: Mon, 17 Jul 2017 17:30:21 +0800
Message-ID: <596C83AD.7070003@rock-chips.com>
References: <1500276982-208439-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500276982-208439-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi guys,

On 07/17/2017 03:36 PM, Shawn Lin wrote:
> This patchset is trying to reconstruct PCIe and PCIe-PHY driver
> for rockchip platform in order to support per-lane PHY mode. And
> we could idle the inactive lane(s) finally.
>
> We deprecate the legacy PHY mode but the code could still support
> it in order not to break backware compatibility of DTB. And I organize
> the patches carefully so that we don't introduce git-bisect issue.
>
> Hi Brian & Jeffy,
>
> I tested it by backporting all things into my kernel 4.4 tree, and it
> works fine for both legacy PHY mode and per-lane PHY model. However I
> couldn't run 4.12 for my rk3399-evb now, so it would be nice if you
> can test it with your chrome devices running v4.12.
I tested these patches on my chromebook bob(based on next-20170714), 
pcie/pcie wifi(mrvl 8997) work well, and bind/unbind suspend/resume 
shows unused lanes powered off as expected.

Tested-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

>
> Hi Rob,
>
> Does the changes for rockchip-pcie.txt in patch 6 & 7 look good to you
> from the perspective of DT?
>
>
> Changes in v2:
> - deprecate legacy PHY model
> - improve rockchip_pcie_phy_of_xlate
> - fix wrong calculation of pwr_cnt and add new init_cnt
> - add internal locking
> - introduce per-lane data to simply the code
> - convert that for all rk3399 platforms
> - make listing all 4 lanes as mandatory
>
> Shawn Lin (7):
>    PCI: rockchip: split out rockchip_pcie_get_phys
>    PCI: rockchip: introduce per-lanes PHYs support
>    phy: rockcip-pcie: reconstruct driver to support per-lane PHYs
>    PCI: rockchip: idle the inactive PHY(s)
>    arm64: dts: rockchip: convert PCIe to use per-lane PHYs for rk3339
>    dt-bindings: PCI: rockchip: convert to use per-lane PHY model
>    Documentation: bindings: convert to use per-lane Rockchip PCIe PHY
>
>   .../devicetree/bindings/pci/rockchip-pcie.txt      |  25 ++-
>   .../devicetree/bindings/phy/rockchip-pcie-phy.txt  |   7 +-
>   arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   8 +-
>   drivers/pci/host/pcie-rockchip.c                   | 168 ++++++++++++++++++---
>   drivers/phy/rockchip/phy-rockchip-pcie.c           | 128 ++++++++++++++--
>   5 files changed, 297 insertions(+), 39 deletions(-)
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
