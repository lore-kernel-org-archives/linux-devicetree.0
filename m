From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: breaking DT compatibility (was: Re: [PATCH v4] clk: sunxi:
 Refactor A31 PLL6 so that it can be reused)
Date: Thu, 11 Feb 2016 18:08:20 +0100
Message-ID: <20160211170820.GP31506@lukather>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <56B4E2FB.3050703@arm.com>
 <56BB2D79.6090402@arm.com>
 <CABGGiswOKztmRT40w4t_7BD729WgM8ueLtOD-UF_wgMbmcg4cg@mail.gmail.com>
 <20160210143755.GE31506@lukather>
 <20160210163001.GG2632@leverpostej>
 <20160211100048.GK31506@lukather>
 <20160211114410.GA32535@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vaHlF1o0eSLrKmNa"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160211114410.GA32535@leverpostej>
Sender: linux-clk-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <rob.herring@linaro.org>, Andre Przywara <andre.przywara@arm.com>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jean-Francois Moine <moinejf@free.fr>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jens Kuske <jenskuske@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--vaHlF1o0eSLrKmNa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2016 at 11:44:10AM +0000, Mark Rutland wrote:
> On Thu, Feb 11, 2016 at 11:00:48AM +0100, Maxime Ripard wrote:
> > On Wed, Feb 10, 2016 at 04:30:01PM +0000, Mark Rutland wrote:
> > > On Wed, Feb 10, 2016 at 03:37:55PM +0100, Maxime Ripard wrote:
> > > > Hi Rob,
> > > >=20
> > > > On Wed, Feb 10, 2016 at 07:42:02AM -0600, Rob Herring wrote:
> > > > > On Wed, Feb 10, 2016 at 6:30 AM, Andre Przywara <andre.przywara@a=
rm.com> wrote:
> > > > > > Hi,
> > > > > >
> > > > > > just a ping:
> > > > > >
> > > > > > Are we really OK with breaking existing DTs in 4.6? (per the co=
de in
> > > > > > -next: f7d372ba54ea04d528a291b8dbe34716507bb60b, which is this =
patch).
> > > > >=20
> > > > > I only warn and make sure people are aware of the issue. I leave =
that
> > > > > up to platform maintainers to decide. It depends on the maturity =
of
> > > > > the platform and users.
> > > >=20
> > > > The impacted SoCs support is really partial. For the most supported
> > > > one, big things like display or sound are totally missing, and we
> > > > still update them on a regular basis to add support for new
> > > > devices. As such, users are very likely to upgrade the DT from one
> > > > version to another just because there's new devices available to
> > > > them. And the newest SoC impacted just got introduced in 4.5, and o=
nly
> > > > has the UART and MMC devices available.
> > > >=20
> > > > > If people complain about it then it's their mess. For platforms
> > > > > supported in distros such as debian or fedora, I would strongly
> > > > > recommend against breaking compatibility.
> > > >=20
> > > > None of them are officially supported:
> > > > https://www.debian.org/releases/stable/armhf/ch02s01.html.en
> > > > https://fedoraproject.org/wiki/Architectures/ARM#Fedora_23
> > > >=20
> > > > Only the older one are, and they are not affected by this patch.
> > > >=20
> > > > > They do ship dtbs, but it's a chicken and egg problem. If dtbs we=
re
> > > > > stable and provided by firmware, then they wouldn't have to provi=
de
> > > > > them. If dtbs are unstable, then they have no choice.
> > > >=20
> > > > And while it might work great on platforms that have all the needed
> > > > documentation, or a perfect one, which is our case. Almost each
> > > > release, we discover that something is not working as it was
> > > > documented, when it was documented in the first place.
> > > >=20
> > > > It also seems that even on well documented platforms, supported by =
the
> > > > vendors, the stable ABI dream is not going to happen:
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/arm/Atmel/README#n105
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/devicetree/bindings/arm/marvell,berlin.txt#n4
> > >=20
> > > To be quite frank, I completely disagree with that stance.
> > >=20
> > > It seems like the only reason DT bindings aren't remaining stable is
> > > because people are deliberately ignoring the requirement and reasoning
> > > for doing so.
> >=20
> > And for DT maintainers saying on multiple occasions that it's bad but
> > ok to break it and / or that they never actually said that it was a
> > stable ABI...
>=20
> Evidently there is a communication failure. Generally, the statement has
> been that old DTBs should continue to work. That's even documented, as
> Andre pointed out:
>=20
> Documentation/devicetree/bindings/ABI.txt
>=20
> There are obviously shades of grey, and _rarely_ it might be necessary
> to deliberately break a binding. However, that should be the rare
> last-resort case, rather than a crutch for development.
>=20
> Saying "bad but ok" underplays the "bad" and overplays the "ok".

Not all of the DT maintainers have the same position I'm afraid.

> > I'm guessing it could be a stable ABI if there was bindings
> > reviews. Rob actually started to review a significant amount of
> > bindings lately, and that's really appreciated, but if you don't
> > review all the bindings, then we're going to make mistakes.
>=20
> I agree that it is unfortunate that we cannot provide the level of
> review that we want to.
>=20
> Mistakes will happen even with review; that doesn't necessitate removing
> support for a binding.

Yet they will be much more likely to be made if no review is made.

> > > I agree that it can be painful, and that we cannot predict the future.
> > > There will always be bugs.
> >=20
> > In our case, we can't even predict the present.
> >=20
> > > Having code in mainline comes with responsibilities. One of those is =
to
> > > keep said code working for existing users. Otherwise, why bother havi=
ng
> > > it in mainline at all?
> >=20
> > None of our existing users ever complained.
>=20
> I believe that in this case, Andre was complaining about this particular
> breakage, unless I have misunderstood.
>=20
> To be clear, I'm arguing for the strategy going forward. If no-one has
> complained about the stuff broken up to this point, let's not waste time
> restoring that.
>=20
> Going forward we need to keep old DTBs supported.

I find that stand a bit dishonest.

You, DT maintainers, admit that you're not doing your job properly,
and that burden relies on the platform maintainers? Or should I take
it as you volunteering to maintain that code?

But ok. Let's do that. Make sure that the other platform maintainers
are aware that this is the rule too though. I surely don't want to be
alone in that boat.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--vaHlF1o0eSLrKmNa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWvMAEAAoJEBx+YmzsjxAgB5wP/2klxhj5/HvK00ALQHo6pPL1
A/QR0/sv3ABBrH2SOdgrIVXViVSzsb4kXMSg+k3gtseptGPoO4Uaw3MR18fiGg66
nATNRXX7uPm5BvUg3QszbrTeCKyUkVwz9Dy8snxyXJzvq3JGhW+FC41WG3kOE68W
LcDnffzExWn6osmZ0m2voNMkRvbQmN+SEtfnnThLi6PJcGnfsVgNTIbLW5P4s9lm
igI5XhDRJ9sFOMnhzVbL3yJGsHIchtgb53FtWvB09yl1Mp2AxRNu2XU1ievB/p6q
/dgIpiFuuS6yBlA7FtrNbVGra94N1m/HTNBEBY4tfkSgKnbBrA1KnzixHWe0VcrA
OsiUPZ0MzgYdZ9xReZ1V4KeV+t/jlR8fV57eSEq93P19OHEMgFB4H/5JKidHM3Vn
TDblT3Y0tOKGrer/uhpFDvSxNo/M9DTYEzp2E3nriT3dLRZ3gfpMDxTArPgCLBzd
uCjseJcZmHkSjClRJnBLOzymWT9uySDrkv6vZfU6lf93OjoJRcL7qrFVtt2mmjpF
dMZ2rWKvd3PVxlh5h/WHn4x78ayIamnegGEDmMh85lOQ4Rh05NS+Zk6jCUARaCZZ
//btq2r8cdY3ZV/oLx9zRvVZBferkJjF5/qMVry+9oSd4I+Qshhc6uALWnMzNfV9
2PVovM5oQ+hGbRcAJOis
=VWT5
-----END PGP SIGNATURE-----

--vaHlF1o0eSLrKmNa--
