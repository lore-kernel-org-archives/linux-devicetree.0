From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 5/6] drivers: boot_constraint: Add initial DT bindings
Date: Wed, 12 Jul 2017 16:28:16 -0500
Message-ID: <CAL_Jsq+oAB3gejRMXuY0q9+Et4GrtvF3RwGzPNJ08TPooVyXJg@mail.gmail.com>
References: <cover.1499770771.git.viresh.kumar@linaro.org> <0610277aef9830cff53b7b53cf41cc54886fdc7f.1499770771.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0610277aef9830cff53b7b53cf41cc54886fdc7f.1499770771.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Shiraz Hashim <shashim-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 12, 2017 at 1:34 AM, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This adds device tree bindings for boot constraints. Only power supply
> constraint types are supported currently.
>
> Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/boot-constraints.txt       | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/boot-constraints.txt
>
> diff --git a/Documentation/devicetree/bindings/boot-constraints.txt b/Documentation/devicetree/bindings/boot-constraints.txt
> new file mode 100644
> index 000000000000..9a01ea1e6e72
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/boot-constraints.txt
> @@ -0,0 +1,68 @@
> +BOOT CONSTRAINTS
> +================
> +
> +Some devices are powered ON by the bootloader before the bootloader handovers
> +control to the Operating System (OS). It maybe important for those devices to
> +keep working until the time the OS takes over and starts configuring the devices
> +again.
> +
> +A typical example of that can be the LCD controller, which is used by the
> +bootloaders to show image(s) while the platform is booting into the Operating
> +System. The LCD controller can be using some resources, like clk, supplies, etc,
> +that are shared between several devices. These shared resources should be
> +configured to satisfy need of all the users. If another device's (X) driver gets
> +probed before the LCD controller driver in this case, then it may end up
> +reconfiguring these resources to ranges satisfying the current users (only
> +device X) and that can make the LCD screen unstable.

Display is a pretty well known use case here. Do you have other
examples in mind? Other cases I've seen are automotive with keeping
the backup camera going and CAN bus handling. Though my new car has a
flicker shortly after coming on, so I guess the handoff doesn't have
to be completely seemless. :)

[...]

> +       mmc: mmc@0x0 {
> +               ...
> +               ...
> +               vmmc-supply = <&twl_reg1>;
> +               vmmcaux-supply = <&twl_reg2>;
> +               boot-constraint-supplies = "vmmc", "vmmcaux";
> +               boot-constraint-uV = <1800000 2000000>, /* vmmc */
> +                                    <2000000 2000000>; /* vmmcaux */

No. I don't like how this is going to extend to all the other bindings
people are going to want constraints for. We don't need a parallel set
of properties for each type of binding.

I'm not convinced that we need a general solution for what's probably
a handful of things that need a handoff versus just re-initialize.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
