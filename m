From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/3] devicetree: bindings: bd718x7: document HW state
 related ROHM specific properties
Date: Mon, 25 Mar 2019 06:28:30 +0000
Message-ID: <20190325062830.GV4731@dell>
References: <cover.1550135853.git.matti.vaittinen@fi.rohmeurope.com>
 <6ed4238fb083f52de0f5f013647b2334bad8ebe4.1550135853.git.matti.vaittinen@fi.rohmeurope.com>
 <20190320130259.GN4731@dell>
 <20190320141701.GA6208@localhost.localdomain>
 <20190321082338.GT4731@dell>
 <74b5d125c5cac75b3ab37ff2202966fb3f3395a1.camel@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <74b5d125c5cac75b3ab37ff2202966fb3f3395a1.camel@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "elven.wang@nxp.com" <elven.wang@nxp.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>, "broonie@kernel.org" <broonie@kernel.org>, "angus.ainslie@puri.sm" <angus.ainslie@puri.sm>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "anson.huang@nxp.com" <anson.huang@nxp.com>, "matt.vaittinen@fi.rohmeurope.com" <matt.vaittinen@fi.rohmeurope.com>, "yibin.gong@nxp.com" <yibin.gong@nxp.com>, "Haikola, Heikki" <Heikki.Haikola@fi.rohmeurope.com>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Mar 2019, Vaittinen, Matti wrote:

> On Thu, 2019-03-21 at 08:23 +0000, Lee Jones wrote:
> > On Wed, 20 Mar 2019, Matti Vaittinen wrote:
> > 
> > > Hello Lee, All
> > > 
> > > On Wed, Mar 20, 2019 at 01:02:59PM +0000, Lee Jones wrote:
> > > > On Thu, 14 Feb 2019, Matti Vaittinen wrote:
> > > > 
> > > > > Add ROHM BD71837 / BD71847 specific device tree bindings for
> > > > > controlling the PMIC shutdown/reset states and voltages for
> > > > > different HW states. The PMIC was designed to be used with NXP
> > > > > i.MX8 SoC and it supports SNVS low power state which seems to
> > > > > be typical for NXP i.MX SoCs. However, when SNVS is used we
> > > > > must
> > > > > not allow SW to control enabling/disabling those regulators
> > > > > which
> > > > > are crucial for system to boot as there is a HW limitation
> > > > > which
> > > > > causes SW controlled regulators to be kept shut down after SNVS
> > > > > reset.
> > > > > 
> > > > > Allow setting the SNVS to be used as reset target state and
> > > > > allow
> > > > > marking those regulators which are critical for boot.
> > > > > 
> > > > > Signed-off-by: Matti Vaittinen <
> > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > ---
> > > > >  .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt  | 17
> > > > > ++++++++++
> > > > >  .../bindings/regulator/rohm,bd71837-regulator.txt  | 38
> > > > > ++++++++++++++++++++++
> > > > >  2 files changed, 55 insertions(+)
> > > > 
> > > > Needs a DT Ack.
> > > 
> > > I think this was already applied to regulator tree by Mark:
> > > 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/commit/?h=for-next&id=f43d1b388f9be4aa47ed42c33659243a675c5c76
> > > Does it go in via his tree or do we need to apply it in Lee's tree
> > > too?
> > 
> > Why don't I see an email from Mark?
> 
> https://lore.kernel.org/lkml/20190214160025.65B8E1126F78@debutante.sirena.org.uk/
> 
> Maybe that's what you're looking for?

It is, but I need this in my inbox.

Mark, could you please take the time to fix your scripts please?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
