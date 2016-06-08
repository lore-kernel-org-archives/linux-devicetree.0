From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v5 3/5] mfd: dt-bindings: Add RK818
 device tree bindings document
Date: Wed, 8 Jun 2016 15:23:26 +0100
Message-ID: <20160608142326.GF14888@dell>
References: <1464850228-17244-1-git-send-email-w.egorov@phytec.de>
 <1464850228-17244-3-git-send-email-w.egorov@phytec.de>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBDA7X7F2WUEBBQGU4C5AKGQEXO75IAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1464850228-17244-3-git-send-email-w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 02 Jun 2016, Wadim Egorov wrote:

> Add device tree bindings documentation for Rockchip's RK818 PMIC.
>=20
> Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/mfd/rk808.txt | 37 +++++++++++++++++++=
++++--
>  1 file changed, 34 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentat=
ion/devicetree/bindings/mfd/rk808.txt
> index 4ca6aab..9636ae8 100644
> --- a/Documentation/devicetree/bindings/mfd/rk808.txt
> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> @@ -1,7 +1,11 @@
> -RK808 Power Management Integrated Circuit
> +RK8XX Power Management Integrated Circuit
> +
> +The rk8xx family current members:
> +rk808
> +rk818
> =20
>  Required properties:
> -- compatible: "rockchip,rk808"
> +- compatible: "rockchip,rk808", "rockchip,rk818"
>  - reg: I2C slave address
>  - interrupt-parent: The parent interrupt controller.
>  - interrupts: the interrupt outputs of the controller.
> @@ -13,6 +17,8 @@ Optional properties:
>    default output clock name
>  - rockchip,system-power-controller: Telling whether or not this pmic is =
controlling
>    the system power.
> +
> +Optional RK808 properties:
>  - vcc1-supply:  The input supply for DCDC_REG1
>  - vcc2-supply:  The input supply for DCDC_REG2
>  - vcc3-supply:  The input supply for DCDC_REG3
> @@ -29,7 +35,20 @@ Optional properties:
>    the gpio controller. If DVS GPIOs aren't present, voltage changes will=
 happen
>    very quickly with no slow ramp time.
> =20
> -Regulators: All the regulators of RK808 to be instantiated shall be
> +Optional RK818 properties:
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
> +Regulators: All the regulators of RK8XX to be instantiated shall be
>  listed in a child node named 'regulators'. Each regulator is represented
>  by a child node of the 'regulators' node.
> =20
> @@ -48,6 +67,18 @@ number as described in RK808 datasheet.
>  	- SWITCH_REGn
>  		- valid values for n are 1 to 2
> =20
> +Following regulators of the RK818 PMIC block are supported. Note that
> +the 'n' in regulator name, as in DCDC_REGn or LDOn, represents the DCDC =
or LDO
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

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
---=20
You received this message because you are subscribed to the Google Groups "=
rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
