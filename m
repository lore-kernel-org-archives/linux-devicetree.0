From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] ARM: kernel: DT cpu map validity check helper function
Date: Fri, 11 Jan 2013 10:03:10 +0000
Message-ID: <20130111100309.GB30538@e102568-lin.cambridge.arm.com>
References: <1357818507-8716-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20130110121514.GD29952@linaro.org>
 <20130110123321.GD4728@e102568-lin.cambridge.arm.com>
 <alpine.LFD.2.02.1301101115350.6300@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.LFD.2.02.1301101115350.6300@xanadu.home>
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
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Dave Martin <dave.martin@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Tony Lindgren <tony@atomide.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Magnus Damm <magnus.damm@gmail.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, David Brown <davidb@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2013 at 04:16:43PM +0000, Nicolas Pitre wrote:
> On Thu, 10 Jan 2013, Lorenzo Pieralisi wrote:
> 
> > On Thu, Jan 10, 2013 at 12:15:14PM +0000, Dave Martin wrote:
> > > On Thu, Jan 10, 2013 at 11:48:27AM +0000, Lorenzo Pieralisi wrote:
> > > > Since the introduction of /cpu nodes bindings for ARM and the
> > > > corresponding parse function arm_dt_init_cpu_maps(), the cpu_logical_map
> > > > and the number of possible CPUs are set according to the DT /cpu
> > > > nodes entries. Currently most of the existing ARM SMP platforms detect the
> > > > number of cores through HW probing in their .smp_init_cpus functions and set
> > > > the possible CPU mask accordingly.
> > > > This method should be upgraded so that the CPU counting mechanism will be
> > > > based on DT, keeping legacy HW probing mechanism as a fall back solution.
> > > > 
> > > > In order to implement this fall back solution mechanism, the ARM DT code
> > > > should provide a helper function to platforms to check if the cpu map
> > > > has been properly initialized through DT. If the check fails the
> > > > platform will resort to legacy HW based cores counting mechanism.
> > > > 
> > > > This patch implements a trivial flag and a helper function that platform
> > > > can call to check whether DT based cpu map initialization and cores count
> > > > were completed successfully.
> > > > 
> > > > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > > > ---
> > > >  arch/arm/include/asm/prom.h | 10 ++++++++++
> > > >  arch/arm/kernel/devtree.c   |  5 +++++
> > > >  2 files changed, 15 insertions(+)
> > > > 
> > > > diff --git a/arch/arm/include/asm/prom.h b/arch/arm/include/asm/prom.h
> > > > index a219227..487614a 100644
> > > > --- a/arch/arm/include/asm/prom.h
> > > > +++ b/arch/arm/include/asm/prom.h
> > > > @@ -18,6 +18,15 @@
> > > >  extern struct machine_desc *setup_machine_fdt(unsigned int dt_phys);
> > > >  extern void arm_dt_memblock_reserve(void);
> > > >  extern void __init arm_dt_init_cpu_maps(void);
> > > > +/*
> > > > + * Return true if cpu map initialization has been
> > > > + * carried out correctly from DT
> > > > + */
> > > > +static inline bool __init arm_dt_cpu_map_valid(void)
> > > > +{
> > > > +	extern bool valid_dt_cpu_map;
> > > > +	return valid_dt_cpu_map;
> > > > +}
> > > >  
> > > >  #else /* CONFIG_OF */
> > > >  
> > > > @@ -28,6 +37,7 @@ static inline struct machine_desc *setup_machine_fdt(unsigned int dt_phys)
> > > >  
> > > >  static inline void arm_dt_memblock_reserve(void) { }
> > > >  static inline void arm_dt_init_cpu_maps(void) { }
> > > > +static inline bool __init arm_dt_cpu_map_valid(void) { return false; }
> > > >  
> > > >  #endif /* CONFIG_OF */
> > > >  #endif /* ASMARM_PROM_H */
> > > > diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> > > > index 70f1bde..c82af3b 100644
> > > > --- a/arch/arm/kernel/devtree.c
> > > > +++ b/arch/arm/kernel/devtree.c
> > > > @@ -62,6 +62,10 @@ void __init arm_dt_memblock_reserve(void)
> > > >  		memblock_reserve(base, size);
> > > >  	}
> > > >  }
> > > > +/*
> > > > + * Export DT cpu map validity flag to platforms
> > > > + */
> > > > +bool valid_dt_cpu_map __initdata;
> > > 
> > > Is there any possibility of this being useful after boot?
> > > Hopefully not, but maybe there's something I haven't considered.
> > 
> > I do not think so, at least for the use cases I have envisaged at the moment,
> > but it is certainly something I should consider.
> 
> Let's simply adjust the code in the future if that ever becomes the 
> case.

I will check against cpu_possible_mask, that will solve the problem and
avoid this niggle.

Thanks,
Lorenzo
