From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 4/6] arm/dt: mx51: dynamically add clocks per dt nodes
Date: Thu, 31 Mar 2011 14:40:12 -0600
Message-ID: <20110331204012.GB31846@ponder.secretlab.ca>
References: <1300472672-13392-1-git-send-email-shawn.guo@linaro.org>
	<1300472672-13392-5-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1300472672-13392-5-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 19, 2011 at 02:24:30AM +0800, Shawn Guo wrote:
> This patch is to change the static clock creating and registering to
> the dynamic way, which scans dt clock nodes, associate clk with
> device_node, and then add them to clkdev accordingly.
> 
> It's a pretty straight translation from non-dt clock code to dt one,
> and it does not really change any actual clock implementation.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hey Shawn,

As you and I discussed earlier, I'm backing off from the encoding all
clock information in the device tree for the time being so that dt and
non-dt use cases will continue to share the same clock setup code.
Clock bindings are still important to get right, particularly for
off-chip connections, but they aren't as critical for getting basic
device tree support up and running.

Regardless, here are my comments on this patch which we can revisit
again later.

> ---
>  arch/arm/mach-mx5/Makefile          |    2 +-
>  arch/arm/mach-mx5/clock-dt.c        |   52 --
>  arch/arm/mach-mx5/clock-mx51-mx53.c | 1433 ++++++++++++++++++++++++++++++++++-
>  3 files changed, 1410 insertions(+), 77 deletions(-)
>  delete mode 100644 arch/arm/mach-mx5/clock-dt.c
> 
> diff --git a/arch/arm/mach-mx5/Makefile b/arch/arm/mach-mx5/Makefile
> index bd4542d..540697e 100644
> --- a/arch/arm/mach-mx5/Makefile
> +++ b/arch/arm/mach-mx5/Makefile
> @@ -18,4 +18,4 @@ obj-$(CONFIG_MACH_EUKREA_CPUIMX51SD) += board-cpuimx51sd.o
>  obj-$(CONFIG_MACH_EUKREA_MBIMXSD51_BASEBOARD) += eukrea_mbimxsd-baseboard.o
>  obj-$(CONFIG_MACH_MX51_EFIKAMX) += board-mx51_efikamx.o
>  obj-$(CONFIG_MACH_MX50_RDP) += board-mx50_rdp.o
> -obj-$(CONFIG_MACH_MX51_DT) += board-dt.o clock-dt.o
> +obj-$(CONFIG_MACH_MX51_DT) += board-dt.o
> diff --git a/arch/arm/mach-mx5/clock-dt.c b/arch/arm/mach-mx5/clock-dt.c
> deleted file mode 100644
> index 9c04475..0000000
> --- a/arch/arm/mach-mx5/clock-dt.c
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -
> -/*
> - * Copyright 2011 Linaro Ltd.
> - * Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> - *
> - * The code contained herein is licensed under the GNU General Public
> - * License. You may obtain a copy of the GNU General Public License
> - * Version 2 or later at the following locations:
> - *
> - * http://www.opensource.org/licenses/gpl-license.html
> - * http://www.gnu.org/copyleft/gpl.html
> - */
> -
> -#include <linux/err.h>
> -#include <linux/init.h>
> -#include <linux/clk.h>
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_clk.h>
> -
> -static struct clk *mx5_dt_clk_get(struct device_node *np,
> -					const char *output_id, void *data)
> -{
> -	return data;
> -}
> -
> -static __init void mx5_dt_scan_clks(void)
> -{
> -	struct device_node *node;
> -	struct clk *clk;
> -	const char *id;
> -	int rc;
> -
> -	for_each_compatible_node(node, NULL, "clock") {
> -		id = of_get_property(node, "clock-outputs", NULL);
> -		if (!id)
> -			continue;
> -
> -		clk = clk_get_sys(id, NULL);
> -		if (IS_ERR(clk))
> -			continue;
> -
> -		rc = of_clk_add_provider(node, mx5_dt_clk_get, clk);
> -		if (rc)
> -			pr_err("error adding fixed clk %s\n", node->name);
> -	}
> -}
> -
> -void __init mx5_clk_dt_init(void)
> -{
> -	mx5_dt_scan_clks();
> -}
> diff --git a/arch/arm/mach-mx5/clock-mx51-mx53.c b/arch/arm/mach-mx5/clock-mx51-mx53.c
> index 0a19e75..f5fdded 100644
> --- a/arch/arm/mach-mx5/clock-mx51-mx53.c
> +++ b/arch/arm/mach-mx5/clock-mx51-mx53.c
> @@ -15,6 +15,10 @@
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/clkdev.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_clk.h>
>  
>  #include <asm/div64.h>
>  
> @@ -43,6 +47,28 @@ static struct clk emi_fast_clk;
>  static struct clk ipu_clk;
>  static struct clk mipi_hsc1_clk;
>  
> +/*
> + * The pointers are defined to unify the references to clocks, as clocks
> + * could also be created by dt code in a dynamic way besides the static
> + * way used in existing non-dt clock code.
> + */
> +static struct clk *osc_clk_ptr;
> +static struct clk *pll1_main_clk_ptr;
> +static struct clk *pll1_sw_clk_ptr;
> +static struct clk *pll2_sw_clk_ptr;
> +static struct clk *pll3_sw_clk_ptr;
> +static struct clk *lp_apm_clk_ptr;
> +static struct clk *periph_apm_clk_ptr;
> +static struct clk *main_bus_clk_ptr;
> +static struct clk *ipg_clk_ptr;
> +static struct clk *ipg_per_clk_ptr;
> +static struct clk *cpu_clk_ptr;
> +static struct clk *iim_clk_ptr;
> +static struct clk *usboh3_clk_ptr;
> +static struct clk *usb_phy1_clk_ptr;
> +static struct clk *esdhc1_clk_ptr;
> +static struct clk *esdhc2_clk_ptr;
> +

I think it's possible to match up device tree nodes with the existing
struct clks.  Its a big change in model from the direction I sent you
on when you worked on this patch, but it is probably the right thing
to di.  That would minimize the impact on the imx clock
definitions by eliminating the _clk --> &_clk_ptr conversions.  It
would also allow for the dt to sparsely define clock nodes.  ie.  only
define the nodes that external devices actually need to reference.

> +static __init int mx5_scan_fixed_clks(void)
> +{
> +	struct device_node *node;
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *rate;
> +	const char *dev_id;
> +	int ret = 0;
> +
> +	for_each_compatible_node(node, NULL, "fixed-clock") {
> +		cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);
> +		if (!cl) {
> +			ret = -ENOMEM;
> +			break;
> +		}
> +		clk = (struct clk *) (cl + 1);
> +
> +		dev_id = of_get_property(node, "clock-outputs", NULL);
> +		if (!dev_id) {
> +			kfree(cl);
> +			continue;
> +		}
> +
> +		rate = of_get_property(node, "clock-frequency", NULL);
> +		if (!rate) {
> +			kfree(cl);
> +			continue;
> +		}
> +		clk->rate = be32_to_cpu(*rate);
> +		clk->get_rate = get_fixed_clk_rate;
> +
> +		if (!strcmp(node->name, "osc"))
> +			osc_clk_ptr = clk;
> +
> +		node->clk = clk;
> +
> +		cl->dev_id = dev_id;
> +		cl->clk = clk;
> +		clkdev_add(cl);

Should use of_clk_add_provider() here.

> +	}
> +
> +	return ret;
> +}
> +
> +static struct clk *mx5_prop_name_to_clk(struct device_node *node,
> +		const char *prop_name)
> +{
> +	struct device_node *provnode;
> +	struct clk *clk;
> +	const void *prop;
> +	u32 provhandle;
> +	int sz;
> +
> +	prop = of_get_property(node, prop_name, &sz);
> +	if (!prop || sz < 4)
> +		goto out;
> +
> +	/* Extract the phandle from the start of the property value */
> +	provhandle = be32_to_cpup(prop);
> +	prop += 4;
> +	sz -= 4;
> +
> +	/*
> +	 * Make sure the clock name is properly terminated and within the
> +	 * size of the property.
> +	 */
> +	if (strlen(prop) + 1 > sz)
> +		goto out;
> +
> +	provnode = of_find_node_by_phandle(provhandle);
> +	if (!provnode)
> +		goto out;
> +
> +	clk = provnode->clk;
> +
> +	of_node_put(provnode);
> +
> +	return clk;
> +
> +out:
> +	pr_err("%s: failed to get %s of %s\n", __func__, prop_name, node->name);
> +	return NULL;
> +}
> +
> +static inline struct clk *mx5_get_source_clk(struct device_node *node)
> +{
> +	return mx5_prop_name_to_clk(node, "src-clock");
> +}
> +
> +static inline struct clk *mx5_get_depend_clk(struct device_node *node)
> +{
> +	return mx5_prop_name_to_clk(node, "dep-clock");
> +}
> +
> +static __init struct clk_lookup *mx5_pre_clk_lookup(struct device_node * node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);
> +	if (cl) {
> +		clk = (struct clk *) (cl + 1);

I've been spanked for this construct before because you can't
guarantee that gcc won't put any padding at the end of the first
structure.  Better to define holding structure and get the two
pointers from it instead:

struct clk_lookup_priv {
	struct clk_lookup cl;
	struct clk clk;
} *clp;

clp = kzalloc(sizeof(*clp), GFP_KERNEL);
cl = &clp->cl;
clk = &clp->clk;

> +		clk->parent = mx5_get_source_clk(node);
> +		clk->secondary = mx5_get_source_clk(node);
> +	}
> +
> +	return cl;
> +}
> +
> +static __init int mx5_post_clk_lookup(struct clk_lookup *cl,
> +				      struct device_node *node)
> +{
> +	struct clk *clk;
> +	const char *dev_id;
> +
> +	dev_id = of_get_property(node, "clock-outputs", NULL);
> +	if (!dev_id) {
> +		kfree(cl);
> +		return -EINVAL;
> +	}
> +
> +	clk = (struct clk *) (cl + 1);

Ewwh!  Definitely use a private structure and the container_of() macro
to resolve it from struct clk.

> +	node->clk = clk;
> +
> +	cl->dev_id = dev_id;
> +	cl->clk = clk;
> +	clkdev_add(cl);

Ditto here, use of_clk_add_provider()

> +
> +	return 0;
> +}
> +
> +static __init int mx5_add_dummy_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	node->clk = clk;
> +
> +	cl->clk = clk;
> +	clkdev_add(cl);
> +
> +	return 0;
> +}
> +
> +static __init int mx5_add_usb_phy1_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR2;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG0_OFFSET;
> +	clk->set_parent = clk_usb_phy1_set_parent;
> +
> +	usb_phy1_clk_ptr = clk;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_usb_ahb_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR2;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG13_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_usboh3_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->get_rate = clk_usboh3_get_rate;
> +	clk->set_parent = clk_usboh3_set_parent;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR2;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG14_OFFSET;
> +
> +	usboh3_clk_ptr = clk;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_mipi_hsp_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_hsc_enable;
> +	clk->disable = _clk_hsc_disable;
> +	clk->enable_reg = MXC_CCM_CCGR4;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG6_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ipu_di_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 1)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR6;
> +	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG5_OFFSET :
> +					MXC_CCM_CCGRx_CG6_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ipu_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = clk_ipu_enable;
> +	clk->disable = clk_ipu_disable;
> +	clk->enable_reg = MXC_CCM_CCGR5;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG5_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ipu_sec_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_mipi_hsc_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 1)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR4;
> +	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG3_OFFSET :
> +					MXC_CCM_CCGRx_CG4_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_mipi_esc_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR4;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG5_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_esdhc_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 1)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_max_enable;
> +	clk->disable = _clk_max_disable;
> +	clk->enable_reg = MXC_CCM_CCGR3;
> +
> +	if (id == 0) {
> +		clk->enable_shift = MXC_CCM_CCGRx_CG1_OFFSET;
> +		clk->get_rate = clk_esdhc1_get_rate;
> +		clk->set_rate = clk_esdhc1_set_rate;
> +		clk->set_parent = clk_esdhc1_set_parent;
> +		esdhc1_clk_ptr = clk;
> +	} else {
> +		clk->enable_shift = MXC_CCM_CCGRx_CG3_OFFSET;
> +		clk->get_rate = clk_esdhc2_get_rate;
> +		clk->set_rate = clk_esdhc2_set_rate;
> +		clk->set_parent = clk_esdhc2_set_parent;
> +		esdhc2_clk_ptr = clk;
> +	}
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_esdhc_ipg_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 1)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_max_enable;
> +	clk->disable = _clk_max_disable;
> +	clk->enable_reg = MXC_CCM_CCGR3;
> +	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG0_OFFSET :
> +					MXC_CCM_CCGRx_CG2_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_sdma_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR4;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG15_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ecspi_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 1)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR4;
> +	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG10_OFFSET :
> +					MXC_CCM_CCGRx_CG12_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ecspi_ipg_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 1)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable_inrun;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR4;
> +	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG9_OFFSET :
> +					MXC_CCM_CCGRx_CG11_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ecspi_main_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->get_rate = clk_ecspi_get_rate;
> +	clk->set_parent = clk_ecspi_set_parent;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_cspi_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR4;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG13_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_cspi_ipg_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR4;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ssi_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 2)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR3;
> +
> +	switch (id) {
> +	case 0:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
> +		break;
> +	case 1:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG11_OFFSET;
> +		break;
> +	case 2:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG13_OFFSET;
> +	}
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ssi_ipg_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 2)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR3;
> +
> +	switch (id) {
> +	case 0:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
> +		break;
> +	case 1:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG10_OFFSET;
> +		break;
> +	case 2:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG12_OFFSET;
> +	}
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_nfc_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR5;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG10_OFFSET;
> +	clk->get_rate = clk_nfc_get_rate;
> +	clk->set_rate = clk_nfc_set_rate;
> +	clk->round_rate = clk_nfc_round_rate;
> +	clk->set_parent = clk_nfc_set_parent;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_i2c_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 2)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR1;
> +
> +	switch (id) {
> +	case 0:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
> +		break;
> +	case 1:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG10_OFFSET;
> +		break;
> +	case 2:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG11_OFFSET;
> +	}
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_pwm_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 1)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR2;
> +	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG6_OFFSET :
> +					MXC_CCM_CCGRx_CG8_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_fec_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR2;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG12_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_uart_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 2)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR1;
> +
> +	switch (id) {
> +	case 0:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG4_OFFSET;
> +		break;
> +	case 1:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG6_OFFSET;
> +		break;
> +	case 2:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
> +	}
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_uart_root_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->get_rate = clk_uart_get_rate;
> +	clk->set_parent = clk_uart_set_parent;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_uart_ipg_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 2)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR1;
> +
> +	switch (id) {
> +	case 0:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG3_OFFSET;
> +		break;
> +	case 1:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG5_OFFSET;
> +		break;
> +	case 2:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG7_OFFSET;
> +	}
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_gpt_32k_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_gpt_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR2;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_gpt_ipg_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR2;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG10_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ahbmux1_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable_inwait;
> +	clk->enable_reg = MXC_CCM_CCGR0;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_aips_tz_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 1)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable_inwait;
> +	clk->enable_reg = MXC_CCM_CCGR0;
> +	clk->enable_shift = (id == 0) ? MXC_CCM_CCGRx_CG12_OFFSET :
> +					MXC_CCM_CCGRx_CG13_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ahb_max_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_max_enable;
> +	clk->disable = _clk_max_disable;
> +	clk->enable_reg = MXC_CCM_CCGR0;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG14_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_iim_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable_reg = MXC_CCM_CCGR0;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG15_OFFSET;
> +
> +	iim_clk_ptr = clk;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_spba_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR5;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG0_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ipg_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->get_rate = clk_ipg_get_rate;
> +
> +	ipg_clk_ptr = clk;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ahb_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->get_rate = clk_ahb_get_rate;
> +	clk->set_rate = _clk_ahb_set_rate;
> +	clk->round_rate = _clk_ahb_round_rate;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_emi_slow_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable_inwait;
> +	clk->enable_reg = MXC_CCM_CCGR5;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
> +	clk->get_rate = clk_emi_slow_get_rate;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_main_bus_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->set_parent = _clk_main_bus_set_parent;
> +
> +	main_bus_clk_ptr = clk;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_emi_fast_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable_inwait;
> +	clk->enable_reg = MXC_CCM_CCGR5;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG7_OFFSET;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ddr_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ddr_hf_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->get_rate = _clk_ddr_hf_get_rate;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_cpu_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->get_rate = clk_cpu_get_rate;
> +	clk->set_rate = clk_cpu_set_rate;
> +
> +	cpu_clk_ptr = clk;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_ipg_per_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->get_rate = clk_ipg_per_get_rate;
> +	clk->set_parent = _clk_ipg_per_set_parent;
> +
> +	ipg_per_clk_ptr = clk;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_periph_apm_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->set_parent = _clk_periph_apm_set_parent;
> +
> +	periph_apm_clk_ptr = clk;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_lp_apm_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->set_parent = _clk_lp_apm_set_parent;
> +
> +	lp_apm_clk_ptr = clk;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_pll_switch_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +	const __be32 *reg;
> +	int id;
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg)
> +		return -ENOENT;
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 2)
> +		return -EINVAL;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->id = id;
> +
> +	switch (id) {
> +	case 0:
> +		clk->get_rate = clk_pll1_sw_get_rate;
> +		clk->set_parent = _clk_pll1_sw_set_parent;
> +		pll1_sw_clk_ptr = clk;
> +		break;
> +	case 1:
> +		clk->get_rate = clk_pll_get_rate;
> +		clk->set_rate = _clk_pll_set_rate;
> +		clk->enable = _clk_pll_enable;
> +		clk->disable = _clk_pll_disable;
> +		clk->set_parent = _clk_pll2_sw_set_parent;
> +		pll2_sw_clk_ptr = clk;
> +		break;
> +	case 2:
> +		clk->get_rate = clk_pll_get_rate;
> +		clk->set_rate = _clk_pll_set_rate;
> +		clk->enable = _clk_pll_enable;
> +		clk->disable = _clk_pll_disable;
> +		pll3_sw_clk_ptr = clk;
> +	}
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}
> +
> +static __init int mx5_add_pll1_main_clk(struct device_node *node)
> +{
> +	struct clk_lookup *cl;
> +	struct clk *clk;
> +
> +	cl = mx5_pre_clk_lookup(node);
> +	if (!cl)
> +		return -ENOMEM;
> +	clk = (struct clk *) (cl + 1);
> +
> +	clk->get_rate = clk_pll_get_rate;
> +	clk->enable = _clk_pll_enable;
> +	clk->disable = _clk_pll_disable;
> +
> +	pll1_main_clk_ptr = clk;
> +
> +	return mx5_post_clk_lookup(cl, node);
> +}


Hmmm, this ends up being a lot of functions that largely do the same
thing.  /me wonders if it could be more data driven.

g.
