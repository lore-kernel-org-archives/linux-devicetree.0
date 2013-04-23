From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH v2 00/13] ARM: DT cpu bindings updates
Date: Tue, 23 Apr 2013 10:34:49 +0100
Message-ID: <20130423093449.GD22946@e102568-lin.cambridge.arm.com>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20130422164112.GB3076@mudshark.cambridge.arm.com>
 <20130422180057.GB17071@e102568-lin.cambridge.arm.com>
 <201304222118.41262.arnd@arndb.de>
 <20130423090942.GA17593@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130423090942.GA17593@mudshark.cambridge.arm.com>
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
To: Will Deacon <will.deacon@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Rutland <Mark.Rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, rob.
List-Id: devicetree@vger.kernel.org

On Tue, Apr 23, 2013 at 10:09:43AM +0100, Will Deacon wrote:
> Hi Lorenzo,
> 
> On Mon, Apr 22, 2013 at 08:18:41PM +0100, Arnd Bergmann wrote:
> > On Monday 22 April 2013, Lorenzo Pieralisi wrote:
> > > > Thoughts? I notice Catalin has some patches queued for arm64 which
> > > > unconditionally use of_property_read_u64, but I have a patch to honour the
> > > > #address-cells property instead.
> > > 
> > > Basically you want me to rule out passing a dtb with cpus node having
> > > #address-cells == 2 to a 32-bit kernel, correct ? Or put it another way:
> 
> No, I'm not proposing that! I don't see why we couldn't make the same change
> for 32-bit kernels and honour the address-cells field there too.

Ok, that was a misunderstanding. I do honour the address-cells field in
the arm32 kernel, but there is code that does not and must be fixed (or
removed, I have to knock together an RFC to do that or ping the authors
and let them do it).

> > > - a 32-bit kernel must always get passed a dtb with cpus node
> > >   #address-cells == 1. 
> > 
> > Why that? For other registers, we allow leading zeroes. This is
> > already required for MMIO registers on LPAE capable machines.
> 
> Indeed, we should probably allow any old #address-cells and parse the reg
> property accordingly. Of course, if any bits above bit 31 are non-zero, then
> we should complain loudly on an AArch32 system.

That's what I do, but again there is code that does not check that and
honestly what I would like to do is parsing the reg property once for
all at cpu_logical_map init time to avoid reg property parsing proliferation
in the kernel.

> > >   If the system is ARMv8 with CPUs having
> > >   MPIDR_EL1[63:32] != 0x0, well, running 32-bit kernel on it is not
> > >   the safest thing to do anyway.
> > 
> > I would assume the hypervisor to provide a virtual MPIDR_EL1 for
> > a 32 bit kernel in that case.
> 
> Correct, but that doesn't help with the bare-metal/host case (where we will
> need to scream, as described above).
> 
> Also, when I mentioned the mpidr check, I was just referring to the boot
> CPU -- you're right about the secondaries.

Ok, that's agreed.

Thanks,
Lorenzo
