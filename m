From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 0/3] dtc bus and unit address checks
Date: Tue, 21 Mar 2017 14:50:54 +1100
Message-ID: <20170321035054.GC13932@umbus.fritz.box>
References: <20170320144418.5021-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170320144418.5021-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2017 at 09:44:15AM -0500, Rob Herring wrote:
> This is a series of checks designed to check problems commonly found in
> binding reviews. The first patch adds checks for PCI bridges and devices.
> The 2nd patch is new in this version and adds checks for simple-bus. The
> 3rd patch is a default check if bus type is not set to check for '0x' or
> leading 0s in unit addresses.
>=20
> Rob
>=20
> Rob Herring (3):
>   checks: Add bus checks for PCI buses
>   checks: Add bus checks for simple-bus buses
>   checks: Warn on node name unit-addresses with '0x' or leading 0s

Applied to master, thanks.

>=20
>  checks.c                       | 231 +++++++++++++++++++++++++++++++++++=
++++++
>  dtc.h                          |   5 +
>  tests/run_tests.sh             |   2 +
>  tests/unit-addr-leading-0s.dts |  12 +++
>  tests/unit-addr-leading-0x.dts |  12 +++
>  5 files changed, 262 insertions(+)
>  create mode 100644 tests/unit-addr-leading-0s.dts
>  create mode 100644 tests/unit-addr-leading-0x.dts
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY0KMdAAoJEGw4ysog2bOSUKkP/0kyn6Mc8OtpMK94dF75pOaI
HE0MTY1lVWYqBzfNb2ureVOYMTnL2hg0NWh2ZOnEkxQ9oCht0SIcL1qhqEE2x0gF
Bbbfi0+7IUrb8MzOJcV6v5OoQCvV63rkKwUFc+YsQ9aCiTTrt3DvNSvqqojUVrxO
OPIAcd+5DE/v+NvSqkGk7djUt7ecEFKxJWCTYaOHoTCp396G55aCtNOSpzGaYKw9
qQ5mKHW5bPMUKcWCy+9F0lzICGEPd/uTS4ZVzagiG/Cc9eRSIpzC/aMdCh9MMz0V
lcsVEjAEG1TWOLTQQ3RS/q1kqW3jIZS97OaliDLmSRexPN6f7SiPLuarkxIWtLOy
Vv0K5T070L0Kewpd8IlzO5Sq+qSfue/s1PewUVYscOwSKhHp59BjZwsn48/JO16+
SZH4ILPs7sWzupTEfXLlDiqgqqVDRrQ5725te8yJnPnuJ7cNA8UUHBLbNDTyod7n
vgycEnwYA1lxLGEZHNz8wZUDqtyuRMASsGW//3P6pscUFSc7M2VORhMGd9Re7j0Z
Z4CeO9B8cw+g1BzbEt54ZCzFpVRZ0WFOJsANYxLBJUZQDQaFJpZ3eBsi+LbUobDL
v5HUYGtiF2mY41giTP6TQOh7Lvz8nTs6zC4UTtOfeKYx71/hinPk4eU3eh2hMPTp
rIyq+In/L4A0osEtsymK
=iV06
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
