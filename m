From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/4] mfd: axp20x: Add AXP209 GPIO driver to the mfd
Date: Tue, 9 Aug 2016 10:58:39 +0100
Message-ID: <20160809095839.GA5243@dell>
References: <20160720141139.25098-1-maxime.ripard@free-electrons.com>
 <20160720141139.25098-3-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160720141139.25098-3-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Jul 2016, Maxime Ripard wrote:

> Now that we have a GPIO driver for the AXP209, we can add it to our MFD.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mfd/axp20x.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index fd80b0981f0f..4b3e073c47b7 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -508,6 +508,9 @@ static const struct regmap_irq_chip axp809_regmap_irq_chip = {
>  
>  static struct mfd_cell axp20x_cells[] = {
>  	{
> +		.name		= "axp20x-gpio",
> +		.of_compatible	= "x-powers,axp209-gpio",
> +	}, {
>  		.name		= "axp20x-pek",
>  		.num_resources	= ARRAY_SIZE(axp20x_pek_resources),
>  		.resources	= axp20x_pek_resources,

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
