From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: juno: add SCPI power domains for device
 power management
Date: Wed, 8 Jun 2016 17:05:33 +0100
Message-ID: <20160608160532.GR1165@e106497-lin.cambridge.arm.com>
References: <1465228765-14038-1-git-send-email-sudeep.holla@arm.com>
 <1465228765-14038-4-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465228765-14038-4-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 06, 2016 at 04:59:25PM +0100, Sudeep Holla wrote:
> This patch adds power domain information to coresight devices using
> SCPI power domains.
>=20
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>

Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>

> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot=
/dts/arm/juno-base.dtsi
> index 49fa55cdc977..ef054094d5a8 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -75,6 +75,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		ports {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -105,6 +106,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		port {
>  			tpiu_in_port: endpoint {
>  				slave-mode;
> @@ -120,6 +122,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		ports {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -157,6 +160,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		port {
>  			etr_in_port: endpoint {
>  				slave-mode;
> @@ -208,6 +212,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		ports {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -244,6 +249,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		ports {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -293,6 +299,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		port {
>  			cluster0_etm0_out_port: endpoint {
>  				remote-endpoint =3D <&cluster0_funnel_in_port0>;
> @@ -306,6 +313,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		port {
>  			cluster0_etm1_out_port: endpoint {
>  				remote-endpoint =3D <&cluster0_funnel_in_port1>;
> @@ -319,6 +327,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		port {
>  			cluster1_etm0_out_port: endpoint {
>  				remote-endpoint =3D <&cluster1_funnel_in_port0>;
> @@ -332,6 +341,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		port {
>  			cluster1_etm1_out_port: endpoint {
>  				remote-endpoint =3D <&cluster1_funnel_in_port1>;
> @@ -345,6 +355,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		port {
>  			cluster1_etm2_out_port: endpoint {
>  				remote-endpoint =3D <&cluster1_funnel_in_port2>;
> @@ -358,6 +369,7 @@
>=20
>  		clocks =3D <&soc_smc50mhz>;
>  		clock-names =3D "apb_pclk";
> +		power-domains =3D <&scpi_devpd 0>;
>  		port {
>  			cluster1_etm3_out_port: endpoint {
>  				remote-endpoint =3D <&cluster1_funnel_in_port3>;
> @@ -428,6 +440,12 @@
>  			};
>  		};
>=20
> +		scpi_devpd: scpi-power-domains {
> +			compatible =3D "arm,scpi-power-domains";
> +			num-domains =3D <2>;
> +			#power-domain-cells =3D <1>;
> +		};
> +
>  		scpi_sensors0: sensors {
>  			compatible =3D "arm,scpi-sensors";
>  			#thermal-sensor-cells =3D <1>;
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
