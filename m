From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt-binding: net: wireless: add bcm43430-fmac
Date: Wed, 30 Aug 2017 10:28:20 +0800
Message-ID: <CAGb2v66=JvS9wHkUNBwd+vHwx4NAQsaWyhx1OyEokSZizo+7-g@mail.gmail.com>
References: <20170829214309.34466-1-antony@phenome.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170829214309.34466-1-antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Aug 30, 2017 at 5:43 AM, Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org> wrote:
> Add device tree binding documentation for Broadcom BCM43430
> AMPAK AP6212A has this chip.
>
> e.g
> compatible = "brcm,bcm43430-fmac";
>
> NanoPi NEO Plus2 has an AMPAK AP6212A WiFi module
> with BCM43430 rev=1 inside.
> brcmf_chip_recognition found AXI chip: BCM43430, rev=1
> brcmf_ops_sdio_probe sdio vendor ID: 0x02d0
> brcmf_ops_sdio_probe sdio device ID: 0xa9a6
>
> Signed-off-by: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  NanoPi Neo Plus2 Kernel DT propsed patch
>  https://patchwork.kernel.org/patch/9925387/
>
> diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> index 590f622..9107e1a 100644
> --- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> @@ -6,7 +6,9 @@ connects the device to the system.
>
>  Required properties:
>
> - - compatible : Should be "brcm,bcm4329-fmac".
> + - compatible : should be one of the following:
> +       * "brcm,bcm4329-fmac"
> +       * "brcm,bcm43430-fmac"

You updated the bindings, but not the driver. So it's not actually
going to work. More specifically, OOB interrupts won't work.

IIRC, The compatible string for this particular case, as it was
originally proposed, only serves as a placeholder for the driver
to check against. None of the instances in sunxi device trees
match the actual chip model. Actual model matching is done
through SDIO, as you've already seen.

ChenYu


>
>  Optional properties:
>   - brcm,drive-strength : drive strength used for SDIO pins on device in mA
> --
> 2.9.3
>
