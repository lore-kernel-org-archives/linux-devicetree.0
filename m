From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v3 1/5] ARM: kernel: smp_setup_processor_id() updates
Date: Thu, 15 Nov 2012 14:18:09 +0000
Message-ID: <20121115141808.GA23513@e102568-lin.cambridge.arm.com>
References: <1352983614-22924-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1352983614-22924-2-git-send-email-lorenzo.pieralisi@arm.com>
 <20121115134951.GF5570@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121115134951.GF5570@mudshark.cambridge.arm.com>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <Will.Deacon@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Martin <dave.martin@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Magnus Damm <magnus.damm@gmail.com>, Amit Kucheria <amit.kucheria@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, vincent.guittot@linaro.org, David Brown <davidb@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

[CC'ed Vincent following MPIDR mask query]

On Thu, Nov 15, 2012 at 01:49:51PM +0000, Will Deacon wrote:
> On Thu, Nov 15, 2012 at 12:46:50PM +0000, Lorenzo Pieralisi wrote:
> > This patch applies some basic changes to the smp_setup_processor_id()
> > ARM implementation to make the code that builds cpu_logical_map more
> > uniform across the kernel.
> > 
> > The function now prints the full extent of the boot CPU MPIDR[23:0] and
> > initializes the cpu_logical_map for CPUs up to nr_cpu_ids.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > ---
> >  arch/arm/kernel/setup.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> > index da1d1aa..d0df6c8 100644
> > --- a/arch/arm/kernel/setup.c
> > +++ b/arch/arm/kernel/setup.c
> > @@ -426,13 +426,14 @@ int __cpu_logical_map[NR_CPUS];
> >  void __init smp_setup_processor_id(void)
> >  {
> >  	int i;
> > -	u32 cpu = is_smp() ? read_cpuid_mpidr() & 0xff : 0;
> > +	u32 mpidr = is_smp() ? read_cpuid_mpidr() & 0xffffff : 0;
> > +	u32 cpu = mpidr & 0xff;
> 
> Can we move the #defines out of topology.c and use those instead of magic
> masks please? You could use MPIDR_HWID_BITMASK, although the LEVEL mask
> definitions over there don't look right to me (MPIDR_LEVEL0_MASK is 0x3?)

Yes, I should have done that, you are right. LEVEL0 and LEVEL1 masks look
wrong to me.

#define MPIDR_LEVEL0_MASK 0x3
#define MPIDR_LEVEL1_MASK 0xF

Vincent, why are they defined with those values ? They should all be
defined as 0xFF.

I will fix them and move them to a header file.

Thanks,
Lorenzo
