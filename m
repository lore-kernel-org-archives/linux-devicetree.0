From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: breaking DT compatibility (was: Re: [PATCH v4] clk: sunxi:
 Refactor A31 PLL6 so that it can be reused)
Date: Thu, 11 Feb 2016 11:00:48 +0100
Message-ID: <20160211100048.GK31506@lukather>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <56B4E2FB.3050703@arm.com>
 <56BB2D79.6090402@arm.com>
 <CABGGiswOKztmRT40w4t_7BD729WgM8ueLtOD-UF_wgMbmcg4cg@mail.gmail.com>
 <20160210143755.GE31506@lukather>
 <20160210163001.GG2632@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TBDBusIORirWKjWQ"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160210163001.GG2632@leverpostej>
Sender: linux-clk-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <rob.herring@linaro.org>, Andre Przywara <andre.przywara@arm.com>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jean-Francois Moine <moinejf@free.fr>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jens Kuske <jenskuske@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--TBDBusIORirWKjWQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2016 at 04:30:01PM +0000, Mark Rutland wrote:
> On Wed, Feb 10, 2016 at 03:37:55PM +0100, Maxime Ripard wrote:
> > Hi Rob,
> >=20
> > On Wed, Feb 10, 2016 at 07:42:02AM -0600, Rob Herring wrote:
> > > On Wed, Feb 10, 2016 at 6:30 AM, Andre Przywara <andre.przywara@arm.c=
om> wrote:
> > > > Hi,
> > > >
> > > > just a ping:
> > > >
> > > > Are we really OK with breaking existing DTs in 4.6? (per the code in
> > > > -next: f7d372ba54ea04d528a291b8dbe34716507bb60b, which is this patc=
h).
> > >=20
> > > I only warn and make sure people are aware of the issue. I leave that
> > > up to platform maintainers to decide. It depends on the maturity of
> > > the platform and users.
> >=20
> > The impacted SoCs support is really partial. For the most supported
> > one, big things like display or sound are totally missing, and we
> > still update them on a regular basis to add support for new
> > devices. As such, users are very likely to upgrade the DT from one
> > version to another just because there's new devices available to
> > them. And the newest SoC impacted just got introduced in 4.5, and only
> > has the UART and MMC devices available.
> >=20
> > > If people complain about it then it's their mess. For platforms
> > > supported in distros such as debian or fedora, I would strongly
> > > recommend against breaking compatibility.
> >=20
> > None of them are officially supported:
> > https://www.debian.org/releases/stable/armhf/ch02s01.html.en
> > https://fedoraproject.org/wiki/Architectures/ARM#Fedora_23
> >=20
> > Only the older one are, and they are not affected by this patch.
> >=20
> > > They do ship dtbs, but it's a chicken and egg problem. If dtbs were
> > > stable and provided by firmware, then they wouldn't have to provide
> > > them. If dtbs are unstable, then they have no choice.
> >=20
> > And while it might work great on platforms that have all the needed
> > documentation, or a perfect one, which is our case. Almost each
> > release, we discover that something is not working as it was
> > documented, when it was documented in the first place.
> >=20
> > It also seems that even on well documented platforms, supported by the
> > vendors, the stable ABI dream is not going to happen:
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/arm/Atmel/README#n105
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/devicetree/bindings/arm/marvell,berlin.txt#n4
>=20
> To be quite frank, I completely disagree with that stance.
>=20
> It seems like the only reason DT bindings aren't remaining stable is
> because people are deliberately ignoring the requirement and reasoning
> for doing so.

And for DT maintainers saying on multiple occasions that it's bad but
ok to break it and / or that they never actually said that it was a
stable ABI...

I'm guessing it could be a stable ABI if there was bindings
reviews. Rob actually started to review a significant amount of
bindings lately, and that's really appreciated, but if you don't
review all the bindings, then we're going to make mistakes.

> I agree that it can be painful, and that we cannot predict the future.
> There will always be bugs.

In our case, we can't even predict the present.

> Having code in mainline comes with responsibilities. One of those is to
> keep said code working for existing users. Otherwise, why bother having
> it in mainline at all?

None of our existing users ever complained.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--TBDBusIORirWKjWQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWvFvQAAoJEBx+YmzsjxAg4jEP/0/RlbX3ytS/+WtORVHtIfYg
SYYEc3i9hNySrpqJPHJSCpLbfe0irBp/DdikN+WYZR/1XyIw4UaGAubF6yn6BfoR
8BuyAsUFcq9cN5+1w6eP8G758XUHa2Q9wRFokjgqQi2SEbEIceXww8D9Ipw9g/uf
HKIqzWtDu5Eb9r3mMXlVJbQncf9145Q/Md7CGTNHNOj820vfD2mVAWuKHKIrvNhK
vCHGbpUh8xGcjFQJEGSlormDtFMwdk6GiuNbh1f42TrSwcoq8E0YuZljTzuHGU0N
eVxdyyPtgRSH4i+RlZ3i3Uts739LpoxRCMdU+wf0NeZ0CMTXKeJsfV11iyQ1G1WT
3B/ltriC0yn7kPfZwetuozqXfDctushrwK5b6AJ+UkTdOvKetjEb331RUsrIMx5C
Q1y1HVXR3LE8tx2CuJOjvKp9EeGMFF5bDWjk/Ohi4otFRBLfzl7hzOPeN0PG2xQP
Oh2MTcPS5prB2mtFF/Enzu2QdzIJbVS8CLaBt1G4QTdS1uV2q9rdcISQ2lZTSgps
c05qXErfx4yFZbSK+9WUiv5bb+dll0KTXbPyyPJ9R0KZwDaozSvjRnwJoaoDkeR5
urjCjw1p5j+knjNEGeKbtvtCNAOPACsr53it5leFXllzuP9Lo0g5cK2M4OhckPTM
LPeNVnpkfLTFJqdFBYDe
=cHIs
-----END PGP SIGNATURE-----

--TBDBusIORirWKjWQ--
