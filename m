From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 0/8] libfdt: Add support for device tree overlays
Date: Thu, 28 Jul 2016 15:29:51 +1000
Message-ID: <20160728052951.GB2588@voom.fritz.box>
References: <20160727125600.15949-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160727125600.15949-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 02:55:52PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> The device tree overlays are a great solution to the issue raised by
> the bunch expandable boards we find everywhere these days, like the
> Beaglebone, Raspberry Pi or CHIP.
>=20
> Although for now Linux is the only available tool that can deal with
> overlays, some other components like bootloaders or user-space tools
> might need to apply these overlays on top of a base device tree.
>=20
> To address these use cases, we introduce a new function to the libfdt,
> fdt_overlay_apply, that does just that.
>=20
> You can find a test program here: http://code.bulix.org/792zum-99476?raw
>=20
> This is the last patches sent to U-boot, with the modifications
> suggested by David, and the additional test cases.

I've merged 1-4/8, some comments on the remaining patches.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmZhPAAoJEGw4ysog2bOSsJUQALVL3B++iY038mHbPDGf2CG2
P3Q1lxlF5NtVfJ6PPRUWpiJAu6Yae1f62ajgkprSWS0a/154xirgI3Kf3OkqWXSQ
sdZfR/K+L9P4vzg60UqCQD5bjtY+41qv46t1xxAxNZY0yv5BNPuZSV0WJWbJ8QeE
2i/iKYSvA8A9f3mPVPcr5KAfFvhzsVPkGekvH1YSgWocxTj1SuBotlESkDxlbOrj
WSyrnL2mzKyBvk6C59lXaq9RiT7A9AdCvmD+QV0mJ8bZF0B/VvhZHG0VoHOFhTvO
3Q8tACZSEtzjCTH9GY8S9s+HKdb2UeWGF+FJ3i4G4HK/ewBbYOeeAfTnhY9fljb/
QQQzKPk1ZeYrlbfuVTLIqKhXzJP8O2fRAxIrWnyUemRJiE9NHmPVHk7mHrjcVZOP
rx61XFdrDGg6cKjvJiGe+u/JeeW1p8y1mccYTPVofE54kW+T4ZqwpR/5FuZbz5Ca
Cz8Y2rDX8Zob64B9o15z2/JUFyCcvwgLuxDYnKD1T/RImj8arekxARqfFLLOziYK
tDHoOFVZEmRrlsDRPD16m9fNAsuxzO7v6ykGjkJITIcuhepSt6yfcqC+kgFRDwFm
gpIEVUdyoGeLqGXqHqFqOKX5N/THCyCC4lpVOEYVOOMO+wWpuhIUnkJi/qI6Y2sy
Gxq3NQiwHVSEPJGwNVmp
=xVKE
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
