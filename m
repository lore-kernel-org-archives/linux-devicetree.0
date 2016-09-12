From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: dwc3: Add ref clock period setting
Date: Mon, 12 Sep 2016 09:09:40 -0500
Message-ID: <20160912140940.GA12684@rob-hp-laptop>
References: <ae2c9b5683820c6456f91a2ef631efa2de0bec28.1472764828.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ae2c9b5683820c6456f91a2ef631efa2de0bec28.1472764828.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 01, 2016 at 02:32:30PM -0700, John Youn wrote:
> From: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> 
> Added ref_clk_per for writing to GUCTL.RefClkPer which
> sets the period of ref_clk in nano second.
> 
> Signed-off-by: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt |  2 ++
>  drivers/usb/dwc3/core.c                        | 21 +++++++++++++++++++++
>  drivers/usb/dwc3/core.h                        |  5 +++++
>  drivers/usb/dwc3/dwc3-pci.c                    |  1 +
>  4 files changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index e3e6983..aa54ba7 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -50,6 +50,8 @@ Optional properties:
>   - snps,hird-threshold: HIRD threshold
>   - snps,hsphy_interface: High-Speed PHY interface selection between "utmi" for
>     UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has value 3.
> + - snps,ref_clk_per: value for GUTCL.RefClkPer field that sets the period of
> +			ref_clk in nano seconds.

Use '-' rather than '_' and add a unit suffix (property-units.txt).

>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
>  	register for post-silicon frame length adjustment when the
>  	fladj_30mhz_sdbnd signal is invalid or incorrect.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
