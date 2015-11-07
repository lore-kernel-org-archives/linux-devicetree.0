From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: add SMP enable-method for Broadcom
 NSP
Date: Sat, 7 Nov 2015 13:40:23 -0800
Message-ID: <563E6FC7.6070700@gmail.com>
References: <1446844273-6460-1-git-send-email-kapilh@broadcom.com>
 <1446844273-6460-2-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446844273-6460-2-git-send-email-kapilh@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kapil Hali <kapilh@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Le 06/11/2015 13:11, Kapil Hali a =C3=A9crit :
> Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
> Northstar Plus CPU to the 32-bit ARM CPU device tree binding
> documentation file and create a new binding documentation for
> Northstar Plus CPU.
>=20
> Signed-off-by: Kapil Hali <kapilh@broadcom.com>
> ---
>  .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 36 ++++++++++++=
++++++++++
>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,ns=
p-cpu-method.txt
>=20
> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-m=
ethod.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-meth=
od.txt
> new file mode 100644
> index 0000000..8506da7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.t=
xt
> @@ -0,0 +1,36 @@
> +Broadcom Northstar Plus SoC CPU Enable Method
> +---------------------------------------------
> +This binding defines the enable method used for starting secondary
> +CPUs in the following Broadcom SoCs:
> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM883=
12
> +
> +The enable method is specified by defining the following required
> +properties in the "cpus" device tree node:
> +  - enable-method =3D "brcm,bcm-nsp-smp";
> +  - secondary-boot-reg =3D <...>;
> +
> +The secondary-boot-reg property is a u32 value that specifies the
> +physical address of the register used to request the ROM holding pen
> +code release a secondary CPU.

Is it really how the ROM code is implemented, as a pen holding/release
mechanism (which sounds like how this was implemented previously in the
kernel actually) or should this be described in a more generic way as
the physical address of the register where the secondary CPUs reset
vector address must be written to? Or something along these lines.

> +
> +Example:
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		enable-method =3D "brcm,bcm-nsp-smp";

Just a nit, but if NSP and NS are sharing the same mechanism, would not
a more "NS-centric" property be more appropriate because NS came before=
 NSP?

> +		secondary-boot-reg =3D <0xffff042c>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a9";
> +			next-level-cache =3D <&L2>;
> +			reg =3D <0>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a9";
> +			next-level-cache =3D <&L2>;
> +			reg =3D <1>;
> +		};
> +	};
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documen=
tation/devicetree/bindings/arm/cpus.txt
> index 91e6e5c..6abe3f3 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -191,6 +191,7 @@ nodes to be present and contain the properties de=
scribed below.
>  			    "allwinner,sun8i-a23"
>  			    "arm,psci"
>  			    "brcm,brahma-b15"
> +			    "brcm,bcm-nsp-smp"
>  			    "marvell,armada-375-smp"
>  			    "marvell,armada-380-smp"
>  			    "marvell,armada-390-smp"
>=20


--=20
=46lorian
