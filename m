From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2 3/5] arm64: Juno: Add memory mapped timer node
Date: Tue, 19 May 2015 12:31:17 +0100
Message-ID: <20150519113116.GH2175@e106497-lin.cambridge.arm.com>
References: <1431970109-8902-1-git-send-email-Liviu.Dudau@arm.com>
 <1431970109-8902-4-git-send-email-Liviu.Dudau@arm.com>
 <1432033003.3047.43.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432033003.3047.43.camel@linaro.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <Marc.Zyngier@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Sudeep Holla <Sudeep.Holla@arm.com>, devicetree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 11:56:43AM +0100, Jon Medhurst (Tixy) wrote:
> On Mon, 2015-05-18 at 18:28 +0100, Liviu Dudau wrote:
> > Juno based boards have a memory mapped timer @ 0x2a810000. This
> > is disabled on r0 version of the board due to an SoC errata.
>=20
> So wouldn't it make more sense then to disable it in the dts for r0? =
As
> it is, you disable it in the common file below then have to later
> re-enable it in juno-r1.dts.

=46rom what I have seen in the existing DTs the preffer approach seems =
to be of
disabling by default the node declared in the common files and enable
it in the DT that makes use of it. My quick grep through the arch/arm/b=
oot/dts
files shows 2638 .dtsi files using 'status =3D "disabled";' string vs 9=
3 .dts
files. 'status =3D "okay";' is more evenly balances with 805 .dtsi file=
s using
it vs 3256 .dts files.

If there is any guidance on how to describe this sort of situations I
would really love to read it.

>=20
> Apart from that, the whole series looks good to be and I've given it =
a
> spin on r0 and r1. So consider that an
> Acked-by: Jon Medhurst <tixy@linaro.org>

Many thanks,
Liviu

>=20
>=20
> >=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > ---
> >  arch/arm64/boot/dts/arm/juno-base.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/bo=
ot/dts/arm/juno-base.dtsi
> > index 5c4c035..b7e862f 100644
> > --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> > +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> > @@ -2,6 +2,21 @@
> >  	 *  Devices shared by all Juno boards
> >  	 */
> > =20
> > +	memtimer: timer@2a810000 {
> > +		compatible =3D "arm,armv7-timer-mem";
> > +		reg =3D <0x0 0x2a810000 0x0 0x10000>;
> > +		clock-frequency =3D <50000000>;
>=20
>=20
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +		ranges;
> > +		status =3D "disabled";
> > +		frame@2a830000 {
> > +			frame-number =3D <1>;
> > +			interrupts =3D <0 60 4>;
> > +			reg =3D <0x0 0x2a830000 0x0 0x10000>;
> > +		};
> > +	};
> > +
> >  	gic: interrupt-controller@2c010000 {
> >  		compatible =3D "arm,gic-400", "arm,cortex-a15-gic";
> >  		reg =3D <0x0 0x2c010000 0 0x1000>,
>=20
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
