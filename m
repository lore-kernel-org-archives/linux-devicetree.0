From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 0/8] drm/sun4i: Allwinner MIPI-DSI support
Date: Fri, 13 Apr 2018 14:09:58 +0200
Message-ID: <20180413120958.vo4y34q36q2rjyej@flea>
References: <cover.a3617c4362eac8783f412525e52cf5552d19095d.1522835818.git-series.maxime.ripard@bootlin.com>
 <20180411124325.youvfpws27l2wesf@flea>
 <CAD6G_RRQrj9m=MPdjovEcwJV_fivCMAERSa49Mt0cKGFTicsxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1953861183=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD6G_RRQrj9m=MPdjovEcwJV_fivCMAERSa49Mt0cKGFTicsxA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jagan Teki <jagannadh.teki@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1953861183==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l5tw7h26mt4edepi"
Content-Disposition: inline


--l5tw7h26mt4edepi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2018 at 05:30:04PM +0530, Jagan Teki wrote:
> On Wed, Apr 11, 2018 at 6:13 PM, Maxime Ripard
> <maxime.ripard@bootlin.com> wrote:
> > On Wed, Apr 04, 2018 at 11:57:08AM +0200, Maxime Ripard wrote:
> >> Hi,
> >>
> >> Here is an preliminary version of the MIPI-DSI support for the Allwinn=
er
> >> SoCs.
> >>
> >> This controller can be found on a number of recent SoCs, such as the
> >> A31, A33 or the A64.
> >>
> >> Given the sparse documentation, there's a number of obscure areas, but
> >> the current implementation has been tested with a 4-lanes DSI panel on
> >> an A33.
> >>
> >> The support is a bit rough around the edges at the time, and some arti=
facts
> >> are still shown on the screen for some reasons. Wider testing with
> >> different display will hopefully nail those down.
> >>
> >> This needs the regmap_mmio_attach_clk, on its way to Linus in 4.17.
> >>
> >> Let me know what you think,
> >> Maxime
> >>
> >> Changes from v3:
> >>   - Rebased on top of current drm-misc-next
> >>   - Switched to SPDX license header
> >>   - Made the ECC array const
> >>   - Split the big DSI patch into two, one to add the DSI driver and on=
e to
> >>     add the TCON bits.
> >>   - Removed the dithering code
> >>   - Changed the DT labels to remove the indices
> >>   - Used sleeps instead of delays in the panel driver
> >>   - Used the backlight_enable / _disable functions
> >>   - Added Chen-Yu's Reviewed-by
> >>
> >> Changes from v2:
> >>   - Added a ports node under the DSI node
> >>   - Changed the huarui panel driver to an ili9881c driver
> >>   - Changed the panel vendor to bananapi
> >>   - Made the init table static in the panel driver
> >>   - Dropped the huarui vendor patch for the DT doc.
> >>
> >> Changes from v1:
> >>   - Rebased on 4.16-rc1
> >>   - Constified a few function arguments and structures
> >>   - Reworked the DT binding example a bit
> >>   - Reworked the panel driver to check for DSI return codes, and use D=
CS
> >>     helpers when possible
> >>
> >> Maxime Ripard (8):
> >>   drm/sun4i: tcon: Add TRI finish interrupt for vblank
> >>   dt-bindings: display: Add Allwinner MIPI-DSI bindings
> >>   drm/sun4i: Add Allwinner A31 MIPI-DSI controller support
> >>   drm/sun4i: Tie the DSI controller in the TCON
> >>   dt-bindings: panel: Add the Ilitek ILI9881c panel documentation
> >>   drm/panel: Add Ilitek ILI9881c panel driver
> >>   ARM: dts: sun8i: a33: Add the DSI-related nodes
> >>   [DO NOT MERGE] arm: dts: sun8i: bpi-m2m: Add DSI display
>=20
> I have reviewed most of the patches and reused for A64 all look fine
> to me (except the panel driver). May be my issue is not relevant to
> this thread, but I'm looking for help If I miss anything for A64 [1]
> and [2] are changes made for A64, the issue is kernel hang while
> loading sun6i_dsi.

My guess would be that you're not claiming the DE2 SRAM. See:
https://lkml.org/lkml/2018/3/16/1096

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--l5tw7h26mt4edepi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrQnhUACgkQ0rTAlCFN
r3Rw5g//bi5ItJEtn4do7/OcCUCHBlDJUzmIdCFKcllgCew6xphqE3OqPRWxDRSr
kC1zTNnG641CVZu3WGoXt2WB95fTuIuahHlXdg6S6y/MisoEHzsAbbzO687iSq4y
neNu8Lswn71WGxEW8fXGafnH/ksoKvE8axdC83BKwR9tThlGhbi+odLpX6JUnJJZ
wVnR2l88rwpqv2TXKabeOLlFqw+irVPw3vMuLmL4hvaLavj8MQkzpG8nmb50wz6b
LW6GKO1JkUEFE3HLnXYKJDGAvB+YmDlyQ6xfUpBSBaQERh4N39LysBWIFCCx5nBQ
JUeqPcbnWU3jKiU826tp+zvKeeRR1VOMQzL69mAfZzJjf3vuUuiJezwrdIstYS0H
/2Z8iKu2MieJFNuiQ2R0TdI60Jang7CVHRKXxUpg53WaPaIMCq6OI0ojOiCCmtJi
Co5XqPK2QFIV3oiFCBsCJHj2mmPICh1SPhTrKCFVSrEn4e2TgXVP/YA9ZIrEZzjd
9jwtrgzObNGPwCs72wwsdQaSNg5+uHlZc1x0GQs3hi2QtxRGIblnQ+KYDJAYEpNU
ucyPJ7xnAE5RwsZ/g8WbyimTkDJgtKyVGh+YERMcSceSkYjVe0xdfNOVhQOxLRMe
FiaZHroGDDNuRWXm/lPTg3qA/gzWUjg/yqX1cMjCyjMtC9nrBYI=
=Xru/
-----END PGP SIGNATURE-----

--l5tw7h26mt4edepi--

--===============1953861183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1953861183==--
