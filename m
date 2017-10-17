From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/9] drm/panel: simple: add support for overriding the
 pixel clock polarity
Date: Tue, 17 Oct 2017 14:45:04 +0200
Message-ID: <20171017124504.GC27983@ulmo>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
 <1507721021-28174-5-git-send-email-LW@KARO-electronics.de>
 <20171017121422.GE684@ulmo>
 <20171017142507.127f1711@karo-electronics.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2133707754=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171017142507.127f1711@karo-electronics.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============2133707754==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 02:25:07PM +0200, Lothar Wa=C3=9Fmann wrote:
> Hi,
>=20
> On Tue, 17 Oct 2017 14:14:22 +0200 Thierry Reding wrote:
> > On Wed, Oct 11, 2017 at 01:23:36PM +0200, Lothar Wa=C3=9Fmann wrote:
> > > The Ka-Ro electronics MB7 baseboard has an on-board LCD->LVDS
> > > converter that requires a fixed pixelclk polarity, no matter what the
> > > panel's display_mode specifies. Add an option to override the pixelclk
> > > polarity defined in the panel's display_mode via DTB.
> >=20
> > I'd argue that the LCD->LVDS converter should be modelled specifically
> > in DT to handle this case. It could be a implemented as a DRM bridge
> > driver, for example.
> >=20
> IMO that's just overkill for a simple chip that is in no way
> configurable nor detectable by software.

I suspect that you're not the only one who runs a board that has this
kind of quirk. If we solve this in a generic way we can point people in
that direction when they come asking for such a quirk.

So this could be something very simple that's instantiated using maybe a
couple of lines of code.

Thierry

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl+1AACgkQ3SOs138+
s6FwkQ//dt3bkw3sPxIQXSgPejIkGS5HXVSN+DztcbJUdw/HzkcS/cUP2f6Rmvay
Lk7gyHpDrYdZ6QAkTbpvSI0DQBY9gukFLEtmCajxXp67xy7NkRYm2q4iRWn5Z96V
6Cb5HVF2ALmjSQdCcRM6oIjuC0ldvVoPQw1ZfcBR70MHT9+ooiSmZv+HCrm2PfMf
D5QCWfXt8iSrzsrB21Gr7OrT0N07VKvWhqkgrB7E7uzdXmDD8CQKd+irjXrJba/P
AQnuljw2s2PLbKXjVUS60QUmOaOfKnMJLZr8MR+LYkgA73q7JgeBkYJhacrYhj+b
wI1qlEpssOReh9FS7fW3kab7qz+HLBCWk97Yz/GvHTU50CBi+yIZrhSh9N8hp8tk
LAZRexwagyQUdgJ/7jOwWcGofL7Hun48BBHjUqHcXkBFbu+7RtiOOGlAv3+Gf2iN
vQJlnnxpQwd1GD6GefeuYfbqbruzyxHNzfkmnZ9Qi+lauxYsZBcCpOXCRmuqycl4
EZezKM2c6qtni5ya/YA29hSw5pbqFuZ1ftzn2hDRxfbMMBWJ1gF9lx3a3cJf7pEv
znrYYUiMoF5Vu2SVZIAVG3QEhH7lP54/GOKXdQ15MXGHYhkqTPbt4zbswzqKgu3s
pMtdB1KnYJ+kTOZS+tqTUK6fPMBOs4OhGd4ZLwBK+E0gFeVmZXo=
=d6rv
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--

--===============2133707754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2133707754==--
