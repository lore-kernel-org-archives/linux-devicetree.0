From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 3 Aug 2017 16:13:13 +1000
Message-ID: <20170803061313.GM394@umbus.fritz.box>
References: <1501174151.1055.8.camel@hp800z>
 <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z>
 <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="I4g3zIzscEHdx6fd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501191985.1055.50.camel@hp800z>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--I4g3zIzscEHdx6fd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 12:46:25AM +0300, Pantelis Antoniou wrote:
> Hi Frank,
>=20
> On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
> > Hi Pantelis,
> >=20
> > Keep in mind one of the reasons Linus says he is very direct is to
> > avoid leading a developer on, so that they don't waste a lot of time
> > trying to resolve the maintainer's issues instead of realizing that
> > the maintainer is saying "no". Please read my current answer as being
> > "no, not likely to ever be accepted", not "no, not in the current form".
> >=20
> > My first reaction is: no, this is not a good idea for the Linux kernel.
>=20
> This has nothing to do with the kernel. It spits out valid DTBs that the
> kernel (or anything else) may use.

[snip]
> >   - experiment with changes to DTB format for overlays?
>=20
> The DTB format never had to change. It's a simple key/value store with a
> few funny bits.

Except you are proposing changing it by adding type information.

>=20
> >   - get patches to dtc accepted?
> >=20
>=20
> Bingo.

Ok.  So I've made a number of snide remarks in this thread about the
design of the overlay format.  For that, I apologise - I try not to be
passive aggressive, but I frequently fail, and I've had various
unrelated reasons to be grumpy lately.

Let me instead be bluntly rude:  if you want patches accepted into dtc
faster, write better patches.

I'm aware that I tend to be overly nitpicky.  That's another habit I
try to avoid, but often fail (doesn't help I'm a qemu developer and
the qemu community is also very nitpicky about patches).  But that's
not the only problem.

Your patches have frequently had sloppy errors: not being careful
about buffer limits, inaccurate comments, not matching existing
similar code when it makes sense to do so.  That's in addition to the
harder to quantify problems of showing insufficient thought on "is
this the best/simplest way to solve this problem" at each level.

Errors in internal implementation can be fixed or cleaned up later,
but best to avoid as many as possible first time round.  Errors in
interfaces cause much more pain, and nearly everything about dts and
dtb is an interface.  It's worth trying hard to avoid mistakes.

When I make suggestions about changes you frequently just re-iterate
why you want the feature you're trying to implement.  That's not at
issue, what I need is either to make the suggested change, or to make
a case as to *why* your original approach is a better way of achieving
the goal.

All the above means the patches tend to go through many iterations
befoire merge.  But, it's more than that.

  1. Because of the above, I'm inclined to review your patches in
     detail, which takes longer
  2. Because of (1), reviewing your patches is more work, which makes
     me procrastinate about it longer.
  3. Because of all the above, I'm less willing to ignore minor errors
     (or correct them myself).

Well, there it is.  I may well regret sending this later.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--I4g3zIzscEHdx6fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmCvvcACgkQbDjKyiDZ
s5L/Mw/+PA7SRNCsLwiejsgqDWHFPSfvZskQUYa0kNcek5riTxGTBwChRaxf/U7B
I1/cZGmHP2Tnbc4B1dpxVknvge1A+CXF8pl0dVEL7S/OxgSxyong9+OAD0ES7U4K
lJwAXctlPxVALZShm+RY8N5IgbEPCgk+x8gtdMiwVUM4lp0LN7OFU8iuySX3twBN
HCwmLH4k6+Lvt6f0UbNNaKVH/bxqahBCBALuYvzG30Gr0dWvDS+k3xt84iWB1zzX
jc6uYJgCAuPZPkhVWSQUw43FVQckzKbAK77dmW5H2enzSgM7Yi+cyJlZlRcB1qgy
uWReGLRe3nvwKghOth5VoLcU4q57modsw5N4MUB7YHCOUsl1oaSJnlIGSEOpBmfN
ygDz6zqGNjipf88bdttMV+SCRdsY6fKAYe6QwgOU01rxqIQQCB7SXeRN2Ih2/wFI
GdqIa8Rtptu/E8JfhLKPUMbOPMN9tV+WHAFcz2ENCOky2JeL5sjMFBUHS9NgEFjx
rz58QgGHf2+AbFO6/9YDGsCdYCMX8BueUhXSJEmt+al+SY2m2q9XIvkFxfPn8PJ2
kYLSGFDeLakuN29Kb8tFpLnqMnZl5mzC5WfRdUjwp18TLCiDyi2dchIlL2U9uUFc
k3JF1zfL9vfApom50C04QrttOX6C91HMxx/NhxQJTUPG0r+/mUc=
=WodE
-----END PGP SIGNATURE-----

--I4g3zIzscEHdx6fd--
