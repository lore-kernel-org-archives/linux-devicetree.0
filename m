From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/6] arm: kconfig: don't select TWD with local timer for
 Armada 370/XP
Date: Tue, 22 Jan 2013 15:57:02 +0000
Message-ID: <201301221557.02976.arnd@arndb.de>
References: <1358790842-2986-1-git-send-email-gregory.clement@free-electrons.com>
 <201301211831.45947.arnd@arndb.de> <50FDC322.2040107@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50FDC322.2040107@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, John Stultz <johnstul@us.ibm.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Nadav Haklai <nadavh@marvell.com>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical>
List-Id: devicetree@vger.kernel.org

On Monday 21 January 2013, Gregory CLEMENT wrote:
> I don't see a strong reason to not enable it if we don't use it. My concern
> was that I don't need it so I didn't want to include it and generating extra
> code for nothing. Then just after having sent this patch set, I received your
> patch set about build regression in 3.8 and especially the part about
> CONFIG_MULTIPLATFORM made me realized that it could be a problem.

Ok.

> > Maybe it can be written as
> > 
> > config LOCAL_TIMERS
> >       bool "Use local timer interrupts"
> >       depends on SMP
> >       default y
> > 
> > config HAVE_ARM_TWD
> >       depends on LOCAL_TIMERS
> >       default ARCH_MULTIPLATFORM || (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT)
> 
> So in this case why not written something like this:
>         default ARCH_MULTIPLATFORM || (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT && !ARMADA_370_XP_TIMER)

That does not change anything, because ARMADA_370_XP_TIMER is only ever enabled
when ARCH_MULTIPLATFORM is enabled as well.

> >       default y
> I am not a kconfig expert, but won't this line set HAVE_ARM_TWD to 'y' whatever
> the result of the previous line?

Yes, that was a mistake on my side.

	Arnd
