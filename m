From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 3 Aug 2017 15:49:14 +1000
Message-ID: <20170803054914.GL394@umbus.fritz.box>
References: <1501174151.1055.8.camel@hp800z>
 <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z>
 <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z>
 <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
 <20170728005140.GF26163@bill-the-cat>
 <20170802150933.GG394@umbus.fritz.box>
 <CACxGe6um3TC3URKa8NWbbQT-gc=AV5jgTxbQ3pYnSp4Xmu_Mfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5LiOUhUlsRX0HDkW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6um3TC3URKa8NWbbQT-gc=AV5jgTxbQ3pYnSp4Xmu_Mfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--5LiOUhUlsRX0HDkW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2017 at 11:04:14PM +0100, Grant Likely wrote:
> I'll randomly choose this point in the thread to jump in...
>=20
> On Wed, Aug 2, 2017 at 4:09 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Jul 27, 2017 at 08:51:40PM -0400, Tom Rini wrote:
> >> If the common dts source file was in yaml, binding docs would be writt=
en
> >> so that we could use them as validation and hey, the above wouldn't ev=
er
> >> have happened.  And I'm sure this is not the only example that's in-tr=
ee
> >> right now.  These kind of problems create an artificially high barrier
> >> to entry in a rather important area of the kernel (you can't trust the
> >> docs, you have to check around the code too, and of course the code
> >> might have moved since the docs were written).
> >
> > Yeah, problems like that suck.  But I don't see that going to YAML
> > helps avoid them.  It may have a number of neat things it can do, but
> > yaml won't magically give you a way to match against bindings.  You'd
> > still need to define a way of describing bindings (on top of yaml or
> > otherwise) and implement the matching of DTs against bindings.
>=20
> I'm going to try and apply a few constraints. I'm using the following
> assumptions for my reply.
> 1) DTS files exist, will continue to exist, and new ones will be
> created for the foreseeable future.
> 2) DTB is the format that the kernel and U-Boot consume

Right.  Regardless of (1), (2) is absolutely the case.  Contrary to
the initial description, the proposal in this thread really seems to
be about completely reworking the device tree data model.  While in
isolation the JSON/yaml data model is, I think, superior to the dtb
one, attempting to change over now lies somewhere between hopelessly
ambitious and completely bonkers, IMO.

> 3) Therefore the DTS->DTB workflow is the important one. Anything that
> falls outside of that may be interesting, but it distracts from the
> immediate problem and I don't want to talk about it here.
>=20
> For schema documentation and checking, I've been investigating how to
> use JSON Schema to enforce DT bindings. Specifically, I've been using
> the JSONSchema Python library which strictly speaking doesn't operate
> on JSON or YAML, but instead operates directly on Python data
> structures. If that data happens to be imported from a DTS or DTB, the
> JSON Schema engine doesn't care.

So, inspired by this thread, I've had a little bit of a look at some
of these json/python schema systems, and thought about how they'd
apply to dtb.  It certainly seems worthwhile to exploit those schema
systems if we can, since they seem pretty close to what's wanted at
least flavour-wise.  But I see some difficulties that don't have
obvious (to me) solutions.

The main one is that they're based around the thing checked knowing
its own types (at least in terms of basic scalar/sequence/map
structure).  I guess that's the motivation behind Pantelis yamldt
notion, but that doesn't address the problem of validating dtbs in the
absence of source.

In a dtb you just have bytestrings, which means your bottom level
types in a suitable schema need to know how to extract themselves from
a bytestream - and in the DT that often means getting an element
length from a different property or even a different node (#*-cells
etc.).  AFAICT the json schema languages I looked at didn't really
have a notion like that.

The other is that because we don't have explicit sequences, a schema
matching a sequence either needs to have a explicit number of entries
(either from another property or preceding the sequence), or it has to
be the last thing in the property's pattern (for basically the same
reason that C99 doesn't allow flexible array members anywhere except
the end of a structure).

Or to look at it in a more JSONSchema specific way, before you examine
the schema, you can't pull the info in the dtb into Python structures
any more specific than "bytestring".

Have I missed some features in JSONSchema that help with this, or do
you have a clever solution already?

> The work Pantelis has done here is important because it defines a
> specific data model for DT data. That data model must be defined
> before schema files can be written, otherwise they'll be testing for
> the wrong things. However, rather than defining a language specific
> data model (ie. Python), specifying it in YAML means it doesn't depend
> on any particular language.

Urgh.. except that dtb already defines a data model, and it's not the
same as the JSON/yaml data model.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5LiOUhUlsRX0HDkW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmCuVcACgkQbDjKyiDZ
s5Kh3Q/9E0joAguZb0a4ppwwKpG3wygOxJKff8uA44CdSMdIhs3kiwJFgicffpzJ
XgH/9NsHOfvQCK1L0zgN84ccWg9KYZy0ca+idTUZ6rssAvljIy2CnvmrBobCFcDD
7KhubZ6KzjSPIfXON6eP5tSMH1HKfzCZz/y1DIEbQc/om7KT/IJYGiNZpzJs0IJe
aMqT0c0E2weD6TCzMmqrTzFfyP5RY2k1jiqX1G7VmTIPtY82fWEV1DuDVVquPmr/
8V+HHAIoIS9IC1tLEfQZauTCcgOF3HNlUw6vKw15qF4SdcfOXoTprpE+rUWsJaMC
DzQHmsYE8JnyRWiyDKjwZGvlvorVKDz1XIvcATuEWqjF+ibavAJG4/c0FN2TFT+K
21qT6ObNSdA+DCZCtF4UbdseMTJ+O2p1Nx1BPQPk+s3/U0GlEM/pdCHhYevPcrG/
uVIETdgCEG3CmGmE0VFJzIckQuhPYNudX2gWb9Hg5dZlRg6ozv5Zsx+6hPu+VJGv
BX/4djW8Byn+e8eoiZKriR8oOmS04tLXfoASJbWa1VX8hdyc527fEqXlvHiwzISK
swuh8Hr5KkvRjCZozAYbpgPnzi6rZ2S32SRkUY1xaS2wC8A7pSQP7cGPgkgyjjxR
Nu/bFW0+UgAVCBSmOWMagiNcvtoO4pyMAUU0ETwA82FoG0RBx88=
=rPPZ
-----END PGP SIGNATURE-----

--5LiOUhUlsRX0HDkW--
