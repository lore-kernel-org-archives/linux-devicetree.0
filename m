From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Fix unsupported isa string info.
Date: Tue, 6 Aug 2019 16:27:30 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1908061625190.13971@viisi.sifive.com>
References: <20190801005843.10343-1-atish.patra@wdc.com>
 <20190801005843.10343-4-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190801005843.10343-4-atish.patra@wdc.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Atish Patra <atish.patra@wdc.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>, Yangtao Li <tiny.windzz@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Johan Hovold <johan@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, Gary Guo <gary@garyguo.net>, linux-riscv@lists.infradead.org, Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
List-Id: devicetree@vger.kernel.org

On Wed, 31 Jul 2019, Atish Patra wrote:

> Currently, kernel prints a info warning if any of the extensions
> from "mafdcsu" is missing in device tree. This is not entirely
> correct as Linux can boot with "f or d" extensions if kernel is
> configured accordingly. Moreover, it will continue to print the
> info string for future extensions such as hypervisor as well which
> is misleading. /proc/cpuinfo also doesn't print any other extensions
> except "mafdcsu".
> 
> Make sure that info log is only printed only if kernel is configured
> to have any mandatory extensions but device tree doesn't describe it.
> All the extensions present in device tree and follow the order
> described in the RISC-V specification (except 'S') are printed via
> /proc/cpuinfo always.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

I tested this patch after dropping the CONFIG_ISA_RISCV_C test (see 
below).  Running "cat /proc/cpuinfo" generated the following kernel 
warnings:
          
[   73.412626] unsupported ISA extensions "su" in device tree for cpu [0]
[   73.418417] unsupported ISA extensions "su" in device tree for cpu [1]
[   73.424912] unsupported ISA extensions "su" in device tree for cpu [2]
[   73.431425] unsupported ISA extensions "su" in device tree for cpu [3]

Seems like the "su" should be dropped from mandatory_ext.  What do you 
think?

> ---
>  arch/riscv/kernel/cpu.c | 47 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 7da3c6a93abd..9b1d4550fbe6 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -7,6 +7,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/of.h>
>  #include <asm/smp.h>
> +#include <asm/hwcap.h>
>  
>  /*
>   * Returns the hart ID of the given device tree node, or -ENODEV if the node
> @@ -46,11 +47,14 @@ int riscv_of_processor_hartid(struct device_node *node)
>  
>  #ifdef CONFIG_PROC_FS
>  
> -static void print_isa(struct seq_file *f, const char *orig_isa)
> +static void print_isa(struct seq_file *f, const char *orig_isa,
> +		      unsigned long cpuid)
>  {
> -	static const char *ext = "mafdcsu";
> +	static const char *mandatory_ext = "mafdcsu";
>  	const char *isa = orig_isa;
>  	const char *e;
> +	char unsupported_isa[26] = {0};
> +	int index = 0;
>  
>  	/*
>  	 * Linux doesn't support rv32e or rv128i, and we only support booting
> @@ -70,27 +74,50 @@ static void print_isa(struct seq_file *f, const char *orig_isa)
>  	isa += 5;
>  
>  	/*
> -	 * Check the rest of the ISA string for valid extensions, printing those
> -	 * we find.  RISC-V ISA strings define an order, so we only print the
> +	 * RISC-V ISA strings define an order, so we only print all the
>  	 * extension bits when they're in order. Hide the supervisor (S)
>  	 * extension from userspace as it's not accessible from there.
> +	 * Throw a warning only if any mandatory extensions are not available
> +	 * and kernel is configured to have that mandatory extensions.
>  	 */
> -	for (e = ext; *e != '\0'; ++e) {
> -		if (isa[0] == e[0]) {
> +	for (e = mandatory_ext; *e != '\0'; ++e) {
> +		if (isa[0] != e[0]) {
> +#if defined(CONFIG_ISA_RISCV_C)

There's no Kconfig option by this name, and we're requiring compressed 
instruction support as part of the RISC-V Linux baseline.  Could you share 
the rationale behind this?  Looks to me like this should be dropped.


> +			if (isa[0] == 'c')
> +				continue;
> +#endif
> +#if defined(CONFIG_FP)
> +			if ((isa[0] == 'f') || (isa[0] == 'd'))
> +				continue;
> +#endif
> +			unsupported_isa[index] = e[0];
> +			index++;
> +		}
> +		/* Only write if part of isa string */
> +		if (isa[0] != '\0') {
>  			if (isa[0] != 's')
>  				seq_write(f, isa, 1);
> -
>  			isa++;
>  		}
>  	}
> +	if (isa[0] != '\0') {
> +		/* Add remainging isa strings */
> +		for (e = isa; *e != '\0'; ++e) {
> +#if !defined(CONFIG_VIRTUALIZATION)
> +			if (e[0] != 'h')
> +#endif
> +				seq_write(f, e, 1);
> +		}
> +	}
>  	seq_puts(f, "\n");
>  
>  	/*
>  	 * If we were given an unsupported ISA in the device tree then print
>  	 * a bit of info describing what went wrong.
>  	 */
> -	if (isa[0] != '\0')
> -		pr_info("unsupported ISA \"%s\" in device tree\n", orig_isa);
> +	if (unsupported_isa[0])
> +		pr_info("unsupported ISA extensions \"%s\" in device tree for cpu [%ld]\n",
> +			unsupported_isa, cpuid);
>  }
>  
>  static void print_mmu(struct seq_file *f, const char *mmu_type)
> @@ -134,7 +161,7 @@ static int c_show(struct seq_file *m, void *v)
>  	seq_printf(m, "processor\t: %lu\n", cpu_id);
>  	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
>  	if (!of_property_read_string(node, "riscv,isa", &isa))
> -		print_isa(m, isa);
> +		print_isa(m, isa, cpu_id);
>  	if (!of_property_read_string(node, "mmu-type", &mmu))
>  		print_mmu(m, mmu);
>  	if (!of_property_read_string(node, "compatible", &compat)
> -- 
> 2.21.0
> 
> 


- Paul
