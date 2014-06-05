From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 3/9] ARM: dts: berlin: add a required reset property in
 the chip controller node
Date: Thu, 5 Jun 2014 18:44:26 +0200
Message-ID: <20140605164426.GA21960@kwain>
References: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com>
 <1401983326-19205-4-git-send-email-antoine.tenart@free-electrons.com>
 <1401986347.4103.11.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401986347.4103.11.camel@paszta.hi.pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, sebastian.hesselbarth@gmail.com, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 05, 2014 at 06:39:07PM +0200, Philipp Zabel wrote:
> Am Donnerstag, den 05.06.2014, 17:48 +0200 schrieb Antoine T=E9nart:
> > The chip controller node now also describes the Marvell Berlin rese=
t
> > controller. Add the required 'reset-cells' property.
> >=20
> > Signed-off-by: Antoine T=E9nart <antoine.tenart@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/berlin2.dtsi   | 1 +
> >  arch/arm/boot/dts/berlin2cd.dtsi | 1 +
> >  arch/arm/boot/dts/berlin2q.dtsi  | 1 +
> >  3 files changed, 3 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/ber=
lin2.dtsi
> > index 2477dac4d643..379ff1a38377 100644
> > --- a/arch/arm/boot/dts/berlin2.dtsi
> > +++ b/arch/arm/boot/dts/berlin2.dtsi
> > @@ -243,6 +243,7 @@
> >  		chip: chip-control@ea0000 {
> >  			compatible =3D "marvell,berlin2-chip-ctrl";
> >  			#clock-cells =3D <1>;
> > +			#reset-cells =3D <1>;
>=20
> Are the marvell,berlin2q-chip-ctrl bindings already documented? This
> should also be added to the documentation.

It is, I'll add information about its reset function.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
