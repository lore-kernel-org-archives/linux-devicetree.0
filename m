From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: Add usb_clk node for a23/a33
Date: Tue, 2 Jun 2015 10:01:01 +0800
Message-ID: <CAGb2v66C=a8SSL0miWYcGskymtex8PUoafzBoaCLgSXqHc6fyg@mail.gmail.com>
References: <1433183008-13086-1-git-send-email-hdegoede@redhat.com> <1433183008-13086-2-git-send-email-hdegoede@redhat.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB5U4WSVQKGQE22H6ELY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1433183008-13086-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 2, 2015 at 2:23 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Add an usb_clk node for a23/a33.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> index c73d1d1..44dd7155 100644
> --- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> @@ -248,6 +248,16 @@
>                                              "mmc2_output",
>                                              "mmc2_sample";
>                 };
> +
> +               usb_clk: clk@01c200cc {
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       compatible = "allwinner,sun8i-a23-usb-clk";
> +                       reg = <0x01c200cc 0x4>;
> +                       clocks = <&osc24M>;
> +                       clock-output-names = "usb_phy0", "usb_phy1", "hsic",
> +                                            "hsic_12m", "usb_ohci0";

Minor nitpicks:

"hsic_12m" should be "hsic_12M". And maybe add the "usb_" prefix
to the hsic clocks as well?

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>


P.S. There's a new linux-clk mailing list that these 2 patches should be
sent to as well.

> +               };
>         };
>
>         soc@01c00000 {
> --
> 2.4.2
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
