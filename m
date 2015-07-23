From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v2 1/2] mfd: devicetree: bindings: 88pm800: Add DT
 property for dual phase enable
Date: Thu, 23 Jul 2015 16:53:22 +0100
Message-ID: <20150723155322.GU3436@x1>
References: <1437495782-15767-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1437495782-15767-2-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437495782-15767-2-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jul 2015, Vaibhav Hiremath wrote:

> 88PM860 family of device supports dual phase mode on BUCK1 supply
> providing total 6A capacity.
> Note that by default they operate independently with 3A capacity.
>=20
> This patch updates the devicetree binding with DT property
> to enable dual-phase mode on BUCK1.
>=20
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/88pm800.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt b/Docu=
mentation/devicetree/bindings/mfd/88pm800.txt
> index dec842f..2c82fcb 100644
> --- a/Documentation/devicetree/bindings/mfd/88pm800.txt
> +++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
> @@ -9,6 +9,12 @@ Required parent device properties:
>  - #interrupt-cells 	: should be 1.
>  			  The cell is the 88pm80x local IRQ number
> =20
> +Optional properties :
> +- marvell,88pm860-buck1-dualphase-en  : If set, enable dual phase on=
 BUCK1,
> +  providing 6A capacity.
> +  Without this both BUCK1A and BUCK1B operates independently with 3A=
 capacity.
> +  (This property is only applicable to 88PM860)

You need to get Mark Brown to Ack this.

>  88pm80x family of devices consists of varied group of sub-devices:
> =20
>  Device		 	Supply Names	 Description

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
