From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v4 4/5] ARM: sunxi: h3/h5: switch
 apb0-related clocks to r_ccu
Date: Thu, 20 Jul 2017 14:12:09 +0200
Message-ID: <1500552729.29912.1.camel@xff.cz>
References: <20170404095100.18649-1-icenowy@aosc.io>
	 <20170404095100.18649-5-icenowy@aosc.io> <1500505173.23770.1.camel@xff.cz>
	 <a934bb1292328400004e58c886ccd693@aosc.io>
Reply-To: megi-DlDF6nMZSto@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBC55PRMWZULRBG54YLFQKGQE3PP6P7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <a934bb1292328400004e58c886ccd693-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Icenowy,

icenowy-h8G6r0blFSE@public.gmane.org p=C3=AD=C5=A1e v =C4=8Ct 20. 07. 2017 v 16:21 +0800:
> =E5=9C=A8 2017-07-20 06:59=EF=BC=8COnd=C5=99ej Jirman =E5=86=99=E9=81=93=
=EF=BC=9A
> > Hi,
> >=20
> > Icenowy Zheng p=C3=AD=C5=A1e v =C3=9At 04. 04. 2017 v 17:50 +0800:
> > > From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> > >=20
> > > Now we have driver for the PRCM CCU, switch to use it instead of
> > > old-style clock nodes for apb0-related clocks in sunxi-h3-h5.dtsi .
> > >=20
> > > The mux 3 of R_CCU is still the internal oscillator, which is said to=
=20
> > > be
> > > 16MHz plus minus 30%, and get a measured value of 15MHz~16MHz on my=
=20
> > > two
> > > H3 boards and one H5 board.
> >=20
> > There's issue with the new r_ccu that breaks r_i2c. (no devices can be
> > found on the bus). Reverting this patch fixes the issue with the I2C
> > controller. (everything else being the same)
> >=20
> > Here's the code I'm using: https://github.com/megous/linux/commits/oran
> > ge-pi-4.12
> >=20
> > The last commit is the revert.
> >=20
> > The issue manifests itself by non-working DVFS, because kernel lacks
> > access to SY8106A regulator, because r_i2c doesn't work with sunxi-ng
> > clock driver (sun8i-r).
> >=20
> > Relevant difference in registers between working/non-working state is
> > just this (diff -u):
> >=20
> >  0x01f02400 =3D 0x00000000
> >  0x01f02404 =3D 0x00000000
> > -0x01f02408 =3D 0x00000091
> > +0x01f02408 =3D 0x00000095 DATA register inisde the I2C controller
> >  0x01f0240c =3D 0x00000044
> >  0x01f02410 =3D 0x000000f8
> > -0x01f02414 =3D 0x00000059
> > +0x01f02414 =3D 0x00000000 CLOCK setup register inside the I2C controll=
er
> >  0x01f02418 =3D 0x00000000
> >  0x01f0241c =3D 0x00000000
> >  0x01f02420 =3D 0x0000003a
> >=20
> > It looks like the new sunxi-ng clock driver causes the I2C driver to
> > not correctly configure the CLOCK register. I don't know why and I'm
> > not sure how to deal with this. Any ideas what can I do next?
>=20
> Could you apply the patches at [1] and [2] to U-Boot and re-try with
> r_ccu? They switched the CPUs clock of r_ccu to non-secure mode, which
> makes it possible to be accessed from the kernel running in non-secure.

I have verified that r_ccu works correctly with the u-boot patches on
H3 and H5.

Thank you very much for looking into the issue. :)

regards,
  o.

> I think these patches can solve this problem.
>=20
> [1] https://patchwork.ozlabs.org/patch/791414/
> [2] https://patchwork.ozlabs.org/patch/791415/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
