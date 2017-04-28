From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: gpu: add bindings for the ARM Mali
 Midgard GPU
Date: Fri, 28 Apr 2017 14:27:42 -0500
Message-ID: <20170428192742.pu4v4layszr6z2ot@rob-hp-laptop>
References: <cover.1493125299.git.guillaume.tucker@collabora.com>
 <9349c8ae9091fbd93e9410f4cfae770ac850bf6b.1493125299.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9349c8ae9091fbd93e9410f4cfae770ac850bf6b.1493125299.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 25, 2017 at 02:16:16PM +0100, Guillaume Tucker wrote:
> The ARM Mali Midgard GPU family is present in a number of SoCs
> from many different vendors such as Samsung Exynos and Rockchip.
> 
> Import the device tree bindings documentation from the r16p0
> release of the Mali Midgard GPU kernel driver:
> 
>   https://developer.arm.com/-/media/Files/downloads/mali-drivers/kernel/mali-midgard-gpu/TX011-SW-99002-r16p0-00rel0.tgz
> 
> Remove the copyright and GPL licence header as deemed not necessary.
> 
> Redesign the "compatible" property strings to list all the Mali
> Midgard GPU types and include optional vendor ones.
> 
> Drop the "clock-names" property as only one clock is used by the Mali
> Midgard driver (which now needs to call clk_get with NULL).
> 
> Convert the "interrupt-names" property values to lower-case: "job",
> "mmu" and "gpu".
> 
> Replace the deprecated "operating-points" optional property with
> "operating-points-v2".
> 
> Omit the following optional properties in this initial version as they
> are only used in very specific cases:
> 
>   * snoop_enable_smc
>   * snoop_disable_smc
>   * jm_config
>   * power_model
>   * system-coherency
>   * ipa-model
> 
> Update the example accordingly to reflect all these changes.
> 
> CC: John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>
> Tested-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  .../devicetree/bindings/gpu/arm,mali-midgard.txt   | 82 ++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> new file mode 100644
> index 000000000000..547ddeceb498
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> @@ -0,0 +1,82 @@
> +ARM Mali Midgard GPU
> +====================
> +
> +Required properties:
> +
> +- compatible :
> +  * Must be one of the following:
> +    + "arm,mali-t60x"
> +    + "arm,mali-t62x"

Don't use wildcards.

> +    + "arm,mali-t720"
> +    + "arm,mali-t760"
> +    + "arm,mali-t820"
> +    + "arm,mali-t830"
> +    + "arm,mali-t860"
> +    + "arm,mali-t880"
> +  * And, optionally, one of the vendor specific compatible:

IMO, these should not be optional.

> +    + "amlogic,meson-gxm-mali"
> +    + "rockchip,rk3288-mali"
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
