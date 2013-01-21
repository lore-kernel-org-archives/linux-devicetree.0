From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/6] arm: kconfig: don't select TWD with local timer for
 Armada 370/XP
Date: Mon, 21 Jan 2013 18:31:45 +0000
Message-ID: <201301211831.45947.arnd@arndb.de>
References: <1358790842-2986-1-git-send-email-gregory.clement@free-electrons.com>
 <1358790842-2986-4-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1358790842-2986-4-git-send-email-gregory.clement@free-electrons.com>
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
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, John Stultz <johnstul@us.ibm.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Chris Van Hoof <vanhoof@canonical.com>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Nadav Haklai <nadavh@marvell>
List-Id: devicetree@vger.kernel.org

On Monday 21 January 2013, Gregory CLEMENT wrote:
> @@ -1624,7 +1624,7 @@ config LOCAL_TIMERS
>         bool "Use local timer interrupts"
>         depends on SMP
>         default y
> -       select HAVE_ARM_TWD if (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT)
> +       select HAVE_ARM_TWD if (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT && !ARMADA_370_XP_TIMER)
>         

Your change is fine, but I just noticed that this line is asking for trouble
when we enable multipleform support for MSM and/or EXYNOS.

Also, I wonder if we should change this somehow in 3.8, because it seems
that for a multiplatform kernel including armadaxp and e.g. versatile express,
you have no ARM_TWD support in the kernel, which seems wrong. Is there any
reason we can't enable the ARM_TWD code to be built-in on platforms that
don't use it?

Maybe it can be written as

config LOCAL_TIMERS
	bool "Use local timer interrupts"
	depends on SMP
	default y

config HAVE_ARM_TWD
	depends on LOCAL_TIMERS
	default ARCH_MULTIPLATFORM || (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT)
	default y

This will still be slightly wrong (generating extra code) on a multiplatform
kernel that has no platform other than MSM or EXYNOS, but the other alternative
would be that each platform with TWD support has to select HAVE_ARM_TWD itself.

	Arnd
