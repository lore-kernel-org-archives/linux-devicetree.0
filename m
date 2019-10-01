From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v2 5/5] MIPS: JZ4780: DTS: Add CPU nodes
Date: Tue, 1 Oct 2019 23:20:33 +0000
Message-ID: <20191001232031.qaci6hk5tjo652mi@pburton-laptop>
References: <cover.1569955865.git.agriveaux@deutnet.info>
 <0dbd1986be4ee50bdd9f45c140aded7c49fddb8a.1569955865.git.agriveaux@deutnet.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0dbd1986be4ee50bdd9f45c140aded7c49fddb8a.1569955865.git.agriveaux@deutnet.info>
Content-Language: en-US
Content-ID: <9529F98D2530BE4ABE646708C200EF09@namprd22.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre GRIVEAUX <agriveaux@deutnet.info>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "jhogan@kernel.org" <jhogan@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

On Tue, Oct 01, 2019 at 09:09:48PM +0200, Alexandre GRIVEAUX wrote:
> The JZ4780 have 2 core, adding to DT.
>=20
> Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/=
ingenic/jz4780.dtsi
> index f928329b034b..9c7346724f1f 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -7,6 +7,23 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,jz4780";
> =20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu@0 {
> +			compatible =3D "ingenic,jz4780";

This should probably be something like ingenic,xburst2. JZ4780 is the
SoC. It also should be a documented binding, but I think it would be
worth holding off on the whole thing until we actually get SMP support
merged - just in case we come up with a binding that doesn't actually
work out.

So I expect I'll just apply patches 1-4 for now.

Thanks for working on it!

    Paul

> +			device_type =3D "cpu";
> +			reg =3D <0>;
> +		};
> +
> +		cpu@1 {
> +			compatible =3D "ingenic,jz4780";
> +			device_type =3D "cpu";
> +			reg =3D <1>;
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> --=20
> 2.20.1
>=20
