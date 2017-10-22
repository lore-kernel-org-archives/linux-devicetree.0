From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague
 (26 Oct 2017)
Date: Sun, 22 Oct 2017 19:25:26 +1100
Message-ID: <20171022082526.GC15297@umbus>
References: <CAGb2v67GU4uW7uPMrqFjTW0qBR6LPNeX4Md+tf9S=HRWT_GVqA@mail.gmail.com>
 <20171018110958.mh76pngzluazmc7y@sirena.co.uk>
 <20171018175910.GP12015@bill-the-cat>
 <FD387FCC-3F95-48DF-B412-3384EF96FCFC@fubar.geek.nz>
 <CAL_JsqJTE5p0zjm-66D2143dEx+xQ0uKCV-20kMt-kq=SOa-8Q@mail.gmail.com>
 <23a238d7-0b3d-8b46-b2fe-88b9d0841aa1@st.com>
 <CAL_Jsq+p=-yTY4BNKXdSccPcBWsCUkP8HPQ-ergZXPB8msY5ig@mail.gmail.com>
 <59E8F2EC.5090602@gmail.com>
 <fea62563-6629-6d79-06a9-3d17c97ad238@st.com>
 <CAL_Jsq+kYCWFR5vSCuvT--N-hHTfFfEVrsv8VHw7PMiyONYs8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+kYCWFR5vSCuvT--N-hHTfFfEVrsv8VHw7PMiyONYs8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Andrew Turner <andrew-/GQUgJ3qWXsIvnNNuaVxrw@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2017 at 08:37:26AM -0500, Rob Herring wrote:
> On Fri, Oct 20, 2017 at 4:55 AM, Alexandre Torgue
> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
> > Hi Frank,
> >
> >
> > On 10/19/2017 08:46 PM, Frank Rowand wrote:
> >> On 10/19/17 07:59, Rob Herring wrote:
> >>> On Thu, Oct 19, 2017 at 9:00 AM, Alexandre Torgue
> >>> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
> >>>>
> >>>> Hi Rob,
> >>>>
> >>>>
> >>>> On 10/19/2017 01:53 AM, Rob Herring wrote:
> >>>>> On Wed, Oct 18, 2017 at 6:28 PM, Andrew Turner <andrew-/GQUgJ3qWXtrsDanXnWFnQ@public.gmane.org=
z>
> >>>>> wrote:
> >>>
> >>>
> >>> [...]
>=20
> >>>>          -->For example, I want to use the same dtsi files between L=
inux
> >>>> and
> >>>> U-boot. If in u-boot dts file I overload several "status" entry by
> >>>> "disabled", is it possible that compiler doesn't build it ? And what
> >>>> about
> >>>> not used phandle ?
> >>>
> >>>
> >>> You certainly could remove disabled nodes in dtc. I'm not sure how
> >>> hard it would be to plumb into dtc. I think phandle properties are
> >>> already only created if there's a reference to them. If that is
> >>
> >>
> >> Yes, phandles are only created if referenced, unless compiled
> >> for loading overlays into:
> >>
> >
> > Are there DTC "extra" options to use to not build those useless phandle=
s ? I
> > just tried to revert the dtb to dts (using following command:
> >  ./scripts/dtc/dtc -I dtb -O dts -o stm32f469-disco-flat.dts
> > arch/arm/boot/dts/stm32f469-disco.dtb)
> >
> > I see that phandles not used are in the dts output file. It is especial=
ly an
> > issue for pinmux phandles. All pinmux groups possibilities are written
> > inside (in my case) stm32f4-pinctrl.dtsi. This file is included in each
> > stm32 board dts files, and in those stm32 board dts files only required=
 node
> > are enabled. But I see that all pinmux definitions are embedded inside =
dtb
> > binary (even ones not used in board dts file).
>=20
> Ah, you mean removing nodes without a phandle reference, not phandles
> themselves.
>=20
> There's no way dtc could do that because no reference doesn't equate
> to unused. For example, there's no phandle reference to the /memory
> node, but that is for sure needed. We would have to add some
> annotation to nodes that could be removed if unused. This could be
> some source annotation (/delete-if-unused/), some extension to status
> property, or some new property.
>=20
> Another option would be just mark all those nodes disabled and then
> postprocess the dtb to mark them okay if they have a phandle property
> and delete the node if not.

I'd be happy enough to merge a patch to dtc which added an option to
strip disabled nodes.  It's also pretty easy to do using libfdt (see
fdt_next_node() and fdt_del_node()).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnsVfYACgkQbDjKyiDZ
s5JmrQ/+OgASJTJHmsHeWaAonQs+OmGmv6NvCThTuxhbq+HEsYpOFf/S6mV/927O
oA6mChvFl3mZZ1eAHEyJaBMogfL4QyFjkzG52nrKrolvOwa1tr2QJTjJrqJn7Jau
caHk9y4AkrnyUmd95dhF0OY27Ip+FjAfaOohDS6h9+Vsx9VdbXz5LvDFfMn+BD26
yh3/nIvP1EafIQfYo6mVMQuJ0xS6n6LKLGk+VgGlOpKhxKE8M9suEeBRHzJZIj5R
5Ond7gJIorI/P/kvOC9EE+0pINySvOsAHfa8sYRb4oE+5fLqFn1N5GI0PI82Z/HU
EoMchZ6fi/YN3Ut+KSV3MCTgBh7NFywjhXvZAN7QAh6PPK1oC727vysmwnxiSz0a
1v0dr/34Mxc9jpSQ+8i6V0MgKtwuMYF00EJwISVaaZSv/HIKXqWskbq9M1L/FPL6
OVPJLRShQ6DuzV4g9ft951djBW+PqOOcZ46IIAuqsG0s7uPSsN415k5lm9uPebSM
7kkbZ2p9CAe8Iv9pPVlsLZSH+dgyVCAbGU0hFgOWgg74MWYlrwldz7XXroM9V2XQ
EvwPMIDpw4Sbq6B0I0oXLWi+4UEKy//cHAlqaR7rIdqqExZyhj+aMTGGg7txQ3c7
8ZlqU2cskgYWlHKQcv4cFIvJGzhDM+XVUlpL0b4eXHUK3fUbYfg=
=Bb93
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
