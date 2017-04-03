From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND v5 7/7] mfd: dt-bindings: Add RK805 device tree
 bindings document
Date: Mon, 3 Apr 2017 12:06:17 +0100
Message-ID: <20170403110617.gczms2uwdgfuaoao@dell>
References: <1490595705-28844-1-git-send-email-zhangqing@rock-chips.com>
 <1490597615-852-1-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490597615-852-1-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 27 Mar 2017, Elaine Zhang wrote:

> Add device tree bindings documentation for Rockchip's RK805 PMIC.
> 
> Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/rk808.txt | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
  
> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
> index 9636ae8d8d41..91b65227afeb 100644
> --- a/Documentation/devicetree/bindings/mfd/rk808.txt
> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> @@ -1,11 +1,14 @@
>  RK8XX Power Management Integrated Circuit
>  
>  The rk8xx family current members:
> +rk805
>  rk808
>  rk818
>  
>  Required properties:
> -- compatible: "rockchip,rk808", "rockchip,rk818"
> +- compatible: "rockchip,rk805"
> +- compatible: "rockchip,rk808"
> +- compatible: "rockchip,rk818"
>  - reg: I2C slave address
>  - interrupt-parent: The parent interrupt controller.
>  - interrupts: the interrupt outputs of the controller.
> @@ -18,6 +21,14 @@ Optional properties:
>  - rockchip,system-power-controller: Telling whether or not this pmic is controlling
>    the system power.
>  
> +Optional RK805 properties:
> +- vcc1-supply:  The input supply for DCDC_REG1
> +- vcc2-supply:  The input supply for DCDC_REG2
> +- vcc3-supply:  The input supply for DCDC_REG3
> +- vcc4-supply:  The input supply for DCDC_REG4
> +- vcc5-supply:  The input supply for LDO_REG1 and LDO_REG2
> +- vcc6-supply:  The input supply for LDO_REG3
> +
>  Optional RK808 properties:
>  - vcc1-supply:  The input supply for DCDC_REG1
>  - vcc2-supply:  The input supply for DCDC_REG2
> @@ -56,6 +67,15 @@ by a child node of the 'regulators' node.
>  		/* standard regulator bindings here */
>  	};
>  
> +Following regulators of the RK805 PMIC regulators are supported. Note that
> +the 'n' in regulator name, as in DCDC_REGn or LDOn, represents the DCDC or LDO
> +number as described in RK805 datasheet.
> +
> +	- DCDC_REGn
> +		- valid values for n are 1 to 4.
> +	- LDO_REGn
> +		- valid values for n are 1 to 3
> +
>  Following regulators of the RK808 PMIC block are supported. Note that
>  the 'n' in regulator name, as in DCDC_REGn or LDOn, represents the DCDC or LDO
>  number as described in RK808 datasheet.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
