From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 3/3] mfd: dt-bindings: Add RK818 device tree bindings
 document
Date: Mon, 11 Apr 2016 10:48:49 -0500
Message-ID: <20160411154849.GA32476@rob-hp-laptop>
References: <1460108861-32818-1-git-send-email-w.egorov@phytec.de>
 <1460108861-32818-4-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460108861-32818-4-git-send-email-w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 08, 2016 at 11:47:41AM +0200, Wadim Egorov wrote:
> Add device tree bindings documentation for rockchip's RK818 pmic.
> 
> Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/rk808.txt | 37 +++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
> index 4ca6aab..8cceb07 100644
> --- a/Documentation/devicetree/bindings/mfd/rk808.txt
> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> @@ -1,7 +1,11 @@
> -RK808 Power Management Integrated Circuit
> +RK8xx Power Management Integrated Circuit
> +
> +The rk8xx family current members:
> +rk808
> +rk818
>  
>  Required properties:
> -- compatible: "rockchip,rk808"
> +- compatible: "rockchip,rk808", "rockchip,rk818"

Do one per line please.

>  - reg: I2C slave address
>  - interrupt-parent: The parent interrupt controller.
>  - interrupts: the interrupt outputs of the controller.
> @@ -13,6 +17,8 @@ Optional properties:
>    default output clock name
>  - rockchip,system-power-controller: Telling whether or not this pmic is controlling
>    the system power.
> +
> +Optional rk808 properties:
>  - vcc1-supply:  The input supply for DCDC_REG1
>  - vcc2-supply:  The input supply for DCDC_REG2
>  - vcc3-supply:  The input supply for DCDC_REG3
> @@ -29,7 +35,20 @@ Optional properties:
>    the gpio controller. If DVS GPIOs aren't present, voltage changes will happen
>    very quickly with no slow ramp time.
>  
> -Regulators: All the regulators of RK808 to be instantiated shall be
> +Optional rk818 properties:
> +- vcc1-supply:  The input supply for DCDC_REG1
> +- vcc2-supply:  The input supply for DCDC_REG2
> +- vcc3-supply:  The input supply for DCDC_REG3
> +- vcc4-supply:  The input supply for DCDC_REG4
> +- boost-supply: The input supply for DCDC_BOOST
> +- vcc6-supply:  The input supply for LDO_REG1 and LDO_REG2
> +- vcc7-supply:  The input supply for LDO_REG3, LDO_REG5 and LDO_REG7
> +- vcc8-supply:  The input supply for LDO_REG4, LDO_REG6 and LDO_REG8
> +- vcc9-supply:  The input supply for LDO_REG9 and SWITCH_REG
> +- h_5v-supply:  The input supply for HDMI_SWITCH
> +- usb-supply:   The input supply for OTG_SWITCH
> +
> +Regulators: All the regulators of RK8xx to be instantiated shall be
>  listed in a child node named 'regulators'. Each regulator is represented
>  by a child node of the 'regulators' node.
>  
> @@ -48,6 +67,18 @@ number as described in RK808 datasheet.
>  	- SWITCH_REGn
>  		- valid values for n are 1 to 2
>  
> +Following regulators of the RK818 PMIC block are supported. Note that
> +the 'n' in regulator name, as in DCDC_REGn or LDOn, represents the DCDC or LDO
> +number as described in RK818 datasheet.
> +
> +	- DCDC_REGn
> +		- valid values for n are 1 to 4.
> +	- LDO_REGn
> +		- valid values for n are 1 to 9.
> +	- SWITCH_REG
> +	- HDMI_SWITCH
> +	- OTG_SWITCH
> +
>  Standard regulator bindings are used inside regulator subnodes. Check
>    Documentation/devicetree/bindings/regulator/regulator.txt
>  for more details
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
