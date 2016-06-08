From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: dts: juno: add arm,primecell-periphid override
Date: Wed, 8 Jun 2016 17:05:17 +0100
Message-ID: <20160608160517.GQ1165@e106497-lin.cambridge.arm.com>
References: <1465228765-14038-1-git-send-email-sudeep.holla@arm.com>
 <1465228765-14038-3-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465228765-14038-3-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 06, 2016 at 04:59:24PM +0100, Sudeep Holla wrote:
> The Linux AMBA framework probes the peripheral ids when adding the am=
ba
> devices very early on the boot. Generally they are on APB bus and jus=
t
> require APB clocks to be on even when most of the core logic of the I=
P
> is powered down.
>=20
> However on Juno, the entire debugsys domain needs to be ON to access
> those CID/PID registers and hence broken by design. Accessing those
> while debugsys power domain is off will lead to the bridge stalling t=
he
> transactions instead of returning the slave error.
>=20
> Since keeping the power domain on by default affects the core power(b=
y
> preventing cores entering deeper idle states), it's not feasible
> solution. Instead we can provide arm,primecell-periphid override in t=
he
> device tree that prevents accessing the device early in the boot.
>=20
> However the power domains can be enabled whenever required using runt=
ime
> PM and associated power domains.
>=20
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>

Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>

> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi | 13 +++++++++++++
>  arch/arm64/boot/dts/arm/juno-r1.dts    |  6 ++++++
>  arch/arm64/boot/dts/arm/juno-r2.dts    |  6 ++++++
>  arch/arm64/boot/dts/arm/juno.dts       |  6 ++++++
>  4 files changed, 31 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot=
/dts/arm/juno-base.dtsi
> index 90a8710f7032..49fa55cdc977 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -63,6 +63,14 @@
>  	 */
>  	etf@20010000 {
>  		compatible =3D "arm,coresight-tmc", "arm,primecell";
> +		/*
> +		 * The primecell peripheral id is explicitly specified here with
> +		 * the actual hardware value. It's not any override. It's
> +		 * required to workaround an errata to avoid bus stalls early
> +		 * in the boot when AMBA primecell ids are probed before the
> +		 * actual power domain can be enabled using SCPI.
> +		 */
> +		arm,primecell-periphid =3D <0x001bb961>;
>  		reg =3D <0 0x20010000 0 0x1000>;
>=20
>  		clocks =3D <&soc_smc50mhz>;
> @@ -92,6 +100,7 @@
>=20
>  	tpiu@20030000 {
>  		compatible =3D "arm,coresight-tpiu", "arm,primecell";
> +		arm,primecell-periphid =3D <0x004bb912>;
>  		reg =3D <0 0x20030000 0 0x1000>;
>=20
>  		clocks =3D <&soc_smc50mhz>;
> @@ -106,6 +115,7 @@
>=20
>  	main_funnel@20040000 {
>  		compatible =3D "arm,coresight-funnel", "arm,primecell";
> +		arm,primecell-periphid =3D <0x002bb908>;
>  		reg =3D <0 0x20040000 0 0x1000>;
>=20
>  		clocks =3D <&soc_smc50mhz>;
> @@ -142,6 +152,7 @@
>=20
>  	etr@20070000 {
>  		compatible =3D "arm,coresight-tmc", "arm,primecell";
> +		arm,primecell-periphid =3D <0x001bb961>;
>  		reg =3D <0 0x20070000 0 0x1000>;
>=20
>  		clocks =3D <&soc_smc50mhz>;
> @@ -192,6 +203,7 @@
>=20
>  	cluster0_funnel@220c0000 {
>  		compatible =3D "arm,coresight-funnel", "arm,primecell";
> +		arm,primecell-periphid =3D <0x002bb908>;
>  		reg =3D <0 0x220c0000 0 0x1000>;
>=20
>  		clocks =3D <&soc_smc50mhz>;
> @@ -227,6 +239,7 @@
>=20
>  	cluster1_funnel@230c0000 {
>  		compatible =3D "arm,coresight-funnel", "arm,primecell";
> +		arm,primecell-periphid =3D <0x002bb908>;
>  		reg =3D <0 0x230c0000 0 0x1000>;
>=20
>  		clocks =3D <&soc_smc50mhz>;
> diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dt=
s/arm/juno-r1.dts
> index f4f8f54f8b85..c3c9fdff49bf 100644
> --- a/arch/arm64/boot/dts/arm/juno-r1.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> @@ -184,24 +184,30 @@
>=20
>  &etm0 {
>  	cpu =3D <&A57_0>;
> +	arm,primecell-periphid =3D <0x002bb95e>;
>  };
>=20
>  &etm1 {
>  	cpu =3D <&A57_1>;
> +	arm,primecell-periphid =3D <0x002bb95e>;
>  };
>=20
>  &etm2 {
>  	cpu =3D <&A53_0>;
> +	arm,primecell-periphid =3D <0x003bb95d>;
>  };
>=20
>  &etm3 {
>  	cpu =3D <&A53_1>;
> +	arm,primecell-periphid =3D <0x003bb95d>;
>  };
>=20
>  &etm4 {
>  	cpu =3D <&A53_2>;
> +	arm,primecell-periphid =3D <0x003bb95d>;
>  };
>=20
>  &etm5 {
>  	cpu =3D <&A53_3>;
> +	arm,primecell-periphid =3D <0x003bb95d>;
>  };
> diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dt=
s/arm/juno-r2.dts
> index d903e545b64c..c672c978f89d 100644
> --- a/arch/arm64/boot/dts/arm/juno-r2.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r2.dts
> @@ -184,24 +184,30 @@
>=20
>  &etm0 {
>  	cpu =3D <&A72_0>;
> +	arm,primecell-periphid =3D <0x000bb95a>;
>  };
>=20
>  &etm1 {
>  	cpu =3D <&A72_1>;
> +	arm,primecell-periphid =3D <0x000bb95a>;
>  };
>=20
>  &etm2 {
>  	cpu =3D <&A53_0>;
> +	arm,primecell-periphid =3D <0x003bb95d>;
>  };
>=20
>  &etm3 {
>  	cpu =3D <&A53_1>;
> +	arm,primecell-periphid =3D <0x003bb95d>;
>  };
>=20
>  &etm4 {
>  	cpu =3D <&A53_2>;
> +	arm,primecell-periphid =3D <0x003bb95d>;
>  };
>=20
>  &etm5 {
>  	cpu =3D <&A53_3>;
> +	arm,primecell-periphid =3D <0x003bb95d>;
>  };
> diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/a=
rm/juno.dts
> index a7270eff6939..0528e47e66d1 100644
> --- a/arch/arm64/boot/dts/arm/juno.dts
> +++ b/arch/arm64/boot/dts/arm/juno.dts
> @@ -176,24 +176,30 @@
>=20
>  &etm0 {
>  	cpu =3D <&A57_0>;
> +	arm,primecell-periphid =3D <0x000bb95e>;
>  };
>=20
>  &etm1 {
>  	cpu =3D <&A57_1>;
> +	arm,primecell-periphid =3D <0x000bb95e>;
>  };
>=20
>  &etm2 {
>  	cpu =3D <&A53_0>;
> +	arm,primecell-periphid =3D <0x000bb95d>;
>  };
>=20
>  &etm3 {
>  	cpu =3D <&A53_1>;
> +	arm,primecell-periphid =3D <0x000bb95d>;
>  };
>=20
>  &etm4 {
>  	cpu =3D <&A53_2>;
> +	arm,primecell-periphid =3D <0x000bb95d>;
>  };
>=20
>  &etm5 {
>  	cpu =3D <&A53_3>;
> +	arm,primecell-periphid =3D <0x000bb95d>;
>  };
> --
> 2.7.4
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
