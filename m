From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [RFC PATCH v1 3/3] regulator: bd718x7: Support SNVS low power
 state
Date: Wed, 13 Feb 2019 10:33:43 +0200
Message-ID: <20190213083343.GC12247@localhost.localdomain>
References: <cover.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
 <06c2f2f730b07caeb1f2fb86be60c02b21d7bea9.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
 <20190212160831.GF20635@sirena.org.uk>
 <20190213073827.GB12247@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190213073827.GB12247@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong <yibin.gong@nxp.com>, Elven Wang <elven.wang@nxp.com>, Anson Huang <anson.huang@nxp.com>
List-Id: devicetree@vger.kernel.org

Hello peeps,

And my apologies! I was in a hurry yesterday. I had to pick up kid kid
from kindegarden and I wanted to send the RFC before that - bad mistake.
Should've learnd by now.

Today I decided to continue work and use combination of
regulator-always-on and regulator-boot-on instead of
rohm,regulator-crucial-for-boot. I was ashtonished by the fact that I
didn't find my latest work from my git. After a while I found unsaved
buffer from another editor instance with changes concerning handling of
"rohm,regulator-crucial-for-boot"...

On Wed, Feb 13, 2019 at 09:38:27AM +0200, Matti Vaittinen wrote:
> Hello Mark,
> 
> On Tue, Feb 12, 2019 at 04:08:31PM +0000, Mark Brown wrote:
> 
> So with current driver design, even if constrains prevented the
> regulator core from touching the regulators, the driver still changes
> the control to SW. So we need to parse some attribute in the BD718x7
> driver side. Besides, I did not spot a 'do not touch me' property from
> the bindings :)

So no wonder it was not clear that the core constrains were not enough.
Previous patch did not contain the part of change that skipped turning
the regulator control to SW if regulator was marked crucial.

> But after writing all this - I think you are correct. We do not need the
> rohm,regulator-crucial-for-boot. I guess we can check for the
> combination of:
> 
> regulator-always-on and regulator-boot-on
> 
> and interpret this as "rohm,regulator-crucial-for-boot".
> 
> I just think I need to document that those flags are required
> for critical regulators if SNVS is used as reset target even if there
> should be no one touching those regulators.

Anyways, this is still valid - I'll prepare next version with all
intended changes included... :/

Br,
	Matti Vaittinen

-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
