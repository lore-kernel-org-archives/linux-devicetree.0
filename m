From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 01/12] ARM: dts: STi: Fix bindings notation
Date: Mon, 12 Feb 2018 09:19:35 -0600
Message-ID: <CABGGiswMN1-CQi-guB5y5YFNLhKH3z58b_skxb_q+ZMm7+n1Nw@mail.gmail.com>
References: <1518446590-16800-1-git-send-email-patrice.chotard@st.com> <1518446590-16800-2-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518446590-16800-2-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 12, 2018 at 8:42 AM,  <patrice.chotard-qxv4g6HH51o@public.gmane.org> wrote:
> From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
>
> Remove leading 0x and 0s from bindings notation
> Add missing unit-address and remove some which are useless.
>
> This allows to fix several warnings like :
>
> Warning (unit_address_vs_reg): Node XXXX has a reg or ranges property, but no unit name
> Warning (simple_bus_reg): Node XXXX simple-bus unit address format error, expected "123456"
> Warning (unit_address_vs_reg): Node XXXX has a unit name, but no reg property
>
> Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
> ---

[...]

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> index a29090077fdf..53c6888d1fc0 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -45,7 +45,7 @@
>         };
>
>         soc {
> -               pin-controller-sbc {
> +               pin-controller-sbc@961f080 {

While you're here changing the node name, these all should be "pinctrl@..."

With that,

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
