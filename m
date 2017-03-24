From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v4 3/8] phy: sun4i-usb: add PHYCTL offset
 for H3 SoC
Date: Fri, 24 Mar 2017 11:04:58 +0800
Message-ID: <CAGb2v65NHgDDPGChR4rg28NS1tuj2RZ9ERrQz2cSa_haZLypXA@mail.gmail.com>
References: <20170319161951.55834-1-icenowy@aosc.xyz> <20170319161951.55834-4-icenowy@aosc.xyz>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB44Z2LDAKGQE5ZB3W2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170319161951.55834-4-icenowy-ymACFijhrKM@public.gmane.org>
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
> The config structure of H3 in phy-sun4i-usb driver have the PHYCTL
> register offset missing.
>
> Add it. Because it's a SoC after A33, its PHYCTL offset should be 0x10.

You are implying that all SoCs after A33 have PHYCTL at 0x10.

This is not true. As the A83T, which was released after the A33, has
PHYCTL at the old offset.

Just state that H3 has PHYCTL at 0x10.

ChenYu

> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
> New patch in v4.
>
>  drivers/phy/phy-sun4i-usb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
> index 62b4d25448c6..a650f283f6ff 100644
> --- a/drivers/phy/phy-sun4i-usb.c
> +++ b/drivers/phy/phy-sun4i-usb.c
> @@ -821,6 +821,7 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
>         .num_phys = 4,
>         .type = sun8i_h3_phy,
>         .disc_thresh = 3,
> +       .phyctl_offset = REG_PHYCTL_A33,
>         .dedicated_clocks = true,
>         .enable_pmu_unk1 = true,
>  };
> --
> 2.12.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
