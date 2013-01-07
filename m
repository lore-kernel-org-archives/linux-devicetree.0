From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] drm/exynos: Get HDMI version from device tree
Date: Mon, 07 Jan 2013 10:54:28 -1000
Message-ID: <50EB3604.60209@firmworks.com>
References: <1357591415-17092-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357591415-17092-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 1/7/2013 10:43 AM, Sean Paul wrote:
> Add a property to the hdmi node so we can specify the HDMI version in
> the device tree instead of just defaulting to v1.4 with the existence of
> the dt node.
> 
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  .../devicetree/bindings/drm/exynos/hdmi.txt        |    3 +++
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   19 ++++++++++---------
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> index 589edee..d1c7d91 100644
> --- a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> +++ b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> @@ -11,6 +11,8 @@ Required properties:
>  	c) pin function mode.
>  	d) optional flags and pull up/down.
>  	e) drive strength.
> +- samsung,supports-hdmi-1.4: Define if device supports HDMI v1.4
> +- samsung,supports-hdmi-1.3: Define if device supports HDMI v1.3

a) This seems pretty generic, not at all samsung-specific, as the HDMI
version numbering space is well-defined by the HDMI spec.

b) It would be better to make it an integer property whose value
encodes the version number, thus eliminating the need to add new
properties as new HDMI versions appear.

>  
>  Example:
>  
> @@ -19,4 +21,5 @@ Example:
>  		reg = <0x14530000 0x100000>;
>  		interrupts = <0 95 0>;
>  		hpd-gpio = <&gpx3 7 0xf 1 3>;
> +		samsung,supports-hdmi-1.4;
>  	};
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 2c46b6c..9834ae5 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -2444,7 +2444,6 @@ static struct platform_device_id hdmi_driver_types[] = {
>  static struct of_device_id hdmi_match_types[] = {
>  	{
>  		.compatible = "samsung,exynos5-hdmi",
> -		.data	= (void	*)HDMI_TYPE14,
>  	}, {
>  		/* end node */
>  	}
> @@ -2498,16 +2497,18 @@ static int __devinit hdmi_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, drm_hdmi_ctx);
>  
> -	if (dev->of_node) {
> -		const struct of_device_id *match;
> -		match = of_match_node(of_match_ptr(hdmi_match_types),
> -					pdev->dev.of_node);
> -		if (match == NULL)
> -			return -ENODEV;
> -		hdata->type = (enum hdmi_type)match->data;
> -	} else {
> +	if (!dev->of_node) {
>  		hdata->type = (enum hdmi_type)platform_get_device_id
>  					(pdev)->driver_data;
> +	} else if (of_get_property(dev->of_node, "samsung,supports-hdmi-1.4",
> +				NULL)) {
> +		hdata->type = HDMI_TYPE14;
> +	} else if (of_get_property(dev->of_node, "samsung,supports-hdmi-1.3",
> +				NULL)) {
> +		hdata->type = HDMI_TYPE13;
> +	} else {
> +		DRM_ERROR("Could not resolve HDMI version support\n");
> +		return -ENODEV;
>  	}
>  
>  	hdata->hpd_gpio = pdata->hpd_gpio;
> 
