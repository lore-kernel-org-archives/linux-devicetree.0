From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] ARM: zynq: dt: Add a fixed regulator for CPU voltage
Date: Thu, 15 May 2014 07:57:35 -0700
Message-ID: <e9675d40-2fd9-4fed-a020-5b465ea1842d@BN1BFFO11FD047.protection.gbl>
References: <1399064852-19569-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1399064852-19569-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, git@xilinx.com
List-Id: devicetree@vger.kernel.org

ping? Any comments?

	Thanks,
	S=C3=B6ren

On Fri, 2014-05-02 at 02:07PM -0700, Soren Brinkmann wrote:
> To silence the warning
> 	cpufreq_cpu0: failed to get cpu0 regulator: -19
> from the cpufreq driver regarding a missing regulator,
> add a fixed regulator to the DT.
> Zynq does not support voltage scaling and the CPU rail should always =
be
> supplied with 1 V, hence it is added in the SOC-level dtsi.
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>=20
>  arch/arm/boot/dts/zynq-7000.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zyn=
q-7000.dtsi
> index c1176abc34d9..64779f9d5c38 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -25,6 +25,7 @@
>  			reg =3D <0>;
>  			clocks =3D <&clkc 3>;
>  			clock-latency =3D <1000>;
> +			cpu0-supply =3D <&regulator_vccpint>;
>  			operating-points =3D <
>  				/* kHz    uV */
>  				666667  1000000
> @@ -48,6 +49,15 @@
>  		reg =3D < 0xf8891000 0x1000 0xf8893000 0x1000 >;
>  	};
> =20
> +	regulator_vccpint: fixedregulator@0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VCCPINT";
> +		regulator-min-microvolt =3D <1000000>;
> +		regulator-max-microvolt =3D <1000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	amba {
>  		compatible =3D "simple-bus";
>  		#address-cells =3D <1>;
> --=20
> 1.9.2.1.g06c4abd
>=20
>=20
