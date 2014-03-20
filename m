From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 7/8] ASoC: atmel: document clock properties of the wm8904
 driver
Date: Thu, 20 Mar 2014 13:47:44 +0000
Message-ID: <20140320134744.GF11706@sirena.org.uk>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com>
 <1395049541-28128-8-git-send-email-voice.shen@atmel.com>
 <20140317115518.GD11706@sirena.org.uk>
 <532931C3.4080909@atmel.com>
 <20140319102800.GW11706@sirena.org.uk>
 <532A5481.6000008@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="repgo6uzkDL7F6fU"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <532A5481.6000008@atmel.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bo Shen <voice.shen@atmel.com>
Cc: nicolas.ferre@atmel.com, Boris BREZILLON <b.brezillon@overkiz.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--repgo6uzkDL7F6fU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 20, 2014 at 10:37:53AM +0800, Bo Shen wrote:

> For this, in my mind, I think we need add following parameters in DT.
> 1. sysclk_src_from_fll --> we need do nothing.

No, how would this work?  If nothing else the FLL needs configuration.

> 2. sysclk_src_from_mclk
>    2.1 use_external_xtal --> we need clock_frequency
>    2.2 !use_external_xtal --> we need retrieve clock and clock_frequency.

No, this is all handled in the clock binding.  If there's a fixed rate
clock the device tree should have a fixed rate clock provided.

> Does this acceptable? Or any other better suggestion for this?

Just have the device tree describe the hardware and provide a way of
specifying an optional MCLK.

--repgo6uzkDL7F6fU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKvF9AAoJELSic+t+oim94yoP/jzlLrru/i3gZQPprWhhPuwU
0BB/QKc2uMrxTclMUTT5jzsdJFefXDYKoN63Eh6c58Cu1hBS3K/Qr0zOxWFTlMaU
yyW4G4nRd1Kw/jx9KyoC2YFVQirB3kATHmX/2UMqMTmVENH4j5FFVy+VzHImA7lq
9RbKgY7Xi0VR/H2xSDvGJw1GNQkXs4SUvVHMxi1BJ6VVF2cSvxfTL2pcBP6d0haT
Wjtkh6KdfLV8ex358JZw2a0BCoAAIUMWPFVnB+0SHeMNbvtm3coaSAGEJd58bXrX
Wb903OQbmdZ0x0MnGONOaROZ9O7YD0J091wYWGrRAYHEOvyD17Ppdv0/6GW4/fKD
nmCYiCYwTqQ5wu2Xx3SS5wcwrzktGxVQK99thLEgJYZnGJMzke2vSaP71OWxlB7T
ezow/M2QWSFIlXJrMK7A9LlK0SKwA1M0TTuc1wI5XkE2Be0nHR9K4LTT03GoNdwQ
SrDq3194wV8mqUYjzJMH0JCaGgow4uRp2c8PeRUSskYgNEoA9q92mFuT5UR5vrKn
MfK8nYyKRaVr2alilvMYOPs2NgzTn0gVN3uitmSDlHO8sUILZWTf0txdBtfc4T5Z
Zu3kfWe0H0NoAP9VcW0t/d6V++Nuew5EkC/NGs1qEpxmKB7cVa4XMBiMMQMLj0tr
R7vdAwVojfvXl9iGHHJt
=v1cx
-----END PGP SIGNATURE-----

--repgo6uzkDL7F6fU--
