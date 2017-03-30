From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: gpu: add bindings for the ARM Mali
 Midgard GPU
Date: Thu, 30 Mar 2017 10:00:42 +0200
Message-ID: <6ce37fbf-3c46-c079-b934-8c8195e3d9fb@collabora.com>
References: <cover.1490789802.git.guillaume.tucker@collabora.com>
 <db45d0d68957d699f13a0d92f4f84d8ebfd0270e.1490789802.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <db45d0d68957d699f13a0d92f4f84d8ebfd0270e.1490789802.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 29/03/17 14:44, Guillaume Tucker wrote:
> The ARM Mali Midgard GPU family is present in a number of SoCs
> from many different vendors such as Samsung Exynos and Rockchip.
> 
> Import the device tree bindings documentation from the r16p0
> release of the Mali Midgard GPU kernel driver:
> 
>   https://developer.arm.com/-/media/Files/downloads/mali-drivers/kernel/mali-midgard-gpu/TX011-SW-99002-r16p0-00rel0.tgz
> 
> The following optional bindings have been omitted in this initial
> version as they are only used in very specific cases:
> 
>   * snoop_enable_smc
>   * snoop_disable_smc
>   * jm_config
>   * power_model
>   * system-coherency
>   * ipa-model
> 
> The example has been simplified accordingly.
> 
> The compatible string definition has been limited to
> "arm,mali-midgard" to avoid checkpatch.pl warnings and to match
> what the driver actually expects (as of r16p0 out-of-tree).
> 
> CC: John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  .../devicetree/bindings/gpu/arm,mali-midgard.txt   | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> new file mode 100644
> index 000000000000..da8fc6d21bbf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> @@ -0,0 +1,53 @@
> +#
> +# (C) COPYRIGHT 2013-2016 ARM Limited.
> +# Copyright (C) 2017 Collabora Ltd
> +#
> +# This program is free software and is provided to you under the terms of the
> +# GNU General Public License version 2 as published by the Free Software
> +# Foundation, and any use by you of this program is subject to the terms
> +# of such GNU licence.
> +#
> +
> +
> +ARM Mali Midgard GPU
> +====================
> +
> +Required properties:
> +
> +- compatible : Should be "arm,mali-midgard".
> +- reg : Physical base address of the device and length of the register area.
> +- interrupts : Contains the three IRQ lines required by Mali Midgard devices.
> +- interrupt-names : Contains the names of IRQ resources in the order they were
> +  provided in the interrupts property. Must contain: "JOB, "MMU", "GPU".
> +
> +Optional:
> +
> +- clocks : Phandle to clock for the Mali Midgard device.
> +- clock-names : Shall be "clk_mali".
> +- mali-supply : Phandle to regulator for the Mali device. Refer to
> +  Documentation/devicetree/bindings/regulator/regulator.txt for details.
> +- operating-points : Refer to Documentation/devicetree/bindings/power/opp.txt
> +  for details.
> +
> +Example for a Mali-T602:
> +
> +gpu@0xfc010000 {
> +	compatible = "arm,mali-midgard";
> +	reg = <0xfc010000 0x4000>;
> +	interrupts = <0 36 4>, <0 37 4>, <0 38 4>;
> +	interrupt-names = "JOB", "MMU", "GPU";
> +
> +	clocks = <&pclk_mali>;
> +	clock-names = "clk_mali";
> +	mali-supply = <&vdd_mali>;
> +	operating-points = <
> +		/* KHz   uV */
> +		533000 1250000,
> +		450000 1150000,
> +		400000 1125000,
> +		350000 1075000,
> +		266000 1025000,
> +		160000  925000,
> +		100000  912500,
> +	>;
> +};
> 

This works with veyron-minnie and veyron-jerry too, so

Tested-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
