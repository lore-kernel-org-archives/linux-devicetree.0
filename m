From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: kernel: fix __cpu_logical_map default
 initialization
Date: Thu, 16 May 2013 17:23:33 +0100
Message-ID: <20130516162332.GA19375@e102568-lin.cambridge.arm.com>
References: <1368718447-19209-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1368718447-19209-4-git-send-email-lorenzo.pieralisi@arm.com>
 <20130516155038.GK11706@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130516155038.GK11706-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 16, 2013 at 04:50:38PM +0100, Will Deacon wrote:
> On Thu, May 16, 2013 at 04:34:07PM +0100, Lorenzo Pieralisi wrote:
> > For legacy reasons, the __cpu_logical_map array is initialized to 0.
> > On old pre-DT ARM platforms, smp_setup_processor_id() generates
> > __cpu_logical_map entries at boot before the number of possible CPUs is
> > set-up, with values that can be considered valid MPIDRs even if they are
> > not present in the system booting; this implies that the __cpu_logical_map[]
> > might end up containing MPIDR values that can be considered valid at logical
> > indexes corresponding to CPUs that are not marked as possible.
> > 
> > To prevent issues with the current implementation, this patch defines an
> > MPIDR_INVALID value, statically initializes the __cpu_logical_map[] array to it
> > and allows DT parsing code to overwrite values in the __cpu_logical_map array
> > that were erroneously set-up in smp_setup_processor_id().
> 
> What issues have you actually hit with this?

I have not hit any, I just thought it would be proper to have the
cpu_logical_map filled with only valid (ie present in HW) MPIDRs (and
by default initialized with MPIDR_INVALID, not 0s which are valid MPIDRs).

I wrote the patch while coding the MPIDR to logical CPU reverse look-up
for the CCI driver and noticed that, if for any reason we do not
constrain the look-up to possible cpus, we might get a logical index
for a CPU that does not exist since smp_setup_processor_id() initializes
the cpu_logical_map up to nr_cpu_ids, with values that might well be
real MPIDRs (but not present in HW).

If we pass an mpidr value to get_logical_index(), that function must not
return a logical index for an MPIDR that does not exist in HW. This can
happen with current code (but I do not think anyone will ever call
get_logical_index() with a mpidr value that has not been read from a CPU
coprocessor, so what I am saying is purely hypothetical).
True, we might check the return value is actually a CPU marked as possible,
provided that check is safe to carry out in low-level PM code where it is
likely to be used.

Overall it can be overkill, granted, it was just meant to clean-up the code,
no more than that.

> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > CC: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  arch/arm/include/asm/cputype.h  |  2 ++
> >  arch/arm/include/asm/smp_plat.h |  2 +-
> >  arch/arm/kernel/devtree.c       | 10 ++++++----
> >  arch/arm/kernel/setup.c         |  2 +-
> >  4 files changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm/include/asm/cputype.h b/arch/arm/include/asm/cputype.h
> > index 7652712..dba62cb 100644
> > --- a/arch/arm/include/asm/cputype.h
> > +++ b/arch/arm/include/asm/cputype.h
> > @@ -32,6 +32,8 @@
> >  
> >  #define MPIDR_HWID_BITMASK 0xFFFFFF
> >  
> > +#define MPIDR_INVALID (~MPIDR_HWID_BITMASK)
> > +
> >  #define MPIDR_LEVEL_BITS 8
> >  #define MPIDR_LEVEL_MASK ((1 << MPIDR_LEVEL_BITS) - 1)
> >  
> > diff --git a/arch/arm/include/asm/smp_plat.h b/arch/arm/include/asm/smp_plat.h
> > index aaa61b6..e789832 100644
> > --- a/arch/arm/include/asm/smp_plat.h
> > +++ b/arch/arm/include/asm/smp_plat.h
> > @@ -49,7 +49,7 @@ static inline int cache_ops_need_broadcast(void)
> >  /*
> >   * Logical CPU mapping.
> >   */
> > -extern int __cpu_logical_map[];
> > +extern u32 __cpu_logical_map[];
> >  #define cpu_logical_map(cpu)	__cpu_logical_map[cpu]
> >  /*
> >   * Retrieve logical cpu index corresponding to a given MPIDR[23:0]
> > diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> > index d2293c0..08f012e 100644
> > --- a/arch/arm/kernel/devtree.c
> > +++ b/arch/arm/kernel/devtree.c
> > @@ -79,12 +79,12 @@ void __init arm_dt_init_cpu_maps(void)
> >  	 * read as 0.
> >  	 */
> >  	static u32 tmp_map[NR_CPUS] __initdata = {
> > -				[0 ... NR_CPUS-1] = UINT_MAX };
> > +				[0 ... NR_CPUS-1] = MPIDR_INVALID };
> >  	struct device_node *cpu, *cpus;
> >  	u32 i, j, cpuidx = 1;
> >  	u32 mpidr = is_smp() ? read_cpuid_mpidr() & MPIDR_HWID_BITMASK : 0;
> > -
> >  	bool bootcpu_valid = false;
> > +
> 
> Random whitespace change.

Gah, sorry.

Thanks for having a look,
Lorenzo
