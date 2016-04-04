From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: arm64: dts: Add expansion bus to VExpress and Juno
Date: Mon, 4 Apr 2016 17:54:17 +0100
Message-ID: <20160404165416.GA1312@e106497-lin.cambridge.arm.com>
References: <1459786850-29409-1-git-send-email-brian.starkey@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459786850-29409-1-git-send-email-brian.starkey-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 04, 2016 at 05:20:50PM +0100, Brian Starkey wrote:
> The VExpress and Juno development platforms have an external expansio=
n
> bus which can be used for additional hardware (e.g. LogicTile Express
> daughterboards).
> Add this bus to all VExpress CoreTile and Juno device-trees.
>=20
> On VExpress, the bus is described for a CoreTile located on site 1.

s/located on/occupying/

You're trying to say that the CPU for which one of these DTs apply is r=
unning
on SITE1 so the expansion bus described here is available on SITE2.

>=20
> Signed-off-by: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>

Otherwise, looks good to me.

With that change:

Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>

Best regards,
Liviu

> ---
>  arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts |   13 +++++++++++++
>  arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts  |   13 +++++++++++++
>  arch/arm/boot/dts/vexpress-v2p-ca5s.dts     |   13 +++++++++++++
>  arch/arm/boot/dts/vexpress-v2p-ca9.dts      |   13 +++++++++++++
>  arch/arm64/boot/dts/arm/juno-base.dtsi      |   10 ++++++++++
>  5 files changed, 62 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts b/arch/arm/b=
oot/dts/vexpress-v2p-ca15-tc1.dts
> index 9420053..ec7539b 100644
> --- a/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
> +++ b/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
> @@ -280,4 +280,17 @@
> =20
>  		/include/ "vexpress-v2m-rs1.dtsi"
>  	};
> +
> +	site2: hsb@40000000 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0 0 0x40000000 0x3fef0000>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-map-mask =3D <0 3>;
> +		interrupt-map =3D <0 0 &gic 0 36 4>,
> +				<0 1 &gic 0 37 4>,
> +				<0 2 &gic 0 38 4>,
> +				<0 3 &gic 0 39 4>;
> +	};
>  };
> diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts b/arch/arm/bo=
ot/dts/vexpress-v2p-ca15_a7.dts
> index 17f63f7..a339b0c 100644
> --- a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
> +++ b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
> @@ -638,4 +638,17 @@
> =20
>  		/include/ "vexpress-v2m-rs1.dtsi"
>  	};
> +
> +	site2: hsb@40000000 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0 0 0x40000000 0x3fef0000>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-map-mask =3D <0 3>;
> +		interrupt-map =3D <0 0 &gic 0 36 4>,
> +				<0 1 &gic 0 37 4>,
> +				<0 2 &gic 0 38 4>,
> +				<0 3 &gic 0 39 4>;
> +	};
>  };
> diff --git a/arch/arm/boot/dts/vexpress-v2p-ca5s.dts b/arch/arm/boot/=
dts/vexpress-v2p-ca5s.dts
> index d2709b7..76a9ccb 100644
> --- a/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
> +++ b/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
> @@ -250,4 +250,17 @@
> =20
>  		/include/ "vexpress-v2m-rs1.dtsi"
>  	};
> +
> +	site2: hsb@40000000 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0 0x40000000 0x40000000>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-map-mask =3D <0 3>;
> +		interrupt-map =3D <0 0 &gic 0 36 4>,
> +				<0 1 &gic 0 37 4>,
> +				<0 2 &gic 0 38 4>,
> +				<0 3 &gic 0 39 4>;
> +	};
>  };
> diff --git a/arch/arm/boot/dts/vexpress-v2p-ca9.dts b/arch/arm/boot/d=
ts/vexpress-v2p-ca9.dts
> index d949fac..edac212 100644
> --- a/arch/arm/boot/dts/vexpress-v2p-ca9.dts
> +++ b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
> @@ -359,4 +359,17 @@
> =20
>  		/include/ "vexpress-v2m.dtsi"
>  	};
> +
> +	site2: hsb@e0000000 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0 0xe0000000 0x20000000>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-map-mask =3D <0 3>;
> +		interrupt-map =3D <0 0 &gic 0 36 4>,
> +				<0 1 &gic 0 37 4>,
> +				<0 2 &gic 0 38 4>,
> +				<0 3 &gic 0 39 4>;
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot=
/dts/arm/juno-base.dtsi
> index 68ccc39..dee2386 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -272,3 +272,13 @@
> =20
>  		/include/ "juno-motherboard.dtsi"
>  	};
> +
> +	site2: tlx@60000000 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0 0 0x60000000 0x10000000>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-map-mask =3D <0 0>;
> +		interrupt-map =3D <0 0 &gic 0 0 0 168 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> --=20
> 1.7.9.5
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
