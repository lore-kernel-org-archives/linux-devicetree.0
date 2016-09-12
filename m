From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: Added a property to set GFLADJ register
Date: Mon, 12 Sep 2016 10:30:18 -0500
Message-ID: <20160912153018.GA14561@rob-hp-laptop>
References: <ae2c9b5683820c6456f91a2ef631efa2de0bec28.1472764828.git.johnyoun@synopsys.com>
 <649b249e86e901b5bd2cf4cbe9db96d04a45f30d.1472764828.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <649b249e86e901b5bd2cf4cbe9db96d04a45f30d.1472764828.git.johnyoun@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <johnyoun@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Thinh Nguyen <thinhn@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 01, 2016 at 02:32:33PM -0700, John Youn wrote:
> From: Thinh Nguyen <thinhn@synopsys.com>
> 
> Added gfladj variable to control the core behavior with respect to
> SOF, ITP, and frame timer functionality.
> 
> Currently there is dwc->fladj that holds a single field in GFLADJ
> register (GFLADJ.GFLADJ_30MHZ). A new variable gfladj is added to
> dwc structure to allow setting of the entire GFLADJ register. If
> dwc->gfladj is set, then it has a higher priority than dwc->fladj
> when writing to the GFLADJ register.

I'm not a fan of magic register values for DT properties.

How many fields in this register that you will ever need to touch?

> Synopsys HW setup (HAPS DX and phy board) requires a preset to this
> register to improve interoperablitity. For example, the value for
> GFLADJ_REFCLK_LPM_SEL should be set to 0 with ref_clk period of 50.

This sounds like it should be handled in the driver. Is it a simple, 
constant correlation of ref_clk period to this value?

> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> Signed-off-by: John Youn <johnyoun@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>  drivers/usb/dwc3/core.c                        | 5 +++++
>  drivers/usb/dwc3/core.h                        | 1 +
>  drivers/usb/dwc3/dwc3-pci.c                    | 1 +
>  4 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index aa54ba7..cad4bf6 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -52,6 +52,8 @@ Optional properties:
>     UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has value 3.
>   - snps,ref_clk_per: value for GUTCL.RefClkPer field that sets the period of
>  			ref_clk in nano seconds.
> + - snps,gfladj: if set, overides the value in the GFLADJ register. Takes
> + 			precedence over snps,quirk-frame-length-adjustment.
>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field 
of GFLADJ
>  	register for post-silicon frame length adjustment when the
>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
