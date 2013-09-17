From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 18/28] of: create default
	early_init_dt_add_memory_arch
Date: Tue, 17 Sep 2013 09:46:52 +0100
Message-ID: <DDB72C85-45A3-40FC-9108-7B56F6C5BC5B@arm.com>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
	<1379372965-22359-19-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <1379372965-22359-19-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Rob Herring <robherring2@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, James Hogan <james.hogan@imgtec.com>, "microblaze-uclinux@itee.uq.edu.au" <microblaze-uclinux@itee.uq.edu.au>, "linux@openrisc.net" <linux@openrisc.net>, "x86@kernel.org" <x86@kernel.org>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 17 Sep 2013, at 00:09, Rob Herring <robherring2@gmail.com> wrote:
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -147,24 +147,6 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
> 	pr_info("Machine: %s\n", machine_name);
> }
> 
> -void __init early_init_dt_add_memory_arch(u64 base, u64 size)
> -{
> -	base &= PAGE_MASK;
> -	size &= PAGE_MASK;
> -	if (base + size < PHYS_OFFSET) {
> -		pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
> -			   base, base + size);
> -		return;
> -	}
> -	if (base < PHYS_OFFSET) {
> -		pr_warning("Ignoring memory range 0x%llx - 0x%llx\n",
> -			   base, PHYS_OFFSET);
> -		size -= PHYS_OFFSET - base;
> -		base = PHYS_OFFSET;
> -	}
> -	memblock_add(base, size);
> -}
> -
> /*
>  * Limit the memory size that was specified via FDT.
>  */

...

> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -688,6 +688,17 @@ u64 __init dt_mem_next_cell(int s, __be32 **cellp)
> 	return of_read_number(p, s);
> }
> 
> +void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
> +{
> +#ifdef CONFIG_HAVE_MEMBLOCK
> +	base &= PAGE_MASK;
> +	size &= PAGE_MASK;
> +	memblock_add(base, size);
> +#else
> +	pr_err("%s: ignoring memory (%llx, %llx)\n", __func__, base, size);
> +#endif
> +}

Are the arm64 changes equivalent here?  There are some safety checks to
cope with the kernel being loaded at a higher offset than the
recommended one (PHYS_OFFSET calculated automatically).

Catalin
