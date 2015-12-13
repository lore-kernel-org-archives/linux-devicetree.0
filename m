From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/9] mfd: axp20x: Add AXP223 to list of
 supported PMICs in DT bindings
Date: Sun, 13 Dec 2015 03:46:07 +0200
Message-ID: <CAHp75VcdqOen1iTf5p8uQF=6hrNiQ62Ris5ysU-Z9kySbTySeg@mail.gmail.com>
References: <1448606610-32647-1-git-send-email-wens@csie.org>
	<1448606610-32647-2-git-send-email-wens@csie.org>
Reply-To: andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCT4VV5O2QKBBX43WOZQKGQERFY7XEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1448606610-32647-2-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 27, 2015 at 8:43 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> The AXP223 is a new PMIC commonly paired with Allwinner A23/A33 SoCs.
> It is functionally identical to AXP221; only the regulator default
> voltage/status and the external host interface are different.
>

I missed cover letter, but anyway, for now the entire series looks fine for me!
FWIW, Reviewed-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
> index a474359dd206..fd39fa54571b 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -5,11 +5,12 @@ axp152 (X-Powers)
>  axp202 (X-Powers)
>  axp209 (X-Powers)
>  axp221 (X-Powers)
> +axp223 (X-Powers)
>
>  Required properties:
>  - compatible: "x-powers,axp152", "x-powers,axp202", "x-powers,axp209",
> -             "x-powers,axp221"
> -- reg: The I2C slave address for the AXP chip
> +             "x-powers,axp221", "x-powers,axp223"
> +- reg: The I2C slave address or RSB hardware address for the AXP chip
>  - interrupt-parent: The parent interrupt controller
>  - interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
>  - interrupt-controller: The PMIC has its own internal IRQs
> @@ -51,7 +52,7 @@ LDO3          : LDO           : ldo3in-supply
>  LDO4           : LDO           : ldo24in-supply        : shared supply
>  LDO5           : LDO           : ldo5in-supply
>
> -AXP221 regulators, type, and corresponding input supply names:
> +AXP221/AXP223 regulators, type, and corresponding input supply names:
>
>  Regulator        Type            Supply Name             Notes
>  ---------        ----            -----------             -----
> --
> 2.6.2
>



-- 
With Best Regards,
Andy Shevchenko
