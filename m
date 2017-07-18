From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH v3 0/7] Reconstruct rockchip's PCIe and PCIe-PHY
 driver for per-lane PHY model
Date: Tue, 18 Jul 2017 13:29:52 -0700
Message-ID: <20170718202951.GA116895@google.com>
References: <1500364623-97041-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500364623-97041-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 03:56:56PM +0800, Shawn Lin wrote:
> 
> This patchset is trying to reconstruct PCIe and PCIe-PHY driver
> for rockchip platform in order to support per-lane PHY mode. And
> we could idle the inactive lane(s) finally.
> 
> We deprecate the legacy PHY mode but the code could still
> support it in order not to break backware compatibility of DTB. And I
> organize the patches carefully so that we don't introduce git-bisect
> issue.
> 
> Note that I carry on Jeffy's test tag from v2 as he has locally tested
> my v3 patchset.

I have a few nits for the patchset (will reply shortly), but otherwise
(if we're *really* going to go with this approach; I still would
appreciate a reply from Kishon on the original patchset, where I
suggested alternatives) at least the code is much better this time
around. So for the whole thing:

Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> Changes in v3:
> - kill rockchip_pcie_manipulate_phys and related stuff
> - use phys array
> - improve the commit msg
> - remove unnecessary forward declaration
> - keep mutex inside struct rockchip_pcie_phy
> - fix wrong check of args number
> - move de-idle lanes after deasserting the reset
> - use cached lanes_map to avoid powering off inactive
>   lanes twice
> - rename the commit tile
> 
> Changes in v2:
> - deprecate legacy PHY model
> - improve rockchip_pcie_phy_of_xlate
> - fix wrong calculation of pwr_cnt and add new init_cnt
> - add internal locking
> - introduce per-lane data to simply the code
> 
> Shawn Lin (7):
>   PCI: rockchip: split out rockchip_pcie_get_phys
>   PCI: rockchip: introduce per-lanes PHYs support
>   phy: rockcip-pcie: reconstruct driver to support per-lane PHYs
>   PCI: rockchip: idle the inactive PHY(s)
>   arm64: dts: rockchip: convert PCIe to use per-lane PHYs for rk3339
>   dt-bindings: PCI: rockchip: convert to use per-lane PHY model
>   dt-bindings: phy: convert to use per-lane Rockchip PCIe PHY
> 
>  .../devicetree/bindings/pci/rockchip-pcie.txt      |  25 ++++-
>  .../devicetree/bindings/phy/rockchip-pcie-phy.txt  |   7 +-
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   8 +-
>  drivers/pci/host/pcie-rockchip.c                   | 123 ++++++++++++++++----
>  drivers/phy/rockchip/phy-rockchip-pcie.c           | 124 ++++++++++++++++++---
>  5 files changed, 245 insertions(+), 42 deletions(-)
> 
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
