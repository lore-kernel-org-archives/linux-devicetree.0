From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v2 08/29] metag: use unflatten_and_copy_device_tree
Date: Fri, 8 Nov 2013 13:12:15 +0000
Message-ID: <527CE32F.6090305@imgtec.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com> <1381163377-21044-9-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381163377-21044-9-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-metag <linux-metag@vger.kernel.org>, Qais <qais.yousef@imgtec.com>, Qais Yousef <qsyousef@gmail.com>
List-Id: devicetree@vger.kernel.org

On 07/10/13 17:29, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Use the common unflatten_and_copy_device_tree to copy the built-in FDT
> out of init section.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: James Hogan <james.hogan@imgtec.com>

With Qais' suggestion of removing the extern void copy_fdt(void) from
arch/metag/include/asm/prom.h (thanks Qais):
Acked-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

> ---
>  arch/metag/kernel/devtree.c | 16 ----------------
>  arch/metag/kernel/setup.c   |  4 +---
>  2 files changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/arch/metag/kernel/devtree.c b/arch/metag/kernel/devtree.c
> index 7cd0252..049af56 100644
> --- a/arch/metag/kernel/devtree.c
> +++ b/arch/metag/kernel/devtree.c
> @@ -94,21 +94,5 @@ struct machine_desc * __init setup_machine_fdt(void *dt)
>  	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
>  
>  	return mdesc_best;
> -}
>  
> -/**
> - * copy_fdt - Copy device tree into non-init memory.
> - *
> - * We must copy the flattened device tree blob into non-init memory because the
> - * unflattened device tree will reference the strings in it directly.
> - */
> -void __init copy_fdt(void)
> -{
> -	void *alloc = early_init_dt_alloc_memory_arch(
> -			be32_to_cpu(initial_boot_params->totalsize), 0x40);
> -	if (alloc) {
> -		memcpy(alloc, initial_boot_params,
> -		       be32_to_cpu(initial_boot_params->totalsize));
> -		initial_boot_params = alloc;
> -	}
>  }
> diff --git a/arch/metag/kernel/setup.c b/arch/metag/kernel/setup.c
> index c396cd0..2c697d3 100644
> --- a/arch/metag/kernel/setup.c
> +++ b/arch/metag/kernel/setup.c
> @@ -408,9 +408,7 @@ void __init setup_arch(char **cmdline_p)
>  	cpu_2_hwthread_id[smp_processor_id()] = hard_processor_id();
>  	hwthread_id_2_cpu[hard_processor_id()] = smp_processor_id();
>  
> -	/* Copy device tree blob into non-init memory before unflattening */
> -	copy_fdt();
> -	unflatten_device_tree();
> +	unflatten_and_copy_device_tree();
>  
>  #ifdef CONFIG_SMP
>  	smp_init_cpus();
> 
