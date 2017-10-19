From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v2 0/5] Allwinner R40 USB host support (DT part)
Date: Thu, 19 Oct 2017 15:42:19 +0800
Message-ID: <CAGb2v67CBtbj0gH6WV-B0hKj6TsvofeRjUk2+VkfM40bjekVkA@mail.gmail.com>
References: <20171018130628.11298-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171018130628.11298-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 18, 2017 at 9:06 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> This patchset adds support for the USB host ports on Allwiner R40, and
> enable them on Banana Pi M2 Ultra and Berry boards.
>
> The first patch adds USB PHY and EHCI/OHCI nodes to the R40 DTSI.
>
> The second and third patch adds 5V regulator for the two boards, and
> the fourth and fifth patch finally adds USB host ports support.
>
> Icenowy Zheng (5):
>   ARM: sun8i: r40: add USB host port nodes for R40
>   ARM: sun8i: r40: add 5V regulator for Banana Pi M2 Ultra
>   ARM: sun8i: v40: add 5V regulator for Banana Pi M2 Berry
>   ARM: sun8i: r40: enable USB host for Banana Pi M2 Ultra

For the four patches,

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

>   ARM: sun8i: v40: enable USB host ports for Banana Pi M2 Berry

See my comments on OHCI and USB hub for the last patch.

ChenYu

>
>  arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 31 ++++++++++
>  arch/arm/boot/dts/sun8i-r40.dtsi                  | 72 +++++++++++++++++++++++
>  arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 22 +++++++
>  3 files changed, 125 insertions(+)
>
> --
> 2.13.6
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
