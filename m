From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/6] drm/panel: simple: Add mode support to devicetree
Date: Mon, 12 Mar 2018 09:35:08 +0100
Message-ID: <20180312083508.GG23060@ulmo>
References: <20180208174855.55620-1-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0637515178=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180208174855.55620-1-seanpaul@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-Id: devicetree@vger.kernel.org


--===============0637515178==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Content-Disposition: inline


--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 08, 2018 at 12:48:47PM -0500, Sean Paul wrote:
> Hello!
>=20
> Here's v3 of the set. I've reintroduced the single display timing node
> in the dt binding from v1, and left the improved docs and patch split
> from v2. I've also added a patch to clarify that a single display timing
> node should always be named panel-timing, which was feedback from v1.
>=20
> Cover letter from v1 (was the same in v2) is here:
> https://lists.freedesktop.org/archives/dri-devel/2018-February/164886.html
>=20
> Thanks for the reviews so far,
>=20
> Sean
>=20
>=20
> Sean Paul (6):
>   dt-bindings: Clarify timing subnode use as panel-timing
>   dt-bindings: Add headings to simple-panel bindings
>   dt-bindings: Add panel-timing subnode to simple-panel
>   drm/panel: simple: Add ability to override typical timing
>   drm/panel: simple: Use display_timing for lq123p1jx31
>   arm64: dts: rockchip: Specify override mode for kevin panel
>=20
>  .../bindings/display/panel/display-timing.txt      |  5 ++
>  .../bindings/display/panel/simple-panel.txt        | 34 ++++++++
>  arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  | 14 ++++
>  drivers/gpu/drm/panel/panel-simple.c               | 94 ++++++++++++++++=
++----
>  4 files changed, 132 insertions(+), 15 deletions(-)

I've applied patches 1, 2 and 5 of the series, 3 and 4 had comments and
6 will need to go through the Rockchip tree.

Thierry

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqmO7kACgkQ3SOs138+
s6GNaQ/+KExPzrDIOtSeVBQUpZgLqAss7b5TkdE+d9uJ19GJWNPYzvpf0WwDg4DW
r2YIShadalmD3Z85qQpi4RaydU0V9wlw6CKPSF3PZ8fgWom78ceKjmQfVSQmLZaf
9wPInSOmNdQIDFoM9eCOcE8Y6B1XGHZEzD4gqbuJhO/JkDjTXEaHumFW9V2yfBis
s4Op/dJbRLD5SK6NU3EY4mj6JmtLTpi3elEDF03y8fohw6s0Gwb2eG4aXFmU9lUc
L/UjS1cPlb2XKwn3oMnewj/zGoCL5ADfYJ9R6dxVOkquh1iPYCQk1xwxsTvgJKEK
946/9dfowKB0mL+5vJ4JcXTY8DDph7okxnOvrY75kas15SncNuecp5cNVQtoCTMd
bXiWinbp4HfWNCOkgNfiJMsfmIqAc0O9R2Nqaxxkh+RlEvzscR+IW4ytoxzg+/2M
lmIkq0aT76WZU8OE5zF/aMi6ac5LLhxSw/Gc6xMmf5BMHfX42oIJoF0zt9J63OWH
jz4r4ZUJjOfwd9pjzHm706TH8SeXBp6jQsYp3Z37w9oaF2viO5nQaz9JkHo8FuvZ
8hSs0pkwbKtl/agwaPZ/CuLuvf69DhSGzM+VMMZc/EbFWSKNN4I00d4G+YBd3mL6
L49WuMUg1ER9nmVHuCW4+v7yj8rV36NuXnlPwh4XGClnaR3UCW0=
=PmFI
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--

--===============0637515178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0637515178==--
