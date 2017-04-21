From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: sun8i: a83t: Rename pinmux setting names
Date: Fri, 21 Apr 2017 11:30:06 +0800
Message-ID: <CAGb2v64s1vSVasHT_ABs9rKu-mWKi+uXZ74fvqkHDzp2kSkk=A@mail.gmail.com>
References: <20170418042205.27894-1-wens@csie.org> <20170418042205.27894-4-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBV7Z4XDQKGQE4UNVGVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170418042205.27894-4-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 18, 2017 at 12:22 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> The pinmux setting nodes all have an address element in their node
> names, however the pinctrl node does not have #address-cells.
>
> Rename the existing pinmux setting nodes and labels in sun8i-a83t.dtsi,
> dropping identifiers for functions that only have one possible setting,
> and using the pingroup name if the function is identically available on
> different pingroups.
>
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts |  2 +-
>  arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts       |  2 +-
>  arch/arm/boot/dts/sun8i-a83t.dtsi                      | 10 +++++-----
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
[...]
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index 82cb87f21b96..87b99338716b 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -174,7 +174,7 @@
>                         #interrupt-cells = <3>;
>                         #gpio-cells = <3>;
>
> -                       mmc0_pins_a: mmc0@0 {
> +                       mmc0_pins: mmc0_pins {
>                                 pins = "PF0", "PF1", "PF2",
>                                        "PF3", "PF4", "PF5";
>                                 function = "mmc0";
> @@ -182,13 +182,13 @@
>                                 bias-pull-up;
>                         };
>
> -                       uart0_pins_a: uart0@0 {
> -                               pins = "PF2", "PF4";
> +                       uart0_pb_pins: uart0_pb_pins {

Duh... Forgot to use hyphens instead of underscores in the node names.
I'll send a patch for you to squash in.

ChenYu

> +                               pins = "PB9", "PB10";
>                                 function = "uart0";
>                         };
>
> -                       uart0_pins_b: uart0@1 {
> -                               pins = "PB9", "PB10";
> +                       uart0_pf_pins: uart0_pf_pins {
> +                               pins = "PF2", "PF4";
>                                 function = "uart0";
>                         };
>                 };
> --
> 2.11.0
>
