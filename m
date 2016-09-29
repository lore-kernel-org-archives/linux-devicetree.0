From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 2/8] pinctrl: aspeed-g5: Fix names of GPID2 pins
Date: Thu, 29 Sep 2016 10:24:13 +0930
Message-ID: <CACPK8XchVHEn9cJKwkQWTDO+M2Luvc1Vd2K9+M1+umbsPcexqw@mail.gmail.com>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <69eda17c16684f4212a9f3e64d9587abfcc7ae74.1474986045.git-series.andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <69eda17c16684f4212a9f3e64d9587abfcc7ae74.1474986045.git-series.andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
> Fixes simple typos in the initial commit. There is no behavioural
> change.
>
> Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
> Reported-by: Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

Reviewed-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index e1ab864e1a7f..14639834a5eb 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -151,21 +151,21 @@ FUNC_GROUP_DECL(GPID0, F19, E21);
>
>  #define GPID2_DESC      SIG_DESC_SET(SCU8C, 9)
>
> -#define D20 26
> +#define F20 26
>  SIG_EXPR_LIST_DECL_SINGLE(SD2DAT0, SD2, SD2_DESC);
>  SIG_EXPR_DECL(GPID2IN, GPID2, GPID2_DESC);
>  SIG_EXPR_DECL(GPID2IN, GPID, GPID_DESC);
>  SIG_EXPR_LIST_DECL_DUAL(GPID2IN, GPID2, GPID);
> -MS_PIN_DECL(D20, GPIOD2, SD2DAT0, GPID2IN);
> +MS_PIN_DECL(F20, GPIOD2, SD2DAT0, GPID2IN);
>
> -#define D21 27
> +#define D20 27
>  SIG_EXPR_LIST_DECL_SINGLE(SD2DAT1, SD2, SD2_DESC);
>  SIG_EXPR_DECL(GPID2OUT, GPID2, GPID2_DESC);
>  SIG_EXPR_DECL(GPID2OUT, GPID, GPID_DESC);
>  SIG_EXPR_LIST_DECL_DUAL(GPID2OUT, GPID2, GPID);
> -MS_PIN_DECL(D21, GPIOD3, SD2DAT1, GPID2OUT);
> +MS_PIN_DECL(D20, GPIOD3, SD2DAT1, GPID2OUT);
>
> -FUNC_GROUP_DECL(GPID2, D20, D21);
> +FUNC_GROUP_DECL(GPID2, F20, D20);
>
>  #define GPIE_DESC      SIG_DESC_SET(HW_STRAP1, 21)
>  #define GPIE0_DESC     SIG_DESC_SET(SCU8C, 12)
> @@ -614,7 +614,6 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
>         ASPEED_PINCTRL_PIN(D10),
>         ASPEED_PINCTRL_PIN(D2),
>         ASPEED_PINCTRL_PIN(D20),
> -       ASPEED_PINCTRL_PIN(D21),
>         ASPEED_PINCTRL_PIN(D4),
>         ASPEED_PINCTRL_PIN(D5),
>         ASPEED_PINCTRL_PIN(D6),
> @@ -630,6 +629,7 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
>         ASPEED_PINCTRL_PIN(E7),
>         ASPEED_PINCTRL_PIN(E9),
>         ASPEED_PINCTRL_PIN(F19),
> +       ASPEED_PINCTRL_PIN(F20),
>         ASPEED_PINCTRL_PIN(F9),
>         ASPEED_PINCTRL_PIN(H20),
>         ASPEED_PINCTRL_PIN(L1),
> --
> git-series 0.8.10
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
