From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v4 2/8] phy: sun4i-usb: change PHYCTL
 register clearing code
Date: Fri, 24 Mar 2017 11:07:16 +0800
Message-ID: <CAGb2v67Y_EeNN9wzgeSS=ReaaJ9kN2tn449OrEQNG9tE1WOYDw@mail.gmail.com>
References: <20170319161951.55834-1-icenowy@aosc.xyz> <20170319161951.55834-3-icenowy@aosc.xyz>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB7E22LDAKGQENGDXDTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170319161951.55834-3-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 20, 2017 at 12:19 AM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> It seems that all SoCs after A33 (including A33) need the PHYCTL
> register to be cleared before writing to it. These SoCs all have another
> feature: PHYCTL register is at 0x10, not 0x04.

As mentioned in the other patch, the basis for this description is
wrong. Just state that, among all the currently supported SoCs, when
PHYCTL is at 0x10, the register must be cleared before writing to it.

This would match what the logic in your patch means. Please also
update the comment.

ChenYu

>
> Change PHYCTL register clearing code to judge whether clearing is needed
> based on the PHYCTL offset.
>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
> New patch in v4.
>
>  drivers/phy/phy-sun4i-usb.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
> index a21b5f24a340..62b4d25448c6 100644
> --- a/drivers/phy/phy-sun4i-usb.c
> +++ b/drivers/phy/phy-sun4i-usb.c
> @@ -188,10 +188,8 @@ static void sun4i_usb_phy_write(struct sun4i_usb_phy *phy, u32 addr, u32 data,
>
>         spin_lock_irqsave(&phy_data->reg_lock, flags);
>
> -       if (phy_data->cfg->type == sun8i_a33_phy ||
> -           phy_data->cfg->type == sun50i_a64_phy ||
> -           phy_data->cfg->type == sun8i_v3s_phy) {
> -               /* A33 or A64 needs us to set phyctl to 0 explicitly */
> +       if (phy_data->cfg->phyctl_offset == REG_PHYCTL_A33) {
> +               /* SoCs newer than A33 need us to set phyctl to 0 explicitly */
>                 writel(0, phyctl);
>         }
>
> --
> 2.12.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
