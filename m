From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/6] arm: kconfig: don't select TWD with local timer for
 Armada 370/XP
Date: Mon, 21 Jan 2013 20:44:41 +0000
Message-ID: <201301212044.41865.arnd@arndb.de>
References: <1358790842-2986-1-git-send-email-gregory.clement@free-electrons.com>
 <201301211831.45947.arnd@arndb.de>
 <CAKGA1b=9WQNwHOz=k13XVc=MyZT1UrcaYj8muF2A5B4eJA5+MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAKGA1b=9WQNwHOz=k13XVc=MyZT1UrcaYj8muF2A5B4eJA5+MA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Sealey <matt@genesi-usa.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, John Stultz <johnstul@us.ibm.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Nadav Haklai <nadavh@marvell.com>, Jon Masters <jcm@redhat.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM Kernel ML <linux-arm-k>
List-Id: devicetree@vger.kernel.org

On Monday 21 January 2013, Matt Sealey wrote:
> On Mon, Jan 21, 2013 at 12:31 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Monday 21 January 2013, Gregory CLEMENT wrote:
> >> @@ -1624,7 +1624,7 @@ config LOCAL_TIMERS
> >>         bool "Use local timer interrupts"
> >>         depends on SMP
> >>         default y
> >> -       select HAVE_ARM_TWD if (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT)
> >> +       select HAVE_ARM_TWD if (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT && !ARMADA_370_XP_TIMER)
> >>
> >
> > Maybe it can be written as
> >
> > config LOCAL_TIMERS
> >         bool "Use local timer interrupts"
> >         depends on SMP
> >         default y
> >
> > config HAVE_ARM_TWD
> >         depends on LOCAL_TIMERS
> >         default ARCH_MULTIPLATFORM || (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT)
> >         default y
> >
> > This will still be slightly wrong (generating extra code) on a multiplatform
> > kernel that has no platform other than MSM or EXYNOS, but the other alternative
> > would be that each platform with TWD support has to select HAVE_ARM_TWD itself.
> 
> Why would having each platform with TWD support select HAVE_ARM_TWD be
> a problem?

Not a big one, it's just one more Kconfig line for each of a large number
of platforms in the long run.

> On multiplatform kernels where at least one arch has TWD support, it
> will be included, and where not, it will not.
> 
> It doesn't seem logical for a feature descriptor (HAVE_ARM_TWD) to
> rely on greater knowledge of what platforms may or may not support it.
> If we had to include every platform in that list it would be unwieldy.

I would expect that all future platforms have ARM_TWD, so the list
of the platforms that don't is not going to grow much, but the list
of platforms that do will keep growing.

> Which leads me to this; I wonder if there should be a policy document
> that basically describes what HAVE_* really is meant for, and how
> dependencies on ARCH_* (or MACH_* in the world of multiplatform)
> should be handled for architectural features? That way there's a
> little more fixed definition of how Kconfigs should be written to
> effectively support multiplatform kernels and allow people to identify
> misuses and get rid of them for multiplatform, if only just to get the
> information out of the heads of maintainers and into a file somewhere
> that we can reference... maybe it exists already but I am missing it?

Documentation is generally considered a good thing, but few people
can be bothered to write it, and few of the other people that should
read it actually do.

To some extent this problem will improve over time for the ARM
multiplatform support as we find all the bugs like this one
and fix them.

	Arnd
