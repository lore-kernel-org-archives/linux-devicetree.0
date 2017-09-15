From: Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 6/8] ARM: dts: iwg20m: Add SPI NOR support
Date: Fri, 15 Sep 2017 15:12:04 +0000
Message-ID: <TY1PR06MB070286FFE608AAB042B6E7DCB76C0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-7-git-send-email-chris.paterson2@renesas.com>
 <20170915083517.GJ3924@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170915083517.GJ3924@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Simon,

> From: devicetree-owner@vger.kernel.org [mailto:devicetree-
> owner@vger.kernel.org] On Behalf Of Simon Horman
> Sent: 15 September 2017 09:35
>=20
> On Wed, Sep 13, 2017 at 06:05:39PM +0100, Chris Paterson wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Add support for the SPI NOR device used to boot up the system to the
> > System on Module DT.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > ---
> > This patch is based on renesas-devel-20170913-v4.13.
> >
> > This patch is dependant on:
> > - "of: add vendor prefix for Silicon Storage Technology Inc."
> > - "doc: dt: mtd: Add sst25vf016b to the list of supported chip names"
> >
> >
> >  arch/arm/boot/dts/r8a7743-iwg20m.dtsi | 26
> ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> > b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> > index 4119737..75a8ca5 100644
> > --- a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> > +++ b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> > @@ -44,6 +44,11 @@
> >  		function =3D "mmc";
> >  	};
> >
> > +	qspi_pins: qspi {
> > +		groups =3D "qspi_ctrl", "qspi_data2";
> > +		function =3D "qspi";
> > +	};
> > +
> >  	sdhi0_pins: sd0 {
> >  		groups =3D "sdhi0_data4", "sdhi0_ctrl";
> >  		function =3D "sdhi0";
> > @@ -61,6 +66,27 @@
> >  	status =3D "okay";
> >  };
> >
> > +&qspi {
> > +	pinctrl-0 =3D <&qspi_pins>;
> > +	pinctrl-names =3D "default";
> > +
> > +	status =3D "okay";
> > +
> > +	/* WARNING - This device contains the bootloader. Handle with care.
> */
> > +	flash: flash@0 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +		compatible =3D "sst,sst25vf016b", "jedec,spi-nor";
> > +		reg =3D <0>;
> > +		spi-max-frequency =3D <50000000>;
> > +		spi-tx-bus-width =3D <1>;
> > +		spi-rx-bus-width =3D <1>;
> > +		m25p,fast-read;
> > +		spi-cpol;
> > +		spi-cpha;
> > +	};
>=20
> Does the device have partitions?
> If so, should they be described here?

We aren't confident that all devices will come with the same partitions, so=
 decided not to add any here.

Kind regards, Chris

>=20
> > +};
> > +
> >  &sdhi0 {
> >  	pinctrl-0 =3D <&sdhi0_pins>;
> >  	pinctrl-names =3D "default";
> > --
> > 1.9.1
> >
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in =
the
> body of a message to majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
