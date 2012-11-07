From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH 1/4] ARM: kernel: add device tree init map function
Date: Wed, 7 Nov 2012 12:00:52 +0000
Message-ID: <20121107120052.GD17831@e102568-lin.cambridge.arm.com>
References: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1350393709-23546-2-git-send-email-lorenzo.pieralisi@arm.com>
 <20121106215044.GB21764@mudshark.cambridge.arm.com>
 <20121107102349.GC17831@e102568-lin.cambridge.arm.com>
 <20121107110542.GH23305@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121107110542.GH23305@mudshark.cambridge.arm.com>
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
To: Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Martin <dave.martin@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Amit Kucheria <amit.kucheria@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Brown <davidb@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 07, 2012 at 11:05:42AM +0000, Will Deacon wrote:
> On Wed, Nov 07, 2012 at 10:23:49AM +0000, Lorenzo Pieralisi wrote:
> > On Tue, Nov 06, 2012 at 09:50:44PM +0000, Will Deacon wrote:
> > > > +	while ((dn = of_find_node_by_type(dn, "cpu")) && cpu <= nr_cpu_ids) {
> > > > +		const u32 *hwid;
> > > > +		int len;
> > > > +
> > > > +		pr_debug("  * %s...\n", dn->full_name);
> > > > +
> > > > +		hwid = of_get_property(dn, "reg", &len);
> > > > +
> > > > +		if (!hwid || len != 4) {
> > > > +			pr_err("  * %s missing reg property\n", dn->full_name);
> > > > +			continue;
> > > > +		}
> > > > +		/*
> > > > +		 * We want to assign the boot CPU logical id 0.
> > > > +		 * Boot CPU checks its own MPIDR and if matches the current
> > > > +		 * cpu node "reg" value it sets the logical cpu index to 0
> > > > +		 * and stores the physical id accordingly.
> > > > +		 * If MPIDR does not match, assign sequential cpu logical
> > > > +		 * id (starting from 1) and increments it.
> > > > +		 */
> > > > +		i = (be32_to_cpup(hwid) == (read_cpuid_mpidr() & 0xffffff))
> > > > +							? 0 : cpu++;
> > > > +
> > > > +		if (!i)
> > > > +			printk(KERN_INFO "Booting Linux on CPU HWID 0x%x\n",
> > > > +					be32_to_cpup(hwid));
> > > 
> > > I don't think we should bother with this print -- we already print something
> > > in smp_setup_processor_id, which cannot differ for the boot CPU, If you want
> > > the full mpidr, we could change that code to include it as well.
> > 
> > Yes, it is duplicate code, I will remove it. Extending the printk in
> > smp_setup_processor_id() to include the entire MPIDR should be done
> > though, otherwise we might have printk aliases on system with multiple
> > clusters.
> 
> Feel free to make that change. You could also replace NR_CPUS in
> smp_setup_processor_id with nr_cpu_ids for consistency (they'll be the same
> this early on).

Ok.

> > > We might also want some sanity checking that we do indeed end up with
> > > logical id 0 for the boot CPU. If not, I think we should scream and fall
> > > back on the simple mapping created earlier.
> > 
> > Well, this basically means that we have to make sure this function is
> > executed on the boot CPU (and it is as the code stands now), right ?
> 
> Yes, smp is not up yet which is why we're allowed to play with the logical
> map.
> 
> > Since we are reading the MPIDR of the CPU parsing the tree and assign logical
> > cpu 0 accordingly I think we have this check carried out automatically,
> > unless for any given reason someone calls this function on a CPU that is
> > not the boot one (Why ?).
> > 
> > Basically I could add a check like:
> > 
> > if (WARN_ON(smp_processor_id())
> > 	return;
> > 
> > to fall back to the previous mapping, but that's overkill IMHO.
> 
> No, I was thinking about what happens if the devicetree doesn't contain an
> mpidr property that matches the boot cpu. In this case, we will fail to
> assign logical ID 0, right? If this happens, we should complain about an
> invalid devicetree and try to fall back on the logical_map that was
> generated earlier on.

Good point. What I could do, I can assign the MPIDR of the boot CPU to
the logical index 0 before even starting to parse the DT (that's what it
is done in smp_setup_processor_id(), with a couple of twists). Then, if I
find a node that matches the boot CPU mpidr I just skip over it. This
way the boot CPU MPIDR will always be correct the only difference with
the current approach will be that instead of generating the secondaries
MPIDRs we will read them from DT.

The problem with this approach is that if we need a pointer (phandle) to the
boot CPU DT node through the MPIDR and the boot CPU node is botched or missing
we still behave as if the DT CPU nodes were ok.

I think I'd better stick a warning condition in there if the boot CPU
node is not present or botched (from a MPIDR perspective at least).

Thoughts ?
Lorenzo
