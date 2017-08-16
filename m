From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RFC PATCH 2/3] dt-bindings: PCI: rockchip: Add support for pcie
 wake irq
Date: Wed, 16 Aug 2017 16:35:24 +0800
Message-ID: <35487e90-74f2-3a66-70d3-d0780b0b6e26@rock-chips.com>
References: <20170816075224.31734-1-jeffy.chen@rock-chips.com>
 <20170816075224.31734-3-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170816075224.31734-3-jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jeffy

On 2017/8/16 15:52, Jeffy Chen wrote:
> Add an optional interrupt for PCIE_WAKE pin.
> 
> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>   Documentation/devicetree/bindings/pci/rockchip-pcie.txt | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> index 1453a734c2f5..6ef9903567db 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> @@ -22,10 +22,13 @@ Required properties:
>   - phys: From PHY bindings: Phandle for the Generic PHY for PCIe.
>   - phy-names:  MUST be "pcie-phy".
>   - interrupts: Three interrupt entries must be specified.
> -- interrupt-names: Must include the following names
> -	- "sys"
> -	- "legacy"
> -	- "client"
> +- interrupt-names: Include the following names
> +	Required:
> +		- "sys"
> +		- "legacy"
> +		- "client"
> +	Optional:
> +		- "wake"

It would be better to introduce interrupts-extended and show a example
here. :)

>   - resets: Must contain seven entries for each entry in reset-names.
>   	   See ../reset/reset.txt for details.
>   - reset-names: Must include the following names
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
