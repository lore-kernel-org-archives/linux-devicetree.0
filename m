From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 08/12] regulator: axp20x-regulator: add
 support for AXP803
Date: Tue, 18 Apr 2017 20:07:26 +0800
Message-ID: <CAGb2v66whYhHmKwgjON36Gsoh_61G=vMwSH744t5Nt+ohdZ7pg@mail.gmail.com>
References: <20170417115747.7300-1-icenowy@aosc.io> <20170417115747.7300-9-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBFUD3DDQKGQEA5VCI6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170417115747.7300-9-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 17, 2017 at 7:57 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> AXP803 PMIC also have a series of regulators (DCDCs and LDOs)
> controllable via I2C/RSB bus.
>
> Add support for them.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v2:
> - Place AXP803 codes before AXP806/809 ones.
> - Fixed some errors in regulator description.
> - Reuse AXP803 DLDO2 range for AXP806 CLDO2 & AXP809 DLDO1.
>
>  drivers/regulator/axp20x-regulator.c | 153 ++++++++++++++++++++++++++++++-----
>  include/linux/mfd/axp20x.h           |  37 +++++++++
>  2 files changed, 168 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
> index 0b9d4e3e52c7..2ed15e4a7a82 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c

[...]

> @@ -492,20 +578,38 @@ static bool axp20x_is_polyphase_slave(struct axp20x_dev *axp20x, int id)
>  {
>         u32 reg = 0;
>
> -       /* Only AXP806 has poly-phase outputs */
> -       if (axp20x->variant != AXP806_ID)
> -               return false;
> +       /*
> +        * Currently in our supported AXP variants, only AXP806 and AXP803

Nit: mention them in ascending order.

Otherwise,

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
