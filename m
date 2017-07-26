From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Wed, 26 Jul 2017 11:01:48 -0400
Message-ID: <20170726150148.GD26163@bill-the-cat>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box>
 <5967CAA6.6010801@gmail.com>
 <CAPhXvM4NzU61dENLeJ2Xt=arKqYFjXaPBvzrjxAJ7h3Y-gT4Nw@mail.gmail.com>
 <20170726042315.GA8978@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="JQOvt/yUJ6yzDJmH"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170726042315.GA8978-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--JQOvt/yUJ6yzDJmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2017 at 02:23:15PM +1000, David Gibson wrote:
> On Thu, Jul 13, 2017 at 08:38:10PM +0100, Phil Elwell wrote:
> > Can we also consider a mechanism for overlay-local symbols, i.e. symbols
> > that are used purely to create links within an overlay - perhaps using a
> > particular naming convention? This would make it easier to instantiate =
an
> > overlay multiple times without having to uniquify all symbols, and it w=
ould
> > avoid polluting the global namespace without reason.
>=20
> I'd really prefer not to add yet more features and complexity to the
> existing shoddily designed overlay mechanism.  I'd prefer for people
> to focus on a better replacement - which includes considering these
> sorts of use cases and how to handle them.

Can we go for incremental progress over time instead of replacing what
was finally accepted?  Maybe one or two concrete examples that need
improvement upon, and go from there?  Thanks!

--=20
Tom

--JQOvt/yUJ6yzDJmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZeK7cAAoJEIf59jXTHXZS5kgQAJvOqi1jDXeICYq6u6/sANta
njNkR0HCT5CQc9/Wkvdnp0yVVWYOi0tHmChK93DOA5u0qJzia0f9G3I3+/87HY1F
7O/xsm3koZmtzatU3fmJnO/f7c5uAlAw9OxbJyxOgz/+PMi5rfzFtgXx5XD9+Y3x
7gJ2/a7QLWalIoSIO5gmtctymEcvwMh77KM5foBEa3/oRoFT1X9GAkJg7KT6i52U
DqGV0UG8vzqi5JEESiArj3LaeePeK8jm5xWDIoA9MSb3baZYAAN1R+qcptqtwxuQ
ekVdiX0ulAhMGi0kXjItwEU341bTivBMfYmavcHCVu0hYlUl9OWtAV9dHVhlDcqY
mktEZy0BM1rhq98c+63HAKW6yQ/jCKGmXi+JChKQ+6i5rBLbaGEtBbc6A7/qSjOB
6umhZFkPamPek5cI07r0ZloyV66U3BXu3OBzvYhj+hq+DgtUm6QvaUlnaiJP1Ksn
rQePSP2mtCmLHpHmp/qteTuXeO2zhAUR+JsaI0/VqDcWYmK8JevmW9q20g94s565
5N54LTeeLkya4JqGTCnVDLbRqZNiYDCXIZmcufxgsPrUm120Qho3vQIJ/Eue7DYS
l1kuVK8er1rPZiNgXwhS6hyOkzk7lalugjOfLLSQM0SEtHIU3kZDrgJZTFi07PKD
UkuySU3jGb/3FA89sn3V
=zCdS
-----END PGP SIGNATURE-----

--JQOvt/yUJ6yzDJmH--
