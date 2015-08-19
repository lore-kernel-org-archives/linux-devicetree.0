From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] ARM: sunxi: Add Reduced Serial Bus support
Date: Wed, 19 Aug 2015 09:32:32 -0700
Message-ID: <20150819163232.GS10748@sirena.org.uk>
References: <1439958009-14056-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="//EvipGn50MqgBlL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439958009-14056-1-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>, Meng Zhang <kevin@allwinnertech.com>, shuge@allwinnertech.com, kevin.z.m.zh@gmail.com
List-Id: devicetree@vger.kernel.org


--//EvipGn50MqgBlL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2015 at 12:20:01PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This is my third attempt at adding support for Allwinner's Reduced
> Serial Bus (RSB), which is used to communicate with PMICs and other
> peripherals on their newer SoCs, such as the A23/A33/A80.

This is flagged as something that is specific to the Allwinner SoCs.
Why add generic regmap support rather than just implement the regmap
reg_read() and reg_write() in a regmap in the controller driver?  Are
there expected to be other controller drivers from other vendors?

--//EvipGn50MqgBlL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV1K+gAAoJECTWi3JdVIfQMnwH/RywHcdG7BRz8PqrdB1FkEs3
mvIiHCfPTA09Gi/ozmLtRDlyTezQHQDo+SiAzKR/t08o+cXQ+3UJIIPHDlg50nie
jlNAEF+iOvcBHYhOPEjQPrN9Z3aLUH3zff9SDgcW9QprUcqR000sJb2I1NKl5QPe
gn3b3xhfE+oTIYOic0ZFATdWvT7zviZY0nJxX1fykaZWDo2LHi5Z7E/o2s0sK798
x0dnsmm/ZGNJDNDVeQpMvvr4hub29Jsfb2l80RL4vfQVF6VYm4S/8rsDX+fN0HOL
rSFfZqGQhPeba/XbbToaqnqB2bWOIhMXF//kFb74KafaOtSRWUQ7WVJmGSSZp8E=
=btIq
-----END PGP SIGNATURE-----

--//EvipGn50MqgBlL--
