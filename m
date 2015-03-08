From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: dts: sun7i: Add OOB irq support to
 boards with broadcom sdio wifi
Date: Sun, 8 Mar 2015 10:40:46 +0800
Message-ID: <CAGb2v65sxMxfk3yy_ACZRXMz=wX1J0vZy8-n2UNT+T1BvMn1vw@mail.gmail.com>
References: <1425754884-7875-1-git-send-email-hdegoede@redhat.com> <1425754884-7875-6-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBRXN52TQKGQE5M33SLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1425754884-7875-6-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Mar 8, 2015 at 3:01 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 11 +++++++++++
>  arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts  | 11 +++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> index 0c219a4..8111b0c 100644
> --- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> @@ -167,12 +167,23 @@
>  };
>
>  &mmc3 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc3_pins_a>;
>         vmmc-supply = <&reg_vmmc3>;
>         bus-width = <4>;
>         non-removable;
>         status = "okay";
> +
> +       brcmf: bcrmf@1 {
> +               reg = <1>;
> +               compatible = "brcm,bcm4329-fmac";
> +               interrupt-parent = <&pio>;
> +               interrupts = <10 8>; /* PH10 / EINT10 */
                                   ^ IRQ_TYPE_LEVEL_LOW?

> +               interrupt-names = "host-wake";
> +       };
>  };
>
>  &mmc3_pins_a {
> diff --git a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
> index baee563..4a8defd 100644
> --- a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
> @@ -164,12 +164,23 @@
>  };
>
>  &mmc3 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc3_pins_a>;
>         vmmc-supply = <&reg_vmmc3>;
>         bus-width = <4>;
>         non-removable;
>         status = "okay";
> +
> +       brcmf: bcrmf@1 {
> +               reg = <1>;
> +               compatible = "brcm,bcm4329-fmac";
> +               interrupt-parent = <&pio>;
> +               interrupts = <10 8>; /* PH10 / EINT10 */

Same here.

ChenYu

> +               interrupt-names = "host-wake";
> +       };
>  };
>
>  &mmc3_pins_a {
