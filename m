From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Fri, 7 Jul 2017 10:01:09 -0400
Message-ID: <20170707140109.GE22707@bill-the-cat>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box>
 <1499085674.4225.17.camel@hp800z>
 <20170707070915.GD24325@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HwnjeXAdSoek43pS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170707070915.GD24325-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--HwnjeXAdSoek43pS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2017 at 05:09:15PM +1000, David Gibson wrote:
> On Mon, Jul 03, 2017 at 03:41:14PM +0300, Pantelis Antoniou wrote:
> > Hi David,
> >=20
> > On Mon, 2017-07-03 at 19:06 +1000, David Gibson wrote:
> > > On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
> > > > This patch enables an overlay to refer to a previous overlay's
> > > > labels by performing a merge of symbol information at application
> > > > time.
> > >=20
> > > This seems to be doing things the hard way.
> > >=20
> >=20
> > It is the minimal implementation to get things to work, with the current
> > overlay implementation.
>=20
> Is it, though?  I'd expect reworking the symbol creation during
> compile to be of similar complexity to the symbol merging here.  And
> it only needs to be done in one place, not two.  And it doesn't
> implicitly extend the overlay spec.
>=20
> > I do have plans for a version 2 with fixes to
> > a number of areas.
>=20
> Saying you'll fix it in v2 is missing the point.  If v1 is out there,
> we have to keep supporting it.  The number of half-arsed overlay
> variants out in the wild just seems to keep growing.

Erm, v1 is out there, because the patches are posted here in public,
where reviews happen.  If some group picks them up and runs with them,
perhaps it's worth asking why some group would be willing to pick up and
run with v1 of a series?  Which, AFAIK, hasn't actually happened just
yet..

> > > You're essentially extending the semantics of overlay application to
> > > add the symbol merging.  You've implemented these extended semantics
> > > in libfdt, which is all very well, but that's not the only overlay
> > > application implementation.
> >=20
> > This is a port of the same patch that's against the linux kernel.
> > As far as I know there's no other implementations, or at least none
> > that are open source.
>=20
> So, it's already in the wild and we have to deal with it.  Yay.
>=20
> The whole history of DT overlays has been this - hacking something up
> to grab some desired feature with a complete lack of forethought about
> what the long term, or even medium term, consequences will be.  It's
> kind of pissing me off.
>=20
> That's exactly why it took so long to get the overlay patches merged
> in the first place.  I was hoping to encourage a bit more thinking
> *before* putting an approach in the wild that would predictably cause
> us trouble later on.  Didn't work, alas.

So there's literally no one that thinks the way the first part over
overlay support happened was a good example?  Good.  Shall we try and
fix that moving forward?  Isn't the way that open source works is that
people develop, in the open and code evolves based on feedback from
other developers and real world uses?

> > > It seems to me a better approach would be to change dtc's -@
> > > implementation, so that in /plugin/ mode instead of making a global
> > > __symbols__ node, it puts it into the individual fragments.  That way
> > > the existing overlay application semantics will update the __symbols__
> > > node.
> >=20
> > A lot of things can be made better, on the next version. These are
> > minimally intrusive patches to address user requests for the current
> > implementation.
>=20
> Except that a) I'm not really convinced of that and b) I don't see any
> signs of really trying to approach this methodically, rather than just
> moving from one hack to the next.

So to be clear for (a), you're saying the change to dtc's -@
implementation would be less invasive?

> > Why don't we start by making a list, and work towards that goal?
> >=20
> > Care to start about what you want addressed and how?
>=20
> The biggest thing is a question of design culture, not any specific
> properties.  Think in terms of specification, rather than just
> implementation, and make at least a minimal effort to ensure that that
> specification is both sufficient and minimal for the requirements at
> hand.  Overlays as they stand are a long way from either.

So you wish that someone had written some "overlay doc" before posting
patches?  Documentation should come with code, not before code, as we
already (right?) have general understanding that things like overlays
need to exist and need to be useful because there's real use cases out
there.

--=20
Tom

--HwnjeXAdSoek43pS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZX5QlAAoJEIf59jXTHXZS4zIP/2RzfMp4rrwZZ/ziFcaTRenb
SwYN26eELr/p/w6itlI3VFxcGA8RIjNm29sbu0jKWJeNXbNNWYER4r5W1OajDWG0
pzIdjL8WUMyiYsk0T2xgG96saXGRhHkmRGImHjYKjPduxa3WyZwI24jk7yJANHVC
TfnOEq3bxrr/wPvra78TBStoK0Jg+UWDvpD5Iq6ytu6CjhYsAaYv6Yv7XwB3Yj+K
IQShZRuvo1SWH6x21Z17rfU0/XvxUnwZsFo1HinuCAskHI/1eE53rHhK8s5KPSkr
zWW8Yj7c+s5H74walydo84ezo9XZANGfI+rf3fg72PgVYQTgbEcihegsbjgR+QzP
yVJ7vTfxGbl6dsKcUwLsOKbfnvL1iZSB5aIKCO9yx3Aj8oikxDfGxV0b+vMTcdJQ
8puBXbLzV1FfcKmEKBAW+uVra3Ws4pgms4erC48Zw8d76zF8hc3T973mLr5vfSDh
NC/NlUh5+oCUGhgI/wW9LQenXbNEmzmY8F3oqGRLal+Z+b7PTdOazvxlDaRkJu9P
a6tNnKE7NuMVbjP/P1B9DyW9QrKJQN1WbXgzPFNy3wZG6OYv6ytaNfFVurXN38Ph
LsRjeX0doV1zxvZshIbNsTdXPnEOm/8HRZA4mYe5zeRFv4qW9GWxhrqIVOxV8Aqv
2U2elZJo8WNfLMkhm69U
=OPSB
-----END PGP SIGNATURE-----

--HwnjeXAdSoek43pS--
