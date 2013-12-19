From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: AS3722: add dt node properties for system power
 controller
Date: Thu, 19 Dec 2013 13:06:10 +0000
Message-ID: <20131219130610.GI27373@lee--X1>
References: <1387457821-12509-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387457821-12509-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: anton@enomsg.org, dwmw2@infradead.org, mark.rutland@arm.com, rob@landley.net, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 19 Dec 2013, Laxman Dewangan wrote:

> ams AS3722 device supports the power off by turning off its all rails=
=2E
>=20
> Add dt node properties to enable this functionality on this device.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  Documentation/devicetree/bindings/mfd/as3722.txt |    9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/as3722.txt b/Docum=
entation/devicetree/bindings/mfd/as3722.txt
> index fc2191e..1e54937 100644
> --- a/Documentation/devicetree/bindings/mfd/as3722.txt
> +++ b/Documentation/devicetree/bindings/mfd/as3722.txt
> @@ -112,6 +112,15 @@ Following are properties of regulator subnode.
>  		ams,enable-tracking: Enable tracking with SD1, only supported
>  			by LDO3.
> =20
> +Power-off:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +AS3722 supports the system power off by turning off all its rail. Th=
e power off
> +is provided through pm power off.

I think pm_power_off is a Linuxisum.

> +The device node should have the following properties to enable power=
-off

Why is it power-off here and power off everywhere else?

> +functionality from ams AS3722:
> +ams,system-power-controller: To enable the power off functionality t=
hrough
> +	device.

Do what with it? "on", "<1>", something else?

>  Example:
>  --------
>  #include <dt-bindings/mfd/as3722.h>

Should it be represented in the example?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
