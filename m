From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: Add panel-timing subnode to
 simple-panel
Date: Sat, 29 Jun 2019 01:47:47 +0200
Message-ID: <20190628234747.GA1189@mithrandir>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0352765055=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190401171724.215780-2-dianders@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <seanpaul@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>, Enric =?utf-8?B?QmFsbGV0YsOy?= <enric.balletbo@collabora.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org
List-Id: devicetree@vger.kernel.org


--===============0352765055==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 10:17:18AM -0700, Douglas Anderson wrote:
> From: Sean Paul <seanpaul@chromium.org>
>=20
> This patch adds a new subnode to simple-panel allowing us to override
> the typical timing expressed in the panel's display_timing.
>=20
> Changes in v2:
>  - Split out the binding into a new patch (Rob)
>  - display-timings is a new section (Rob)
>  - Use the full display-timings subnode instead of picking the timing
>    out (Rob/Thierry)
> Changes in v3:
>  - Go back to using the timing subnode directly, but rename to
>    panel-timing (Rob)
> Changes in v4:
>  - Simplify desc. for when override should be used (Thierry/Laurent)
>  - Removed Rob H review since it's been a year and wording changed
> Changes in v5:
>  - Removed bit about OS may ignore (Rob/Ezequiel)
>=20
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  .../bindings/display/panel/simple-panel.txt   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)

Sorry for taking so long to get back to this, sounds good to me:

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Wpx0ACgkQ3SOs138+
s6FkAA//dq1vkl6yNj7/hlMzdjFe9maoEW7fwyt9MG/kUuV2+7K/iB2hj9M9DaKS
36rSIataHUoMbKAZprhPFKpa4Ux0KVuFcld+pU/GfvX1ux+omwfYZioEtkacrlFa
FVpTSbqsQm/A1a6jTK/44si7bTgnG3AiJ7Nz+7+VBEn0Fsf+Hua9GUbwMHCPz1lb
fRuJXIEGj6s9ZnCd/2YevxcrAscypxSeU5kAePyZF2i7bdeta2TR7655vYQkdqOb
nNFz+2R53UC5P4K9ekNZPue3QivyLjyN9M+OCmf+uSkdCK2RLF/lGKDtzcxtbMJF
FK4bsJRqF0icbG7bQucnIIIf5zgUFWuURWyzciqEa0TjnkqIy4Ugdw7iUY6MERlE
fn2u1wJAjWuztuyl9FSOgBs86zFvlnW79FkX7q4Db4BZSU1c7Vld08Cw0/scsuuW
fwJMzZSf/vSshfuJrXRo8wB+YsU7WgY0Y6v7IYx+5r3gvxKAGy02i/rjvPRb+e9c
0kvQKZqBYPxZDv3xkWZHLD4fZo5vkluDnxxTU/6omXTRCsqIAS26XZ8jlXE5fcHk
0hfy2HaCXhG7ckpQusum9uasjhcpQg3QKxul3oqM2iD1XvJIwcBwJq15pMvUm5w3
Qqm5DatatB3t0U+G84KTeIEzFIBNjeLY0kNjTOa0Ke9GRDyGoEU=
=lrYn
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

--===============0352765055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0352765055==--
