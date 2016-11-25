From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Bindings for Rockchip serial flash
 controller
Date: Fri, 25 Nov 2016 14:30:01 +0100
Message-ID: <7fd2cdc0-2103-d254-c7b2-d2552a32a738@gmail.com>
References: <1479437945-27918-1-git-send-email-shawn.lin@rock-chips.com>
 <1479437945-27918-2-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479437945-27918-2-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/18/2016 03:59 AM, Shawn Lin wrote:
> Add binding document for the Rockchip serial flash controller.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> 
> Changes in v2: None
> 
>  .../devicetree/bindings/mtd/rockchip-sfc.txt       | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt b/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
> new file mode 100644
> index 0000000..28430ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
> @@ -0,0 +1,31 @@
> +Rockchip Serial Flash Controller
> +
> +Required properties:
> +- compatible : Should be
> +		"rockchip,rk1108-sfc", "rockchip,sfc" for ROCKCHIP RK1108.
> +- address-cells : Should be 1.
> +- size-cells : Should be 0.

Shouldn't these two props have a # prefix ? I'm not sure they should
even be part of this binding document at all.

> +- clocks: Must contain two entries for each entry in clock-names.
> +- clock-names: Shall be "sfc" for the transfer-clock, and "hsfc" for
> +		the peripheral clock.
> +- interrupts : Should contain the interrupt for the device.
> +- reg: Physical base address of the controller and length of memory mapped.
> +
> +Optional properties:
> +- rockchip,sfc-no-dma: Indicate the controller doesn't support dma transfer.

DMA should be in capital letters.

> +Example:
> +nor_flash: sfc@301c0000 {
> +	compatible = "rockchip,rk1108-sfc", "rockchip,sfc";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> +	clock-names = "sfc", "hsfc";
> +	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +	reg = <0x301c0000 0x1000>;
> +	spi-nor@0 {
> +		compatible = "jedec,spi-nor";
> +		spi-max-frequency = <12000000>;
> +		reg = <0>;
> +	};
> +};
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
