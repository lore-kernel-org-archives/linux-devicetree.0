From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv6 3/3] dt-bindings: mfd: s2mps11: Add support S2MPU02 PMIC
Date: Wed, 18 Jun 2014 10:14:49 +0100
Message-ID: <20140618091449.GE23945@lee--X1>
References: <1402964830-24890-1-git-send-email-cw00.choi@samsung.com>
 <1402964830-24890-4-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402964830-24890-4-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 17 Jun 2014, Chanwoo Choi wrote:

> This patch add documentation for S2MPU02 PMIC device. S2MPU02 has a l=
ittle
> difference from S2MPS11/S2MPS14 PMIC and has LDO[1-28]/Buck[1-7].
>=20
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Nothing controversial here me thinks.

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index d81ba30..f7c9180 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -1,5 +1,5 @@
> =20
> -* Samsung S2MPS11 and S2MPS14 Voltage and Current Regulator
> +* Samsung S2MPS11, S2MPS14 and S2MPU02 Voltage and Current Regulator
> =20
>  The Samsung S2MPS11 is a multi-function device which includes voltag=
e and
>  current regulators, RTC, charger controller and other sub-blocks. It=
 is
> @@ -7,7 +7,8 @@ interfaced to the host controller using an I2C interf=
ace. Each sub-block is
>  addressed by the host system using different I2C slave addresses.
> =20
>  Required properties:
> -- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-p=
mic".
> +- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-p=
mic"
> +              or "samsung,s2mpu02-pmic".
>  - reg: Specifies the I2C slave address of the pmic block. It should =
be 0x66.
> =20
>  Optional properties:
> @@ -81,11 +82,13 @@ as per the datasheet of s2mps11.
>  		  - valid values for n are:
>  			- S2MPS11: 1 to 38
>  			- S2MPS14: 1 to 25
> +			- S2MPU02: 1 to 28
>  		  - Example: LDO1, LD02, LDO28
>  	- BUCKn
>  		  - valid values for n are:
>  			- S2MPS11: 1 to 10
>  			- S2MPS14: 1 to 5
> +			- S2MPU02: 1 to 7
>  		  - Example: BUCK1, BUCK2, BUCK9
> =20
>  Example:

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
