From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/2] Documentation: bindings: add dt doc for Rockchip
 PCIe controller
Date: Tue, 5 Jul 2016 15:38:44 -0500
Message-ID: <20160705203844.GA25930@rob-hp-laptop>
References: <1467686561-25638-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467686561-25638-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 05, 2016 at 10:42:40AM +0800, Shawn Lin wrote:
> This patch adds a binding that describes the Rockchip PCIe controller
> found on Rockchip SoCs PCIe interface.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> ---
> 
> Changes in v5:
> - fix wrong example reported by Marc
> - add seperate section to describe the interrupt controller child
>   node
> 
> Changes in v4:
> - fix example of adding intermediate interrupt controller for pcie
>   legacy interrrupt
> 
> Changes in v3:
> - fix example dts code suggested by Rob and Marc
> - remove driver's behaviour of regulator
> 
> Changes in v2:
> - fix lots clk/reset stuff suggested by Heiko
> - remove msi-parent and add msi-map suggested by Marc
> - drop phy related stuff
> - some others minor fixes
> 
>  .../devicetree/bindings/pci/rockchip-pcie.txt      | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/rockchip-pcie.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
