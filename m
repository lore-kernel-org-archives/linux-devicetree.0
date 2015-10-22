From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/6] regulator: axp20x: Support new AXP223 PMIC
Date: Thu, 22 Oct 2015 13:50:08 +0100
Message-ID: <20151022125008.GJ8232@sirena.org.uk>
References: <1444840342-9233-1-git-send-email-wens@csie.org>
 <1444840342-9233-5-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BOmey7/79ja+7F5w"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444840342-9233-5-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--BOmey7/79ja+7F5w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2015 at 12:32:20AM +0800, Chen-Yu Tsai wrote:
> The AXP223 is a new PMIC commonly paired with Allwinner A23/A33 SoCs.
> It is functionally identical to AXP221; only the regulator default
> voltage/status and the external host interface are different.

Reviwed-by: Mark Brown <broonie@kernel.org>

--BOmey7/79ja+7F5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWKNuAAAoJECTWi3JdVIfQMNAH/iF1Nm/IywDYLJjXioVBkiP1
obkm5xCwMYS3XHjsquUFj674obzx0oFVUzZpcRxTNuQvzLDGRHysLRZzEtAtyNur
huIj+O1sU2RlG/W+nw66LEDWdg2Aply3nPwPlkERCXYh6XLdIwTejTws3YWS9w9K
J5Jctcc6IAA5ZnPIIdWF41oTjo7bjbt6O+3WM0LqlxCJfhGtjQIajvNJn0ixb0J/
hRGfmSavQfuLGFmweleFdm4uTUCSc3XOn7vbe1rZduW32qQjg1vGGFkiSKCJuh/s
VnBRVcSukWA0m8p9af4IVlJWzD3k2jqNDajmFTtxLnPN5uhaJKol6tFwt8wSTcA=
=+MaE
-----END PGP SIGNATURE-----

--BOmey7/79ja+7F5w--
