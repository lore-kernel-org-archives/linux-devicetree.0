From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] drm: exynos: hdmi: Add dt support for hdmiphy
 settings
Date: Mon, 28 Oct 2013 06:50:07 +0000
Message-ID: <20131028065006.GA3065@kartoffel>
References: <1382941462-6691-1-git-send-email-s.shirish@samsung.com>
 <1382941462-6691-4-git-send-email-s.shirish@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382941462-6691-4-git-send-email-s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Oct 28, 2013 at 06:24:22AM +0000, Shirish S wrote:
> This patch adds dt support to hdmiphy config settings
> as it is board specific and depends on the signal pattern
> of board.
> 
> Signed-off-by: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/video/exynos_hdmi.txt      |   29 ++++++++
>  arch/arm/boot/dts/exynos5250-arndale.dts           |    6 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   70 ++++++++++++++++++--
>  3 files changed, 98 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> index 323983b..770f92d 100644
> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> @@ -13,6 +13,27 @@ Required properties:
>  	b) pin number within the gpio controller.
>  	c) optional flags and pull up/down.
>  
> +- hdmiphy-confs: following information about the hdmiphy conf settings.

Judging by the other patches, this is a node, not a property.

> +        a) "nr-confs" specifies the number of pixel clocks supported.

Why is this needed? Someone will get it wrong eventually and it can be figured
out currently by counting the child nodes, testing if they have the appropriate
properties.

> +	b) "confX: confX" specifies the phy configuration settings,

This is confusing. What is X?

The label is irrelevant -- none of this patch looks for phandles pointing at
configurations, nor is the precise name of the label important.

This is a node, not a property.

> +		"clock-frequency" specifies the pixel clock

Is this a frequency to configure the pixel clock with, or the pre-determined
frequency of a clock that we will select?

> +		"con-de-emphasis-level" specifies the configuration
> +		of Data De-emphasis levels.

Please explain _why_ we need this configuration.

Also, "con" is not a good abbreviation of "configuration", "config" would be
preferable.

> +			0x145D0040h[3:0] permitted values:
> +				0000 means 760 mVdiff && 1111 means 1400 mVdiff

I assume the 'h' suffix is a redundant description that the constant is
hexadecimal. Please drop it.

What is 0x145D0040? The address of the register, or its value?

The description is confusing, 0x145D0040h[3:0] is always 0[3:0].

Why does this need to be the exact value programmed into the register rather
than separate values the driver can compose?

> +			0x145D0040h[7:4] permitted values:
> +				000 	0dB
> +				0001	-0.25dB
> +				0010	-0.7dB
> +				0011	-1.15dB
> +				1111	-7.45dB

Again, this seems very odd. Why this format?

> +		"con-clock-level" specifies the configuration for
> +		the corresponding clock level.

To repeat my comment on "con-de-emphasis-level", "con" is not a good
abbreviation for "configuration".

> +			0x145D005Ch [1:0] permitted values:
> +				00 means 0 mVdiff && 11 means 60 mVdiff
> +			0x145D005Ch [7:3] permitted values:
> +				00000 is 790 mVdiff
> +				11111 is 1430 mVdiff

Please explain why we must use this exact format rather than one which may be
understood more easily.

>  Example:
>  
>  	hdmi {
> @@ -20,4 +41,12 @@ Example:
>  		reg = <0x14530000 0x100000>;
>  		interrupts = <0 95 0>;
>  		hpd-gpio = <&gpx3 7 1>;
> +		hdmiphy-confs {
> +			nr-confs = <1>;
> +			conf0: conf0 {
> +				clock-frequency = <25200000>;
> +				conf-de-emphasis-level =  /bits/ 8 <0x26>;
> +				conf-clock-level =  /bits/ 8 < 0x66>;

Why are these 8-bit? That wasn't described in the binding at all so far.

> +			};
> +		}
>  	};
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index c23f16b..436b75a 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -424,6 +424,9 @@
>  
>  	hdmi {
>  		hpd-gpio = <&gpx3 7 2>;
> +		vdd_osc-supply = <&ldo10_reg>;
> +		vdd_pll-supply = <&ldo8_reg>;
> +		vdd-supply = <&ldo8_reg>;
>  		hdmiphy-confs {
>  			nr-confs = <13>;
>  			conf0: conf0 {
> @@ -492,9 +495,6 @@
>  				conf-clock-level =  /bits/ 8 < 0x66>;
>  			};
>  		};
> -		vdd_osc-supply = <&ldo10_reg>;
> -		vdd_pll-supply = <&ldo8_reg>;
> -		vdd-supply = <&ldo8_reg>;
>  	};
>  
>  	mmc_reg: voltage-regulator {

Why is this moving? It in no way relates to the rest of the patch, and wasn't
described in the commit message.

[...]

> +static int drm_hdmi_dt_parse_phy_conf(struct platform_device *pdev,
> +						struct hdmi_context *hdata)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *dev_np = dev->of_node;
> +	struct device_node *phy_conf, *cfg_np;
> +	int i = 0;
> +
> +	phy_conf = of_find_node_by_name(dev_np, "hdmiphy-confs");
> +	if (phy_conf == NULL) {
> +		DRM_ERROR("Did not find hdmiphy_conf node\n");
> +		return -ENODEV;
> +	}
> +
> +	of_property_read_u32(phy_conf, "nr-confs", &hdata->nr_confs);

This can fail, returning an error code. Either check it, or remove this
property entirely and do this based on the number of children which have the
appropriate properties.

> +	hdata->confs = kzalloc((hdata->nr_confs * sizeof
> +					(struct hdmiphy_config)), GFP_KERNEL);

Why the brackets on the first argument of kzalloc? They're superfluous.

What if kzalloc fails?

> +
> +	/* Initialize with default config */
> +	hdata->confs = hdmiphy_v14_configs;
> +
> +	for_each_child_of_node(phy_conf, cfg_np) {

What if nr-confs is smaller than the number of child nodes?

> +		if (!of_find_property(cfg_np, "clock-frequency", NULL))
> +			continue;
> +
> +		if (of_property_read_u32_array(cfg_np, "clock-frequency",
> +					(u32 *)&hdata->confs[i].
> +							pixel_clock, 1)) {

Don't split &hdata->confs[i].pixel_clock over two lines.

Why is the cast necessary?

Why not just of_property_read_u32? This only ever has a single value, and while
there's no of_property_read_u8, of_property_read_u32 exists.

> +				DRM_ERROR("Failed to get pixel clock\n");
> +				return -EINVAL;
> +		}
> +
> +		/* Overwrite the data de-emphasis and data level */
> +		if (of_property_read_u8_array(cfg_np, "conf-de-emphasis-level",
> +					(u8 *)&hdata->confs[i].conf[16], 1)) {

Why is this cast necessary?

I don't see why this must be an 8 bit property.

> +				DRM_ERROR("Failed to get conf\n");
> +				return -EINVAL;
> +		}
> +		/* Overwrite the clock level diff */
> +		if (of_property_read_u8_array(cfg_np, "conf-clock-level",
> +					(u8 *)&hdata->confs[i].conf[23], 1)) {

Why the cast?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
