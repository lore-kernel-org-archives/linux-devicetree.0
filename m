From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/4] pinctrl-tz1090-pdc: add TZ1090 PDC pinctrl driver
Date: Mon, 24 Jun 2013 17:08:50 +0200
Message-ID: <CACRpkdbq8OP1FYpUuoC+Zo=qD0mA6Hmj5gUQJCbJasOspWz6SA@mail.gmail.com>
References: <1371720391-21825-1-git-send-email-james.hogan@imgtec.com>
	<1371720391-21825-4-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1371720391-21825-4-git-send-email-james.hogan@imgtec.com>
Sender: linux-doc-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2013 at 11:26 AM, James Hogan <james.hogan@imgtec.com> wrote:

> Add a pin control driver for the TZ1090's low power pins via the
> powerdown controller SOC_GPIO_CONTROL registers.
>
> These pins have individually controlled pull-up, and group controlled
> schmitt, slew-rate, drive-strength, and power-on-start (pos).
>
> The pdc_gpio0 and pdc_gpio1 pins can also be muxed onto the
> ir_mod_stable_out and ir_mod_power_out functions respectively. If no
> function is set they remain in GPIO mode. These muxes can be overridden
> by requesting them as GPIOs.
>
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Rob Landley <rob@landley.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-doc@vger.kernel.org
> Cc: devicetree-discuss@lists.ozlabs.org
> ---
> Changes in v3:
>  - separated from irq-imgpdc and removed arch/metag changes to allow
>    these patches to go upstream separately via the pinctrl[/gpio] trees
>    (particularly the pinctrl drivers depend on the new pinconf DT
>    bindings).
>  - some s/unsigned/unsigned int/.
>  - pinctrl-tz1090*: switch to generic pinconfig DT bindings and
>    pinconf_generic_dump_config.
>  - pinctrl-tz1090*: use tz1090, prefix for pins and function in DT
>    bindings.
>  - pinctrl-tz1090*: make internal functions static.
>  - pinctrl-tz1090*: move initcall from postcore to arch.

Thanks, patch applied as well.

Yours,
Linus Walleij
