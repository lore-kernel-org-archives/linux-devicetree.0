From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 1/6] pinctrl-aspeed-g5: Never set SCU90[6]
Date: Fri, 4 Nov 2016 09:29:32 +1030
Message-ID: <CACPK8Xcbv5VjE9deETV6zC4cPSfeBSgP96QYqV_ebAgtB9Jwtw@mail.gmail.com>
References: <1478097481-14895-1-git-send-email-andrew@aj.id.au> <1478097481-14895-2-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478097481-14895-2-git-send-email-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 3, 2016 at 1:07 AM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
> If a pin depending on bit 6 in SCU90 is requested for GPIO, the export
> will succeed but changes to the GPIO's value will not be accepted by the
> hardware. This is because the pinmux driver has misconfigured the SCU by
> writing 1 to the reserved bit.
>
> The description of SCU90[6] from the datasheet is 'Reserved, must keep
> at value =E2=80=9D0=E2=80=9D'. The fix is to switch pinmux from the bit-f=
lipping macro
> to explicitly configuring the .enable and .disable values to zero.
>
> The patch has been tested on an AST2500 EVB.
>
> Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
> Reported-by: Uma Yadlapati <yadlapat-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

Reviewed-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

And tested-by.

> This patch should be applied for 4.9.

In the future I think we should send fixes separately from the rest of
the series, so it's clear to Linus where we expect patches to end up.

Perhaps Linus can share his preference with us?

Cheers,

Joel


>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g5.c
> index c8c72e8259d3..87b46390b695 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -26,7 +26,7 @@
>
>  #define ASPEED_G5_NR_PINS 228
>
> -#define COND1          SIG_DESC_BIT(SCU90, 6, 0)
> +#define COND1          { SCU90, BIT(6), 0, 0 }
>  #define COND2          { SCU94, GENMASK(1, 0), 0, 0 }
>
>  #define B14 0
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
