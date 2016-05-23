From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] regulator: DT: Add DT property for operation mode
 configuration
Date: Mon, 23 May 2016 12:28:56 +0100
Message-ID: <20160523112856.GR8206@sirena.org.uk>
References: <1463987611-32139-1-git-send-email-henryc.chen@mediatek.com>
 <1463987611-32139-2-git-send-email-henryc.chen@mediatek.com>
 <20160523104703.GB26992@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xSu31lw3TgkWXnjh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160523104703.GB26992@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Henry Chen <henryc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--xSu31lw3TgkWXnjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 23, 2016 at 11:47:04AM +0100, Mark Rutland wrote:

> > +/* Regulator operating modes */
> > +#define REGULATOR_OPERATION_MODE_FAST			0x0
> > +#define REGULATOR_OPERATION_MODE_NORMAL			0x1
> > +#define REGULATOR_OPERATION_MODE_IDLE			0x2
> > +#define REGULATOR_OPERATION_MODE_STANDBY		0x3

> These sound like they're tied to linux internal details (e.g. the
> implementation of idle and/or suspend).

> What do each of these actually mean?

They are not really at all general and I'm fairly sure I've provided the
same feedback repeatedly on earlier versions of the patch set.  They are
not entirely based on Linux internal details (or at least the Linux
internal details tend to flow from the hardware) - broadly fast is
forced PWM, normal is default, idle is LDO mode and standby is a lower
quality LDO mode - but how this translates into anything that a consumer
could actually use is unclear since the supported output loads and
quality of regulation can vary wildy.  It's also somewhat implementation
dependent what a given regulator does (and it's always possible that
some regulators may have more modes to control or differing definitions
in the hardware).

Henry, *please* look at how the existing mode support in the bindings is
done and consider how a consumer would use this given that it doesn't
know anything about the regulator...

--xSu31lw3TgkWXnjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXQul2AAoJECTWi3JdVIfQ/0MH/273M2+b80bCdidd2WPB/FtZ
CaP8OEzs3OodFyNFyTXPLlq5wMwmpeuPK/nUeoi7lqMPbFLCJkgiaYaFIrLvRMhe
upwWWxVmewhobVuSkep33qJU71PKcrzVMv4rmfcrgIthOhvVE+7rMtZIv04po1sf
uLP/xdBWRte93SIiGtl5naqZR1MmoBlzXLdJleJwv2w8Vo9+KBtAIFiR03O39m9H
lZwLIu04fevGZ2I8COlBklycdfTspt9hmqXSZdtWypIS8zPLLtGZardFTXUSqdfZ
bALfVUZAePGEUL2Ypr8zqFxjfpaIt/YE9ncEJGYVKyDP9T0kR3vgRdEGX1gwWn8=
=Od5Q
-----END PGP SIGNATURE-----

--xSu31lw3TgkWXnjh--
