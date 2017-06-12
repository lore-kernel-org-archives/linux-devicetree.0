From: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] DT: pinctrl: Add binding documentation for
 Spreadtrum pin controller
Date: Mon, 12 Jun 2017 14:07:18 +0800
Message-ID: <20170612060718.GA8566@spreadtrum.com>
References: <359d62c1f2f7ef61c6160df9b60c1af4bfcea89a.1496664241.git.baolin.wang@spreadtrum.com>
 <CACRpkdbtuPKr=tWGoJC-sg2Oj47rYMpo6fs_Us=Nynew1Wkz=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbtuPKr=tWGoJC-sg2Oj47rYMpo6fs_Us=Nynew1Wkz=w@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 五,  6月 09, 2017 at 01:00:17下午 +0200, Linus Walleij wrote:
> On Mon, Jun 5, 2017 at 2:11 PM, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
> 
> > This patch adds the binding documentation for Spreadtrum SC9860 pin
> > controller device.
> >
> > Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> 
> Good improvements since last iteration!
> 
> (...)
> 
> > +The Spreadtrum pin controller are organized in 3 blocks (types).
> > +
> > +The first block comprises some global control registers, and each
> > +register contains several bit fields with one bit or several bits
> > +to configure for some global common configuration, such as domain
> > +pad driving level, system control select and so on.
> 
> Insert your explanations about domain pads and system
> control from the other mail here.

OK.

> 
> > + We recognise
> > +every fields comprising one bit or several bits in one global control
> > +register as one pin, thus we should record every pin's bit offset,
> > +bit width and register offset to configure this field (pin). Since
> > +this type pins' configuration are very tricky and different for each
> > +register, we introduce "sprd,ctrl" property to set the various global
> > +control configuration.
> 
> Hm I still don't fully understand this property.

I try to explain these special pins definition on Spreadtrum platform.
This type pins (containing one bit or several bits) are used to configure
various global control, not only domain pad driving level, system control,
and also some other configuration:
EIC (external interrupt controller) source select, debug mode select,
camera pd signal select, camera reset signal select, ADI sync signal
require, watchdog reset select .......

There are too much various configuration that I can not list all of them,
so we can not make every special configuration as one generic configuration,
and maybe it will add more strange globle configuration in future. Then
we add one "sprd,ctrl" (maybe "sprd,control" will be better) to set these
various global control configuration, and we need use magic number for this
property.

> 
> > + In some situation we have some pin-sleep related
> > +configuration need to set when one of system goes into deep sleep
> > +mode. For example, if we set the pin sleep mode as AP_SLEEP, which
> > +means when AP system goes into deep sleep mode, this pin's sleep
> > +related properties (input/output or pullup/down) will be set
> > +automatically. Thus we intoduce "sprd,sleep_mode" to set pin sleep
> > +mode.
> 
> So what you mean is that there is a special register for the sleep
> mode, so that we do not need to write the sleep mode explicitly,
> it will instead hit the hardware automatically when the system
> switches to sleep mode on some global level?

No. Sorry for confusing. What I mean is if we set one pin's sleep mode
as AP_SLEEP, when the AP system goes into deep sleep mode, then the sleep
related configuration of this pin will be set automatically. If we set
the sleep mode as PUBCP_SLEEP, which means when the pubcp system goes into
deep sleep mode, this pin's sleep related configuration will be set.

The sleep related configuration of one pin are described (need modify as
you pointed) as below:
- sprd,input-sleep: Input enable when system goes into deep sleep mode.
- sprd,output-sleep: Output enable when system goes into deep sleep mode.
- sprd,pullup_sleep: Pull up enable when system goes into deep sleep mode.
- sprd,pulldown_sleep: Pull down enable when system goes into deep sleep mode.

So if we set one pin's sleep related configuration, we also should choose
the sleep mode (means which system).

> 
> Please detail this.
> 
> This is not a spreadtrum-specific feature. Look for example in:
> include/dt-bindings/pinctrl/nomadik.h
> 
> We have things like this:
> 
> #define SLPM_DISABLED           0
> #define SLPM_ENABLED            1
> #define SLPM_INPUT_NOPULL       0
> #define SLPM_INPUT_PULLUP       1
> #define SLPM_INPUT_PULLDOWN     2
> #define SLPM_DIR_INPUT          3
> #define SLPM_OUTPUT_LOW         0
> #define SLPM_OUTPUT_HIGH        1
> #define SLPM_DIR_OUTPUT         2
> #define SLPM_WAKEUP_DISABLE     0
> #define SLPM_WAKEUP_ENABLE      1
> 
> These (also custom) properties predate the generic pin config,
> and that is why it was done like this.
> 
> But moving forward, we may need to think about coming up with
> something generic for this.
> 
> I think this kind of overlaps the pin control states "default"
> and "sleep".
> 
> What we want to do is read out both "default" and "sleep" modes
> from the device tree and program *both* into the hardware
> when "default" is normally initialized.
> 
> This is better, because then the device tree looks the same
> whether we use hardware-backed switch from "default" to
> "sleep" and back or not.
> 
> I don't know how to do this practically unfortunately, it may need
> some modifications of the pin control core code so that drivers
> can get the "sleep" mode configuration out and program it.

Yes, I think these "sleep" related configuration are not like
what "sprd,sleep-mode" describes, it looks like below properties:
- sprd,input-sleep: Input enable when system goes into deep sleep mode.
- sprd,output-sleep: Output enable when system goes into deep sleep mode.
- sprd,pullup_sleep: Pull up enable when system goes into deep sleep mode.
- sprd,pulldown_sleep: Pull down enable when system goes into deep sleep mode.

I agree we should add these into core code, something like:
static const struct pinconf_generic_params dt_params[] = {
	{ "bias-bus-hold", PIN_CONFIG_BIAS_BUS_HOLD, 0 },
	{ "bias-disable", PIN_CONFIG_BIAS_DISABLE, 0 },
	{ "bias-high-impedance", PIN_CONFIG_BIAS_HIGH_IMPEDANCE, 0 },
	{ "bias-pull-up", PIN_CONFIG_BIAS_PULL_UP, 1 },
	{ "bias-pull-pin-default", PIN_CONFIG_BIAS_PULL_PIN_DEFAULT, 1 },
	{ "bias-pull-down", PIN_CONFIG_BIAS_PULL_DOWN, 1 },
	{ "drive-open-drain", PIN_CONFIG_DRIVE_OPEN_DRAIN, 0 },
	{ "drive-open-source", PIN_CONFIG_DRIVE_OPEN_SOURCE, 0 },
	{ "drive-push-pull", PIN_CONFIG_DRIVE_PUSH_PULL, 0 },
	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
	{ "input-schmitt", PIN_CONFIG_INPUT_SCHMITT, 0 },
	{ "input-schmitt-disable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 0 },
	{ "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
	{ "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
	{ "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
+	{ "sleep-bias-pull-up", PIN_CONFIG_SLEEP_BIAS_PULL_UP, 1},
+	{ "sleep-bias-pull-down", PIN_CONFIG_SLEEP_BIAS_PULL_DOWN 1},
	......
};

If you agree that, I can help to add these configuration.

> 
> > +The last block comprises some misc registers which also have unified
> > +register definition, and each register described one pin is used to
> > +configure drive strength, pull up/down and so on.
> 
> OK
> 
> > + Especially for pull
> > +up, we introduce "sprd,pullup" property for two kind configuration:
> > +PULLUP_20K or PULLUP_4_7K, which means the pullup resistor is 20K or
> > +4.7K.
> 
> Do not use this. The generic bias-pull-up already supports an
> argument.
> 
> Use this:
> 
> bias-pull-up = <20000>;
> bias-pull-up = <4700>;
> 
> Just unpack the argument in the .set_config() callback and deny
> it setting anything else than 20000 or 4700 Ohms.

Yes, you are right. I missed this and will fix in next version.

> 
> > +Optional properties:
> > +- function: Specified the function name.
> > +- drive-strength: Drive strength in mA.
> > +- input-schmitt-disable: Enable schmitt-trigger mode.
> > +- input-schmitt-enable: Disable schmitt-trigger mode.
> > +- bias-disable: Disable pin bias.
> > +- bias-pull-down: Pull down on pin.
> 
> OK
> 
> > +- sprd,ctrl: Control values referring to databook for global control pins.
> 
> Uncertain on this.
> 
> > +- sprd,sleep_mode: Sleep mode selection.
> > +- sprd,pullup: Pull up on pin.
> 
> Switch to bias-pull-up as per above.

OK.

> 
> > +- sprd,input-sleep: Input enable when system goes into deep sleep mode.
> > +- sprd,output-sleep: Output enable when system goes into deep sleep mode.
> > +- sprd,pullup_sleep: Pull up enable when system goes into deep sleep mode.
> > +- sprd,pulldown_sleep: Pull down enable when system goes into deep sleep mode.
> 
> This is not good. We need to handle these using the standard
> 
> input-enable
> output-enable
> bias-pull-up
> bias-pull-down
> 
> Just inside a state named "sleep" and then let the driver read and program
> this state into the sleep registers at first convenience.

I am afraid I can not use the "sleep" state. Since if we set the "sleep" state,
and usually we will issue "pinctrl_force_sleep()" in suspend function, but I am
afraid it will be too late for pin sleep related configuration when system goes
into deep sleep.

As I explained above, these 4 sleep related configuration bind with the pin sleep
mode, we should set them as generic config before system goes into deep sleep.
We can add these sleep related configuration into pinctrl core like I suggested
above, which will be more reasonable. What do you think?
static const struct pinconf_generic_params dt_params[] = {
	......
	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
+	{ "sleep-bias-pull-up", PIN_CONFIG_SLEEP_BIAS_PULL_UP, 1},
+	{ "sleep-bias-pull-down", PIN_CONFIG_SLEEP_BIAS_PULL_DOWN, 1},
+	{ "sleep-bias-input-enable", PIN_CONFIG_SLEEP_INPUT_ENABLE, 1},
+	{ "sleep-bias-output-enable", PIN_CONFIG_SLEEP_OUTPUT_ENABLE, 1},

Really appreciate for your comments.

};
> 
> Yours,
> Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
