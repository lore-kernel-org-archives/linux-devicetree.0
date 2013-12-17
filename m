From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] regulator: Start using standard gpios property and
 deprecate some custom properties
Date: Tue, 17 Dec 2013 07:37:27 -0800
Message-ID: <20131217153727.GI26293@atomide.com>
References: <1386965234-26461-1-git-send-email-tony@atomide.com>
 <20131216183615.GK3185@sirena.org.uk>
 <20131216194023.GE26293@atomide.com>
 <20131216201102.GP3185@sirena.org.uk>
 <20131216210512.GF26293@atomide.com>
 <20131216214057.GG3185@sirena.org.uk>
 <20131216230622.GH26293@atomide.com>
 <20131216233737.GL3185@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131216233737.GL3185@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

* Mark Brown <broonie@kernel.org> [131216 15:39]:
> On Mon, Dec 16, 2013 at 03:06:22PM -0800, Tony Lindgren wrote:
> > * Mark Brown <broonie@kernel.org> [131216 13:42]:
> > > On Mon, Dec 16, 2013 at 01:05:13PM -0800, Tony Lindgren wrote:
> 
> > > > Personally I don't see any value for a regulator describing the names of
> > > > the GPIOs in the binding, it's really up to the driver to make sense of
> > > > them. Especially if there are one or more similar GPIOs. We're not
> 
> > > Devices like PMICs frequently have a *lot* of possible pin functions
> > > some of which can get mapped onto GPIOs (in either direction), many of
> > > which are going to be fixed by system design and generally all muxed
> > > onto a much smaller set of physical pins.  If you try to specify those
> 
> > That's why PMICs usually show up as GPIO controllers. And if a regulator
> > needs to use those GPIOs, it should most likely just use the standard
> > "gpios" property.
> 
> No, that's a different thing - the PMIC will typically be able to use
> some pins as GPIOs so most expose a GPIO controller.  The functions that
> are an issue here are things like voltage selection, voltage transition
> completion status, sleep mode, enable control or whatever that may need
> to be tied to the SoC for interaction (usually not just limited to the
> regulator bit either).  A lot of these things get done either to bypass
> register I/O or because they are used as part of power up/down
> sequencing and need to be done by hardware.  
> 
> If there's any overlap it's with pinctrl though you still need to map
> the connected functions to any software controllable GPIOs they're
> connected to.

OK. Maybe the best way to deal with that is to have the driver specific
regmap (gpiomap? :) configuration describe that? And then the driver
GPIO configuration is picked up just based on the compatible flags and
the gpios property?
 
> > > > I don't think there should be any named GPIOs. If we want names, then
> > > > the GPIO usage should be possible to group quite easily rather than create
> > > > a new property for everything. Something like "enable-gpio" comes to mind.
> 
> > > I don't understand the difference between your suggestion and named
> > > GPIOs.
> 
> > What I'm trying to say is let's not let drivers invent their random
> > *-gpio[s] property as those essentially creates new kernel ABIs that
> > we're stuck with.
> 
> > Instead, let's try to use standard properties where possible like
> > "gpios" and "enable-gpios", "cs-gpios" and so on.
> 
> Oh, OK.  Yes, standardisation of the names has benefits though for some
> of the features (especially voltage selection) the implementation gets
> rather chip specific and there are also advantages in having the DT
> binding correspond to the chip documentation.
> 
> Things that really are very standard probably ought to be being done by
> the core anyway (like we've done with all the factoring out of standard
> voltage map and regmap operations).

Agreed. And a lot of that can be configured automatically based on the
compatible property.

Regards,

Tony
