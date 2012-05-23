From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 05/12] usb: chipidea: add imx driver binding
Date: Wed, 23 May 2012 16:09:29 +0300
Message-ID: <20120523130928.GC1015@arwen.pp.htv.fi>
References: <1337592237-5090-6-git-send-email-richard.zhao@freescale.com>
 <201205220630.57007.marex@denx.de>
 <20120522045120.GL6206@b20223-02.ap.freescale.net>
 <87fwasbkt7.fsf@ashishki-desk.ger.corp.intel.com>
 <20120522100624.GP30559@arwen.pp.htv.fi>
 <20120522103139.GD32035@b20223-02.ap.freescale.net>
 <20120522103516.GR30559@arwen.pp.htv.fi>
 <8762bobiqt.fsf@ashishki-desk.ger.corp.intel.com>
 <20120522150616.GA2380@richard-laptop>
 <87wr439hk2.fsf@ashishki-desk.ger.corp.intel.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/+TVfO13bGamJ+u9"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87wr439hk2.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--/+TVfO13bGamJ+u9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2012 at 04:02:21PM +0300, Alexander Shishkin wrote:
> Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>=20
> > On Tue, May 22, 2012 at 01:41:30PM +0300, Alexander Shishkin wrote:
> >> Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:
> >>=20
> >> > On Tue, May 22, 2012 at 06:31:40PM +0800, Richard Zhao wrote:
> >> >> On Tue, May 22, 2012 at 01:06:26PM +0300, Felipe Balbi wrote:
> >> >> > Hi,
> >> >> >=20
> >> >> > On Tue, May 22, 2012 at 12:56:52PM +0300, Alexander Shishkin wrot=
e:
> >> >> > > > Do you think it's a good idea to let user select binding driv=
er directly
> >> >> > > > and the binding driver config depends on chipidea config?
> >> >> > >=20
> >> >> > > I don't have a strong opinion on this, although I prefer it the=
 way it
> >> >> > > is now, because, imo:
> >> >> > >=20
> >> >> > >   * in case of =3Dm (and that's the only sane way of compiling =
it anyway),
> >> >> > >     these all are compiled as modules, which you simply don't i=
nstall if
> >> >> > >     you don't want them;
> >> >> > >   * all of them get compile-tested every time you change someth=
ing in
> >> >> > >     the driver, which is a good thing;
> >> >> >=20
> >> >> > only true for $(ARCH) builds. I would like to see these drivers b=
eing
> >> >> > compile tested on linux-next on all arches. Thus the patches I ju=
st
> >> >> > sent.
> >> >> The idea is great. But
> >> >> - how can I make sure it pass for all arch? There' 27 folder in arc=
h/.
> >> >> - it's hard to predict one driver depends on what.
> >> >> - for embedded kernel, people like built-in drivers, and people will
> >> >>   have things they don't need at all.
> >> >
> >> > that's true to some extent, but until we know for sure that all of t=
hat
> >> > is compiling fine and all dependencies are properly handled, I would=
n't
> >> > like to see Kconfig or Makefile being abused. That has happened befo=
re
> >> > and will happen again if we allow it.
> >> >
> >> > My suggestion to Alex is to remove all dependencies for at least a
> >> > couple of merge windows and only add dependencies for stuff which
> >> > actually matters; like only building the PCI glue layer when CONFIG_=
PCI
> >> > is defined instead of when ARCH_X86 is defined and so on.
> >>=20
> >> That's what I mean to do as well. I wouldn't dream of making something
> >> like this x86 specific. :)
> > Alex, Have you made the decision that remove all dependencies and leave
> > only ones that has to be there? If yes, I'll try the way, though I don't
> > feel good about that.
>=20
> Yes, I like Felipe's suggestion. Currently (with Felipe's patches from
> yesterday), there is only one dependency (PCI for ci13xxx_pci, which is
> ok). So let's try to keep it that way.
>=20
> I'll push the patches to my tree on github [1] soon, which I propose to
> use for all chipidea-related patches.
>=20
> [1] git://github.com/virtuoso/linux-ci.git

you should add it to MAINTAINERS file.

T: git git://github.com/virtuoso/linux-ci.git

--=20
balbi

--/+TVfO13bGamJ+u9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPvOGIAAoJEIaOsuA1yqREM4YQAJ0jrUUeQbFnT/AlqGuUzsC2
6k7eElbMP6RXAP0NemagaNsg9DTYLxmmOmss4EHQz79fo7Yjx6pVZiFno4QckyUH
VJtAqAZak86P2VRHVVPiDdAKK3MH/C2A5WRA2JARH/4Q/DWTMM247iaemoYYA+Ne
DJEUvpxMz1dbAcfmn+zAAjjiAG6Gpnpw+8bRjPFrWJFT1e6vQvfIxVgww+n/FJD0
Jpb4F4MLnQX68d/me/Dgz/6nY1HaK964TIN0rpUcRvA9DiGN9clOCwXNyGrRvw26
sivsRHLy1iWMZHymWx4/dFpGV+QeJCgc0VgXU+JBgs8WHrbrVNxy+XgfTIANpGFj
TdwnY0Ab/uhZDRVg0cbcJBNVwsUTjjb/KH85ZkfwBLtONuB5n3/sFA1xBvDBCxtB
jQVH2KvdiVcITMTD+REUultBpwe9eyk+IPinzYeIWqszOwyUPigMuSJYDLLfhXCS
G+8eOSZfcegV6ez3VdJ67CGsdbMEHHYymJYfMEN6kP5yNyfkT4Je5kaVWAqbPA+6
0MHoCMp6JE8Mhia/Q31Cfpb2kCODyUTLfU5xta/XZuwNUu2IiuI4m4r+734k3POu
v/3huA0fHA+XN+HuoT6a/FE1OE/IR0GPCI3mGD3448Ju0GU2lBcUh451I3v/osra
85OfoaJN13YKZWqJ3lb1
=wE/A
-----END PGP SIGNATURE-----

--/+TVfO13bGamJ+u9--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
