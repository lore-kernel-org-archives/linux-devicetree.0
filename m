From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: berlin: enable SD card reader and eMMC
 for the BG2Q DMP
Date: Wed, 23 Apr 2014 19:36:31 +0200
Message-ID: <20140423173631.GA10464@kwain>
References: <1398155248-1659-1-git-send-email-antoine.tenart@free-electrons.com>
 <1398155248-1659-3-git-send-email-antoine.tenart@free-electrons.com>
 <5357F7BF.8000703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5357F7BF.8000703@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: zmxu@marvell.com, jszhang@marvell.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Sebastian,

On Wed, Apr 23, 2014 at 07:26:23PM +0200, Sebastian Hesselbarth wrote:
> On 04/22/2014 10:27 AM, Antoine T=E9nart wrote:
> > Enable the SD Card reader and the internal eMMC on the Berlin BG2Q =
DMP
> > using two of the SDHCI nodes of the Berlin BG2Q.
> >=20
> > Signed-off-by: Antoine T=E9nart <antoine.tenart@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/=
boot/dts/berlin2q-marvell-dmp.dts
> > index 2da9c41e29d8..6ca8c9e52b08 100644
> > --- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> > +++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> > @@ -26,3 +26,14 @@
> >  &uart0 {
> >  	status =3D "okay";
> >  };
> > +
> > +&sdhci1 {
>=20
> Antoine,
>=20
> nit: please sort referenced nodes alphabetically.
>=20
> With your comments about mmc aliases, I can take both patches
> in now (and fixup ordering) if you like.

You can take them.

I talked with Jisheng about this and the plan is to make a following up
series for the aliases since it will require to modify the subsystem.

Thanks!

Antoine

>=20
> Sebastian
>=20
> > +	broken-cd;
> > +	sdhci,wp-inverted;
> > +	status =3D "okay";
> > +};
> > +
> > +&sdhci2 {
> > +	non-removable;
> > +	status =3D "okay";
> > +};
> >=20
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
