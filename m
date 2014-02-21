From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: SPDX-License-Identifier
Date: Fri, 21 Feb 2014 10:20:45 -0600
Message-ID: <20140221162045.GN31902@saruman.home>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local>
 <20140220182257.GF23217@saruman.home>
 <5306F458.9010706@monstr.eu>
 <20140221160442.GA17506@kroah.com>
 <5307790A.4050806@monstr.eu>
 <20140221161246.GM31902@saruman.home>
 <53077C5F.9000407@monstr.eu>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="finhkSr2yyrWw3ow"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53077C5F.9000407-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--finhkSr2yyrWw3ow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 21, 2014 at 05:18:39PM +0100, Michal Simek wrote:
> On 02/21/2014 05:12 PM, Felipe Balbi wrote:
> > On Fri, Feb 21, 2014 at 05:04:26PM +0100, Michal Simek wrote:
> >> On 02/21/2014 05:04 PM, Greg Kroah-Hartman wrote:
> >>> On Fri, Feb 21, 2014 at 07:38:16AM +0100, Michal Simek wrote:
> >>>> BTW: u-boot started to use SPDX-License-Identifier
> >>>> which will be nice to start to use.
> >>>
> >>> I agree, feel free to start sending patches to use this type of
> >>> identifier for drivers.
> >>
> >> But we probably need to add that Licenses to one location.
> >> Documentation/Licenses?
> >=20
> > Just add to the drivers themselves, just like u-boot is doing. A simple:
> >=20
> > 	$ git grep -e SPDX-License-Identifier
> >=20
> > will tell you filename and license. Or did I misunderstand your questio=
n ?
>=20
> But for doing this it is probably necessary to have location where
> you will place that licenses and you will explain what it is how
> it is done by Wolfgang in this commit.
>=20
> http://git.denx.de/?p=3Du-boot.git;a=3Dcommitdiff;h=3Deca3aeb352c964bdb28=
b8e191d6326370245e03f
>=20
> Then yes, adding one line is enough.

spdx.org has all licenses, why don't we just rely on that instead of
adding every other license to the kernel source ?

cheers

--=20
balbi

--finhkSr2yyrWw3ow
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTB3zdAAoJEIaOsuA1yqREUD8P/RnDEST3WI5ykFb2m1mdGDTR
t/if9Y6G4YNwuUaW7aRPbKdYR1eEMuFYPG64os8CqVdufHk79uHaIEfw0LE0u0hY
KCC8h1uGuqcmmLcB28bvvKl09E2wXjtPXBCi2b4QuR6sJVH5wToJNZT3fK1GTRcv
OsZGW+rPafg4RDncW1ZoW/hjZhUuLL4wM+PV107aJmLTGJCTG+Dr4mwo0tNUAdto
d4styuCCitkerSqEQLjCL2CqFHVnOa41i9b7biazLhVIFcVICnUBCJ9VC7H/FsVL
7wAvoywr9hsvIfYGkANOX3hHw8TlL8Ut3PBym0FMZYB3yQKFzbZl3tvSWD67THKV
gyM3WvjeRvCBpt4frKvKzTAgGesjtQwxkekZEMGt+8EHuvFKFTEm3x4ErzXUvPYn
qgfI3kKYV6A9fUhmg4scxVzt4TMfGZuAdyhyNE1xxxRz+V+mnmiFofvzyWRXcz0X
xMFifdyJlA+aPp3z77Xzm8kZn7PQWMro2/BVscCe1H0FlYR4XEMFCgeFrTW8kJMv
4RGw+TLNySxpSkj75mfN6aolXVndIVOsVTkLUy9tsjfzyQD0hkavLEXKGEnIcUf3
rZRP5IP+8uMAdahZhzdIxBvz0QIs+UN3DKYIWs8rmD9KJrV93wD3EvwdcsjALJoQ
PNWLPDCd2hjrU0b29TEW
=3XSM
-----END PGP SIGNATURE-----

--finhkSr2yyrWw3ow--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
