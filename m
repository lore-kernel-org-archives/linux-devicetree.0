From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] ARM: sunxi: dt: list all pinctrl compatible strings
Date: Wed, 23 Apr 2014 09:20:16 -0500
Message-ID: <CAL_JsqLcTk4yUc9geDHNwxcELo=6JKTHy-6PoHNa2BpYmc3VXQ@mail.gmail.com>
References: <1398173886-9376-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1398173886-9376-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 22, 2014 at 8:38 AM, Boris BREZILLON
<boris.brezillon@free-electrons.com> wrote:
> List all sunxi pinctrl compatible strings in order to be able to grep for
> those values.

If you were fixing this to please checkpatch.pl, that issue has been
fixed in checkpatch. I think it is only in linux-next ATM.

Rob

>
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> ---
>  .../devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt      | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> index dff0e5f..d8d0656 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> @@ -6,8 +6,13 @@ the first two functions being GPIO in and out. The configuration on
>  the pins includes drive strength and pull-up.
>
>  Required properties:
> -- compatible: "allwinner,<soc>-pinctrl". Supported SoCs for now are:
> -  sun5i-a13.
> +- compatible: Should be one of the followings (depending on you SoC):
> +  "allwinner,sun4i-a10-pinctrl"
> +  "allwinner,sun5i-a10s-pinctrl"
> +  "allwinner,sun5i-a13-pinctrl"
> +  "allwinner,sun6i-a31-pinctrl"
> +  "allwinner,sun6i-a31-r-pinctrl"
> +  "allwinner,sun7i-a20-pinctrl"
>  - reg: Should contain the register physical address and length for the
>    pin controller.
>
> --
> 1.8.3.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
