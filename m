From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/4] PCI: rockchip: Move PCIE_WAKE handling into
 rockchip pcie driver
Date: Thu, 24 Aug 2017 11:55:05 -0500
Message-ID: <20170824165505.GM31858@bhelgaas-glaptop.roam.corp.google.com>
References: <20170822031934.8675-1-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170822031934.8675-1-jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 22, 2017 at 11:19:30AM +0800, Jeffy Chen wrote:
> 
> Currently we are handling pcie wake in mrvl wifi driver. But Brian
> suggests to move it into rockchip pcie driver.
> 
> Tested on my chromebook bob(with cros 4.4 kernel and mrvl wifi).
> 
> 
> Changes in v4:
> Rebase on newest for-next branch, also fix error handling by:
> 1e7f570a1b86 PCI: rockchip: Idle inactive PHY(s)
> 
> Changes in v3:
> Fix error handling
> 
> Changes in v2:
> Use dev_pm_set_dedicated_wake_irq
>         -- Suggested by Brian Norris <briannorris-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>
> 
> Jeffy Chen (4):
>   PCI: rockchip: Fix error handlings
>   PCI: rockchip: Add support for pcie wake irq
>   dt-bindings: PCI: rockchip: Add support for pcie wake irq
>   arm64: dts: rockchip: Handle pcie wake in pcie driver for Gru
> 
>  .../devicetree/bindings/pci/rockchip-pcie.txt      |  20 ++-
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |  15 +-
>  drivers/pci/host/pcie-rockchip.c                   | 179 ++++++++++++---------
>  3 files changed, 126 insertions(+), 88 deletions(-)

Looking for acks from Shawn and Rob...

And I'm not sure about the DT wake IRQ description.  That seems like it
could potentially be generic than this Rockchip-specific proposal.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
