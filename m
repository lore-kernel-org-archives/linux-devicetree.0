From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] regulator: Start using standard gpios property and
 deprecate some custom properties
Date: Mon, 16 Dec 2013 11:40:23 -0800
Message-ID: <20131216194023.GE26293@atomide.com>
References: <1386965234-26461-1-git-send-email-tony@atomide.com>
 <20131216183615.GK3185@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131216183615.GK3185@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

* Mark Brown <broonie@kernel.org> [131216 10:37]:
> On Fri, Dec 13, 2013 at 12:07:14PM -0800, Tony Lindgren wrote:
> > We can start moving regulators to using the standard gpios property instead
> > of various custom GPIO related properties. The reason for doing this is that
> > at least regulator-fixed can currently cause silent bugs if "gpios" property
> > is used instead of "gpio" property.
> 
> If the issue is typos then I'm not convinced that for singular GPIOs
> it's going to be helpful, either way is prone to typos.  If the problem
> is error reporting then that seems like a more important thing to fix.

Are you serious? A typo here in the binding leads to silent errors where
nothing happens with the GPIO. That's just totally messed up considering
we use "gpios" instead of "gpio" everywhere else. So both "gpio" and
"gpios" should be parsed for sure.
 
> > Fix the issue by trying to use "gpios" where possible in the drivers that
> > can already use it, and if that fails, then try to use the deprecated custom
> > property for getting the GPIO.
> 
> Please split stuff like this up per driver rather than just sending a
> jumbo patch for the subsystem, it makes it much easier to review
> especially when they're not all doing exactly the same thing.

OK I'll just do patch for the fixed regulator.
 
> > -  - ti,dvs-gpio: GPIO specifier for external DVS pin control of LP872x devices.
> > +  - gpios: GPIO specifier for external DVS pin control of LP872x devices.
> 
> This is definitely a step backwards, it's changing from a named property
> which does a specific thing to a property with no useful semantics in
> the name.  That would be a step backwards for both legibility and
> extensibility, if support for any other GPIO controlled features is
> added then adding them into the sam property is going to be unpleasant
> and lead to the usability failures so typical of the older device tree
> bindings.  The the binding document says to use a name prefix, not to
> call everything just "gpios".

OK let's drop that change and just fix the fixed regulator.
 
> To be honest I'm also struggling to summon up the enthusiasm for the
> churn in the bindings, especially without going through and updating all
> the boards (and all the other GPIO properties in various DTs).  It seems
> like there's stuff missing in the helpers here, if we really wanted to
> force the properties to have -gpios on the end of their names then we
> should've had that being added by the helpers.

Sounds like exposing an infinite number of random *-gpio and *-gpios
bindings is a topic for another discussion. Anyways it's already totally
out of control so what do I care.

Regards,

Tony
