From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/2] mfd: axp20x: Add support for dts property "xpowers,master-mode"
Date: Tue, 21 Feb 2017 11:21:54 +0800
Message-ID: <CAGb2v66nu3rYnNPwcYQww7pA172csrc77ti=2S4+9r8T2aMtYQ@mail.gmail.com>
References: <cover.1487428238.git.rask@formelder.dk> <10a2231445e8ccbb83d54bb84d91b4d61b4d642f.1487428239.git.rask@formelder.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10a2231445e8ccbb83d54bb84d91b4d61b4d642f.1487428239.git.rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 19, 2017 at 4:11 AM, Rask Ingemann Lambertsen
<rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org> wrote:
> commit b101829a029a ("mfd: axp20x: Fix AXP806 access errors on cold boot")
> was intended to fix the case where a board uses an AXP806 in slave mode,
> but the boot loader leaves it in master mode for lack of AXP806 support.
> But now the driver breaks on boards where the PMIC is operating in master
> mode. This patch lets the driver use the new device tree property
> "xpowers,master-mode" to set the correct operating mode for the board.
>
> Fixes: b101829a029a ("mfd: axp20x: Fix AXP806 access errors on cold boot")

Same comment as the previous patch. You are fixing or adding something that
we should've had from the beginning.

ChenYu

> Signed-off-by: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
> ---
>  drivers/mfd/axp20x.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 25115fe..0512900 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -31,6 +31,7 @@
>
>  #define AXP20X_OFF     0x80
>
> +#define AXP806_REG_ADDR_EXT_ADDR_MASTER_MODE   0
>  #define AXP806_REG_ADDR_EXT_ADDR_SLAVE_MODE    BIT(4)
>
>  static const char * const axp20x_model_names[] = {
> @@ -877,15 +878,19 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
>          * the these device addressing bits (in the upper 4 bits of the
>          * registers) match.
>          *
> -        * Since we only support an AXP806 chained to an AXP809 in slave
> -        * mode, and there isn't any existing hardware which uses AXP806
> -        * in master mode, or has 2 AXP806s in the same system, we can
> -        * just program the register address extension to the slave mode
> -        * address.
> +        * By default we support an AXP806 chained to an AXP809 in slave
> +        * mode. Boards which use an AXP806 in master mode can set the
> +        * property "x-powers,master-mode" to override the default.
>          */
> -       if (axp20x->variant == AXP806_ID)
> -               regmap_write(axp20x->regmap, AXP806_REG_ADDR_EXT,
> -                            AXP806_REG_ADDR_EXT_ADDR_SLAVE_MODE);
> +       if (axp20x->variant == AXP806_ID) {
> +               if (of_property_read_bool(axp20x->dev->of_node,
> +                                         "x-powers,master-mode"))
> +                       regmap_write(axp20x->regmap, AXP806_REG_ADDR_EXT,
> +                                    AXP806_REG_ADDR_EXT_ADDR_MASTER_MODE);
> +               else
> +                       regmap_write(axp20x->regmap, AXP806_REG_ADDR_EXT,
> +                                    AXP806_REG_ADDR_EXT_ADDR_SLAVE_MODE);
> +       }
>
>         ret = regmap_add_irq_chip(axp20x->regmap, axp20x->irq,
>                           IRQF_ONESHOT | IRQF_SHARED | axp20x->irq_flags,
> --
> 2.10.2
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
