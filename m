From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC 2/3] checks: Add unit-address checks for simple-bus and
 default
Date: Mon, 4 Apr 2016 10:22:04 +1000
Message-ID: <20160404002204.GD16485@voom.fritz.box>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
 <1458780021-5052-2-git-send-email-robh@kernel.org>
 <20160331052912.GE416@voom.redhat.com>
 <CAL_JsqJO+9Wna4mjeRLj+ELy7BwL7K=QEVrNGs3CuAaE3Y_Q3A@mail.gmail.com>
 <20160401022735.GJ416@voom.redhat.com>
 <CAL_JsqLup+esWdQ1dzpOaj17BaE2d2CJ6sJAqBUcNx2xBvNFKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLup+esWdQ1dzpOaj17BaE2d2CJ6sJAqBUcNx2xBvNFKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2016 at 01:50:18PM -0500, Rob Herring wrote:
> On Thu, Mar 31, 2016 at 9:27 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Mar 31, 2016 at 11:18:25AM -0500, Rob Herring wrote:
> >> On Thu, Mar 31, 2016 at 12:29 AM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > On Wed, Mar 23, 2016 at 07:40:20PM -0500, Rob Herring wrote:
> >> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> >
> >> > Minor nit: before doing these tests, we should probably add a check
> >> > which ensures that any bus bridge node *has* a #address-cells and
> >> > #size-cells value.
> >>
> >> I'll check, but I thought we already had that check because any bridge
> >> node has reg or ranges.
> >>
> >> >
> >> >> ---
> >> >>  checks.c                                    | 87 +++++++++++++++++=
++++++++++--
> >> >>  tests/run_tests.sh                          |  4 ++
> >> >>  tests/unit-addr-leading-0s.dts              | 10 ++++
> >> >>  tests/unit-addr-leading-0x.dts              | 10 ++++
> >> >>  tests/unit-addr-simple-bus-comma.dts        | 18 ++++++
> >> >>  tests/unit-addr-simple-bus-reg-mismatch.dts | 18 ++++++
> >> >>  6 files changed, 142 insertions(+), 5 deletions(-)
> >> >>  create mode 100644 tests/unit-addr-leading-0s.dts
> >> >>  create mode 100644 tests/unit-addr-leading-0x.dts
> >> >>  create mode 100644 tests/unit-addr-simple-bus-comma.dts
> >> >>  create mode 100644 tests/unit-addr-simple-bus-reg-mismatch.dts
> >> >>
> >> >> diff --git a/checks.c b/checks.c
> >> >> index 48e926e..82a7f38 100644
> >> >> --- a/checks.c
> >> >> +++ b/checks.c
> >> >> @@ -20,6 +20,11 @@
> >> >>
> >> >>  #include "dtc.h"
> >> >>
> >> >> +#define node_addr_cells(n) \
> >> >> +     (((n)->addr_cells =3D=3D -1) ? 2 : (n)->addr_cells)
> >> >> +#define node_size_cells(n) \
> >> >> +     (((n)->size_cells =3D=3D -1) ? 1 : (n)->size_cells)
> >> >> +
> >> >>  #ifdef TRACE_CHECKS
> >> >>  #define TRACE(c, ...) \
> >> >>       do { \
> >> >> @@ -578,12 +583,88 @@ static bool is_simple_bridge(struct node *nod=
e)
> >> >>       return false;
> >> >>  }
> >> >>
> >> >> +static void default_unit_addr(struct check *c, struct node *dt, st=
ruct node *node)
> >> >> +{
> >> >> +     const char *unitname =3D get_unitname(node);
> >> >> +
> >> >> +     if (strstr(unitname, "0x") =3D=3D unitname) {
> >> >> +             FAIL(c, "Node %s unit address should not have leading=
 \"0x\"",
> >> >> +                  node->fullpath);
> >> >> +             /* skip over 0x for next test */
> >> >> +             unitname +=3D 2;
> >> >> +     }
> >> >> +     if (unitname[0] =3D=3D '0' && isxdigit(unitname[1]))
> >> >> +             FAIL(c, "Node %s unit address should not have leading=
 0s",
> >> >> +                  node->fullpath);
> >> >
> >> > Explicitly checking various aspects of the format seems a bit weird =
to
> >> > me.  Why not just generate the expected address from 'reg' and
> >> > strcmp()?
> >>
> >> Because for the default check, I'm only testing these aspects. I found
> >> some cases running this thru the kernel tree dts files that the full
> >> simple-bus check is too strict. For example, we want to warn on
> >> "@0x002,4", but not "@2,4" or "@2blah".
> >
> > Ok.  Thinking about it, I think this might work a bit better separated
> > (mostly) from the bus type stuff.  Basically treat it as a "common
> > unit name problems" test, that will skip itself if a bus type is set
> > (which will allow more thorough testing of the unit name).
>=20
> Ha! That's pretty much back to my original patch, but with the
> addition of skipping the test if the bus type is known.

Heh, yeah, I guess it is.  Sorry.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXAbOsAAoJEGw4ysog2bOSOrUP+gPw9N0X9kf2encauBQV+yIH
pQD8In7fZg6JTTyzOPpoxnIyBxvOZ6T8XziGiXUWPT7pzB24HsTaECyflajnPtD1
jReW30wYJcYH59GG5S0xB8Npaf0NcCtNHxCs/9hZvFw7YgBbl1xE60Qqpx/8wozq
y4dkNdw1GXXgiUspnCAMj4+ONcLucYrIgIN9TtPg/UadF0YKYtR8XSYuuZLPId8j
2IJA5WH8lxv9bb+Nd38lHF+akLAojJI3hX64aueRdcoG0EXRcp5EdNS+g49wqsbh
t/IzIrPbD3LMUdE0q9GkPJgjXvUhnFhWSvkXd8pTOxIqIgIFAF09PwAUtxSjwAvm
gbp10Pgtf1m82dNtm8GkVFVHkP2mm/CMS72gLy2teBEYFETrQQ9w9l1wJmAZb1GA
jdPZ/AgJ8+09sWKZqjnL4T842RgZdew8lQjGKaRj1PbiprvWT1ZHwlaATq9VfIVY
Dl5s5laaB0SVhhYQIEhj4ZPM73Q/sOpg7k1vCeVLFFS/fD+gP0XgXID8X+Sd+6HL
AkUn0mt5HGad53K0z0xr6aAWAkNEkhycfvRZe+SSuLYBC7I35sWCVSZ1clXCzFwV
JhXh2ulBRKzPUuzId42c1q+99j1TPF8aFdZdTnJXzMwvieDKtFVm3Ac4B+K4fpxt
tCuBxjXYjU9qizvcfgm+
=iYQ1
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--
