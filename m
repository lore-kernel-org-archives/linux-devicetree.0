Return-Path: <SRS0=GiHI=NR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from sauhun.de ([88.99.104.3]:49256 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729605AbeKFUWA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 6 Nov 2018 15:22:00 -0500
Date: Tue, 6 Nov 2018 11:57:17 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V2] arm64: dts: renesas: Switch eMMC bus to 1V8 on
 Salvator-X and ULCB
Message-ID: <20181106105717.bdrvfwbry4ci6pii@ninjato>
References: <20181104203707.20996-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mx4rgnv6d2hxdxx2"
Content-Disposition: inline
In-Reply-To: <20181104203707.20996-1-marek.vasut+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--mx4rgnv6d2hxdxx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 04, 2018 at 09:37:07PM +0100, Marek Vasut wrote:
> The eMMC card has two supplies, VCC and VCCQ. The VCC supplies the NAND
> array and the VCCQ supplies the bus. On Salvator-X and ULCB, the VCC is
> connected to 3.3V rail, while the VCCQ is connected to 1.8V rail. Adjust
> the pinmux to match the bus, which is always operating in 1.8V mode.
>=20
> While at it, deduplicate the pinmux entries, which are now the same for
> both default and UHS modes. We still need the two pinctrl entries to
> match the bindings though.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org

Tested on M3-N and H3 ES2.0 with HS400 enabled eMMC:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--mx4rgnv6d2hxdxx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvhc4kACgkQFA3kzBSg
KbZTGg//WcNEVcUCLlQuKOFp0/SwhPP+M7eOnYojxVagMBpy2jI6525tm4cN0irY
GAfjhRvfW8skWxU7Q6mwzIsYTSz8kkQ7kTJLaR2XqdCSbKcx48gBzpvd1+yyGgbo
BbwspIkQwXG+ZzdnKElCZXOxeL5zMrdfmPl+EKk4cB45r34hvfMDy+JSx+65MU01
rJjVvkfGhGUtWhPp+gRNKj0RGJSBePT9maQ8kkNK+wDEeL/vYCLTw95IvVQawuPQ
VXJc+ZOMpeErtuNFMVjVVcO+Z4v9948xKGbl99yNOhdzjEz68mku4F9YpmTLKPyp
+Zohtrzy/5pWgyrnEUJfu9PH3Ce2g1ksT3JG94WpBA93Jt8u2Eo0ADpZO1RnfezV
mQeUZ1QZbdyVLxM6xhIFYY/TZrH9baiLBeJ0W+AMojhGS5hjeELprINMNb5pI9iB
RiL+rcR9BV0cIQ8V8E8TK2DZO6GgUuiAPiVEi3riMv6CTFkmfMQf61K3ucqn9kwI
IaE5juqAtzWgKWu28+xnPSeumcR0CDwc0aFlRPTYxgwrHWK8albRdLUhi1Kg0Gbq
9e7KDjPZ5/6XknJ2ZIgJly6igtKEHmZNdyVJMP+Vqo1K3T9XxKGDQSjSB2DH98p9
N73wk/WRv58QIRuYWwG8aJor2OK9I1TDy5zNmt1HvECsHm5Q0kU=
=cYjh
-----END PGP SIGNATURE-----

--mx4rgnv6d2hxdxx2--
