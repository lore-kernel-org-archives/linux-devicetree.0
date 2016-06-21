From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 00/15] clk: sunxi: introduce "modern" clock support
Date: Tue, 21 Jun 2016 16:47:52 +0200
Message-ID: <20160621144752.GR26668@lukather>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
 <20160621114044.811e2136eca5c1d863d79ac6@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2370165447274819326=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160621114044.811e2136eca5c1d863d79ac6@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2370165447274819326==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="foM9DbudB2CcldhH"
Content-Disposition: inline


--foM9DbudB2CcldhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean-Francois,

On Tue, Jun 21, 2016 at 11:40:44AM +0200, Jean-Francois Moine wrote:
> On Tue,  7 Jun 2016 22:41:39 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > The current code has been tested on the H3 and an Orange Pi PC,
> > including making sure that MMC still works, so the general approach
> > seems ok.
> >=20
> > Let me know what you think,
>=20
> Hi Maxime,
>=20
> I used your code in both the H3 and A83T, and it worked fine for the
> current clocks.

I'm glad it works :)

Your reviews have been appreciated, I'll address them in my v3.

> But I had some problems with some features as the 'mode select' in the
> A83T MMC2 clock.
> Also, I think that you did not go far enough in the changes.

At some point, you also have to support what's used out there,
otherwise it just becomes an un-maintainable mess. Plus, it really
doesn't have to be perfect from day one, it just has to works as it
used to, we can always add more stuff later on.

At it works way better than what we had.

The question also is: is there anyone that we depend on using it
(mainline u-boot)? and is it something we need? If both answers are
no, then it's just dead code, which shouldn't be here in the first
place.

> For example, most clock gates as well as most resets could be removed
> from the DT and automatically set/de-asserted on clock prepare or clock
> enable.

No. The semantics are completely different between the bus gates, bus
resets and the module clocks. For example, the module clock can be
shut down while retaining the register state, while the gate clock
can't. And drivers are already using that semantic.

Some other problems arise from that as well: this would break the DT
ABI, and it deviates way too much from what the other SoCs are doing
(which is the whole reason for that rework in the first place).

> So, I am rewriting a generic sunxi clock driver into one file (about
> 1000 lines) and I have the full (simpler and clearer) description of
> the H3 and the A863T clocks.
>=20
> Coding is not finished yet. I will submit a RFC as soon as I will have
> something working.

Please don't. I don't want to waste any more time on this, this is way
overdue.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--foM9DbudB2CcldhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXaVOYAAoJEBx+YmzsjxAgshQP/3fDwNpRAYNfZJw3hQBG1m0O
FF87cnUSFtoxLiopwl1yRvgIIhpIynODVWbW7PlslRWfcrUWUTmPbXvCyC3mZhs4
I1/8NP+widO6AiUqkdEp5an6uGMyvxhMOznhJZ2tT3Hy690AG8+QpCCl27YXZyZh
GMm1EDiAyP0fb2Kyo0WEPKDpVsy1nJX7blzNyzj61fBV7uEh3Kat7s7C0qwx7Rip
TgWAbYH95Wdxp3j6nkqkCr83a8rCWRq7vwZUvpIgsFHXJS+aMDjEO0DGoniw0TD9
rTQWTHSMMNJwMSngAFPlDbHbFDsiQvkWQzB7zc6g4Lwkx1XUJS0hAcs0xmo/sKIA
NLaj5ttbS7Oqfy/oq/lqnDWoVotA2d66C792AQ6vMwH3jj0HaqJyI0XMsXe6DuuM
fum3HqScVUAFUiXO6XQT5EJ79ZOojBLQjG+Ktm1+/vXmT3G4mPgOCM4lBoaice/i
AIaxAOmKHSRFzrkfPA7cDjuyIIJMe1kS7fa/Z1XtINRdDt8CXCA3GaLvFA+yyprI
+gXK5COME9mjRTA9CixtuNsu5SGItj301yM9Xx71iJnFTZUsM4TyDaosfru5c7nQ
u7GshBDZ9t22DhrDAxzkRCI/yA1Nb68r1t3DYgGaH48Rjl4LkaxLh1yr922o2aJ9
6Smy2S6A6Rgc+Atn9fp2
=Kws3
-----END PGP SIGNATURE-----

--foM9DbudB2CcldhH--


--===============2370165447274819326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2370165447274819326==--
