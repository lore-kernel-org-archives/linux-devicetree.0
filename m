From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 06/15] x86/dtb: add support hpet
Date: Tue, 11 Jan 2011 15:26:07 -0700
Message-ID: <20110111222607.GC2131@angua.secretlab.ca>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	<1292600033-12271-7-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1292600033-12271-7-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 17, 2010 at 04:33:44PM +0100, Sebastian Andrzej Siewior wrote:
> Set hpet_address based on information provied form DTB
> 
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
>  arch/x86/kernel/prom.c |   19 +++++++++++++++++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/x86/kernel/prom.c b/arch/x86/kernel/prom.c
> index 9cbb52b..40ad8c0 100644
> --- a/arch/x86/kernel/prom.c
> +++ b/arch/x86/kernel/prom.c
> @@ -10,6 +10,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/slab.h>
>  
> +#include <asm/hpet.h>
>  #include <asm/irq_controller.h>
>  #include <asm/io_apic.h>
>  
> @@ -101,6 +102,23 @@ void __init add_dtb(u64 data)
>  	initial_dtb = data + offsetof(struct setup_data, data);
>  }
>  
> +static void __init dtb_setup_hpet(void)
> +{
> +	struct device_node *dn;
> +	struct resource r;
> +	int ret;
> +
> +	dn = of_find_compatible_node(NULL, NULL, "intel,hpet");
> +	if (!dn)
> +		return;
> +	ret = of_address_to_resource(dn, 0, &r);
> +	if (ret) {
> +		WARN_ON(1);
> +		return;
> +	}
> +	hpet_address = r.start;
> +}
> +
>  static void __init dtb_lapic_setup(void)
>  {
>  #ifdef CONFIG_X86_LOCAL_APIC
> @@ -212,5 +230,6 @@ void __init x86_dtb_get_config(unsigned int unused)
>  	of_scan_flat_dt(early_init_dt_scan_root, NULL);
>  
>  	unflatten_device_tree();
> +	dtb_setup_hpet();
>  	dtb_apic_setup();
>  }
> -- 
> 1.7.3.2
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
