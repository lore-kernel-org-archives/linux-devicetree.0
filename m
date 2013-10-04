From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] clk: palmas: add clock driver for palmas
Date: Fri, 4 Oct 2013 21:52:52 +0100
Message-ID: <20131004205252.GU27287@sirena.org.uk>
References: <1380803407-15196-1-git-send-email-ldewangan@nvidia.com>
 <20131004164139.GR27287@sirena.org.uk>
 <20131004193545.4343.15596@quantum>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9JkkYVew5bnwk98f"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131004193545.4343.15596@quantum>
Sender: linux-doc-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, rob@landley.net, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--9JkkYVew5bnwk98f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 04, 2013 at 12:35:45PM -0700, Mike Turquette wrote:

> The best solution is to have a driver claim the clock with clk_get and
> enable it with clk_prepare_enable. I gave more detail in my reply to
> Laxman.

Yeah, definitely - though with regulators we did find that there were
some passive things which didn't really warrant a driver for any purpose
other than holding the reference to them.

--9JkkYVew5bnwk98f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSTyqhAAoJELSic+t+oim9OSYP/Rc6uVT9uEMrXqS3fstAVx2p
C75+eQsKCEcrZLFa3Ulym6VCKhjRuvqyUNfBu3woaPaYJxJKvtJ+bYW48YipAP1X
bR5Ogsazr3+dkAJm/mt83eKN8NfG0pPQdE1hHW4biaPqbYPSkZjzfPqeKF0yxssY
D0xUznihMwhXoN7CZrqnt2Ak2Q9urQU3kLKEYzzlVkZBrV2Cdm1hPxsBpxU4iX6l
aeC1Zg5QmtO+MHw/GHFBw2+WVbenF328lFd4Nn00wROpnzeEP5rF27X957HzI8H7
EEsrsztAcOkhbSPVt98gWePfmCa+Z9lK1afdYmk4/Q/Nj7VjLJYKktUuGqRM+3ha
sVvoMOWgawDSiGsbMQ1YpWmZvlbYUIOHA8K8G0CSnDJVpVrtSthGxeQdxNHRL/w5
jSqz/kXPtQd40IUQC+4VgOh64p2qA35di5dbJ77ef/6rBNzdj0AtpBleaICtWBLb
RzBqJ87u88n7OHrnv2KMRGudVXewdYOfAuJnF6b/ScIgLjQM0kDMdXvNZ9oTBVAl
ICbtax3HYtIdNpBp+NOYtA9GqIxTfUj9UOCTSTHIS70v0gaOjZ3mgiUjkkHSxIwt
gWq8XmDQd3i8HIzNusYoXBUp9HHs3mhHIjcayf3I4f4Wey0LxWWeSZAS+4g57rCv
sl/k48iPtt4FCKpY57SI
=sp07
-----END PGP SIGNATURE-----

--9JkkYVew5bnwk98f--
