From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/6] arm: kconfig: don't select TWD with local timer for
 Armada 370/XP
Date: Tue, 22 Jan 2013 21:19:23 +0000
Message-ID: <201301222119.23750.arnd@arndb.de>
References: <1358790842-2986-1-git-send-email-gregory.clement@free-electrons.com>
 <201301212044.41865.arnd@arndb.de> <50FEFAB9.4030503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50FEFAB9.4030503@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Matt Sealey <matt@genesi-usa.com>, Nadav Haklai <nadavh@marvell.com>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, John Stultz <johnstul@us.ibm.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Jon Masters <jcm@redhat.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM Kernel ML <linux-arm-kernel@lists.infradead.org>, Chris Van Hoof <vanhoof@canonical.c>
List-Id: devicetree@vger.kernel.org

On Tuesday 22 January 2013, Rob Herring wrote:
> No, I expect all future platforms will have architected timers. TWD is
> pretty much A9 and A5 only I believe. Same with SCU. I've probably
> missed some in my list.

Ah, I was incorrectly assuming that TWD was referring to the architected
timers, sorry about that.

Maybe we should do this differently then and do the more logical

config LOCAL_TIMERS
	bool

config ARM_TWD
	bool "ARM TWD local timer"
	depends on SMP && CPU_V7
	select LOCAL_TIMERS

config EXYNOS4_MCT
	bool "Samsung Exynos4 MCT Timer"
	depends on SMP && ARCH_EXYNOS
	select LOCAL_TIMERS

config MSM_LOCAL_TIMER
	bool "Qualcomm MSM Local Timer"
	depends on SMP && ARCH_MSM
	select LOCAL_TIMERS

That way we have no implicit assumptions. Everything will still work if you
disable local timers, but of course we will enable them in the defconfigs.

	Arnd
