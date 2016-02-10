From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: breaking DT compatibility (was: Re: [PATCH v4] clk: sunxi:
 Refactor A31 PLL6 so that it can be reused)
Date: Wed, 10 Feb 2016 15:37:55 +0100
Message-ID: <20160210143755.GE31506@lukather>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <56B4E2FB.3050703@arm.com>
 <56BB2D79.6090402@arm.com>
 <CABGGiswOKztmRT40w4t_7BD729WgM8ueLtOD-UF_wgMbmcg4cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qsoMWdMv/ifdm7CC"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABGGiswOKztmRT40w4t_7BD729WgM8ueLtOD-UF_wgMbmcg4cg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <rob.herring@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jean-Francois Moine <moinejf@free.fr>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jens Kuske <jenskuske@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--qsoMWdMv/ifdm7CC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Feb 10, 2016 at 07:42:02AM -0600, Rob Herring wrote:
> On Wed, Feb 10, 2016 at 6:30 AM, Andre Przywara <andre.przywara@arm.com> =
wrote:
> > Hi,
> >
> > just a ping:
> >
> > Are we really OK with breaking existing DTs in 4.6? (per the code in
> > -next: f7d372ba54ea04d528a291b8dbe34716507bb60b, which is this patch).
>=20
> I only warn and make sure people are aware of the issue. I leave that
> up to platform maintainers to decide. It depends on the maturity of
> the platform and users.

The impacted SoCs support is really partial. For the most supported
one, big things like display or sound are totally missing, and we
still update them on a regular basis to add support for new
devices. As such, users are very likely to upgrade the DT from one
version to another just because there's new devices available to
them. And the newest SoC impacted just got introduced in 4.5, and only
has the UART and MMC devices available.

> If people complain about it then it's their mess. For platforms
> supported in distros such as debian or fedora, I would strongly
> recommend against breaking compatibility.

None of them are officially supported:
https://www.debian.org/releases/stable/armhf/ch02s01.html.en
https://fedoraproject.org/wiki/Architectures/ARM#Fedora_23

Only the older one are, and they are not affected by this patch.

> They do ship dtbs, but it's a chicken and egg problem. If dtbs were
> stable and provided by firmware, then they wouldn't have to provide
> them. If dtbs are unstable, then they have no choice.

And while it might work great on platforms that have all the needed
documentation, or a perfect one, which is our case. Almost each
release, we discover that something is not working as it was
documented, when it was documented in the first place.

It also seems that even on well documented platforms, supported by the
vendors, the stable ABI dream is not going to happen:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docume=
ntation/arm/Atmel/README#n105
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docume=
ntation/devicetree/bindings/arm/marvell,berlin.txt#n4

If it makes things clearer, I can also add such a statement.

> > Also I think one needs ACKs from DT maintainers before merging something
> > in the respective directories, which I don't see here.
>=20
> It can go in with subsystem maintainers ack, but there are problems
> with this one regardless of compatibility.
>=20
> > As I am somewhat blocked on that patch, I'd like to have some discussion
> > on the list.
> >
> > Thanks,
> > Andre.
> >
> > On 05/02/16 17:59, Andre Przywara wrote:
> >> Hi Maxime,
> >>
> >> just found this while looking at your current git branch, so sorry for
> >> the late reply.
> >>
> >> CC:ing DT people, since you touch both existing DTs(!) and the binding=
 doc.
> >>
> >> On 01/02/16 20:20, Maxime Ripard wrote:
> >>> Remove the fixed dividers from the PLL6 driver to be able to have a
> >>> reusable driver that can be used across several SoCs that share the s=
ame
> >>> controller, but don't have the same set of dividers for this clock, a=
nd to
> >>> also be reused multiple times in the same SoC, since we're droping the
> >>> clock name.
>=20
> Removing a compatible name or not has nothing to do with sharing code.

This was not about the compatible name, but the hardcoded name in our
structure associated to that compatible. And since we can't register
two clocks with the same name, we couldn't use the same compatible
several times.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--qsoMWdMv/ifdm7CC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWu0tDAAoJEBx+YmzsjxAgvNEP/jLiEKooX2JJUPTfaN0jFoSw
nzRndBvTMvI/j0BczxwVUpNWVmV70ukgbM6KGDGkFIWym8QVMJmLV1WhnxRopXdf
luwhHOfvRPh27kgxZrC5wGuLlRsr38FwSikcu0QLZlfJ2NLgUaUkJboowvjr6HLy
R5J1rckt0eiI8mbaigmN1oHu6upx/8iVbilZq3wwNmN/RJehNn6Kaz1xrUfy+Bz9
MN4ZDyivQtznRS7toDvQBPuzVrjLWRHwsGcC+KEeMWb4XTFNrBkB4CkC6rPFiK5G
v3IzG4OvbJeHarsMjFU1tYmfvSh0BJ3tCiQdcsF+dHN5hXbJ0WKsm853s7lVzIxF
HJVgsc1ejtJlVILxqiTDFHglp1GCIUeW/BsmptKaIB/AgAAD2LcxYM/wr7W2k6qe
O0sijASlxOGsjhPzhFJ8fzdYbD8i4UFn2Fcy4SH497gpk3m/Jb9B1nq+IstkkyyJ
V29434XtobOO2x3GyCkP+saxxmlyP67Ro0I1u/do5luuisncXn22xTG9kT0R0ZEt
HgWOWCSfaEznZgYhWD1xlbLXoNe+fnUDzbA/dWA6IQZtawLwx9qDbN5BMSJGArYr
H5Zm/PBhdQgsbSRH5hrA9vMNZpvYed67V9eXkiJY/7KtEQD5h4z5IN9j5x2qioIn
GdvzJYvsHt01uzLF49lw
=btnu
-----END PGP SIGNATURE-----

--qsoMWdMv/ifdm7CC--
