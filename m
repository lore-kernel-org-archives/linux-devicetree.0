From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V11 4/6] pinctrl: max77620: add pincontrol driver for
 MAX77620/MAX20024
Date: Thu, 28 Apr 2016 18:52:26 +0530
Message-ID: <57220E92.90105@nvidia.com>
References: <1461837540-17071-1-git-send-email-ldewangan@nvidia.com> <1461837540-17071-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461837540-17071-5-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, swarren@nvidia.com, treding@nvidia.com, irina.tirdea@intel.com
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Thursday 28 April 2016 03:28 PM, Laxman Dewangan wrote:
> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO pins
> which also act as the special function in alternate mode. Also
> there is configuration like push-pull, open drain, FPS timing
> etc for these pins.
>
> Add pin control driver to configure these parameters through
> pin control APIs.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It seems there is some mismatches on kernel-next and the mfd/for-next 
for one of patch for generic function name.

/**
2016-04-01    pinctrl: Rename pinctrl_utils_dt_free_map to 
pinctrl_utils_free_map    Irina Tirdea    1    -1/+1

d32f7fd3bbc32732b094d938b95169521503a9fb (patch)

pinctrl: Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map

Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map, since
it does not depend on device tree despite the current name. This
will enforce a consistent naming in pinctr-utils.c and will make
it clear it can be called from outside device tree (e.g. from
ACPI handling code).
**/

But this is not there in MFD sub system.

In mfd tree
.dt_free_map = pinctrl_utils_dt_free_map,

In kernel next
.dt_free_map = pinctrl_utils_free_map,


  I used APIs from the kernel-next.
> +static const struct pinctrl_ops max77620_pinctrl_ops = {
> +	.get_groups_count = max77620_pinctrl_get_groups_count,
> +	.get_group_name = max77620_pinctrl_get_group_name,
> +	.get_group_pins = max77620_pinctrl_get_group_pins,
> +	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
> +	.dt_free_map = pinctrl_utils_free_map,
> +};


If you see any issue on this patch, please drop this patch and we will 
fix this later once the renamed change available all the places.
