From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH 1/4] ARM: kernel: add device tree init map function
Date: Wed, 7 Nov 2012 10:23:49 +0000
Message-ID: <20121107102349.GC17831@e102568-lin.cambridge.arm.com>
References: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1350393709-23546-2-git-send-email-lorenzo.pieralisi@arm.com>
 <20121106215044.GB21764@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121106215044.GB21764@mudshark.cambridge.arm.com>
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

Hi Will,

thanks for the review on the series.

On Tue, Nov 06, 2012 at 09:50:44PM +0000, Will Deacon wrote:
> On Tue, Oct 16, 2012 at 02:21:45PM +0100, Lorenzo Pieralisi wrote:
> > When booting through a device tree, the kernel cpu logical id map can be
> > initialized using device tree data passed by FW or through an embedded blob.
> > 
> > This patch adds a function that parses device tree "cpu" nodes and
> > retrieves the corresponding CPUs hardware identifiers (MPIDR).
> > It sets the possible cpus and the cpu logical map values according to
> > the number of CPUs defined in the device tree and respective properties.
> > 
> > The primary CPU is assigned cpu logical number 0 to keep the current
> > convention valid.
> > 
> > Current bindings documentation is included in the patch:
> > 
> > Documentation/devicetree/bindings/arm/cpus.txt
> > 
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> 
> [...]
> 
> > +void __init arm_dt_init_cpu_maps(void)
> > +{
> > +	struct device_node *dn = NULL;
> > +	int i, cpu = 1;
> > +
> > +	while ((dn = of_find_node_by_type(dn, "cpu")) && cpu <= nr_cpu_ids) {
> > +		const u32 *hwid;
> > +		int len;
> > +
> > +		pr_debug("  * %s...\n", dn->full_name);
> > +
> > +		hwid = of_get_property(dn, "reg", &len);
> > +
> > +		if (!hwid || len != 4) {
> > +			pr_err("  * %s missing reg property\n", dn->full_name);
> > +			continue;
> > +		}
> > +		/*
> > +		 * We want to assign the boot CPU logical id 0.
> > +		 * Boot CPU checks its own MPIDR and if matches the current
> > +		 * cpu node "reg" value it sets the logical cpu index to 0
> > +		 * and stores the physical id accordingly.
> > +		 * If MPIDR does not match, assign sequential cpu logical
> > +		 * id (starting from 1) and increments it.
> > +		 */
> > +		i = (be32_to_cpup(hwid) == (read_cpuid_mpidr() & 0xffffff))
> > +							? 0 : cpu++;
> > +
> > +		if (!i)
> > +			printk(KERN_INFO "Booting Linux on CPU HWID 0x%x\n",
> > +					be32_to_cpup(hwid));
> 
> I don't think we should bother with this print -- we already print something
> in smp_setup_processor_id, which cannot differ for the boot CPU, If you want
> the full mpidr, we could change that code to include it as well.

Yes, it is duplicate code, I will remove it. Extending the printk in
smp_setup_processor_id() to include the entire MPIDR should be done
though, otherwise we might have printk aliases on system with multiple
clusters.

> 
> We might also want some sanity checking that we do indeed end up with
> logical id 0 for the boot CPU. If not, I think we should scream and fall
> back on the simple mapping created earlier.

Well, this basically means that we have to make sure this function is
executed on the boot CPU (and it is as the code stands now), right ?

Since we are reading the MPIDR of the CPU parsing the tree and assign logical
cpu 0 accordingly I think we have this check carried out automatically,
unless for any given reason someone calls this function on a CPU that is
not the boot one (Why ?).

Basically I could add a check like:

if (WARN_ON(smp_processor_id())
	return;

to fall back to the previous mapping, but that's overkill IMHO.

Thanks,
Lorenzo
