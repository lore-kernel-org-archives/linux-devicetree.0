From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 09/10] dts: versatile: add clock tree
Date: Fri, 23 May 2014 15:28:21 +0200
Message-ID: <CACRpkdaBdNo=Nkoe62j9ZUspWZx7+cuisHT9EHVKR5aEdRWgBg@mail.gmail.com>
References: <1400620176-7239-1-git-send-email-robherring2@gmail.com>
	<1400620176-7239-10-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400620176-7239-10-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 20, 2014 at 11:09 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> The versatile dts is missing any clock data. Add the clocks.
>
> It is not clear from the documentation where pclk comes from, so for
> now it is a dummy clock which is sufficient for things to work.

AFAICT (from experiments and measurements on some boards, during which
I destroyed some boards) that is actually just the 24MHz clock right off.

> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +       core-module@10000000 {
> +               compatible = "arm,core-module-versatile";
> +               reg = <0x10000000 0x200>;
> +
> +               osc24M: oscillator@24M {
> +                       #clock-cells = <0>;
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <24000000>;
> +               };

Please follow the naming convention from the Integrator DTS, I am
pretty sure this is a chrystal:

        /* 24 MHz chrystal on the core module */
        xtal24mhz: xtal24mhz@24M {
                #clock-cells = <0>;
                compatible = "fixed-clock";
                clock-frequency = <24000000>;
        };


> +               /* OSC1 on AB, OSC4 on PB */
> +               osc1: cm_aux_osc@24M {
> +                       #clock-cells = <0>;
> +                       compatible = "arm,versatile-cm-auxosc";
> +                       clocks = <&osc24M>;
> +               };

Name xtal, also: why is this inside the core module node?
You're explicitly saying it is on the PB (platform baseboard)
and *not* on the core module!

> +               /* The timer clock is the 24 MHz oscillator divided to 1MHz */
> +               timclk: timclk@1M {
> +                       #clock-cells = <0>;
> +                       compatible = "fixed-factor-clock";
> +                       clock-div = <24>;
> +                       clock-mult = <1>;
> +                       clocks = <&osc24M>;
> +               };
> +
> +               /* Actually hclk ? */
> +               pclk: pclk@0 {
> +                       #clock-cells = <0>;
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <0>;
> +               };

I strongly suspect it's like this:

        pclk: pclk@0 {
                #clock-cells = <0>;
                compatible = "fixed-factor-clock";
                clock-div = <1>;
                clock-mult = <1>;
                clocks = <&xtal24mhz>;
        };


>                 timer@101e2000 {
>                         compatible = "arm,sp804", "arm,primecell";
>                         reg = <0x101e2000 0x1000>;
>                         interrupts = <4>;
> +                       clocks = <&timclk>, <&pclk>;
> +                       clock-names = "tmrclk", "apb_pclk";
>                 };

We recently had some fight over the names of these clocks.
The DT bindings say they should be named "timer0" "timer1"
etc, see
Documentation/devicetree/bindings/timer/arm,sp804.txt

>                 timer@101e3000 {
>                         compatible = "arm,sp804", "arm,primecell";
>                         reg = <0x101e3000 0x1000>;
>                         interrupts = <5>;
> +                       clocks = <&timclk>, <&pclk>;
> +                       clock-names = "tmrclk", "apb_pclk";

Dito.

>                 ssp@101f4000 {
>                         compatible = "arm,pl022", "arm,primecell";
>                         reg = <0x101f4000 0x1000>;
>                         interrupts = <11>;
> +                       clocks = <&osc24M>, <&pclk>;
> +                       clock-names = "sspclk", "apb_pclk";

Should be SSPCLK all capitals.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
