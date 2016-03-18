From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: 74x164: add dt support for nxp's 74x594
Date: Fri, 18 Mar 2016 15:26:36 -0500
Message-ID: <20160318202636.GA8849@rob-hp-laptop>
References: <1457998330-8070-1-git-send-email-nicolassaenzj@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457998330-8070-1-git-send-email-nicolassaenzj@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 14, 2016 at 11:32:10PM +0000, Nicolas Saenz Julienne wrote:
> The chip is also an 8 bit shift register which works out of the box as a GPO
> expander with this patch
> 
> Signed-off-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-74x164.txt | 4 +++-
>  drivers/gpio/gpio-74x164.c                             | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
> index cc26080..ce1b223 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
> @@ -1,7 +1,9 @@
>  * Generic 8-bits shift register GPIO driver
>  
>  Required properties:
> -- compatible : Should be "fairchild,74hc595"
> +- compatible: Should contain one of the following:
> +    "fairchild,74hc595"
> +    "nxp,74lvc594"
>  - reg : chip select number
>  - gpio-controller : Marks the device node as a gpio controller.
>  - #gpio-cells : Should be two.  The first cell is the pin number and
> diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
> index c81224f..ebd0d1a 100644
> --- a/drivers/gpio/gpio-74x164.c
> +++ b/drivers/gpio/gpio-74x164.c
> @@ -153,6 +153,7 @@ static int gen_74x164_remove(struct spi_device *spi)
>  
>  static const struct of_device_id gen_74x164_dt_ids[] = {
>  	{ .compatible = "fairchild,74hc595" },
> +	{ .compatible = "nxp,74lvc594" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, gen_74x164_dt_ids);
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
