From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] dt: Add id to AUXDATA structure
Date: Thu, 14 Jul 2011 20:53:49 -0600
Message-ID: <20110715025349.GV2927@ponder.secretlab.ca>
References: <20110714025312.32655.28495.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110714025312.32655.28495.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 13, 2011 at 07:53:24PM -0700, John Bonesio wrote:
> This patch adds the ability to set the device id in the AUXDATA structure for
> those few device drivers that just have to have a statically defined device id.
> ---
> 
>  drivers/of/platform.c       |    7 +++++++
>  include/linux/of_platform.h |    7 ++++++-
>  2 files changed, 13 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index c177345..ebbbf42 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -565,6 +565,7 @@ static int of_platform_bus_create(struct device_node *bus,
>  	struct platform_device *dev;
>  	const char *bus_id = NULL;
>  	void *platform_data = NULL;
> +	int id = -1;
>  	int rc = 0;
>  
>  	/* Make sure it has a compatible property */
> @@ -585,6 +586,7 @@ static int of_platform_bus_create(struct device_node *bus,
>  	auxdata = of_dev_lookup(lookup, bus);
>  	if (auxdata) {
>  		bus_id = auxdata->name;
> +		id = auxdata->id;
>  		platform_data = auxdata->platform_data;
>  	}
>  
> @@ -594,6 +596,11 @@ static int of_platform_bus_create(struct device_node *bus,
>  	}
>  
>  	dev = of_platform_device_create_pdata(bus, bus_id, platform_data, parent);
> +
> +	/* override the id if auxdata gives an id */
> +	if (id != -1)
> +		dev->id = id;
> +

This won't actually work because of_platform_device_create_pdata
registers the device, and the id must be set before it device is
registered.  You'll need to pass in the is as a parameter to
of_platform_device_create_pdata.

>  	if (!dev || !of_match_node(matches, bus))
>  		return 0;
>  
> diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
> index 40ce814..252246c 100644
> --- a/include/linux/of_platform.h
> +++ b/include/linux/of_platform.h
> @@ -45,13 +45,18 @@ struct of_dev_auxdata {
>  	char *compatible;
>  	resource_size_t phys_addr;
>  	char *name;
> +	int id;
>  	void *platform_data;
>  };
>  
>  /* Macro to simplify populating a lookup table */
>  #define OF_DEV_AUXDATA(_compat,_phys,_name,_pdata) \
>  	{ .compatible = _compat, .phys_addr = _phys, .name = _name, \
> -	  .platform_data = _pdata }
> +	  .id = -1, .platform_data = _pdata }
> +
> +#define OF_DEV_AUXDATA_ID(_compat,_phys,_name,_id,_pdata) \
> +	{ .compatible = _compat, .phys_addr = _phys, .name = _name, \
> +	  .id = _id, .platform_data = _pdata }
>  
>  /**
>   * of_platform_driver - Legacy of-aware driver for platform devices.
> 
