From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Add support for the otm8009a dsi panel
Date: Fri, 18 Aug 2017 16:02:38 +0200
Message-ID: <20170818140238.GB28143@ulmo>
References: <1500297593-30633-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500297593-30633-1-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2017 at 03:19:50PM +0200, Philippe CORNU wrote:
> Version 3:
> - panel-orisetech-otm8009a.c: Remove a FIXME (Andrzej Hajda)
> - panel/Makefile & Kconfig: Alphabetical order (Andrzej Hajda)
>=20
> Version 2:
> - panel-orisetech-otm8009a.c: Add Manufacturer Command Set defines,
>   add new macro for handling address shifting, improve reset
>   sequence, use more mipi dcs helpers (Andrzej Hajda)
> - dt-bindings/display/panel/orisetech,otm8009a.txt: Fix reset gpio
>   active level in the example (Andrzej Hajda), Add an "Optional
>   Properties" section (Rob Herring).
>=20
> Version 1:
> - Initial commit
>=20
> The purpose of this patch is to add support for the Orise Tech
> otm8009a 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode).
> This LCD panel is used in several STM32 boards.
>=20
> Philippe CORNU (3):
>   dt-bindings: Add vendor prefix for Orise Technology
>   dt-bindings: display: panel: Add support for Orise Tech otm8009a dsi
>     panel
>   drm/panel: Add support for otm8009a panel driver
>=20
>  .../bindings/display/panel/orisetech,otm8009a.txt  |  21 +
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/gpu/drm/panel/Kconfig                      |   9 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   | 491 +++++++++++++++=
++++++
>  5 files changed, 523 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/orise=
tech,otm8009a.txt
>  create mode 100755 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c

Series applied to drm-misc-next, thanks.

Thierry

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmW83kACgkQ3SOs138+
s6HNGA//aeCH4rWnTRSpM97XcD9q6yUGoq3vSwa7/3nf8nbp1U3YD54uljlimioP
WWbl0ygl+MaCKKTtbA98YYL63iPhHRRCjv6wy7XANAGi/BA/bErDZ6ynzbcVShkb
AoQNXs36XNYk/KbDkRsWgYRrpRYAqymRxRuCTFMGLAAIxRQQ5QZq9x0yyCh96Z5L
fseQRto/rXI8BVKgAfBvA/ASRVVrP0msVVWdgUmrZ1e6xSbecdp7VtJxm+tURVjM
Kf+LM9qkmRteHTteq0f/yK4djdytF99FeWNWZ+SYZwi5jtqJqAME0GFofir8mINx
keX1ODwjAUO4BNetOzBPx/HMxOKGvnxfNu7vbYuD1I55bJi5q9KhO2iGNiqJOF+G
wHlSVSDQNlKtVZV2bhI5PiDeoCgeqG5OFyLS7pf/hF4Jq0KUUeG+uOwiN2tMmdAJ
uelGO/PucSXgPmG09DLcneQ64GKmUCzB5w3W96DNk6yL5hYTHZOSTlfzyLwkpQCu
GsFZW1vJg4LWE0aGQDyFl3YuxJrAkpGw5W/DGKJHUTUZDqynDiSraGam334ip+pX
63ErPTB7zqd9mSd63jo3PF+CSDBPmSxPbeVE9gPoqjokAsPdG3pWw1v3ZYxC6/ai
t708AVUfgr8x4PRWO5yGZ3fQT/tAX5TFF1uRQav5C8Y9ZzPBhjg=
=GRdh
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
