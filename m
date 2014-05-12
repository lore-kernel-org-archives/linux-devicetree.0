From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: rockchip: convert smp bringup to CPU_METHOD_OF_DECLARE
Date: Mon, 12 May 2014 19:17:46 +0200
Message-ID: <155552153.z5UXrbJMBi@phil>
References: <1632873.urGeGsUMPH@diego> <2151573.evmqdkWnet@diego> <1878147.CvhHSZhTas@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1878147.CvhHSZhTas@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 27. M=E4rz 2014, 01:06:32 schrieb Heiko St=FCbner:
> With the newly introduced CPU_METHOD_OF_DECLARE is not necessary anym=
ore
> to reference the relevant smp_ops in the board file, but instead it c=
an
> simply be set by the enable-method property of the cpu nodes.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

more responses to this? [or maybe even an ack :-) ? ]


Thanks
Heiko

> ---
> changes since v1:
>   - add a short description to the enable-method binding
>=20
>  Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
>  arch/arm/boot/dts/rk3066a.dtsi                 | 1 +
>  arch/arm/boot/dts/rk3188.dtsi                  | 1 +
>  arch/arm/mach-rockchip/core.h                  | 2 --
>  arch/arm/mach-rockchip/platsmp.c               | 3 ++-
>  arch/arm/mach-rockchip/rockchip.c              | 1 -
>  6 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt
> b/Documentation/devicetree/bindings/arm/cpus.txt index 333f4ae..f52a9=
ac
> 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -185,6 +185,8 @@ nodes to be present and contain the properties de=
scribed
> below. "qcom,gcc-msm8660"
>  			    "qcom,kpss-acc-v1"
>  			    "qcom,kpss-acc-v2"
> +			    "rockchip,rk3066-smp" - cpu-core handling of Socs
> +					from Rockchip starting with rk3066
>=20
>  	- cpu-release-addr
>  		Usage: required for systems that have an "enable-method"
> diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk306=
6a.dtsi
> index 4d4dfbb..90b354d 100644
> --- a/arch/arm/boot/dts/rk3066a.dtsi
> +++ b/arch/arm/boot/dts/rk3066a.dtsi
> @@ -24,6 +24,7 @@
>  	cpus {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> +		enable-method =3D "rockchip,rk3066-smp";
>=20
>  		cpu@0 {
>  			device_type =3D "cpu";
> diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188=
=2Edtsi
> index bb36596..7ad5103 100644
> --- a/arch/arm/boot/dts/rk3188.dtsi
> +++ b/arch/arm/boot/dts/rk3188.dtsi
> @@ -24,6 +24,7 @@
>  	cpus {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> +		enable-method =3D "rockchip,rk3066-smp";
>=20
>  		cpu@0 {
>  			device_type =3D "cpu";
> diff --git a/arch/arm/mach-rockchip/core.h b/arch/arm/mach-rockchip/c=
ore.h
> index e2e7c9d..39bca96 100644
> --- a/arch/arm/mach-rockchip/core.h
> +++ b/arch/arm/mach-rockchip/core.h
> @@ -18,5 +18,3 @@ extern char rockchip_secondary_trampoline_end;
>=20
>  extern unsigned long rockchip_boot_fn;
>  extern void rockchip_secondary_startup(void);
> -
> -extern struct smp_operations rockchip_smp_ops;
> diff --git a/arch/arm/mach-rockchip/platsmp.c
> b/arch/arm/mach-rockchip/platsmp.c index dbfa5a2..a18b7f2 100644
> --- a/arch/arm/mach-rockchip/platsmp.c
> +++ b/arch/arm/mach-rockchip/platsmp.c
> @@ -178,7 +178,8 @@ static void __init rockchip_smp_prepare_cpus(unsi=
gned
> int max_cpus) pmu_set_power_domain(0 + i, false);
>  }
>=20
> -struct smp_operations rockchip_smp_ops __initdata =3D {
> +static struct smp_operations rockchip_smp_ops __initdata =3D {
>  	.smp_prepare_cpus	=3D rockchip_smp_prepare_cpus,
>  	.smp_boot_secondary	=3D rockchip_boot_secondary,
>  };
> +CPU_METHOD_OF_DECLARE(rk3066_smp, "rockchip,rk3066-smp",
> &rockchip_smp_ops); diff --git a/arch/arm/mach-rockchip/rockchip.c
> b/arch/arm/mach-rockchip/rockchip.c index d211d6f..4499b0a 100644
> --- a/arch/arm/mach-rockchip/rockchip.c
> +++ b/arch/arm/mach-rockchip/rockchip.c
> @@ -39,7 +39,6 @@ static const char * const rockchip_board_dt_compat[=
] =3D {
>  };
>=20
>  DT_MACHINE_START(ROCKCHIP_DT, "Rockchip Cortex-A9 (Device Tree)")
> -	.smp		=3D smp_ops(rockchip_smp_ops),
>  	.init_machine	=3D rockchip_dt_init,
>  	.dt_compat	=3D rockchip_board_dt_compat,
>  MACHINE_END

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
