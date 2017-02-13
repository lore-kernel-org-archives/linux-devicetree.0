From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 0/4] dtc unit-address and character set checks
Date: Mon, 13 Feb 2017 16:04:41 +1100
Message-ID: <20170213050441.GA25381@umbus>
References: <20170210164717.1234-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wRyyN4gAPkNkeCwp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170210164717.1234-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wRyyN4gAPkNkeCwp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 10:47:13AM -0600, Rob Herring wrote:
> This is a series of checks designed to check problems commonly found in
> binding reviews. The first 2 patches implement a stricter character set
> for property and node names. The 3rd patch checks unit address formatting.
> The 4th patch adds checks for PCI buses including more specific checks on
> unit address formatting.
>=20
> In patches 1 and 2, I've turned the checks off by default. In patch 3,
> the leading '0x' or 0s check was moved to its own check. In patch 4, most
> of the bus struct was removed with only the type and the checks are called
> directly.

I'm still a touch uncomfortable about the tests in 1 & 2, but since
they're off by default, I've merged them.

3 & 4 have further comments.

>=20
> Rob
>=20
>=20
> Rob Herring (4):
>   checks: Add Warning for stricter property name character checking
>   checks: Add Warning for stricter node name character checking
>   checks: Warn on node name unit-addresses with '0x' or leading 0s
>   checks: Add bus checks for PCI buses
>=20
>  checks.c                       | 151 +++++++++++++++++++++++++++++++++++=
++++++
>  dtc.h                          |   7 ++
>  tests/run_tests.sh             |   2 +
>  tests/unit-addr-leading-0s.dts |  10 +++
>  tests/unit-addr-leading-0x.dts |  10 +++
>  5 files changed, 180 insertions(+)
>  create mode 100644 tests/unit-addr-leading-0s.dts
>  create mode 100644 tests/unit-addr-leading-0x.dts
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wRyyN4gAPkNkeCwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYoT5pAAoJEGw4ysog2bOSRzYP/03MFOE56aUs6pxLFlddABsN
D0zFkTG+F7F8cQ+2vRDAyZ/AD33+BpgotKJ9nXEw3r3/p5Ls7o/nlsqKfZBNtDHh
ue/ANy3hYbFTw6+WXBVYgoTIqj7atIhZIhG231lH6xl+LmfNRvfsIHqlyJ3JCnoR
P3f8xZYHyFHXJgTk+2yCppTyS9Pydf6BMUB9OAyGEpfz+AgXZp/OS1Xwm3QG3IyF
Gbxf3nI+MCF/fPfnrH5LNWPggX/Ortxm/sBZAUs57hPj9nfB/iLKYom0PZyNi/Yo
lJ4u0S2usxlv8VTb+rzwiXpMAQO6XlCdNtlC0yFyMSoowKVaH7tMHneEzd8uvjbg
DFQ65F3M+9zoJqtkaSmSQeKF1jvjRsWdbQce8VyuiKQq149XF0Ty1umMkn7fRujD
T09GTzin/N4QdfLvGCG7cmr5XrjJc6Njn1uc+hobc1SEE62eVgRQrBLF5mrsMnEx
6sSBIkHLRSZhmn4BBE9jtsUhDkZ4l/KjxYkwAc/3/wXiQ4MTuGGH6Y3TE4ASDc6m
BttUCS+Wm4S51cnoYErA9R3YdEg0LVJg6weAQGER0NVlHg2e7RKLG1cUSSstrtqH
eTgYM4waIRM1WA23pcs1PyMpYtAyDRDyzx0JCjwdBdVMicK/JtmWEAP7P73Rh1vp
fd818Fc79iHWfnTMmXSz
=Wqrf
-----END PGP SIGNATURE-----

--wRyyN4gAPkNkeCwp--
