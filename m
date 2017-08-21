From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH  2/3] ARM: dts: iwg20m: Enable SDHI0 controller
Date: Mon, 21 Aug 2017 10:28:42 +0200
Message-ID: <20170821082842.GB2418@katana>
References: <1502711389-16040-1-git-send-email-biju.das@bp.renesas.com>
 <1502711389-16040-3-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502711389-16040-3-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +
> +&sdhi0 {
> +	pinctrl-0 = <&sdhi0_pins>;
> +	pinctrl-names = "default";
> +
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&reg_3p3v>;
> +	cd-gpios = <&gpio7 11 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};

Just to make sure: No 1.8V and UHS support (SDR50/104)? Or is this to be
tested and added later?


--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmamboACgkQFA3kzBSg
KbZW1w//Y20D0mKIKOIxC1oYFcB2pEitTHKsa36oaK5BFswsGhMcdx1qc4B3Ly8Z
PwHTYSQLxImdHCoyNN/NlVqCsai4D+zFJN2lXuDlcb4HFCGDFT07SqANJNLo+f6p
LmVwqVY8fV8YjhoaMDIfg5KW/THr3jAsSabXh7xqNhiDLrWfOZAEdO03OiLodLxa
gk9HsIDeCx8ozS02GbcFmVVL3KsHngspSQGQzK5riwICy4r/LLYgmjIYes4hTXOi
AkijerGI5anHHP6FK6bVXoCqLr9Qy7v419ukn/st10Dl8NL+fP6dwM4efoAcIKlb
XEzamueQAKLrleDfdBa/ZiK5pPSxRrgFDc1Mk6F89xNxC5O8bpgRB5jNK8eZjm/b
XkN/lX5yy2hCd/yZbnR/cifi1ZXG6rEaX1LN3oSReE5bF4VgtIS8gRLifjRhm2qG
IkIPDIXbRFEw47tfaRRf1OPatUE3zWsHaA0pgZXXzvZ02HMJQbTvfJhy42eVFJU0
PAZtA+rkrQmm/2Zx4sPOxyMcpgMeVXETlLAUd1PHK9YWaB2TIIAKcuvA4mKNjOa8
wXJ9bP+XAevsjG0gtzFx32PM9/vQo0JAxLs7Cf36xRQrLahjgokLL4qv2zJLCxFQ
AOj9b1h8TcWLCj30UtW3YoOUujoj6Uxy13jFYB/c18wnqg/+u0k=
=Zae7
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
