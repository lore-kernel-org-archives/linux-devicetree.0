From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 14/15] usb: dwc3: Add disabling of start_transfer failure
 quirk
Date: Mon, 8 Jan 2018 22:16:02 -0600
Message-ID: <20180109041602.f4tk5jynnno2xgvk@rob-hp-laptop>
References: <cover.1515182391.git.thinhn@synopsys.com>
 <3c63b5f97343d276049e1d59ef2371160004b137.1515182391.git.thinhn@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3c63b5f97343d276049e1d59ef2371160004b137.1515182391.git.thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 05, 2018 at 12:16:02PM -0800, Thinh Nguyen wrote:
> In DWC_usb31 version 1.70a-ea06 and prior needs a SW workaround for isoc
> START TRANSFER command failure. However, some affected versions may have
> RTL patches to fix this without a SW workaround. Add this quirk to
> disable the SW workaround when it is not needed.

I really think this one should be implied by compatible strings.

> Synopsys STAR 9001202023: Wrong microframe number for isochronous IN
> endpoints.
> 
> Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 02dde83d02fa..c03a3b363cde 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -15,6 +15,9 @@ Optional properties:
>   - phys: from the *Generic PHY* bindings
>   - phy-names: from the *Generic PHY* bindings; supported names are "usb2-phy"
>  	or "usb3-phy".
> + - snps,dis_start_transfer_quirk: when set, disable isoc START TRANSFER command
> +			failure SW work-around for DWC_usb31 version 1.70a-ea06
> +			and prior.
>   - snps,usb3_lpm_capable: determines if platform is USB3 LPM capable
>   - snps,disable_scramble_quirk: true when SW should disable data scrambling.
>  	Only really useful for FPGA builds.
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
