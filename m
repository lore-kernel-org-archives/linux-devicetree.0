From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 2/4] soc: ti: ti_sci_pm_domains: Add support for exclusive
 access
Date: Mon, 18 Feb 2019 10:10:42 +0200
Message-ID: <74ef7305-0575-f24a-0806-49d85b7b70ff@ti.com>
References: <20190218051517.9218-1-lokeshvutla@ti.com>
 <20190218051517.9218-3-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190218051517.9218-3-lokeshvutla@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lokesh Vutla <lokeshvutla@ti.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 18/02/2019 07:15, Lokesh Vutla wrote:
> TISCI protocol supports for enabling the device with exclusive
> permissions. Certain remoteproc devices or some shared devices
> across VM doesn't wants to request devices with this flag set.
> So add support for getting this information from DT. With this
> power-domain-cells are increased to 2.
> 
> For keeping the DT backward compatibility intact, defaulting the
> device permissions to set the exclusive flag set. In this case the
> power-domain-cells is 1.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   .../bindings/soc/ti/sci-pm-domain.txt         |  7 ++++--
>   drivers/soc/ti/ti_sci_pm_domains.c            | 22 +++++++++++++++++--

Please split the dt-binding change into a separate patch.

-Tero

>   2 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt b/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
> index f7b00a7c0f68..5fdda7475023 100644
> --- a/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
> +++ b/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
> @@ -19,8 +19,11 @@ child of the pmmc node.
>   Required Properties:
>   --------------------
>   - compatible: should be "ti,sci-pm-domain"
> -- #power-domain-cells: Must be 1 so that an id can be provided in each
> -		       device node.
> +- #power-domain-cells: Can be one of the following:
> +			1: Containing the device id of each node
> +			2: First entry should be device id
> +			   Second entry should be 1 or 0. Use 1 for enabling
> +			   the device with exclusive permissions set else 0.
>   
>   Example (K2G):
>   -------------
> diff --git a/drivers/soc/ti/ti_sci_pm_domains.c b/drivers/soc/ti/ti_sci_pm_domains.c
> index de31b9389e2e..4dae42651212 100644
> --- a/drivers/soc/ti/ti_sci_pm_domains.c
> +++ b/drivers/soc/ti/ti_sci_pm_domains.c
> @@ -24,6 +24,8 @@
>   #include <linux/slab.h>
>   #include <linux/soc/ti/ti_sci_protocol.h>
>   
> +#define PD_REQUEST_EXCLUSIVE BIT(0)
> +
>   /**
>    * struct ti_sci_genpd_dev_data: holds data needed for every device attached
>    *				 to this genpd
> @@ -32,6 +34,7 @@
>    */
>   struct ti_sci_genpd_dev_data {
>   	int idx;
> +	u8 exclusive;
>   };
>   
>   /**
> @@ -63,6 +66,14 @@ static int ti_sci_dev_id(struct device *dev)
>   	return sci_dev_data->idx;
>   }
>   
> +static u8 is_ti_sci_dev_exclusive(struct device *dev)
> +{
> +	struct generic_pm_domain_data *genpd_data = dev_gpd_data(dev);
> +	struct ti_sci_genpd_dev_data *sci_dev_data = genpd_data->data;
> +
> +	return sci_dev_data->exclusive & PD_REQUEST_EXCLUSIVE;
> +}
> +
>   /**
>    * ti_sci_dev_to_sci_handle(): get pointer to ti_sci_handle
>    * @dev: pointer to device associated with this genpd
> @@ -87,7 +98,10 @@ static int ti_sci_dev_start(struct device *dev)
>   	const struct ti_sci_handle *ti_sci = ti_sci_dev_to_sci_handle(dev);
>   	int idx = ti_sci_dev_id(dev);
>   
> -	return ti_sci->ops.dev_ops.get_device(ti_sci, idx);
> +	if (is_ti_sci_dev_exclusive(dev))
> +		return ti_sci->ops.dev_ops.get_device_exclusive(ti_sci, idx);
> +	else
> +		return ti_sci->ops.dev_ops.get_device(ti_sci, idx);
>   }
>   
>   /**
> @@ -118,7 +132,7 @@ static int ti_sci_pd_attach_dev(struct generic_pm_domain *domain,
>   	if (ret < 0)
>   		return ret;
>   
> -	if (pd_args.args_count != 1)
> +	if (pd_args.args_count != 1 && pd_args.args_count != 2)
>   		return -EINVAL;
>   
>   	idx = pd_args.args[0];
> @@ -136,6 +150,10 @@ static int ti_sci_pd_attach_dev(struct generic_pm_domain *domain,
>   		return -ENOMEM;
>   
>   	sci_dev_data->idx = idx;
> +	/* Enable the exclusive permissions by default */
> +	sci_dev_data->exclusive = PD_REQUEST_EXCLUSIVE;
> +	if (pd_args.args_count == 2)
> +		sci_dev_data->exclusive = pd_args.args[1];
>   
>   	genpd_data = dev_gpd_data(dev);
>   	genpd_data->data = sci_dev_data;
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
