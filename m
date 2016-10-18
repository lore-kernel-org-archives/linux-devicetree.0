From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 1/3] Documentation/devicetree: Add new property to
 specify the max link speed
Date: Tue, 18 Oct 2016 11:41:39 -0500
Message-ID: <20161018164139.z52uo7eda5xgwkzu@rob-hp-laptop>
References: <1476755110-22647-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476755110-22647-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 18, 2016 at 09:45:08AM +0800, Shawn Lin wrote:
> Some of the host drivers have the requirement of knowing whether the
> EP would never train at some link speed at all. For instance, on some
> boards, the link won't train at 5 GT/s but the host driver still sacrifice
> some cycle to wait for the resule of training at 5 GT/s as the host could
> actually support 5 GT/s. So we could parse this new property and make the
> host drivers be aware of these cases.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v8: None
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None

Humm, either you are respinning versions too quickly or failed to copy 
the DT list.

> 
>  Documentation/devicetree/bindings/pci/pci.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> 
> diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Documentation/devicetree/bindings/pci/pci.txt
> index 08dcfad..e7d97a3 100644
> --- a/Documentation/devicetree/bindings/pci/pci.txt
> +++ b/Documentation/devicetree/bindings/pci/pci.txt
> @@ -18,3 +18,9 @@ driver implementation may support the following properties:
>     host bridges in the system, otherwise potentially conflicting domain numbers
>     may be assigned to root buses behind different host bridges.  The domain
>     number for each host bridge in the system must be unique.
> +- max-link-speed:
> +   If present this property specifies PCI gen for link capability. The host drivers
> +   could add this as a strategy to avoid unnecessary operation for unsupported
> +   link speed, for instance, trying to do training for unsupported link speed, etc.
> +   Must be '4' for gen4, '3' for gen3, '2' for gen2, and '1' for gen1. Any other
> +   values are invalid.
> -- 
> 2.3.7
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
