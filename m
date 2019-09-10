From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] reset: uniphier-glue: Add Pro5 USB3 support
Date: Tue, 10 Sep 2019 09:48:15 +0200
Message-ID: <1568101695.3062.1.camel@pengutronix.de>
References: <1568080527-1767-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568080527-1767-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Kunihiko,

On Tue, 2019-09-10 at 10:55 +0900, Kunihiko Hayashi wrote:
> Pro5 SoC has same scheme of USB3 reset as Pro4, so the data for Pro5 is
> equivalent to Pro4.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

If it is exactly the same, you could keep using the same compatible:

> ---
>  Documentation/devicetree/bindings/reset/uniphier-reset.txt | 5 +++--
>  drivers/reset/reset-uniphier-glue.c                        | 4 ++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/uniphier-reset.txt b/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> index ea00517..e320a8c 100644
> --- a/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> @@ -130,6 +130,7 @@ this layer. These clocks and resets should be described in each property.
>  Required properties:
>  - compatible: Should be
>      "socionext,uniphier-pro4-usb3-reset" - for Pro4 SoC USB3
> +    "socionext,uniphier-pro5-usb3-reset" - for Pro5 SoC USB3

+    "socionext,uniphier-pro5-usb3-reset", "socionext,uniphier-pro4-usb3-reset" - for Pro5 SoC USB3

[...]
> diff --git a/drivers/reset/reset-uniphier-glue.c b/drivers/reset/reset-uniphier-glue.c
> index a45923f..2b188b3bb 100644
> --- a/drivers/reset/reset-uniphier-glue.c
> +++ b/drivers/reset/reset-uniphier-glue.c
> @@ -141,6 +141,10 @@ static const struct of_device_id uniphier_glue_reset_match[] = {
>  		.data = &uniphier_pro4_data,
>  	},
>  	{
> +		.compatible = "socionext,uniphier-pro5-usb3-reset",
> +		.data = &uniphier_pro4_data,
> +	},
> +	{
>  		.compatible = "socionext,uniphier-pxs2-usb3-reset",
>  		.data = &uniphier_pxs2_data,
>  	},

And this change would not be necessary.

regards
Philipp
