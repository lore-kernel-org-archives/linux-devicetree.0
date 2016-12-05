From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Bindings for Rockchip serial flash
 controller
Date: Mon, 5 Dec 2016 04:24:55 +0100
Message-ID: <40cb2739-f58d-2e35-5b87-6b46e93e422e@gmail.com>
References: <1480906577-38455-1-git-send-email-shawn.lin@rock-chips.com>
 <1480906577-38455-2-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480906577-38455-2-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/05/2016 03:56 AM, Shawn Lin wrote:
> Add binding document for the Rockchip serial flash controller.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> 
> Changes in v3:
> - rename sfc-no-dma to sfc-no-DMA
> 
> Changes in v2: None
> 
>  .../devicetree/bindings/mtd/rockchip-sfc.txt       | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt b/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
> new file mode 100644
> index 0000000..c6b4f58
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
> +- clocks: Must contain two entries for each entry in clock-names.
> +- clock-names: Shall be "sfc" for the transfer-clock, and "hsfc" for
> +		the peripheral clock.
> +- interrupts : Should contain the interrupt for the device.
> +- reg: Physical base address of the controller and length of memory mapped.
> +
> +Optional properties:

Uhhh, I apologize for the miscommunication.

> +- rockchip,sfc-no-DMA: Indicate the controller doesn't support dma transfer.
I didn't mean this   ^^^ DMA, that should be lowercase. I meant   ^^^
this one. The property should be lowercase, the description
should be uppercase.

> +
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
