From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 10/14] ARM: dts: sun8i: Add sy8106a
 regulator to Orange Pi PC
Date: Fri, 24 Jun 2016 17:14:03 +0800
Message-ID: <CAGb2v67UH8d5CiH9OkeJmVjXhPEhXursppEgh65QRuTpXC0ZPg@mail.gmail.com>
References: <20160623192104.18720-1-megous@megous.com> <20160623192104.18720-11-megous@megous.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB5PTWO5QKGQE52I75JI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160623192104.18720-11-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2016 at 3:21 AM,  <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> Add sy8106a regulator to r_twi bus on Orange Pi PC. This
> regulator controls the CPUX voltage.
>
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> index e5991da..7e04017 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> @@ -92,6 +92,16 @@
>
>  &r_twi {
>         status = "okay";
> +
> +       vdd_cpu: regulator@65 {
> +               compatible = "sy8106a";
> +               reg = <0x65>;
> +               regulator-min-microvolt = <1000000>;
> +               regulator-max-microvolt = <1400000>;
> +               regulator-ramp-delay = <200>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };

This should be merged with the previous "enable r_twi" patch.

ChenYu

>  };
>
>  &ehci1 {
> --
> 2.9.0
>
