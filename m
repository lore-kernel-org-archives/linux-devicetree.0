Return-Path: <robherring2@gmail.com>
Date: Fri, 22 Feb 2019 18:32:46 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] Documentation: usb: dwc3: add power down clock scale
 property
Message-ID: <20190223003246.GA20964@bogus>
References: <1548152179-19472-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548152179-19472-1-git-send-email-jun.li@nxp.com>
To: Jun Li <jun.li@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "balbi@kernel.org" <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 22, 2019 at 10:37:17AM +0000, Jun Li wrote:
> The USB3 suspend_clk input replaces pipe3_rx_pclk as a clock
> source to a small part of the USB3 core that operates when the
> SS PHY is in its lowest power(P3) state, and therefore does
> not provide a clock. The power down scale specifies how many
> suspend_clk periods fit into a 16 KHz clock period, details
> can see DWC3 databook register GCTL.PWRDNSCALE.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 3e4c38b..d1c8b62 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -102,6 +102,12 @@ Optional properties:
>  			more than one value, which means undefined length INCR burst type
>  			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
>  
> + - snps,power-down-scale: Power down scale field specifies how many suspend_clk
> +			periods fit into a 16 Khz clock period. When performing
> +			the division, round up the remainder. Suspend clock is
> +			from 32kHz to 125MHz, means the value range is 2~8000.
> +			(details see DWC_usb3 databook register GCTL.PWRDNSCALE).
> +

Sounds like the suspend_clk should be provided as a clock input so you 
can calculate this value.

>   - in addition all properties from usb-xhci.txt from the current directory are
>     supported as well
>  
> -- 
> 2.7.4
> 
