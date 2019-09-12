From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH 3/6] ARM: dts: sunxi: h3/h5: Add MBUS
 controller node
Date: Thu, 12 Sep 2019 22:28:37 +0200
Message-ID: <1679881.yZ8pMUtPNZ@jernej-laptop>
References: <20190912175132.411-1-jernej.skrabec@siol.net> <20190912175132.411-4-jernej.skrabec@siol.net> <20190912202057.czb6nzgssg442isi@localhost.localdomain>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERB6GU5LVQKGQE7ZOBCDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190912202057.czb6nzgssg442isi-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 12. september 2019 ob 22:20:57 CEST je Maxime Ripard napi=
sal(a):
> Hi,
>=20
> On Thu, Sep 12, 2019 at 07:51:29PM +0200, Jernej Skrabec wrote:
> > Both, H3 and H5, contain MBUS, which is the bus used by DMA devices to
> > access system memory.
> >=20
> > MBUS controller is responsible for arbitration between channels based
> > on set priority and can do some other things as well, like report
> > bandwidth used. It also maps RAM region to different address than CPU.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > ---
> >=20
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > b/arch/arm/boot/dts/sunxi-h3-h5.dtsi index eba190b3f9de..ef1d03812636
> > 100644
> > --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > @@ -109,6 +109,7 @@
> >=20
> >  		compatible =3D "simple-bus";
> >  		#address-cells =3D <1>;
> >  		#size-cells =3D <1>;
> >=20
> > +		dma-ranges;
> >=20
> >  		ranges;
> >  	=09
> >  		display_clocks: clock@1000000 {
> >=20
> > @@ -538,6 +539,14 @@
> >=20
> >  			};
> >  	=09
> >  		};
> >=20
> > +		mbus: dram-controller@1c62000 {
> > +			compatible =3D "allwinner,sun8i-h3-mbus";
> > +			reg =3D <0x01c62000 0x1000>;
> > +			clocks =3D <&ccu 113>;
> > +			dma-ranges =3D <0x00000000 0x40000000=20
0xc0000000>;
> > +			#interconnect-cells =3D <1>;
> > +		};
> > +
>=20
> If that's easy enough to access, can you also add the references in
> the devices that are already there? (CSI and DE comes to my mind, but
> there might be others).

Strangely, DE2 doesn't use this offset. That was tested on OrangePi Plus2E,=
=20
which has 2 GiB of RAM and subtracting this offset causes corrupted image.

But I can add this properties to CSI too. However, wouldn't that need CSI D=
T=20
binding expansion with those properties? othetwise DT check will fail.

Best regards,
Jernej

>=20
> Thanks!
> Maxime




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/1679881.yZ8pMUtPNZ%40jernej-laptop.
