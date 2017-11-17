From: Ioana Ciornei <ioana.ciornei-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] arm64: dts: ls1088a: add fsl-mc hardware resource manager
 node
Date: Fri, 17 Nov 2017 13:59:04 +0000
Message-ID: <DB6PR0401MB22648400A0742C65F9B8E384E02F0@DB6PR0401MB2264.eurprd04.prod.outlook.com>
References: <1510147805-24873-1-git-send-email-ioana.ciornei@nxp.com>
 <20171116083920.GK25384@dragon>
 <DB6PR0401MB2264A182C4048471B53BFF89E02E0@DB6PR0401MB2264.eurprd04.prod.outlook.com>
 <20171117123530.GA25390@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117123530.GA25390@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> On Thu, Nov 16, 2017 at 02:24:49PM +0000, Ioana Ciornei wrote:
> ...
> > > > +	fsl_mc: fsl-mc@80c000000 {
> > >
> > > The unit-address of the node should be somehow related to 'reg'
> > > property.  Can you please help me understand how they are related?
> >
> > The unit-address of the fsl-mc node is the base address of the MC porta=
l
> described in the first region of the 'reg' property and formed using the =
2
> address cells.
> > Hope this helps.
>=20
> Ah, sorry, I forgot that the address-cells is 2.
>=20
> >
> > >
> > > > +		compatible =3D "fsl,qoriq-mc";
> > > > +		reg =3D <0x00000008 0x0c000000 0 0x40>,	 /* MC portal
> base */
> > > > +		      <0x00000000 0x08340000 0 0x40000>; /* MC control
> reg */
> > > > +		msi-parent =3D <&its>;
> > > > +		#address-cells =3D <3>;
> > > > +		#size-cells =3D <1>;
> > > > +
> > > > +		/*
> > > > +		 * Region type 0x0 - MC portals
> > > > +		 * Region type 0x1 - QBMAN portals
> > > > +		 */
> > > > +		ranges =3D <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
> > > > +			  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
> > > > +
> > > > +		dpmacs {
> > > > +			#address-cells =3D <1>;
> > > > +			#size-cells =3D <0>;
> > > > +
> > > > +			dpmac1: dpmac@1 {
> > > > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > > > +				reg =3D <1>;
> > > > +			};
> > >
> > > Please have a newline in between nodes.
> >
> > Will do.
> >
> > Should I send a rework of this patch right away or better to wait for t=
he
> merge window to close?
>=20
> Either way is fine, as I will rebase my branch to v4.15-rc1 after merge w=
indow
> closes.
>=20
> > > > +			dpmac2: dpmac@2 {
> > > > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > > > +				reg =3D <2>;
> > > > +			};
> > > > +			dpmac3: dpmac@3 {
> > > > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > > > +				reg =3D <3>;
> > > > +			};
> > > > +			dpmac4: dpmac@4 {
> > > > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > > > +				reg =3D <4>;
> > > > +			};
> > > > +			dpmac5: dpmac@5 {
> > > > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > > > +				reg =3D <5>;
> > > > +			};
> > > > +			dpmac6: dpmac@6 {
> > > > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > > > +				reg =3D <6>;
> > > > +			};
> > > > +			dpmac7: dpmac@7 {
> > > > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > > > +				reg =3D <7>;
> > > > +			};
> > > > +			dpmac8: dpmac@8 {
> > > > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > > > +				reg =3D <8>;
> > > > +			};
> > > > +			dpmac9: dpmac@9 {
> > > > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > > > +				reg =3D <9>;
> > > > +			};
> > > > +			dpmac10: dpmac@10 {
>=20
> Just noticed this - the unit-address should be hex number, so it should b=
e
> dpmac@a rather than dpmac@10, I think.
>=20

Yes, that is right, it should be dpmac@a. Will change it.

Ioana

> Shawn
>=20
> > > > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > > > +				reg =3D <0xa>;
> > > > +			};
> > > > +		};
> > > > +	};
> > > > +
> > > >  	psci {
> > > >  		compatible =3D "arm,psci-0.2";
> > > >  		method =3D "smc";
> > > > --
> > > > 1.9.1
> > > >
> > > >
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
