From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] mfd: s2mps11: Add binding documentation for Samsung
 S2MPS13 PMIC
Date: Tue, 18 Nov 2014 08:19:42 +0000
Message-ID: <20141118081942.GT24004@x1>
References: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
 <1416184980-532-6-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416184980-532-6-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 17 Nov 2014, Chanwoo Choi wrote:

> This patch adds the binding documentation for Samsung S2MPS13 PMIC
> which is similiar with existing S2MPS14 PMIC. S2MPS13 has the differe=
nt number
> of regulators from S2MPS14 and RTC/Clock is the same with the S2MPS14=
=2E
>=20
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt | 22 ++++++++++++-=
---------
>  1 file changed, 12 insertions(+), 10 deletions(-)

=46or my reference:

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index 0e4026a..57a0450 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -1,5 +1,5 @@
> =20
> -* Samsung S2MPS11, S2MPS14 and S2MPU02 Voltage and Current Regulator
> +* Samsung S2MPS11, S2MPS13, S2MPS14 and S2MPU02 Voltage and Current =
Regulator
> =20
>  The Samsung S2MPS11 is a multi-function device which includes voltag=
e and
>  current regulators, RTC, charger controller and other sub-blocks. It=
 is
> @@ -7,8 +7,8 @@ interfaced to the host controller using an I2C interf=
ace. Each sub-block is
>  addressed by the host system using different I2C slave addresses.
> =20
>  Required properties:
> -- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-p=
mic"
> -              or "samsung,s2mpu02-pmic".
> +- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps13-p=
mic"
> +	      or "samsung,s2mps14-pmic" or "samsung,s2mpu02-pmic".
>  - reg: Specifies the I2C slave address of the pmic block. It should =
be 0x66.
> =20
>  Optional properties:
> @@ -17,8 +17,8 @@ Optional properties:
>  - interrupts: Interrupt specifiers for interrupt sources.
> =20
>  Optional nodes:
> -- clocks: s2mps11 and s5m8767 provide three(AP/CP/BT) buffered 32.76=
8 KHz
> -  outputs, so to register these as clocks with common clock framewor=
k
> +- clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffe=
red 32.768
> +  KHz outputs, so to register these as clocks with common clock fram=
ework
>    instantiate a sub-node named "clocks". It uses the common clock bi=
nding
>    documented in :
>    [Documentation/devicetree/bindings/clock/clock-bindings.txt]
> @@ -30,12 +30,12 @@ Optional nodes:
>      the clock which they consume.
>      Clock               ID           Devices
>      ----------------------------------------------------------
> -    32KhzAP		0            S2MPS11, S2MPS14, S5M8767
> -    32KhzCP		1            S2MPS11, S5M8767
> -    32KhzBT		2            S2MPS11, S2MPS14, S5M8767
> +    32KhzAP		0            S2MPS11, S2MPS13, S2MPS14, S5M8767
> +    32KhzCP		1            S2MPS11, S2MPS13, S5M8767
> +    32KhzBT		2            S2MPS11, S2MPS13, S2MPS14, S5M8767
> =20
> -  - compatible: Should be one of: "samsung,s2mps11-clk", "samsung,s2=
mps14-clk",
> -		"samsung,s5m8767-clk"
> +  - compatible: Should be one of: "samsung,s2mps11-clk", "samsung,s2=
mps13-clk",
> +		"samsung,s2mps14-clk", "samsung,s5m8767-clk"
> =20
>  - regulators: The regulators of s2mps11 that have to be instantiated=
 should be
>  included in a sub-node named 'regulators'. Regulator nodes included =
in this
> @@ -81,12 +81,14 @@ as per the datasheet of s2mps11.
>  	- LDOn
>  		  - valid values for n are:
>  			- S2MPS11: 1 to 38
> +			- S2MPS13: 1 to 40
>  			- S2MPS14: 1 to 25
>  			- S2MPU02: 1 to 28
>  		  - Example: LDO1, LDO2, LDO28
>  	- BUCKn
>  		  - valid values for n are:
>  			- S2MPS11: 1 to 10
> +			- S2MPS13: 1 to 10
>  			- S2MPS14: 1 to 5
>  			- S2MPU02: 1 to 7
>  		  - Example: BUCK1, BUCK2, BUCK9

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
