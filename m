From: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 RESEND 2/2] mfd: arizona: Update DT
 binding to support OUTn_MONO init_data
Date: Tue, 20 Jan 2015 13:20:01 +0000
Message-ID: <20150120132001.GA21293@sirena.org.uk>
References: <1420185829-24886-1-git-send-email-ideal.song@samsung.com>
 <1420185829-24886-3-git-send-email-ideal.song@samsung.com>
 <20150120122005.GA13701@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150120122005.GA13701@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Inha Song <ideal.song@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, ckeepax@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2015 at 12:20:05PM +0000, Lee Jones wrote:
> On Fri, 02 Jan 2015, Inha Song wrote:

> > This patch update DT binding to support OUTn_MONO init_data. Each
> > output signal can be configurated as a mono differential output.
> > The mono differential configuration is selected using the OUTn_MONO
> > registers.

> This requires a DT Ack and an entry in the example.

The DT maintainers have said they're OK with maintainers just merging
things if they're comfortable with it (see the bindings specific
submitting-patches.txt) and given their workload and general resulting
responsiveness it's going to make it difficult go get anything done.

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUvlYAAAoJECTWi3JdVIfQePsH/A2qysGVcmVKORiKU0eiv9it
Z5lW/OBk0Q/7JUcDijm+B8b4+h6ZRI4z/hh8NOTdj5KYyzO/Xt2m54BC6MRbfqvB
GgA3cU5TERnbmRDZ6w+XcBFnGTZ9GVCKCAPTDuqhBsFdHL4i51YMLJCOd7kx/wV5
a5UNVDyk6th03/upBEGGCxV1jR2k9+dfeawgfpZWfZB1kuzpj9tTBfZeOOdhwJW+
PP3QUgkK5UeTURCKdBgWfXK8km32ja94b3TP1cAKvrHB9m7N7SBcEBpUM4I1a0ej
zYHZQD6oI5AP+uz5CK69U1XWYYEPGcKhRYUCbgw1ptvdm2JhRwt6D487fC0pVcg=
=8xvF
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
