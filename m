From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 25/29] arc: use common of_flat_dt_match_machine
Date: Tue, 8 Oct 2013 11:12:36 +0530
Message-ID: <52539B4C.9040400@synopsys.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com> <1381163377-21044-26-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381163377-21044-26-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 10/07/2013 09:59 PM, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 
> Convert arc to use the common of_flat_dt_match_machine function.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> Acked-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arc/kernel/devtree.c | 65 +++++++++++++----------------------------------
>  1 file changed, 18 insertions(+), 47 deletions(-)
> 
> diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> index 1ab6f35..12de555 100644
> --- a/arch/arc/kernel/devtree.c
> +++ b/arch/arc/kernel/devtree.c
> @@ -18,6 +18,19 @@
>  #include <asm/clk.h>
>  #include <asm/mach_desc.h>
>  
> +static const void * __init arch_get_next_mach(const char *const **match)
> +{
> +	static const struct machine_desc *mdesc = __arch_info_begin;
> +	const struct machine_desc *m = mdesc;
> +
> +	if (m >= __arch_info_end)
> +		return NULL;
> +
> +	mdesc++;
> +	*match = m->dt_compat;
> +	return m;
> +}
> +
>  /**
>   * setup_machine_fdt - Machine setup when an dtb was passed to the kernel
>   * @dt:		virtual address pointer to dt blob
> @@ -27,64 +40,22 @@
>   */
>  struct machine_desc * __init setup_machine_fdt(void *dt)
>  {
> -	struct machine_desc *mdesc = NULL, *mdesc_best = NULL;
> -	unsigned int score, mdesc_score = ~1;
> +	struct machine_desc *mdesc;
>  	unsigned long dt_root;
> -	const char *model, *compat;
>  	void *clk;
> -	char manufacturer[16];
>  	unsigned long len;
>  
>  	if (!early_init_dt_scan(dt))
>  		return NULL;
>  
> -	dt_root = of_get_flat_dt_root();
> -
> -	/*
> -	 * The kernel could be multi-platform enabled, thus could have many
> -	 * "baked-in" machine descriptors. Search thru all for the best
> -	 * "compatible" string match.
> -	 */
> -	for_each_machine_desc(mdesc) {
> -		score = of_flat_dt_match(dt_root, mdesc->dt_compat);
> -		if (score > 0 && score < mdesc_score) {
> -			mdesc_best = mdesc;
> -			mdesc_score = score;
> -		}
> -	}
> -	if (!mdesc_best) {
> -		const char *prop;
> -		long size;
> -
> -		pr_err("\n unrecognized device tree list:\n[ ");
> -
> -		prop = of_get_flat_dt_prop(dt_root, "compatible", &size);
> -		if (prop) {
> -			while (size > 0) {
> -				printk("'%s' ", prop);
> -				size -= strlen(prop) + 1;
> -				prop += strlen(prop) + 1;
> -			}
> -		}
> -		printk("]\n\n");
> -
> +	mdesc = of_flat_dt_match_machine(NULL, arch_get_next_mach);
> +	if (!mdesc)
>  		machine_halt();
> -	}
> -
> -	/* compat = "<manufacturer>,<model>" */
> -	compat =  mdesc_best->dt_compat[0];
> -
> -	model = strchr(compat, ',');
> -	if (model)
> -		model++;
> -
> -	strlcpy(manufacturer, compat, model ? model - compat : strlen(compat));
> -
> -	pr_info("Board \"%s\" from %s (Manufacturer)\n", model, manufacturer);
>  
> +	dt_root = of_get_flat_dt_root();
>  	clk = of_get_flat_dt_prop(dt_root, "clock-frequency", &len);
>  	if (clk)
>  		arc_set_core_freq(of_read_ulong(clk, len/4));
>  
> -	return mdesc_best;
> +	return mdesc;
>  }
> 

Can you please fold the following into this patch. This removes the const warning
and also gets rid of some dead code.

Thx,
-Vineet

------------------->
>From 3cd48b4955e9763248e306fff7ddf420b126ebab Mon Sep 17 00:00:00 2001
From: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Date: Tue, 8 Oct 2013 09:53:17 +0530
Subject: [PATCH] ARC: Addendum to "use common of_flat_dt_match_machine"

Signed-off-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 arch/arc/include/asm/mach_desc.h | 14 ++------------
 arch/arc/kernel/devtree.c        |  4 ++--
 arch/arc/kernel/setup.c          |  2 +-
 3 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/arc/include/asm/mach_desc.h b/arch/arc/include/asm/mach_desc.h
index d3e9c0a05be8..c88c59c4183c 100644
--- a/arch/arc/include/asm/mach_desc.h
+++ b/arch/arc/include/asm/mach_desc.h
@@ -51,22 +51,12 @@ struct machine_desc {
 /*
  * Current machine - only accessible during boot.
  */
-extern struct machine_desc *machine_desc;
+extern const struct machine_desc *machine_desc;

 /*
  * Machine type table - also only accessible during boot
  */
 extern struct machine_desc __arch_info_begin[], __arch_info_end[];
-#define for_each_machine_desc(p)            \
-    for (p = __arch_info_begin; p < __arch_info_end; p++)
-
-static inline struct machine_desc *default_machine_desc(void)
-{
-    /* the default machine is the last one linked in */
-    if (__arch_info_end - 1 < __arch_info_begin)
-        return NULL;
-    return __arch_info_end - 1;
-}

 /*
  * Set of macros to define architecture features.
@@ -81,6 +71,6 @@ __attribute__((__section__(".arch.info.init"))) = {    \
 #define MACHINE_END                \
 };

-extern struct machine_desc *setup_machine_fdt(void *dt);
+extern const struct machine_desc *setup_machine_fdt(void *dt);

 #endif
diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index 336396300e53..b6dc4e21fd32 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -37,9 +37,9 @@ static const void * __init arch_get_next_mach(const char *const
**match)
  * If a dtb was passed to the kernel, then use it to choose the correct
  * machine_desc and to setup the system.
  */
-struct machine_desc * __init setup_machine_fdt(void *dt)
+const struct machine_desc * __init setup_machine_fdt(void *dt)
 {
-    struct machine_desc *mdesc;
+    const struct machine_desc *mdesc;
     unsigned long dt_root;
     void *clk;
     unsigned long len;
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 5ae542454bed..f7d4a41d0629 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -30,7 +30,7 @@
 int running_on_hw = 1;    /* vs. on ISS */

 char __initdata command_line[COMMAND_LINE_SIZE];
-struct machine_desc *machine_desc;
+const struct machine_desc *machine_desc;

 struct task_struct *_current_task[NR_CPUS];    /* For stack switching */

-- 1.8.1.2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
