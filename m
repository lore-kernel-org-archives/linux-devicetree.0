From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 2/8] ARM: sunxi: Split out the various
 machines into separate files
Date: Wed, 23 Apr 2014 15:28:29 +0200
Message-ID: <20140423132829.GT24905@lukather>
References: <1397724379-15398-1-git-send-email-maxime.ripard@free-electrons.com>
 <1397724379-15398-3-git-send-email-maxime.ripard@free-electrons.com>
 <201404231433.51129.arnd@arndb.de>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kG2acDqmwoBDcCHP"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBW4A36NAKGQEEKT473I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201404231433.51129.arnd-r2nGTMty4D4@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kG2acDqmwoBDcCHP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 02:33:50PM +0200, Arnd Bergmann wrote:
> On Thursday 17 April 2014, Maxime Ripard wrote:
> > This will allow to add per-SoC hooks more easily.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  arch/arm/mach-sunxi/Makefile  |   6 +-
> >  arch/arm/mach-sunxi/restart.c | 104 +++++++++++++++++++++++++++
> >  arch/arm/mach-sunxi/restart.h |  20 ++++++
> >  arch/arm/mach-sunxi/sun4i.c   |  36 ++++++++++
> >  arch/arm/mach-sunxi/sun5i.c   |  37 ++++++++++
> >  arch/arm/mach-sunxi/sun6i.c   |  49 +++++++++++++
> >  arch/arm/mach-sunxi/sun7i.c   |  36 ++++++++++
> >  arch/arm/mach-sunxi/sunxi.c   | 164 ----------------------------------=
--------
> >  8 files changed, 287 insertions(+), 165 deletions(-)
>=20
> This doesn't look like a move in the right direction, and I don't see
> the connection with the DMA driver.

This is actually not adding any code at all, just reorganizing it.

This was also something that would allow to have per-family
configuration options, and hence not select drivers like the pinctrl
one that are pretty huge if they're not needed.

>=20
> > diff --git a/arch/arm/mach-sunxi/restart.c b/arch/arm/mach-sunxi/restar=
t.c
> > new file mode 100644
> > index 000000000000..3b89727ee943
> > --- /dev/null
> > +++ b/arch/arm/mach-sunxi/restart.c
>=20
> Splitting out the restart code is good, but please complete this by
> moving it into a driver directory. My preferred location would be
> within the watchdog driver, since it's really the same registers.
> You can turn on the watchdog driver as built-in in the defconfig.
> While it's not ideal that you can end up without a restart function
> if the driver does not get loaded, I would still prefer that over
> having the driver in the mach-sunxi directory.

Ok. The thing is, we don't have any watchdog driver for the A31 for
the moment, so the restart code will have to stay there. But I can
totally do that for the A10/A20.

> An alternative would be to move the restart code into
> drivers/power/reset.

That would be a good place for the A31 code then.

> > diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
> > deleted file mode 100644
> > index 460b5a4962ef..000000000000
> > --- a/arch/arm/mach-sunxi/sunxi.c
>=20
> Instead of splitting up this file, I think it would be better to
> reduce the number of special hacks required per machine. Note that
> for arm64 we require platforms not to have any code outside of
> the drivers directory, and I'd like to get to the same situation
> for much of arch/arm/mach-* as well.

I think it's fair.

How would you enforce default clock parenting and/or rate then?

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--kG2acDqmwoBDcCHP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTV7/9AAoJEBx+YmzsjxAgaKkQAJ5qi3RAbQ4C7M4aJA3J+bcR
wqk18xstNaZ6N/CF/kgrTGzyUYSjJXAQcGOt44xQZIKPgt7h/f6uHwhxl/1RAfAp
IAHJr9On7jtsoQZdtyunf8BNm5yuN2q1dbSJG+D4TJmBfFGsoxsq35Um7jLrYzSi
30Mtft2amrWJMwpTbUW0Jh5Cmwq+RMLzsmHxtT4XrH5NZSgxMSTRPEwl/vOM5Z3R
N5P4x9E8RzhJKsHx3zKHuieut45S1+vhfcuCVitJt+qNKPXQVpSTCGj60Eg1q5CH
bQDuVsoSSux1J3i3u6Xde4iR5mUIJiibya/txZ7HouwZ5j6PFY9bCrx4VBWYc5/R
n4fGxXLaodHx4ghfhNwGAPkXAYExxVeNbxqI5G4NB3B+s3U0328swRpt2nPEWQIq
E17oAvLtELzsYTqKHypMo1mKGvAIWRVTHpRCefMvWXd0IxzhyH5+kbBHb/F/jlhd
AXGK6Ljq5Br1wuiN9jRxAH50XE543yggk/HFYgGnnfYhbz/QSc7GTTNDyExtJJAf
e+3Rju9StkhIffkxDG0dcyjlYb63uj+IbC8IAjiu2mjxV+P6l9KQXqbyYgRqrIEe
Rdx1SSDxtgDEDFYuIZRQmuuZFtz/JH18tZBeDUaSUu1fqBxpQwncbpI4eyQD6nnV
JmQJbsgPx8u18+kPYwY7
=LuIR
-----END PGP SIGNATURE-----

--kG2acDqmwoBDcCHP--
