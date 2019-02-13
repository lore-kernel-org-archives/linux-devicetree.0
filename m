From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [RFC PATCH v1 3/3] regulator: bd718x7: Support SNVS low power
 state
Date: Wed, 13 Feb 2019 09:38:27 +0200
Message-ID: <20190213073827.GB12247@localhost.localdomain>
References: <cover.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
 <06c2f2f730b07caeb1f2fb86be60c02b21d7bea9.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
 <20190212160831.GF20635@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212160831.GF20635@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong <yibin.gong@nxp.com>, Elven Wang <elven.wang@nxp.com>, Anson Huang <anson.huang@nxp.com>
List-Id: devicetree@vger.kernel.org

Hello Mark,

On Tue, Feb 12, 2019 at 04:08:31PM +0000, Mark Brown wrote:
> On Tue, Feb 12, 2019 at 04:19:38PM +0200, Matti Vaittinen wrote:
> > read ROHM BD71837 / BD71847 specific device tree bindings for
> > controlling the PMIC shutdown/reset states and voltages for
> > different HW states. The PMIC was designed to be used with NXP
> > i.MX8 SoC and it supports SNVS low power state which seems to
> > be typical for NXP i.MX SoCs. However, when SNVS is used we must
> > not allow SW to control enabling/disabling those regulators which
> > are crucial for system to boot as there is a HW limitation which
> > causes SW controlled regulators to be kept shut down after SNVS
> > reset.
> > 
> > Allow setting the SNVS to be used as reset target state and allow
> > marking those regulators which are critical for boot.
> 
> The general idea seems fine but I'm wondering if we should use the
> existing bindings and just prevent any change with fixed configurations
> - that *should* just be a case of picking appropriate constraints I
> think.  Why does this need completely new properties other than
> preventing the user from shooting themselves in the foot?

The BD71847 and BD71847 have 'HW state machine' in PMIC. It has READY,
RUN, IDLE, SUSPEND, SNVS,.. states.

At RUN state, the enabling and disabling status can be either a
predefined configuration - or controlled by SW. There is one bit for
each regulator which can be used to switch the control to the SW.

By default the BD718x7 driver turns this control bit so that all of the
regulators are controlled by SW. This is done at driver probe, right
after the regulators have been registered.

Now when a reset occurs (SW reset or reset via power button press,
external WDG, ...) the PMIC disables all power outputs no matter if they
are controlled by SW or HW.

Unfortunately there is this 'feature' in PMIC so that when PMIC starts
up after reset, those regulators which were controlled by SW won't be
powered again - no matter if they were enabled before reset. This
happens only whn reset target state was SNVS state.

So with current driver design, even if constrains prevented the
regulator core from touching the regulators, the driver still changes
the control to SW. So we need to parse some attribute in the BD718x7
driver side. Besides, I did not spot a 'do not touch me' property from
the bindings :)

But after writing all this - I think you are correct. We do not need the
rohm,regulator-crucial-for-boot. I guess we can check for the
combination of:

regulator-always-on and regulator-boot-on

and interpret this as "rohm,regulator-crucial-for-boot".

I just think I need to document that those flags are required
for critical regulators if SNVS is used as reset target even if there
should be no one touching those regulators.

Thanks once again for the feedback Mark!

Br,
	Matti Vaittinen

-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
