From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH v2 00/13] ARM: DT cpu bindings updates
Date: Mon, 22 Apr 2013 21:18:41 +0200
Message-ID: <201304222118.41262.arnd@arndb.de>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20130422164112.GB3076@mudshark.cambridge.arm.com>
 <20130422180057.GB17071@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130422180057.GB17071@e102568-lin.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Amit Kucheria <amit.kucheria@linaro.org>, Mark Rutland <Mark.Rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Stephen Warren <swarren@wwwdotorg.org>, Sekhar Nori <nsekhar@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Monday 22 April 2013, Lorenzo Pieralisi wrote:
> > Thoughts? I notice Catalin has some patches queued for arm64 which
> > unconditionally use of_property_read_u64, but I have a patch to honour the
> > #address-cells property instead.
> 
> Basically you want me to rule out passing a dtb with cpus node having
> #address-cells == 2 to a 32-bit kernel, correct ? Or put it another way:
> 
> - a 32-bit kernel must always get passed a dtb with cpus node
>   #address-cells == 1. 

Why that? For other registers, we allow leading zeroes. This is
already required for MMIO registers on LPAE capable machines.

>   If the system is ARMv8 with CPUs having
>   MPIDR_EL1[63:32] != 0x0, well, running 32-bit kernel on it is not
>   the safest thing to do anyway.

I would assume the hypervisor to provide a virtual MPIDR_EL1 for
a 32 bit kernel in that case.

	Arnd
