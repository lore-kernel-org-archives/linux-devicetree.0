From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: at91/dt: fix sama5d3 ohci hclk clock reference
Date: Fri, 7 Feb 2014 16:46:27 +0100
Message-ID: <52F4FFD3.3070602@atmel.com>
References: <1389885934-26119-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389885934-26119-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 16/01/2014 16:25, Boris BREZILLON :
> The hclk clock of the ohci node is referencing udphs_clk instead of
> uhphs_clk.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Added to at91-3.14-fixes

Thanks,

> ---
>  arch/arm/boot/dts/sama5d3.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
> index e398e5d..31356e2 100644
> --- a/arch/arm/boot/dts/sama5d3.dtsi
> +++ b/arch/arm/boot/dts/sama5d3.dtsi
> @@ -1195,7 +1195,7 @@
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00600000 0x100000>;
>  			interrupts = <32 IRQ_TYPE_LEVEL_HIGH 2>;
> -			clocks = <&usb>, <&uhphs_clk>, <&udphs_clk>,
> +			clocks = <&usb>, <&uhphs_clk>, <&uhphs_clk>,
>  				 <&uhpck>;
>  			clock-names = "usb_clk", "ohci_clk", "hclk", "uhpck";
>  			status = "disabled";
> 


-- 
Nicolas Ferre
