From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] regulator, dt: add dt support for tps6502x regulator
Date: Tue, 27 Oct 2015 11:12:50 +0900
Message-ID: <20151027021250.GR28319@sirena.org.uk>
References: <1445858717-12707-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZqRzwd/9tauJXEMK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1445858717-12707-1-git-send-email-hs@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org


--ZqRzwd/9tauJXEMK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2015 at 12:25:17PM +0100, Heiko Schocher wrote:
> add DT support for the tps6502x regulators.

Please use subject lines matching the style for the subsystem.

> +	regulators = of_get_child_by_name(np, "regulators");
> +	if (!regulators) {
> +		dev_err(dev, "regulator node not found\n");
> +		return NULL;
> +	}

Please use the generic support for locating the DT information for
regulators using regulators_node and of_match in the regulator_desc
rather than open coding this.

--ZqRzwd/9tauJXEMK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWLt2dAAoJECTWi3JdVIfQKFMH/0JA/btF6/FMis7iNni47kaf
4ugdDzRC08BNDkjzsqUt7C6tr2O8F3kUk0vxiGa2s9P/0Cj5PCVV6d/at1Mg7mnG
xBl9rKX3nbFI5ing04TmxDZKp4+ZNCURivFnMdq5zB8awRKLLEACxoa/QsKvNtjq
ps4QD+KSurQh+qBdFAr8HMChCHvOiv8As5jkyLJQ4UpDHvlvk8hcBBXzP1dQzcl8
5GghFT+96nm6qeks+4zTGnr1lflPGaekTf9sOLjaLfTTScxHB+QNj6KDZEJ8nbWB
wRNTRVrkEDeGdq4C/0SRPgPgeWLdTkIlmfCFjJawY2rPhrP986wXyJ/HhBqOvSU=
=yFuu
-----END PGP SIGNATURE-----

--ZqRzwd/9tauJXEMK--
