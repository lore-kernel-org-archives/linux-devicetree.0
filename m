From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 3/6] ARM: dts: sunxi: h3/h5: Add MBUS controller node
Date: Thu, 12 Sep 2019 22:34:27 +0200
Message-ID: <20190912203427.ajbmtm5djctpkz6p@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
 <20190912175132.411-4-jernej.skrabec@siol.net>
 <20190912202057.czb6nzgssg442isi@localhost.localdomain>
 <1679881.yZ8pMUtPNZ@jernej-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1679881.yZ8pMUtPNZ@jernej-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 10:28:37PM +0200, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 12. september 2019 ob 22:20:57 CEST je Maxime Ripard na=
pisal(a):
> > Hi,
> >=20
> > On Thu, Sep 12, 2019 at 07:51:29PM +0200, Jernej Skrabec wrote:
> > > Both, H3 and H5, contain MBUS, which is the bus used by DMA devices to
> > > access system memory.
> > >=20
> > > MBUS controller is responsible for arbitration between channels based
> > > on set priority and can do some other things as well, like report
> > > bandwidth used. It also maps RAM region to different address than CPU.
> > >=20
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > >=20
> > >  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > b/arch/arm/boot/dts/sunxi-h3-h5.dtsi index eba190b3f9de..ef1d03812636
> > > 100644
> > > --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > @@ -109,6 +109,7 @@
> > >=20
> > >  		compatible =3D "simple-bus";
> > >  		#address-cells =3D <1>;
> > >  		#size-cells =3D <1>;
> > >=20
> > > +		dma-ranges;
> > >=20
> > >  		ranges;
> > >  	=09
> > >  		display_clocks: clock@1000000 {
> > >=20
> > > @@ -538,6 +539,14 @@
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >=20
> > > +		mbus: dram-controller@1c62000 {
> > > +			compatible =3D "allwinner,sun8i-h3-mbus";
> > > +			reg =3D <0x01c62000 0x1000>;
> > > +			clocks =3D <&ccu 113>;
> > > +			dma-ranges =3D <0x00000000 0x40000000=20
> 0xc0000000>;
> > > +			#interconnect-cells =3D <1>;
> > > +		};
> > > +
> >=20
> > If that's easy enough to access, can you also add the references in
> > the devices that are already there? (CSI and DE comes to my mind, but
> > there might be others).
>=20
> Strangely, DE2 doesn't use this offset. That was tested on OrangePi Plus2=
E,=20
> which has 2 GiB of RAM and subtracting this offset causes corrupted image.

Ok, weird. But if it was tested then fine by me :)

> But I can add this properties to CSI too. However, wouldn't that need CSI=
 DT=20
> binding expansion with those properties? othetwise DT check will fail.

Oh right, we definitely need to update the binding indeed. The code
should be able to cope with both cases already.

Maxime
