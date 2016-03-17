From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/8] clk: bcm2835: add missing osc and per clocks
Date: Thu, 17 Mar 2016 10:19:19 -0700
Message-ID: <87twk5ja3s.fsf@eliezer.anholt.net>
References: <1456760642-2412-1-git-send-email-kernel@martin.sperl.org> <1456760642-2412-4-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1456760642-2412-4-git-send-email-kernel@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> Add definitions for the following clocks:
> * AVE0
> * DFT
> * GP0
> * GP1
> * GP2
> * PULSE
> * SLIM
> * SMI
> * TEC
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
> ---

> +	[BCM2835_CLOCK_DFT]	= REGISTER_PER_CLK(
> +		.name = "dft",
> +		.ctl_reg = CM_DFTCTL,
> +		.div_reg = CM_DFTDIV,
> +		.int_bits = 5,
> +		.frac_bits = 0),
> +	[BCM2835_CLOCK_DFT]	= REGISTER_PER_CLK(
> +		.name = "dpi",
> +		.ctl_reg = CM_DPICTL,
> +		.div_reg = CM_DPIDIV,
> +		.int_bits = 4,
> +		.frac_bits = 8),

Oh, I see you've also doubled up the DFT definition here, when it seems
you meant to define DPI.  I've added a DPI enum value to fix it.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW6ucXAAoJELXWKTbR/J7o1EsP+wcwNNHYiE8UMdtI0QNsqBgn
Af5gAxinKV33OHwciZ5EgwSdBBH84hgpJe7lI4QGscMve843ltmqa6SLWW/4i/k0
MDMlfu3xZWC2gUEDopbQHmM1hFz1guQZcuJ/rrF6ZsuoK2jmn/FPTqkJHq71nMmV
ntgMEEGozEWU11xxwX3Ttq5x2vO2DQaBD+OjfWAlGu24+A5uDpPZbLPE21kPes/f
xShC8OS8nSiG+kSo+sywczxWIwrK32wib7ZvWxeCNAab6dx+PWVu3rkmHgcvwAoH
cGKQV0HF6jzbUUXlrvA83Qi/ZfQl0lZd85NRuGzQFhPhUViODnwnuroWK5OX7Okt
S4XYcdgx6EowhHr/STeX/WxFQiVZdFVVrc/GjMW5hoVHoGLoAepO4CgUM/1jGZaT
mA1X0c5fEIrvi+XpKP4S0Y3OVGILtoGHHEOth61pTgrY/o6jVvBnZtqR9AvkpL5t
2LNSF88KMADcbNOcMkKGwbVDi1zCVeRZlgeyi/G5jpQUAjSPojCV2GYEchBqimqE
WsQfEXNMIC7jSW5/Iywi+JuI4801GO3T50u4cPH8ra7ycI7/Evdsadqhl7BeoSQ1
ACJbFQYqx0rk3THh+dYimxiALJTvTeEMd2COwM2JnDegO3dLZkn2HSInh7meZ3iw
7n5UByawxE478tZll2YY
=CqSU
-----END PGP SIGNATURE-----
--=-=-=--
