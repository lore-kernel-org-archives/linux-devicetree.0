From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 0/4] libfdt: Add support for device tree overlays
Date: Thu, 6 Oct 2016 13:24:39 +0200
Message-ID: <20161006112439.GB4684@lukather>
References: <20160930135717.16511-1-maxime.ripard@free-electrons.com>
 <20161006094756.GR18733@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161006094756.GR18733-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Oct 06, 2016 at 08:47:56PM +1100, David Gibson wrote:
> On Fri, Sep 30, 2016 at 03:57:13PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > The device tree overlays are a great solution to the issue raised by
> > the bunch expandable boards we find everywhere these days, like the
> > Beaglebone, Raspberry Pi or CHIP.
> >=20
> > Although for now Linux is the only available tool that can deal with
> > overlays, some other components like bootloaders or user-space tools
> > might need to apply these overlays on top of a base device tree.
> >=20
> > To address these use cases, we introduce a new function to the libfdt,
> > fdt_overlay_apply, that does just that.
> >=20
> > You can find a test program here: http://code.bulix.org/792zum-99476?raw
> >=20
> > This is the last patches sent to U-boot, with the modifications
> > suggested by David, and the additional test cases.
> >=20
> > Let me know what you think!
> > Maxime
>=20
> Looking pretty good.  There's a minor error in 3/4 which I've pointed
> out, it can be fixed in a followup.
>=20
> An error in the conditionals means it's trying to run some of the
> tests which require an overlay-aware dtc on even when that's not
> available - I adjusted 4/4 to correct that.

While chasing that, I found that it was actually a bug in a condition
that was stricter than it should, I'll send follow-up with that and
the fix you asked.

> It also hit build failures on Travis, because the compiler version
> there complains about local variables named 'index' shadowing the
> standard library function.  I've corrected that with a followup patch.
>=20
> With that done, the whole lot has been committed to master.

Thanks a lot,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX9jR3AAoJEBx+YmzsjxAgv5YP/RlsvrbduecN81CP3Z/OSah6
KinWGQ3pTKOhmanmVak7+wsQmCit0smPGl44gQzFHf09NCRBn2qUBfxLhpWBYP4q
mxQziq9pNKLBaTeTV9E6nTpYgxgvr4UwypZ+C8s3jRbCrtSIqvem5nZYpL15v9uK
ZC54IQRghFKZ6kxmpCX9Xtt+iNRGUpCTjd0RxlHuj5Z/zjwpbj4zDBSO53wuJZRe
X6BiylqhHYoiaC4Q0inG+zlLE82oj8T058iFaGbC1D+4Gp9dJN1AjguVgViKI4kY
4c0K5agoDx3b6Mswg/ojEKhapEAlXdoGZsOXlu2fY9feYFKdxUrsCO1/jzfP2Ai9
R8zHc0oI4B1eRbbeFUb1uEfvSGpdRha3/+d4D+xzLpGSzdWqY6x62egdfxhCFGPv
9lbbEHEXUkhVCxjv5ZG+GofNCEP2Jna2BngJ6FI2alKEgrnm7dTwjodnIYLnnQyk
5xQY2awaf+UQvx06Pdw7TW1tP4wZvswJ9GWsQ1L15arulrwdgcZOgdFIZdwIkUtF
tcSp/tFOuttsAiw1FMZRvuqrGUGmyxmVvNQAhF9dwPGkqcUsrALRYsZSblXPYUA5
vEYTdbdA7TnmZVPZkEacQi5FdQPH4EPdexStxeAGVDo3THnPOPsBE1hEKWs+YQSv
Cmz6uZhRzhhe4VxJhf8o
=Mkhj
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
