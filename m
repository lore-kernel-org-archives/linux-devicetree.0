From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] DT: pinctrl: Add binding documentation for
 Spreadtrum pin controller
Date: Fri, 9 Jun 2017 13:00:17 +0200
Message-ID: <CACRpkdbtuPKr=tWGoJC-sg2Oj47rYMpo6fs_Us=Nynew1Wkz=w@mail.gmail.com>
References: <359d62c1f2f7ef61c6160df9b60c1af4bfcea89a.1496664241.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <359d62c1f2f7ef61c6160df9b60c1af4bfcea89a.1496664241.git.baolin.wang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 5, 2017 at 2:11 PM, Baolin Wang <baolin.wang@spreadtrum.com> wrote:

> This patch adds the binding documentation for Spreadtrum SC9860 pin
> controller device.
>
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>

Good improvements since last iteration!

(...)

> +The Spreadtrum pin controller are organized in 3 blocks (types).
> +
> +The first block comprises some global control registers, and each
> +register contains several bit fields with one bit or several bits
> +to configure for some global common configuration, such as domain
> +pad driving level, system control select and so on.

Insert your explanations about domain pads and system
control from the other mail here.

> + We recognise
> +every fields comprising one bit or several bits in one global control
> +register as one pin, thus we should record every pin's bit offset,
> +bit width and register offset to configure this field (pin). Since
> +this type pins' configuration are very tricky and different for each
> +register, we introduce "sprd,ctrl" property to set the various global
> +control configuration.

Hm I still don't fully understand this property.

> + In some situation we have some pin-sleep related
> +configuration need to set when one of system goes into deep sleep
> +mode. For example, if we set the pin sleep mode as AP_SLEEP, which
> +means when AP system goes into deep sleep mode, this pin's sleep
> +related properties (input/output or pullup/down) will be set
> +automatically. Thus we intoduce "sprd,sleep_mode" to set pin sleep
> +mode.

So what you mean is that there is a special register for the sleep
mode, so that we do not need to write the sleep mode explicitly,
it will instead hit the hardware automatically when the system
switches to sleep mode on some global level?

Please detail this.

This is not a spreadtrum-specific feature. Look for example in:
include/dt-bindings/pinctrl/nomadik.h

We have things like this:

#define SLPM_DISABLED           0
#define SLPM_ENABLED            1
#define SLPM_INPUT_NOPULL       0
#define SLPM_INPUT_PULLUP       1
#define SLPM_INPUT_PULLDOWN     2
#define SLPM_DIR_INPUT          3
#define SLPM_OUTPUT_LOW         0
#define SLPM_OUTPUT_HIGH        1
#define SLPM_DIR_OUTPUT         2
#define SLPM_WAKEUP_DISABLE     0
#define SLPM_WAKEUP_ENABLE      1

These (also custom) properties predate the generic pin config,
and that is why it was done like this.

But moving forward, we may need to think about coming up with
something generic for this.

I think this kind of overlaps the pin control states "default"
and "sleep".

What we want to do is read out both "default" and "sleep" modes
from the device tree and program *both* into the hardware
when "default" is normally initialized.

This is better, because then the device tree looks the same
whether we use hardware-backed switch from "default" to
"sleep" and back or not.

I don't know how to do this practically unfortunately, it may need
some modifications of the pin control core code so that drivers
can get the "sleep" mode configuration out and program it.

> +The last block comprises some misc registers which also have unified
> +register definition, and each register described one pin is used to
> +configure drive strength, pull up/down and so on.

OK

> + Especially for pull
> +up, we introduce "sprd,pullup" property for two kind configuration:
> +PULLUP_20K or PULLUP_4_7K, which means the pullup resistor is 20K or
> +4.7K.

Do not use this. The generic bias-pull-up already supports an
argument.

Use this:

bias-pull-up = <20000>;
bias-pull-up = <4700>;

Just unpack the argument in the .set_config() callback and deny
it setting anything else than 20000 or 4700 Ohms.

> +Optional properties:
> +- function: Specified the function name.
> +- drive-strength: Drive strength in mA.
> +- input-schmitt-disable: Enable schmitt-trigger mode.
> +- input-schmitt-enable: Disable schmitt-trigger mode.
> +- bias-disable: Disable pin bias.
> +- bias-pull-down: Pull down on pin.

OK

> +- sprd,ctrl: Control values referring to databook for global control pins.

Uncertain on this.

> +- sprd,sleep_mode: Sleep mode selection.
> +- sprd,pullup: Pull up on pin.

Switch to bias-pull-up as per above.

> +- sprd,input-sleep: Input enable when system goes into deep sleep mode.
> +- sprd,output-sleep: Output enable when system goes into deep sleep mode.
> +- sprd,pullup_sleep: Pull up enable when system goes into deep sleep mode.
> +- sprd,pulldown_sleep: Pull down enable when system goes into deep sleep mode.

This is not good. We need to handle these using the standard

input-enable
output-enable
bias-pull-up
bias-pull-down

Just inside a state named "sleep" and then let the driver read and program
this state into the sleep registers at first convenience.

Yours,
Linus Walleij
