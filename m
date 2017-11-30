From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4] mfd: syscon: Add hardware spinlock support
Date: Thu, 30 Nov 2017 08:35:52 +0000
Message-ID: <20171130083552.ynti3n3njzvps555@dell>
References: <2344ec4123c8b0985e54e03a0fa1bfe8d5e68235.1512009343.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2344ec4123c8b0985e54e03a0fa1bfe8d5e68235.1512009343.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, broonie@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Nov 2017, Baolin Wang wrote:

> Some system control registers need hardware spinlock to synchronize
> between the multiple subsystems, so we should add hardware spinlock
> support for syscon.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v3:
>  - Add error handling for of_hwspin_lock_get_id()
> 
> Changes since v2:
>  - Add acked tag from Rob.
> 
> Changes since v1:
>  - Remove timeout configuration.
>  - Modify the binding file to add hwlocks.
> ---
>  Documentation/devicetree/bindings/mfd/syscon.txt |    1 +
>  drivers/mfd/syscon.c                             |   21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
> index 8b92d45..f464cc8 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.txt
> +++ b/Documentation/devicetree/bindings/mfd/syscon.txt
> @@ -16,6 +16,7 @@ Required properties:
>  Optional property:
>  - reg-io-width: the size (in bytes) of the IO accesses that should be
>    performed on the device.
> +- hwlocks: reference to a phandle of a hardware spinlock provider node.

Example?

Perhaps even include the hwlock node (I'm not sure what that would
look like).

>  Examples:
>  gpr: iomuxc-gpr@20e0000 {
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index b93fe4c..caf6a25 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -13,6 +13,7 @@
>   */
>  
>  #include <linux/err.h>
> +#include <linux/hwspinlock.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/list.h>
> @@ -87,6 +88,26 @@ static struct syscon *of_syscon_register(struct device_node *np)
>  	if (ret)
>  		reg_io_width = 4;
>  
> +	ret = of_hwspin_lock_get_id(np, 0);
> +	if (ret > 0) {
> +		syscon_config.hwlock_id = ret;
> +		syscon_config.hwlock_mode = HWLOCK_IRQSTATE;
> +	} else {
> +		switch (ret) {
> +		case -ENOENT:
> +			/* ignore missing hwlock, it's optional */

Is your shift key broken? ;)

Please use proper grammar.  Sentences start with capital letters.

> +			break;
> +		case 0:
> +			ret = -EINVAL;
> +			/* fall-through */
> +		default:
> +			pr_err("Failed to retrieve valid hwlock: %d\n", ret);
> +			/* fall-through */
> +		case -EPROBE_DEFER:
> +			goto err_regmap;
> +		}
> +	}
> +
>  	syscon_config.reg_stride = reg_io_width;
>  	syscon_config.val_bits = reg_io_width * 8;
>  	syscon_config.max_register = resource_size(&res) - reg_io_width;

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
