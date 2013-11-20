From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/1] dt: binding: reword PowerPC 8xxx GPIO documentation
Date: Wed, 20 Nov 2013 17:50:52 -0600
Message-ID: <CAL_JsqJvxA240QEreWPp2L+eNFQmhp0XV=qmO4QXqTga+RFuCQ@mail.gmail.com>
References: <201311182328.40743.arnd@arndb.de>
	<1384983293-11002-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384983293-11002-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Rob Herring@" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 20, 2013 at 3:34 PM, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org> wrote:
> re-format and re-word the device tree binding documentation for MPC8xxx
> and compatibles, reference the common document for interrupt controllers
> and remove outdated duplicate SoC specific information
>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Rob Herring@ <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> ---
>
> This change should improve the "flow" of the 8xxx GPIO binding document,
> starting with an overview, then discussing specific properties, and then
> collecting examples at the end.  Re-formatting should improve readability
> of enumerations.
>
> I was not certain whether the kinds of changes to the document warrant a
> split into several patches, separating whitespace/reformatting and the
> content update.  For the moment I went with a single patch to not
> overcomplicate matters.
>
> Putting the interrupt-parent before the interrupts specifiers is a thing
> of personal taste -- I'm a fan of hierarchy, finding the specific detail
> first and then the addendum "oh, by the way, it's that other parent"
> keeps confusing me as much as top-posting in email does. :)
>
> Feel free to tell me when I got terminology wrong.  This is the only
> real issue that may remain after this change IMO.
>
>  .../devicetree/bindings/gpio/8xxx_gpio.txt         |   59 ++++++++++++--------
>  1 file changed, 35 insertions(+), 24 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt b/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
> index b0019eb5330e..7788e8df3a15 100644
> --- a/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
> @@ -5,16 +5,41 @@ This is for the non-QE/CPM/GUTs GPIO controllers as found on
>
>  Every GPIO controller node must have #gpio-cells property defined,
>  this information will be used to translate gpio-specifiers.
> +See bindings/gpio/gpio.txt for details of how to specify GPIO
> +information for devices.
> +
> +The GPIO module usually is connected to the SoC's internal interrupt
> +controller, see bindings/interrupt-controller/interrupts.txt (the
> +interrupt client nodes section) for details how to specify this GPIO
> +module's interrupt.
> +
> +The GPIO module may serve as another interrupt controller (cascaded to
> +the SoC's internal interrupt controller).  See the interrupt controller
> +nodes section in bindings/interrupt-controller/interrupts.txt for
> +details.
>
>  Required properties:
> -- compatible : "fsl,<CHIP>-gpio" followed by "fsl,mpc8349-gpio" for
> -  83xx, "fsl,mpc8572-gpio" for 85xx and "fsl,mpc8610-gpio" for 86xx.
> -- #gpio-cells : Should be two. The first cell is the pin number and the
> -  second cell is used to specify optional parameters (currently unused).
> - - interrupts : Interrupt mapping for GPIO IRQ.
> - - interrupt-parent : Phandle for the interrupt controller that
> -   services interrupts for this device.
> -- gpio-controller : Marks the port as GPIO controller.
> +- compatible:          "fsl,<CHIP>-gpio" followed by "fsl,mpc8349-gpio"

Can you use <chip> here. Only because I'm developing some
documentation checking scripts and handle that already.

> +                       for 83xx, "fsl,mpc8572-gpio" for 85xx and

s/and/or/

> +                       "fsl,mpc8610-gpio" for 86xx.
> +- #gpio-cells:         Should be two. The first cell is the pin number
> +                       and the second cell is used to specify optional
> +                       parameters (currently unused).
> +- interrupt-parent:    Phandle for the interrupt controller that
> +                       services interrupts for this device.
> +- interrupts:          Interrupt mapping for GPIO IRQ.
> +- gpio-controller:     Marks the port as GPIO controller.
> +
> +Optional properties:
> +- interrupt-controller:        Empty boolean property which marks the GPIO
> +                       module as an IRQ controller.
> +- #interrupt-cells:    Number of integer cells required to specify an

Should start with "Should be two."

> +                       interrupt within this interrupt controller.  The
> +                       first cell defines the pin number, the second
> +                       cell defines additional flags (trigger type,
> +                       trigger polarity).  Note that the specific set
> +                       of trigger conditions supported by the GPIO
> +                       module depends on the actual SoC.

You mean what values are supported vary, not the meaning of the values right?

>  Example of gpio-controller nodes for a MPC8347 SoC:
>
> @@ -36,25 +61,11 @@ Example of gpio-controller nodes for a MPC8347 SoC:
>                 gpio-controller;
>         };
>
> -See booting-without-of.txt for details of how to specify GPIO
> -information for devices.
> -
> -To use GPIO pins as interrupt sources for peripherals, specify the
> -GPIO controller as the interrupt parent and define GPIO number +
> -trigger mode using the interrupts property, which is defined like
> -this:
> -
> -interrupts = <number trigger>, where:
> - - number: GPIO pin (0..31)
> - - trigger: trigger mode:
> -       2 = trigger on falling edge
> -       3 = trigger on both edges
> -
> -Example of device using this is:
> +Example of a peripheral using the GPIO module as an IRQ controller:
>
>         funkyfpga@0 {
>                 compatible = "funky-fpga";
>                 ...
> -               interrupts = <4 3>;
>                 interrupt-parent = <&gpio1>;
> +               interrupts = <4 3>;
>         };
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
