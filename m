From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add usb-phy property to the
 jz4740-musb node
Date: Sun, 31 Mar 2019 01:41:15 -0500
Message-ID: <5ca0610d.1c69fb81.44d14.2fff@mx.google.com>
References: <20190321150956.6629-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190321150956.6629-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Bin Liu <b-liu@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2019 at 04:09:54PM +0100, Paul Cercueil wrote:
> Add a required 'usb-phy' property, to obtain a phandle to the USB PHY
> from devicetree.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt b/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
> index 620355cee63f..23213779f193 100644
> --- a/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
> +++ b/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
> @@ -8,9 +8,15 @@ Required properties:
>  - interrupt-names: must be "mc"
>  - clocks: phandle to the "udc" clock
>  - clock-names: must be "udc"
> +- usb-phy: phandle to the USB PHY

'phys' is the standard property name now.

>  
>  Example:
>  
> +usb_phy: usb-phy@0 {
> +	compatible = "usb-nop-xceiv";
> +	#phy-cells = <0>;
> +};
> +
>  udc: usb@13040000 {
>  	compatible = "ingenic,jz4740-musb";
>  	reg = <0x13040000 0x10000>;
> @@ -21,4 +27,6 @@ udc: usb@13040000 {
>  
>  	clocks = <&cgu JZ4740_CLK_UDC>;
>  	clock-names = "udc";
> +
> +	usb-phy = <&usb_phy>;
>  };
> -- 
> 2.11.0
> 
