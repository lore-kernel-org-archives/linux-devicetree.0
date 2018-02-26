Return-Path: <SRS0=dGFV=FU=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 26 Feb 2018 15:32:13 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 02/12] usb: typec: add API to get sink and source
 config
Message-ID: <20180226133213.GC25535@kuha.fi.intel.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
 <1519645759-12701-3-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519645759-12701-3-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, linux@roeck-us.net, a.hajda@samsung.com, mark.rutland@arm.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi,

On Mon, Feb 26, 2018 at 07:49:09PM +0800, Li Jun wrote:
> This patch add 2 APIs to get sink and source power config from firmware
> description.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/typec/tcpm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/tcpm.h |  2 ++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index f4d563e..409f1d0 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -12,6 +12,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>

No need for that. There is nothing DT only specific here.

As in 01/12, you only have device properties here, so use the unified
device property API instead of of_property_* functions.

>  #include <linux/proc_fs.h>
>  #include <linux/sched/clock.h>
>  #include <linux/seq_file.h>
> @@ -3589,6 +3590,48 @@ static int tcpm_copy_vdos(u32 *dest_vdo, const u32 *src_vdo,
>  	return nr_vdo;
>  }
>  
> +int tcpm_of_get_src_config(struct device_node *np, struct tcpc_config *tcfg)
> +{
> +	int ret;
> +
> +	ret = of_property_read_variable_u32_array(np, "src-pdos",
> +				tcfg->src_pdo, 1, PDO_MAX_OBJECTS);
> +	if (ret > 0)
> +		tcfg->nr_src_pdo = ret;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(tcpm_of_get_pdos);
> +
> +int tcpm_of_get_snk_config(struct device_node *np, struct tcpc_config *tcfg)
> +{
> +	int ret;
> +
> +	ret = of_property_read_variable_u32_array(np, "snk-pdos",
> +				tcfg->snk_pdo, 1, PDO_MAX_OBJECTS);
> +	if (ret > 0)
> +		tcfg->nr_snk_pdo = ret;
> +	else
> +		return ret;
> +
> +	ret = of_property_read_u32(np, "max-snk-microvolt", &tcfg->max_snk_mv);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_u32(np, "max-snk-microamp", &tcfg->max_snk_ma);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_u32(np, "max-snk-microwatt-hours",
> +				   &tcfg->max_snk_mw);
> +	if (ret)
> +		return ret;
> +
> +	return of_property_read_u32(np, "op-snk-microwatt-hours",
> +				    &tcfg->operating_snk_mw);
> +}
> +EXPORT_SYMBOL_GPL(tcpm_of_get_pdos);
> +
>  int tcpm_update_source_capabilities(struct tcpm_port *port, const u32 *pdo,
>  				    unsigned int nr_pdo)
>  {
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index ca1c0b5..962eff1 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -191,6 +191,8 @@ int tcpm_update_sink_capabilities(struct tcpm_port *port, const u32 *pdo,
>  				  unsigned int max_snk_ma,
>  				  unsigned int max_snk_mw,
>  				  unsigned int operating_snk_mw);
> +int tcpm_of_get_src_config(struct device_node *np, struct tcpc_config *tcfg);
> +int tcpm_of_get_snk_config(struct device_node *np, struct tcpc_config *tcfg);
>  
>  void tcpm_vbus_change(struct tcpm_port *port);
>  void tcpm_cc_change(struct tcpm_port *port);

Thanks,

-- 
heikki
