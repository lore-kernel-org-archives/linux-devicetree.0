From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Add Sharp LS043T1LE01 panel binding
 documentation
Date: Fri, 30 Oct 2015 18:24:55 +0100
Message-ID: <20151030172455.GA17183@ulmo.nvidia.com>
References: <1438133861-22370-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438133861-22370-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Werner Johansson <werner.johansson@sonymobile.com>
List-Id: devicetree@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2015 at 06:37:40PM -0700, Bjorn Andersson wrote:
> From: Werner Johansson <werner.johansson@sonymobile.com>
>=20
> Signed-off-by: Werner Johansson <werner.johansson@sonymobile.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>  .../bindings/panel/sharp,ls043t1le01.txt           | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/sharp,ls043t1=
le01.txt
>=20
> diff --git a/Documentation/devicetree/bindings/panel/sharp,ls043t1le01.tx=
t b/Documentation/devicetree/bindings/panel/sharp,ls043t1le01.txt
> new file mode 100644
> index 000000000000..758d48d33e46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/sharp,ls043t1le01.txt
> @@ -0,0 +1,22 @@
> +Sharp Microelectronics 4.3" qHD TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "sharp,ls043t1le01-qhd-vid"

The -vid suffix needs to go away, otherwise the binding looks good to
me.

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWM6fkAAoJEN0jrNd/PrOhvAsP/1RJPOoWUmguagUJxsDwu/9g
KwmKYRkzPuO5xNkW4HDA3PDQvHKKlJ49GS8BX6Epv/CxdngoDaD6949CP+P5qF1g
fhrhf8y51eLznB/qwKPBp789fFwam2EBL35icEV6q3zY0BOVC9DPLa2hZX4z96vO
jpBa+XFFN1HlwOOD8FYrnX9GnzzawVvB2ZmjvGdqjxz6xLhY0GoazBqTNSjLMv58
lQEHj+24srgb2/+jPQiW6jPIslcbqZ5dm/IRPxDJrdBX03aHFm3Jo3C1mG8fSXvH
etRRhbYO6Pj15Kv1wbZmvCPORV9P6KpgGhKbzXc6OmTh0z2KyfaxezVcxxD/0Ho9
Ttggbj5tKmNYppXHoXS/J40kGsvYjxYqcy6L0HKiMeKehDxeH3BdA3j6X1hfbovA
g6DfwPZrhQkbEKak0GJmnwpKKDVd69M9lh5MqjQ3uGEKvbWMdu8Kow+az8qGlwEg
jX3nFj6JV5bbm+c2c0TmP+WQSQ0s80oUswDQ7DW0N+5esI/hd08Vt3EmNSQpyfXk
4Hrqsqs3Wp2CZqoWoBI0ZXzw+LXaZFRcFCrd8kcKnqAM368AqPx4PdA3MNa/Hr1r
ea+nCbDRK0mICkAXnCZkOWpvrYlu5k9LXYzarV5f1d0n1jKn4ALlL6YKjF8gwSub
1QUX7jHkTzCezE1JRQhj
=3t2g
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
