Return-Path: <SRS0=Rn+y=XJ=goldelico.com=hns@kernel.org>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC v2 2/2] ARM: omap3: Consolidate thermal references to common omap3
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20190913153714.30980-2-aford173@gmail.com>
Date: Sat, 14 Sep 2019 11:25:35 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <40FEEAC9-8F19-466F-83C3-C8F0142D44B7@goldelico.com>
References: <20190913153714.30980-1-aford173@gmail.com> <20190913153714.30980-2-aford173@gmail.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-omap@vger.kernel.org, adam.ford@logicpd.com, nm@ti.com, =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


> Am 13.09.2019 um 17:37 schrieb Adam Ford <aford173@gmail.com>:
>=20
> Because the omap34xx, omap36xx and am3517 SoC's have the same
> thermal junction limits, there is no need to duplicate the entry
> multiple times.
>=20
> This patch removes the thermal references from omap36xx and
> omap34xx and pushes it into the common omap3.dtsi file with
> the added benefit of enabling the thermal info on the AM3517.
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:	Add node name for cpu and add cooling-cells entry
>=20
> diff --git a/arch/arm/boot/dts/omap3.dtsi =
b/arch/arm/boot/dts/omap3.dtsi
> index 4043ecb38016..84704eb3b604 100644
> --- a/arch/arm/boot/dts/omap3.dtsi
> +++ b/arch/arm/boot/dts/omap3.dtsi
> @@ -32,7 +32,7 @@
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
> -		cpu@0 {
> +		cpu: cpu@0 {
> 			compatible =3D "arm,cortex-a8";
> 			device_type =3D "cpu";
> 			reg =3D <0x0>;
> @@ -41,9 +41,14 @@
> 			clock-names =3D "cpu";
>=20
> 			clock-latency =3D <300000>; /* =46rom =
omap-cpufreq driver */
> +			#cooling-cells =3D <2>;
> 		};
> 	};

Looks ok.

>=20
> +	thermal_zones: thermal-zones {
> +		#include "omap3-cpu-thermal.dtsi"
> +	};
> +

I have observed one compile issue: we also include this indirectly by =
am3517.dtsi
and the included code refers to <&bandgap 0> but there is no bandgap =
definition in am3517.dtsi

Therefore I studied the am35x TRM (SPRUGR0C) and compared to the =
am/dm37x TRM (SPRUGN4M).

But I can't find a bandgap temperature sensor with ADC like it is =
described in
"13.4.6 Band Gap Voltage and Temperature Sensor" for the am/dm37x. Only
"BANDGAP Logic" exists in both and both have the CM_FCLKEN3_CORE but =
with
different meaning of bit 0.

There is also no description of an CONTROL_TEMP_SENSOR (0x48002524) =
register for am35x.
(note: the register is also documented for omap3530).

So this might mean that the am35x does not have this feature unless TI =
simply
did not document it because the chip is specified for a single OPP only =
where it
make no sense to monitor the temperature.

We can find out only by looking at 0x48002524 if there is an =
undocumented
bandgap converter.

Which means we probably can't make thermal throttling work for it. And =
even
if the bandgap sensor exists we are lacking an value -> celsius table.


> 	pmu@54000000 {
> 		compatible =3D "arm,cortex-a8-pmu";
> 		reg =3D <0x54000000 0x800000>;
> diff --git a/arch/arm/boot/dts/omap34xx.dtsi =
b/arch/arm/boot/dts/omap34xx.dtsi
> index f572a477f74c..b80378d6e5c1 100644
> --- a/arch/arm/boot/dts/omap34xx.dtsi
> +++ b/arch/arm/boot/dts/omap34xx.dtsi
> @@ -101,10 +101,6 @@
> 			};
> 		};
> 	};
> -
> -	thermal_zones: thermal-zones {
> -		#include "omap3-cpu-thermal.dtsi"
> -	};
> };
>=20
> &ssi {
> diff --git a/arch/arm/boot/dts/omap36xx.dtsi =
b/arch/arm/boot/dts/omap36xx.dtsi
> index 6fb23ada1f64..ff2dca63a04e 100644
> --- a/arch/arm/boot/dts/omap36xx.dtsi
> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> @@ -140,10 +140,6 @@
> 			};
> 		};
> 	};
> -
> -	thermal_zones: thermal-zones {
> -		#include "omap3-cpu-thermal.dtsi"
> -	};
> };

So if we have to exclude the am3517 we can not apply the rearrangement =
part
of this patch.

I'd suggest to move the cpu: cpu@0 and #cooling-cells into 1/2 (also to =
make it
compile stand-alone). And have the consolidation separately - if we can =
fix the
am3517 bandgap sensor issue.

>=20
> /* OMAP3630 needs dss_96m_fck for VENC */
> --=20
> 2.17.1
>=20

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 with =
dm3730cbp100
