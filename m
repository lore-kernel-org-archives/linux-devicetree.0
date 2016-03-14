From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] regulator: axp20x: Fix axp209 ldo4 ranges
Date: Mon, 14 Mar 2016 14:48:48 +0800
Message-ID: <CAGb2v67RGWn6-bgDXYL37RDvR+MqJRKNtVuqE1p9eLGBqxrgJg@mail.gmail.com>
References: <1457792401-28337-1-git-send-email-hdegoede@redhat.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZ55TG3QKGQEZ3ZAAEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1457792401-28337-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 12, 2016 at 10:20 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> The axp209 ldo4 regulator has a hole at (skips) 2600 mV and 2900 mV, fix
> its range table to match.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Fixes: 13d57e64352a ("regulator: axp20x: Use linear voltage ranges for
AXP20X LDO4")

then

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

> ---
>  drivers/regulator/axp20x-regulator.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
> index 4250b1b..500d162 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -157,7 +157,9 @@ static struct regulator_ops axp20x_ops_sw = {
>  static const struct regulator_linear_range axp20x_ldo4_ranges[] = {
>         REGULATOR_LINEAR_RANGE(1250000, 0x0, 0x0, 0),
>         REGULATOR_LINEAR_RANGE(1300000, 0x1, 0x8, 100000),
> -       REGULATOR_LINEAR_RANGE(2500000, 0x9, 0xf, 100000),
> +       REGULATOR_LINEAR_RANGE(2500000, 0x9, 0x9, 0),
> +       REGULATOR_LINEAR_RANGE(2700000, 0xa, 0xb, 100000),
> +       REGULATOR_LINEAR_RANGE(3000000, 0xc, 0xf, 100000),
>  };
>
>  static const struct regulator_desc axp20x_regulators[] = {
> --
> 2.7.2
>
