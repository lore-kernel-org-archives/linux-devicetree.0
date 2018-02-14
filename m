From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Wed, 14 Feb 2018 07:05:47 +0100
Message-ID: <20180214060547.bf6upib2mbgoexas@katana>
References: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tfe42vr6wdjrzf5u"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org


--tfe42vr6wdjrzf5u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +	chosen {
> +		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
> +		stdout-path = "serial0:38400n8";

Hmm, that would be our first board to not have 115200, or? We already
have some other boards upstream where UBoot has 38400 and Linux 115200.
I'd prefer consistency here a little, but no strong opinion and asking
for other opinions.


> +	vcc_sdhi0: regulator-vcc-sdhi0 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "SDHI0 Vcc";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&gpio5 24 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};

Just double checking: No 1.8V for SDR50/104?


--tfe42vr6wdjrzf5u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqD0boACgkQFA3kzBSg
KbY+WhAAnjqAroQBHObE2Jp1a79suXhYcgrESbuJ/Jk3A3iuqOpGBKRxUoL7rECg
y5TKMAhJ0xE/3GjOe9axAKwhH9dWS/i+9SwBOBKnO0Qn12282mMBXRIGDxzgxN5O
tAuIpGjMjR1bHuInTbz5GiKfZxDPCktLk/K09E6TlBL0gMDqgXaf9zFJ+amst3Nh
8kBvuqcXfLIMPxVAP/mYry9zF3srMep0wLk1t5S6xNBAQ/TQhjD0ON6dZJieaKM0
0qYJM8bOwuGZPu3nQXs67dJy0LGVKTXUoR5CKPcDV9EWirqFNgKJOxTrXnSIWkKP
mx4/A6nL7FDWkqEVndYPp+ZQwaCTkLREFfz+Tom6YWemFJe1hpAVszc80JVMXYRX
4c6b/6nHeyxsRO+Hw2g68yMS/pz62WBGo0kKoN+XBhw+c9ivpp0Mhka6gWYgQz0d
II7zP8/deft+vxdtsnPwarNQLTuAEp8TxTEStR8uy0ioLLE2Q+l4Glz5eHYanKFj
G4ihL717ZO6C3tJ+imKuom8keWzjWQovv9hWrTT0QNlhfSb7UIbr9DRB7tG7SKQf
bHWkIU9CGqztaoYL907xuGqBBJUxkDuz8VtZgzDAouRlwTuPTyDKV68MR2WI+o7h
wxpCNzKozWpw0BLG4CvvhmIvkERMSJbE5Tf8vSkUPW4mOasvGlI=
=TK5M
-----END PGP SIGNATURE-----

--tfe42vr6wdjrzf5u--
