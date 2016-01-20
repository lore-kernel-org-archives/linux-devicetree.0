From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] bmips: add device tree example for BCM6358
Date: Wed, 20 Jan 2016 10:59:10 -0600
Message-ID: <20160120165910.GA32520@rob-hp-laptop>
References: <1453030101-14794-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453030101-14794-2-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 17, 2016 at 12:28:21PM +0100, =C1lvaro Fern=E1ndez Rojas wr=
ote:
> This adds a device tree example for SFR Neufbox4 (Sercomm version), w=
hich
> also serves as a real example for brcm,bcm6358-leds.
>=20
> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

[...]

> diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi=20
b/arch/mips/boot/dts/brcm/bcm6358.dtsi
> new file mode 100644
> index 0000000..b2d11da
> --- /dev/null
> +++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
> @@ -0,0 +1,111 @@
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	compatible =3D "brcm,bcm6358";
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		mips-hpt-frequency =3D <150000000>;
> +
> +		cpu@0 {
> +			compatible =3D "brcm,bmips4350";
> +			device_type =3D "cpu";
> +			reg =3D <0>;
> +		};
> +
> +		cpu@1 {
> +			compatible =3D "brcm,bmips4350";
> +			device_type =3D "cpu";
> +			reg =3D <1>;
> +		};
> +	};
> +
> +	clocks {
> +		periph_clk: periph_clk {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <50000000>;
> +		};
> +	};
> +
> +	aliases {
> +		leds0 =3D &leds0;

Why do we need alias for LEDs?

> +		uart0 =3D &uart0;
> +		uart1 =3D &uart1;
> +	};

[...]

> diff --git a/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts b/arch/mips/b=
oot/dts/brcm/bcm96358nb4ser.dts
> new file mode 100644
> index 0000000..ca95084
> --- /dev/null
> +++ b/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts
> @@ -0,0 +1,47 @@
> +/dts-v1/;
> +
> +/include/ "bcm6358.dtsi"
> +
> +/ {
> +	compatible =3D "sfr,nb4-ser", "brcm,bcm6358";
> +	model =3D "SFR Neufbox 4 (Sercomm)";
> +
> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x02000000>;
> +	};
> +
> +	chosen {
> +		bootargs =3D "console=3DttyS0,115200";
> +		stdout-path =3D &uart0;

You shouldn't need both here. Just stdout-path.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
