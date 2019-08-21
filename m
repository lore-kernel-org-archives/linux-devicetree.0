From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
Date: Wed, 21 Aug 2019 09:31:54 +0200
Message-ID: <20190821073154.jnqv4sysoyorv7vo@flea>
References: <20190820195959.6126-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ye7watdg3ithuyxt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820195959.6126-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ye7watdg3ithuyxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Tue, Aug 20, 2019 at 02:59:56PM -0500, Rob Herring wrote:
> This series converts the various Arm Mali GPU bindings to use the DT
> schema format.
>
> The Midgard and Bifrost bindings generate warnings on 'interrupt-names'
> because there's all different ordering. The Utgard binding generates
> warnings on Rockchip platforms because 'clock-names' order is reversed.

Thank for taking care of that one, it was on my radar but I didn't
really want to actually do it :)

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ye7watdg3ithuyxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVzzagAKCRDj7w1vZxhR
xeOoAP0fDHwGDG+Pp7I7jUWueHcugddYVgoBEitC7+EXWXCGywD/cyBgtgtPE19N
g0eZSCfigQtpIBBde4Gqm9+94pYLnwI=
=UmRS
-----END PGP SIGNATURE-----

--ye7watdg3ithuyxt--
