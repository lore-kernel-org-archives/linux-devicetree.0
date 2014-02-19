From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 1/7] Documentation: Add device tree bindings for
 Freescale i.MX GPC
Date: Wed, 19 Feb 2014 15:38:08 +0100
Message-ID: <201402191538.08507.arnd@arndb.de>
References: <1392737687-25003-1-git-send-email-p.zabel@pengutronix.de>
 <2328803.HhaG6blXIR@wuerfel>
 <1392802255.3445.18.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1392802255.3445.18.camel@pizza.hi.pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 19 February 2014, Philipp Zabel wrote:

> Am Dienstag, den 18.02.2014, 19:10 +0100 schrieb Arnd Bergmann:
> > On Tuesday 18 February 2014 16:34:41 Philipp Zabel wrote:
> > > +
> > > +Example of a device that is part of a power domain:
> > > +
> > > +       vpu: vpu@02040000 {
> > > +               reg = <0x02040000 0x3c000>;
> > > +               /* ... */
> > > +               fsl,power-domain = <&pd_pu>;
> > > +               /* ... */
> > > +       };
> > > +
> > 
> > I'm really not too happy about platforms starting to add random
> > bindings for power domains. Unfortunately I didn't catch exynos
> > doing this first, but I don't want to see another platform like
> > that.
> > 
> > Can we please come up with a proper generic power domain binding
> > first and then add platform specific users?
> 
> what is the process here? I've seen the samsung bindings and copied the
> pattern. I guess the Exynos bindings are set in stone, and the i.MX
> power domains can be handled using the same bindings.

* First of all, get the pm domain maintainers into the loop, then make
  sure all other users of pm domains are aware of what you are doing.

* Come up with a way to describe a pm_domain in a sufficiently generic
  way. It's possible you just need a phandle, but experience on other
  subsystems suggests that it helps to allow arguments, as we do for
  clocks, dmas, mailboxes, etc.

* Draft a generic binding that can work on all platforms

* Implement support for the generic binding in the platform independent
  code.

* Add a specific binding for your hardware.

* Implement support for your hardware binding on top of the generic
  code.

* Get everyone involved to Ack the generic binding and implementation.

	Arnd
