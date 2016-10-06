From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4] PCI: rockchip: Support property to specify the link
 capability
Date: Thu, 6 Oct 2016 14:38:00 -0700
Message-ID: <20161006213800.GA2347@localhost>
References: <1475743800-1036-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1475743800-1036-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 06, 2016 at 04:50:00PM +0800, Shawn Lin wrote:
> From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> rk3399 supports PCIe 2.x link speeds marginally at best, and on some
> boards, the link won't train at 5 GT/s at all. Rather than sacrifice 500
> ms waiting for training that will never happen, let's add a property
> from devicetree to specify link capability.
> 
> Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> ---
> 
> Changes in v4:
> - define link_gen as u32
> - elaborate more for rockchip,max-link-speed on doc
> 
> Changes in v3:
> - Cast a warning for invalid max link speed and use gen1 for it.
>   That looks better than v2. (Suggested by Brian)
> 
> Changes in v2:
> - rename the property to rockchip,max-link-speed according to
>   Bjorn's recommendation and take some bits from imx6q-pcie to
>   make this requirement more consisent.
> 
>  .../devicetree/bindings/pci/rockchip-pcie.txt      |  4 ++
>  drivers/pci/host/pcie-rockchip.c                   | 63 ++++++++++++++--------
>  2 files changed, 44 insertions(+), 23 deletions(-)

Not sure if it means anything much, since I wrote half of this, but:

Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
