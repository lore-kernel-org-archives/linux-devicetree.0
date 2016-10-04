From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 6/9] dt-bindings: pinctrl: Deprecate sunxi pinctrl bindings
Date: Tue, 4 Oct 2016 10:32:12 +0800
Message-ID: <CAGb2v67wk_DANTyzaxTM6Stgh-u2kZXn_kjb0vbWDYUd-DUxGA@mail.gmail.com>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
 <fad5a977d8ecdd43b37d7028b1bc32d8667b65a2.1475489558.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fad5a977d8ecdd43b37d7028b1bc32d8667b65a2.1475489558.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 3, 2016 at 6:21 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The generic pin configuration and multiplexing should be preferred now,
> even though we still support the old one.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 5 +++++
>  1 file changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> index 69617220c5d6..e8b7cf64fdf1 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> @@ -36,6 +36,11 @@ pins it needs, and how they should be configured, with regard to muxer
>  configuration, drive strength and pullups. If one of these options is
>  not set, its actual value will be unspecified.
>
> +This driver supports the generic pin multiplexing and configuration
> +bindings.

Should we list which options are supported? We don't support them all.

ChenYu

> +
> +*** Deprecated pin configuration and multiplexing binding
> +
>  Required subnode-properties:
>
>  - allwinner,pins: List of strings containing the pin name.
> --
> git-series 0.8.10
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
