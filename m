From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 1/5] DT: mfd: add device-tree binding doc fro PMIC max77620/max20024
Date: Wed, 27 Jan 2016 10:42:31 +0100
Message-ID: <CACRpkdbwnTRHUmHx+o238phQP6LrZr6kV-OjF2kcxd8rguT+4Q@mail.gmail.com>
References: <1452771166-13694-1-git-send-email-ldewangan@nvidia.com>
	<1452771166-13694-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452771166-13694-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 14, 2016 at 12:32 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> +Flexible power sequence configuration
> +====================================
> +This sub-node configures the Flexible Power Sequnece(FPS) for power ON slot,
> +power OFF slot and slot period of the device. Device has 3 FPS as FPS0,
> +FPS1 and FPS2. The details of FPS configuration is provided through
> +subnode "fps". The details of FPS0, FPS1, FPS2 are provided through the
> +child node under this subnodes. The FPS number is provided via reg property.
> +
> +The property for fps child nodes as:
> +Required properties:
> +       -reg: FPS number like 0, 1, 2 for FPS0, FPS1 and FPS2 respectively.

This is ambitiously custom. Isn't power sequencing a generic problem?
The MMC subsystem has some power sequencing for example.

> +Optinal properties:
> +       -maxim,active-fps-time-period-us: Active state FPS time period in
> +               microseconds.
> +       -maxim,suspend-fps-time-period-us: Suspend state FPS time period in
> +               microseconds.

Define the "active state" and "suspend state" in the initial paragraph
under FPS so we can understand what these things are.

> +       -maxim,fps-enable-input: FPS enable source like EN0, EN1 or SW. The
> +                       macros are defined on dt-bindings/mfd/max77620.h for
> +                       different enable source.
> +                               FPS_EN_SRC_EN0 for EN0 enable source.
> +                               FPS_EN_SRC_EN1 for En1 enable source.
> +                               FPS_EN_SRC_SW for SW based control.

Is SW software? And EN0 and EN1 two different lines into the PMIC?
In that case describe that somewhere.

> +       -maxim,fps-sw-enable: Boolean, applicable if enable input is SW.
> +                       If this property present then enable the FPS else
> +                       disable FPS.
> +       -maxim,enable-sleep: Boolean, enable sleep when the external control
> +                       goes from HIGH to LOW.
> +       -maxim,enable-global-lpm: Boolean, enable global LPM when the external
> +                       control goes from HIGH to LOW.

First *what* is it that will sleep? The PMIC? The whole system? Or
does this simply mean that this will start the state machine? Elaborate.

This is confusing since for example there is a generic "wakeup-enable;"
property you can set on any device, therfore these things must be very
precisely defined.

What is "external control"? Is that a line into the PMIC?

> +    Optional properties:
> +    --------------------
> +       Following properties are require if pin control setting is required
> +       at boot.
> +       - pinctrl-names: A pinctrl state named "default" be defined, using
> +               the bindings in pinctrl/pinctrl-binding.txt.
> +       - pinctrl[0...n]: Properties to contain the phandle that refer to
> +               different nodes of pin control settings. These nodes
> +               represents the pin control setting of state 0 to state n.
> +               Each of these nodes contains different subnodes to
> +               represents some desired configuration for a list of pins.
> +               This configuration can include the mux function to select
> +               on those pin(s), and various pin configuration parameters,
> +               such as pull-up, open drain.
> +
> +               Each subnode have following properties:
> +               Required properties:
> +                   - pins: List of pins. Valid values of pins properties
> +                               are: gpio0, gpio1, gpio2, gpio3, gpio4,
> +                               gpio5, gpio6, gpio7
> +
> +               Optional properties:

Optional properties under optional properties?
This is getting confusing.

Write "Optional pin configurations"

> +                       function, drive-push-pull, drive-open-drain,
> +                       bias-pull-up, bias-pull-down.
> +                               Definitions are in the pinmux dt binding
> +                       devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +                       Absence of properties will leave the configuration
> +                       on default.

Thanks for using standardized bindings.

> +                       Valid values for function properties are:
> +                               gpio, lpm-control-in, fps-out, 32k-out,
> +                               sd0-dvs-in, sd1-dvs-in, reference-out
> +                       Theres is also customised property for the GPIO1,
> +                               GPIO2 and GPIO3.
> +                       - maxim,active-fps-source: FPS source for the gpios in
> +                               active state of the GPIO. Valid values are
> +                               FPS_SRC_0, FPS_SRC_1, FPS_SRC_2 and
> +                               FPS_SRC_NONE. Absence of this property will
> +                               leave the pin on default.


Define closer what an FPS source is. What is the effect on the pin?

> +                       - maxim,active-fps-power-up-slot: Power up slot on
> +                               given FPS for acive state.Valid values are 0
> +                               to 7.
> +                       - maxim,active-fps-power-down-slot: Power down slot
> +                               on given FPS for active state. Valid values
> +                               are 0 t  7.
> +                       - maxim,suspend-fps-source: Suspend state FPS source.
> +                       - maxim,suspend-fps-power-down-slot: Suspend state
> +                               power down slot.
> +                       - maxim,suspend-fps-power-up-slot: Suspend state power
> +                               up slot.


These two also have to be explained and connected back under the FPS
heading and explained. I guess it is impossible to understand this
without an accurate understanding of the FPS state machine, so provide
such a description in the document.

> +Low-Battery Monitor:
> +==================
> +This sub-node configure low battery monitor configuration registers.
> +Device has support for low-battery monitor configuration through
> +child DT node "low-battery-monitor".
> +
> +Optinal properties:
> +       - maxim,low-battery-dac: Tristate, enable/disable low battery DAC.
> +                       0 for disable,
> +                       1 for enable,
> +                       absence will left configuration to default.
> +       - maxim,low-battery-shutdown: Tristate, enable/disable low battery
> +               shutdown.
> +                       0 for disable,
> +                       1 for enable,
> +                       absence will left configuration to default.
> +       - maxim,low-battery-reset: Tristate, enable/disable low battery reset.
> +                       0 for disable,
> +                       1 for enable,
> +                       absence will left configuration to default.

I guess this should be reviewed by the drivers/power maintainers?
Added on the To: line.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
