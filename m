From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 1/2] mfd: AS3722: add dt node properties for system
 power controller
Date: Fri, 20 Dec 2013 13:48:08 +0000
Message-ID: <20131220134808.GD3709@lee--X1>
References: <1387545840-2844-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387545840-2844-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: anton@enomsg.org, dwmw2@infradead.org, mark.rutland@arm.com, rob@landley.net, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 20 Dec 2013, Laxman Dewangan wrote:

> ams AS3722 device supports the power off by turning off its all rails=
=2E
>=20
> Add dt node properties to enable this functionality on this device.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Tested-by: Stephen Warren <swarren@nvidia.com>

I'm guessing I can use this as an Ack?

> ---
> Changes form V1:
> - Rephrase sentence and mention that propery is boolean type.
> - Added Tested by.
>=20
>  Documentation/devicetree/bindings/mfd/as3722.txt |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/as3722.txt b/Docum=
entation/devicetree/bindings/mfd/as3722.txt
> index fc2191e..8edcb9b 100644
> --- a/Documentation/devicetree/bindings/mfd/as3722.txt
> +++ b/Documentation/devicetree/bindings/mfd/as3722.txt
> @@ -112,6 +112,15 @@ Following are properties of regulator subnode.
>  		ams,enable-tracking: Enable tracking with SD1, only supported
>  			by LDO3.
> =20
> +Power-off:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +AS3722 supports the system power off by turning off all its rail. Th=
is
> +is provided through pm_power_off.
> +The device node should have the following properties to enable this
> +functionality
> +ams,system-power-controller: Boolean, to enable the power off functi=
onality
> +        through this device.
> +
>  Example:
>  --------
>  #include <dt-bindings/mfd/as3722.h>
> @@ -120,6 +129,8 @@ ams3722 {
>  	compatible =3D "ams,as3722";
>  	reg =3D <0x48>;
> =20
> +	ams,system-power-controller;
> +
>  	interrupt-parent =3D <&intc>;
>  	interrupt-controller;
>  	#interrupt-cells =3D <2>;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
