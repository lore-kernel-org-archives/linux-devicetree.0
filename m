From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH 2/2] ARM: DT: kernel: DT cpu node bindings update
Date: Wed, 17 Apr 2013 12:02:04 +0100
Message-ID: <20130417110203.GB29188@e102568-lin.cambridge.arm.com>
References: <1366042402-8987-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366042402-8987-3-git-send-email-lorenzo.pieralisi@arm.com>
 <201304171148.57146.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201304171148.57146.arnd@arndb.de>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Viresh Kumar <viresh.kumar@linaro.org>, Mark Rutland <Mark.Rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <Catalin.Marinas@arm.com>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Simon Horman <horms@verge>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2013 at 10:48:56AM +0100, Arnd Bergmann wrote:
> On Monday 15 April 2013, Lorenzo Pieralisi wrote:
> > -               "arm,cortex-a9"
> > -               "arm,cortex-a15"
> > -               "arm,arm1136"
> > -               "arm,arm1156"
> > -               "arm,arm1176"
> > -               "arm,arm11mpcore"
> > -               "faraday,fa526"
> > -               "intel,sa110"
> > -               "intel,sa1100"
> > -               "marvell,feroceon"
> > -               "marvell,mohawk"
> > -               "marvell,xsc3"
> > -               "marvell,xscale"
> 
> > +                           "arm,cortex-a9"
> > +                           "arm,cortex-a15"
> > +                           "arm,cortex-a57"
> > +                           "arm,arm1136"
> > +                           "arm,arm1156"
> > +                           "arm,arm1176"
> > +                           "arm,arm11mpcore"
> > +                           "faraday,fa526"
> > +                           "intel,sa110"
> > +                           "intel,sa1100"
> > +                           "marvell,feroceon"
> > +                           "marvell,mohawk"
> > +                           "marvell,xsc3"
> > +                           "marvell,xscale"
> 
> I see you are adding cortex-a57 here, but there are actually a couple
> of other cores that we could add here. It also makes sense to sort these
> alphanumerically I think, and move arm10 after arm9, as well as arm11
> before cortex.

Ok, I will do that.

> The ones that I find missing but actually used are:
> 
> 	"arm,cortex-a53"
> 	"arm,cortex-m0"
> 	"arm,cortex-m0+"
> 	"arm,cortex-m1"
> 	"arm,cortex-m3"
> 	"arm,cortex-m4"
> 	"arm,cortex-r4"
> 	"arm,cortex-r5"
> 	"arm,cortex-r7"
> 	"marvell,pj4"
> 	"qcom,scorpion"
> 	"qcom,krait"

Ok, I will add them, but we should probably enforce a policy regulating
how this binding should be updated in the future.

> 
> There are also a number of faraday cores that we don't support in
> Linux (fa626, fa626te, fa726te, ...), not sure if we should attempt to
> list them all here. The only one that is being worked on at the moment
> is based on fa526.

That's why it is the only one in the list, not sure what we should do either.

> There are also a number of 64 bit cores that other companies have announced,
> but I'm not sure if the names are final yet.

On a side note, as far as the in-kernel dts updates are concerned, how would
you like me to split them ? per-mach ? per-SoC ?

Thank you very much,
Lorenzo
