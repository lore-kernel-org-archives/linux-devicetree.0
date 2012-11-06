From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 1/4] ARM: kernel: add device tree init map function
Date: Tue, 6 Nov 2012 21:50:44 +0000
Message-ID: <20121106215044.GB21764@mudshark.cambridge.arm.com>
References: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1350393709-23546-2-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1350393709-23546-2-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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

On Tue, Oct 16, 2012 at 02:21:45PM +0100, Lorenzo Pieralisi wrote:
> When booting through a device tree, the kernel cpu logical id map can be
> initialized using device tree data passed by FW or through an embedded blob.
> 
> This patch adds a function that parses device tree "cpu" nodes and
> retrieves the corresponding CPUs hardware identifiers (MPIDR).
> It sets the possible cpus and the cpu logical map values according to
> the number of CPUs defined in the device tree and respective properties.
> 
> The primary CPU is assigned cpu logical number 0 to keep the current
> convention valid.
> 
> Current bindings documentation is included in the patch:
> 
> Documentation/devicetree/bindings/arm/cpus.txt
> 
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>

[...]

> +void __init arm_dt_init_cpu_maps(void)
> +{
> +	struct device_node *dn = NULL;
> +	int i, cpu = 1;
> +
> +	while ((dn = of_find_node_by_type(dn, "cpu")) && cpu <= nr_cpu_ids) {
> +		const u32 *hwid;
> +		int len;
> +
> +		pr_debug("  * %s...\n", dn->full_name);
> +
> +		hwid = of_get_property(dn, "reg", &len);
> +
> +		if (!hwid || len != 4) {
> +			pr_err("  * %s missing reg property\n", dn->full_name);
> +			continue;
> +		}
> +		/*
> +		 * We want to assign the boot CPU logical id 0.
> +		 * Boot CPU checks its own MPIDR and if matches the current
> +		 * cpu node "reg" value it sets the logical cpu index to 0
> +		 * and stores the physical id accordingly.
> +		 * If MPIDR does not match, assign sequential cpu logical
> +		 * id (starting from 1) and increments it.
> +		 */
> +		i = (be32_to_cpup(hwid) == (read_cpuid_mpidr() & 0xffffff))
> +							? 0 : cpu++;
> +
> +		if (!i)
> +			printk(KERN_INFO "Booting Linux on CPU HWID 0x%x\n",
> +					be32_to_cpup(hwid));

I don't think we should bother with this print -- we already print something
in smp_setup_processor_id, which cannot differ for the boot CPU, If you want
the full mpidr, we could change that code to include it as well.

We might also want some sanity checking that we do indeed end up with
logical id 0 for the boot CPU. If not, I think we should scream and fall
back on the simple mapping created earlier.

Will
