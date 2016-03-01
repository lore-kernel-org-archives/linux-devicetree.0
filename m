From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM64: dts: Prepare configs for Amlogic Meson GXBaby
Date: Tue, 1 Mar 2016 14:43:19 +0000
Message-ID: <56D5AA87.7020401@arm.com>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
 <1456789465-2962-4-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456789465-2962-4-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 29/02/16 23:44, Andreas F=C3=A4rber wrote:
> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>   arch/arm64/boot/dts/Makefile                |   1 +
>   arch/arm64/boot/dts/amlogic/Makefile        |   3 +
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 128 +++++++++++++++++=
+++++++++++
>   3 files changed, 132 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/Makefile
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makef=
ile
> index fd80617a9c6f..330fae966cf3 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -1,6 +1,7 @@
>   dts-dirs +=3D al
>   dts-dirs +=3D altera
>   dts-dirs +=3D amd
> +dts-dirs +=3D amlogic
>   dts-dirs +=3D apm
>   dts-dirs +=3D arm
>   dts-dirs +=3D broadcom
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/d=
ts/amlogic/Makefile
> new file mode 100644
> index 000000000000..1b06c28c67eb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -0,0 +1,3 @@
> +always		:=3D $(dtb-y)
> +subdir-y	:=3D $(dts-dirs)
> +clean-files	:=3D *.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64=
/boot/dts/amlogic/meson-gxbb.dtsi
> new file mode 100644
> index 000000000000..0ae089bd1806
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -0,0 +1,128 @@

[...]

> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible =3D "amlogic,meson-gxbb";
> +	interrupt-parent =3D <&gic>;
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	cpus {
> +		#address-cells =3D <0x2>;
> +		#size-cells =3D <0x0>;
> +

[...]

> +	};
> +
> +	arm-pmu {
> +		compatible =3D "arm,armv8-pmuv3";

Please use "arm,cortex-a53-pmu" instead

> +		interrupts =3D <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity =3D <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci";

Any particular reason why PSCI v0.2 or above is not supported on this
platform. PSCI v0.1 is very old now and I assume this platform is
relatively new.

> +		method =3D "smc";
> +		cpu_suspend =3D <0xc4000001>;
> +		cpu_off =3D <0x84000002>;
> +		cpu_on =3D <0xc4000003>;
> +		migrate =3D <0xc4000005>;

Atleast the functions ids look like v0.2 or above. So check if it's=20
actually v0.2 or above in which case you can drop all the function ids =
above

[...]

> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		gic: interrupt-controller@c4301000 {
> +			compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";

Preferably "arm,gic-400" ?

--=20
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
