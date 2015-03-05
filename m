From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] ARM64: Add new Xilinx ZynqMP SoC
Date: Thu, 05 Mar 2015 14:05:50 +0000
Message-ID: <54F862BE.7000901@arm.com>
References: <cd616fa25dafee38f98e3b207e74450c5403f440.1425563597.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cd616fa25dafee38f98e3b207e74450c5403f440.1425563597.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zach Pfeffer <zachp-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Michal,

On 05/03/15 13:53, Michal Simek wrote:
> Initial version of device tree for Xilinx ZynqMP SoC.
>=20
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> Changes in v2:
> -  move timer out of amba_apu bus because it is not on bus
>    Reported by Mark
> - FIC GICC and GICV addresses - Reported by Rob
> - Fix copyright
> - Enable cadence IP in defconfig
> - Add support for macb multiqueue
>=20
>  arch/arm64/Kconfig                          |   5 +
>  arch/arm64/boot/dts/Makefile                |   1 +
>  arch/arm64/boot/dts/xilinx/Makefile         |   5 +
>  arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts |  47 +++++
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 303 ++++++++++++++++++=
++++++++++
>  arch/arm64/configs/defconfig                |   3 +
>  6 files changed, 364 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/xilinx/Makefile
>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp.dtsi

[...]

> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64=
/boot/dts/xilinx/zynqmp-ep108.dts
> new file mode 100644
> index 000000000000..0a3f40ecd06d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts

[...]

> +		gic: interrupt-controller@f9010000 {
> +			compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> +			#interrupt-cells =3D <3>;
> +			reg =3D <0x0 0xf9010000 0x10000>,
> +			      <0x0 0xf902f000 0x2000>,
> +			      <0x0 0xf9040000 0x20000>,
> +			      <0x0 0xf906f000 0x2000>;
> +			interrupt-controller;

Please add the missing GIC maintenance interrupt.

Thanks,

	M.
--=20
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
