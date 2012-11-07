From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 1/4] ARM: kernel: add device tree init map function
Date: Wed, 7 Nov 2012 11:05:42 +0000
Message-ID: <20121107110542.GH23305@mudshark.cambridge.arm.com>
References: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1350393709-23546-2-git-send-email-lorenzo.pieralisi@arm.com>
 <20121106215044.GB21764@mudshark.cambridge.arm.com>
 <20121107102349.GC17831@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121107102349.GC17831-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 07, 2012 at 10:23:49AM +0000, Lorenzo Pieralisi wrote:
> On Tue, Nov 06, 2012 at 09:50:44PM +0000, Will Deacon wrote:
> > > +	while ((dn = of_find_node_by_type(dn, "cpu")) && cpu <= nr_cpu_ids) {
> > > +		const u32 *hwid;
> > > +		int len;
> > > +
> > > +		pr_debug("  * %s...\n", dn->full_name);
> > > +
> > > +		hwid = of_get_property(dn, "reg", &len);
> > > +
> > > +		if (!hwid || len != 4) {
> > > +			pr_err("  * %s missing reg property\n", dn->full_name);
> > > +			continue;
> > > +		}
> > > +		/*
> > > +		 * We want to assign the boot CPU logical id 0.
> > > +		 * Boot CPU checks its own MPIDR and if matches the current
> > > +		 * cpu node "reg" value it sets the logical cpu index to 0
> > > +		 * and stores the physical id accordingly.
> > > +		 * If MPIDR does not match, assign sequential cpu logical
> > > +		 * id (starting from 1) and increments it.
> > > +		 */
> > > +		i = (be32_to_cpup(hwid) == (read_cpuid_mpidr() & 0xffffff))
> > > +							? 0 : cpu++;
> > > +
> > > +		if (!i)
> > > +			printk(KERN_INFO "Booting Linux on CPU HWID 0x%x\n",
> > > +					be32_to_cpup(hwid));
> > 
> > I don't think we should bother with this print -- we already print something
> > in smp_setup_processor_id, which cannot differ for the boot CPU, If you want
> > the full mpidr, we could change that code to include it as well.
> 
> Yes, it is duplicate code, I will remove it. Extending the printk in
> smp_setup_processor_id() to include the entire MPIDR should be done
> though, otherwise we might have printk aliases on system with multiple
> clusters.

Feel free to make that change. You could also replace NR_CPUS in
smp_setup_processor_id with nr_cpu_ids for consistency (they'll be the same
this early on).

> > 
> > We might also want some sanity checking that we do indeed end up with
> > logical id 0 for the boot CPU. If not, I think we should scream and fall
> > back on the simple mapping created earlier.
> 
> Well, this basically means that we have to make sure this function is
> executed on the boot CPU (and it is as the code stands now), right ?

Yes, smp is not up yet which is why we're allowed to play with the logical
map.

> Since we are reading the MPIDR of the CPU parsing the tree and assign logical
> cpu 0 accordingly I think we have this check carried out automatically,
> unless for any given reason someone calls this function on a CPU that is
> not the boot one (Why ?).
> 
> Basically I could add a check like:
> 
> if (WARN_ON(smp_processor_id())
> 	return;
> 
> to fall back to the previous mapping, but that's overkill IMHO.

No, I was thinking about what happens if the devicetree doesn't contain an
mpidr property that matches the boot cpu. In this case, we will fail to
assign logical ID 0, right? If this happens, we should complain about an
invalid devicetree and try to fall back on the logical_map that was
generated earlier on.

Will
