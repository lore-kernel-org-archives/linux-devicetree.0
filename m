From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: Clarify timing subnode use as
 panel-timing
Date: Mon, 19 Feb 2018 15:59:33 +0100
Message-ID: <20180219145933.GL11455@ulmo>
References: <20180208174855.55620-1-seanpaul@chromium.org>
 <20180208174855.55620-2-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0434547176=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180208174855.55620-2-seanpaul@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-Id: devicetree@vger.kernel.org


--===============0434547176==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Swj79WlilW4BQYVz"
Content-Disposition: inline


--Swj79WlilW4BQYVz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 08, 2018 at 12:48:48PM -0500, Sean Paul wrote:
> Add a note in the documentation explaining when it's appropriate to use
> the display-timings subnode on its own, as well as the preferred name to
> use (panel-timing).

panel-timing seems rather redundant, but I guess that's the de facto
standard, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--Swj79WlilW4BQYVz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK5lUACgkQ3SOs138+
s6Fq1xAApels5m4VvPRbJzkGf6k07e8urhqjpucf55zP7cccqWI1yfkk9P4ujTXF
X5UOfKrHlBFtDstAJtrkhVcT9FMBi9HSv4AJcO1SdspTZR3C8LjDFT+suY1WevNK
B5BY+Tjp7aGflj8flNqA1TerhFgvpQyhbctdWEljcPck4XJ/cG6i3fuSPxqbw/NQ
BZ7xLRiQSgNhcnBzR/LD1JnhsWcxs74hdmJDuAnqw9K+3LNLJJimvfeNXzOeym80
dM6tXG1/A6y61ru8Fd9hssvYvj500CVmAhkN7DH27AeV7iVBCyI+Fz3WDhuPg8HP
4HS7y207jHUQdLOlkiNh0YPtHQtunOvkcLy5MG1u6RmRp+zFZ/jbMUh08Y4qkxMQ
5enufVyj1RY1g/tCEYJAeEvoKZCc3lDNiA2xppKfA68wJf8wBsfb3HhzoPFvJlPq
LdN+8t/W3fwWPihNiVKeo0Iukv70LNSZVCDdihVI1tJXeokb8860vWCZt2fVBfnB
Fy/msaNXWk0ehhstj6AWdJh90XbIlWJ+No0fvD2mDihcsGOMZcJPxp/MPQjnCS1F
HebwdinuSsRx8zrY2wA93WDvkiaGmkjd/xcC3tze/W5Fbk7X6GuOoSckTr3umq5J
9QdNr3VyG+uPed0LwiB53BtG2vqy9lU6keav6Rn4QNr7FeOSgI8=
=6Pqs
-----END PGP SIGNATURE-----

--Swj79WlilW4BQYVz--

--===============0434547176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0434547176==--
