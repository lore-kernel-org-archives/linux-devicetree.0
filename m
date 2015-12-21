From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: dts: sun4i: Add touchscreen node
 to inet9f-rev03 tablet dts file
Date: Mon, 21 Dec 2015 13:57:51 +0800
Message-ID: <CAGb2v67tBGSZTwVk4uQ97tqah3x83xFEPJn=rM-dBV9xgyFMAw@mail.gmail.com>
References: <1450611782-9494-1-git-send-email-hdegoede@redhat.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB5VJ32ZQKGQEWZ3T7JI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1450611782-9494-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 20, 2015 at 7:42 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Add a node describing the focaltech ft5406ee8 touchscreen found on
> inet-9f-rev03 / qware qw tb-g100 tablets.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts b/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
> index ca49b0d..d39067e 100644
> --- a/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
> +++ b/arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts
> @@ -253,6 +253,16 @@
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2c2_pins_a>;
>         status = "okay";
> +
> +       ft5406ee8: touchscreen@38 {
> +               compatible = "edt,edt-ft5406";
> +               reg = <0x38>;
> +               interrupt-parent = <&pio>;
> +               interrupts = <7 21 IRQ_TYPE_EDGE_FALLING>;
> +               pinctrl-names = "default";

Name only and no references?

ChenYu

> +               touchscreen-size-x = <800>;
> +               touchscreen-size-y = <480>;
> +       };
>  };
>
>  &lradc {
> --
> 2.5.0
>
