From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: bd718x7: document HW state
 related ROHM specific properties
Date: Thu, 14 Feb 2019 09:15:47 +0200
Message-ID: <20190214071547.GD12247@localhost.localdomain>
References: <cover.1550050645.git.matti.vaittinen@fi.rohmeurope.com>
 <501fe1a68a9ad0987ddc0d3f559b2bdd1f65a5b7.1550050645.git.matti.vaittinen@fi.rohmeurope.com>
 <044d28c6ea1f9dd58f4c1942411aaf58@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <044d28c6ea1f9dd58f4c1942411aaf58@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong <yibin.gong@nxp.com>, Elven Wang <elven.wang@nxp.com>, Anson Huang <anson.huang@nxp.com>, linux-kernel-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Angus,

Glad to hear from you again =)

On Wed, Feb 13, 2019 at 03:38:40PM -0800, Angus Ainslie wrote:
> > 
> >  Optional properties:
> >  - clock-output-names	: Should contain name for output clock.
> > +- rohm,reset-snvs-powered : Transfer BD718x7 to SNVS state at reset.
> > +
> > +The BD718x7 supports two different HW states as reset target states.
> > States
> > +are called as SNVS and READY. At READY state all the PMIC power outputs
> > go
> > +down and OTP is reload. At the SNVS state all other logic and external
> > +devices apart from the SNVS power domain are shut off. Please refer to
> > NXP
> > +i.MX8 documentation for further information regarding SNVS state. When
> > a
> > +reset is done via SNVS state the PMIC OTP data is not reload. This
> > cause
> > +
> 
> It looks like there is some text missing here.

Actually, the "This cause" is a leftover from previous version. So
nothings missing, just something extra :D But well spotted. I'll clean
this up for next version!

> > diff --git
> > a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
> > b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
> > index 4b98ca26e61a..4a05cbf915ee 100644
> > ---
> > a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
> > +++
> > b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
> > @@ -27,8 +27,38 @@ BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6
> >  LDO1, LDO2, LDO3, LDO4, LDO5, LDO6
> > 

[...]

> > +----------------------------------------------------------------------------
> > +rest	| not supported		| not supported		| not supported
> > +
> >  Example:
> 
> Could you add an example of the optional properties ?

Sure. I'll do that for next version as well :)

Br,
	Matti Vaittinen

-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
