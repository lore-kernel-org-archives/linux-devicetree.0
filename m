From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/5] usb: dwc3: add phyif_utmi_quirk
Date: Thu, 30 Jun 2016 21:35:52 -0500
Message-ID: <20160701023552.GA26314@rob-hp-laptop>
References: <1467285176-25222-1-git-send-email-william.wu@rock-chips.com>
 <1467285176-25222-4-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467285176-25222-4-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 30, 2016 at 07:12:54PM +0800, William Wu wrote:
> Add a quirk to configure the core to support the
> UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
> interface is hardware property, and it's platform
> dependent. Normall, the PHYIf can be configured
> during coreconsultant. But for some specific usb
> cores(e.g. rk3399 soc dwc3), the default PHYIf
> configuration value is fault, so we need to
> reconfigure it by software.
> 
> And refer to the dwc3 databook, the GUSB2PHYCFG.USBTRDTIM
> must be set to the corresponding value according to
> the UTMI+ PHY interface.
> 
> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Changes in v5:
> - None
> 
> Changes in v4:
> - rebase on top of balbi testing/next, remove pdata (balbi)
> 
> Changes in v3:
> - None
> 
> Changes in v2:
> - add a quirk for phyif_utmi (balbi)
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt |  4 ++++
>  drivers/usb/dwc3/core.c                        | 19 +++++++++++++++++++
>  drivers/usb/dwc3/core.h                        | 12 ++++++++++++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 1ada121..34d13a5 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -42,6 +42,10 @@ Optional properties:
>   - snps,dis_u2_freeclk_exists_quirk: when set, clear the u2_freeclk_exists
>  			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
>  			a free-running PHY clock.
> + - snps,phyif_utmi_quirk: when set core will set phyif UTMI+ interface.

This isn't really what I'd call a quirk.

> + - snps,phyif_utmi: the value to configure the core to support a UTMI+ PHY
> +			with an 8- or 16-bit interface. Value 0 select 8-bit
> +			interface, value 1 select 16-bit interface.

These seem like they should be standard properties for setting the phy 
type/mode. I think we already have something defined in fact.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
