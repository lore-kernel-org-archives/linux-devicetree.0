From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] of/device: Obtain platform dev name and id from bus_id
Date: Fri, 18 Nov 2011 10:17:03 -0600
Message-ID: <4EC684FF.7000408@calxeda.com>
References: <1321630233.21392.43.camel@zalecze.wat.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1321630233.21392.43.camel-mW8Zrtsli9hKR43/MA08o07CuiCeIGUxQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wojciech Baranowski <baranowski-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/18/2011 09:30 AM, Wojciech Baranowski wrote:
> When adding new platform device, parse platform_device.dev.bus_id (used as
> device name) to get platform_device.name and platform_device.id before
> calling device_add. If bus_id cannot be split into name and id, fallback to
> the old way.
> 
> Currently the name is being set to bus_id and id is being set to -1, even
> when bus_id is in the form "some_name.some_number". This might lead to
> problems with device-driver matching and index out of bounds error. It is
> also not consistent with how the bus_id is generated from name and id.
> 
> Signed-off-by: Wojciech Baranowski <baranowski-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---

This has come up before and been rejected. Drivers should not rely on id
as an index. The main case I've seen where an index is needed is serial
consoles and aliases supports that case.

Do you have a specific problem you are trying to solve?

Rob

>  drivers/of/device.c |   43 +++++++++++++++++++++++++++++++++++++++----
>  1 files changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 62b4b32..8758c3f 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -47,14 +47,49 @@ void of_dev_put(struct platform_device *dev)
>  }
>  EXPORT_SYMBOL(of_dev_put);
>  
> +static int of_dev_parse_devname(struct platform_device *ofdev)
> +{
> +	const char *name;
> +	const char *dot_pos;
> +	char *short_name;
> +
> +	name = dev_name(&ofdev->dev);
> +	if (!name)
> +		goto std_out;
> +
> +	dot_pos = strrchr(name, '.');
> +	if (!dot_pos)
> +		goto std_out;
> +
> +	short_name = kmalloc(dot_pos - name + 1, GFP_KERNEL);
> +	if (!short_name)
> +		return -ENOMEM;
> +
> +	strlcpy(short_name, name, dot_pos - name + 1);
> +	ofdev->name = short_name;
> +
> +	if (kstrtoint(dot_pos + 1, 10, &ofdev->id))
> +		goto kfree_out;
> +
> +	return 0;
> +
> +kfree_out:
> +	kfree(short_name);
> +std_out:
> +	ofdev->name = name;
> +	ofdev->id = -1;
> +	return 0;
> +}
> +
>  int of_device_add(struct platform_device *ofdev)
>  {
> +	int ret;
> +
>  	BUG_ON(ofdev->dev.of_node == NULL);
>  
> -	/* name and id have to be set so that the platform bus doesn't get
> -	 * confused on matching */
> -	ofdev->name = dev_name(&ofdev->dev);
> -	ofdev->id = -1;
> +	ret = of_dev_parse_devname(ofdev);
> +	if (ret)
> +		return ret;
>  
>  	/* device_add will assume that this device is on the same node as
>  	 * the parent. If there is no parent defined, set the node
