From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [RESEND PATCH 0/2] Add bluetooth support for Orange Pi 3
Date: Tue, 8 Oct 2019 07:58:10 +0200
Message-ID: <20191008055810.wqkmoy63ujiagbfe@gilmour>
References: <20191007203152.3889947-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ert3szapvjumxzbc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191007203152.3889947-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: megous@megous.com
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--ert3szapvjumxzbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 07, 2019 at 10:31:50PM +0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
>
> (Re-send for Maxime, with already applied patches dropped. Nothing new.)
>
> This series implements bluetooth support for Xunlong Orange Pi 3 board.
>
> The board uses AP6256 WiFi/BT 5.0 chip.
>
> Summary of changes:
>
> - add more delay to let initialize the chip
> - let the kernel detect firmware file path
> - add new compatible and update dt-bindings
> - update Orange Pi 3 / H6 DTS
>
> Please take a look.

Applied both, thanks!
Maxime

--ert3szapvjumxzbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZwlcQAKCRDj7w1vZxhR
xfZYAP9SMxqaZn19ntY7023We3X+5/xContSlxTodlVbXkTQCQEAghM2VObtw49u
Q9P7kQeTJcnIsIbJNFymmtSCVdx+sA0=
=ZikW
-----END PGP SIGNATURE-----

--ert3szapvjumxzbc--
