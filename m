From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add sid for a83t
Date: Tue, 9 Jan 2018 14:34:12 +0100
Message-ID: <20180109133412.uyai4s6vfnh37hn2@flea>
References: <20171219210523.10428-1-kevans91@ksu.edu>
 <20171221145512.llxvzkcrjpquhczi@flea.lan>
 <CACNAnaE9GiVTXD-TV1xXyBJKtTGKpdA6n0REk6a=qm218EgHbg@mail.gmail.com>
 <20171221152630.2vf57x5o2yi5sv3n@flea.lan>
 <20171221190903.56ebae536acf51401c63802c@bidouilliste.com>
 <20171222083508.dfcp6egfvxykmogg@flea.lan>
 <20171222110727.520df7394234f6a5dc0b9ec0@bidouilliste.com>
 <CAGb2v64mf-ihyOs-WJZuVa4Yib3Szp90RZu_a1EeQ1LJXnoXEQ@mail.gmail.com>
 <20180104140119.5pyfihp4zs2poz35@flea.lan>
 <CACNAnaHOuPH05hsJ-jt1135-Giknb-DOuvjeQRSGVR2L7Xc-Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vc7qj476uzdqvh2o"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACNAnaHOuPH05hsJ-jt1135-Giknb-DOuvjeQRSGVR2L7Xc-Cg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--vc7qj476uzdqvh2o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 09:30:57AM -0600, Kyle Evans wrote:
> On Thu, Jan 4, 2018 at 8:01 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Fri, Dec 22, 2017 at 06:11:52PM +0800, Chen-Yu Tsai wrote:
> >> On Fri, Dec 22, 2017 at 6:07 PM, Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org=
> wrote:
> >> > On Fri, 22 Dec 2017 09:35:08 +0100
> >> > Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >> >
> >> >> On Thu, Dec 21, 2017 at 07:09:03PM +0100, Emmanuel Vadot wrote:
> >> >> >
> >> >> >  Hi Maxime,
> >> >> >
> >> >> > On Thu, 21 Dec 2017 16:26:30 +0100
> >> >> > Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >> >> >
> >> >> > > Hi,
> >> >> > >
> >> >> > > On Thu, Dec 21, 2017 at 09:19:24AM -0600, Kyle Evans wrote:
> >> >> > > > On Thu, Dec 21, 2017 at 8:55 AM, Maxime Ripard
> >> >> > > > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >> >> > > > > Hi Kyle,
> >> >> > > > >
> >> >> > > > > On Tue, Dec 19, 2017 at 03:05:23PM -0600, kevans91-OYTqUY/oFF8@public.gmane.org =
wrote:
> >> >> > > > >> Allwinner a83t has a 1 KB sid block with efuse for securit=
y rootkey and
> >> >> > > > >> thermal calibration data, add node to describe it.
> >> >> > > > >>
> >> >> > > > >> a83t-sid is not currently supported by nvmem/sunxi-sid, bu=
t it is
> >> >> > > > >> supported in an external driver for FreeBSD.
> >> >> > > > >>
> >> >> > > > >> Signed-off-by: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
> >> >> > > > >
> >> >> > > > > The patch looks fine in itself, but we've had a number of i=
ssues with
> >> >> > > > > the register layout (and access patterns) in the past, so I=
'd rather
> >> >> > > > > have something that works in Linux too if possible.
> >> >> > > >
> >> >> > > > I have a patch that I think should make it work fine on Linux=
 [1], but
> >> >> > > > I'm afraid I have little to no capability to test it myself a=
nd so I
> >> >> > > > did not add it as well.
> >> >> > > >
> >> >> > > > I do know that the rootkey is offset 0x200 into the given spa=
ce [2],
> >> >> > > > as is the case with the H3, and that the readout quirk is not=
 needed.
> >> >> > > > I wasn't 100% sure that the a83t has 2Kbit worth of efuse spa=
ce as the
> >> >> > > > H3, but I do know that thermal data can be found at 0x34 and =
0x38 in
> >> >> > > > this space.
> >> >> > >
> >> >> > > Then maybe we should leave it aside until someone takes some ti=
me on
> >> >> > > the A83t.
> >> >> >
> >> >> >  Take some time on the Linux driver and do not apply this patch f=
or
> >> >> > now you mean ?
> >> >>
> >> >> Yep.
> >> >>
> >> >> Maxime
> >> >
> >> >  Since linux doesn't have the compatible in it's driver what would
> >> > be the harm to add the node in the DTS ? If a quirks is needed becau=
se
> >> > some region is weird this would go in the driver right ? I don't see=
 a
> >> > technical problem for adding this node right now.
> >> >  If Kyle confirm the lenght of the region and that no quirk is needed
> >> > will it be enough ?
> >>
> >> I guess I wasn't very clear. I'm OK with the patch going in. The device
> >> node currently says nothing about how much efuse space there is. The
> >> memory region covers that and the control section, and the size matches
> >> what the memory map says.
> >>
> >> The size and offset of the efuse space would be dealt with in the driv=
er.
> >
> > Let's merge it then.
> >
> > Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> What does the timeline for these things normally look like? I'm new to
> these parts. =3D)

We're one week away from the merge window, so it's a bit late for it
to be merged in 4.16, but it'll be in 4.17.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vc7qj476uzdqvh2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpUxNMACgkQ0rTAlCFN
r3T7jg/+JvuvajV6yDK4RyyUBdut5K4qjAUnQjX0brxio9BXPuQwlIVZFdOdASIq
uPWBFYNbZyF66JDO3SnGM+ID8/yH2tG1y19z+EAHNXGPt4lqpLNwocik53gh8fUU
IlKz+7MnLwf+zr+PgckZJNPYfWiunAl/pS8d4oECGh+yKqC/OKyMirmESVWTRJb0
um1Q5zcHeDllsEicBLU4kkCX4RqJvWTkFMhQ4VUhtl0OtAzRS0QpRy3bmhdGPYIn
uT1GVj6hHx4y+7VdOAVWKJyCmS3INhEeRzUBxzLGl/JAxjVRgLRl1RETt4BEFTsI
UrGB7G768W/WWJ63fpMczspW6Ii5lHSc5Ed3jbiz/pAELdkhIrqFDc8xj1PxORvu
YnqBUKBoikV4VQ4XVmM2CEMEFM3irDee4G840dnURz9F8n+btHOpyDtUP8cIsQoo
61KNLC0+Jc8tUqlc4iDJTS6Dbc961t6U1fo0tcZbkCh8xi6iO6HmFMKJkA9eN+hU
C+NLGZFCXEODxH/b6/jLQkqIrvKJWFllIlZTYam41YbjoSKm4IMsg6UvYoAoO/PQ
XDTOAp8r9xQlI/wwt1IACrgmG8eDO6DOnEdRRC5EmIbfeTkmq/zQx+ylawoeeU4v
5V5rA7DyRC5RMrsgtAVF5Wotg9SOmEQ2GgTSVjNyMhSi1gyXk2k=
=fE1M
-----END PGP SIGNATURE-----

--vc7qj476uzdqvh2o--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
