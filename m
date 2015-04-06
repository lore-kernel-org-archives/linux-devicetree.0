From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/5] Refactor Qualcomm RPM regulator to single
 platform_device
Date: Mon, 6 Apr 2015 17:51:54 +0100
Message-ID: <20150406165154.GP6023@sirena.org.uk>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
 <551DBC05.2090301@codeaurora.org>
 <20150402222630.GV6023@sirena.org.uk>
 <551DC94C.3060001@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rKOZBEg9ux5nbisz"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <551DC94C.3060001@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--rKOZBEg9ux5nbisz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2015 at 03:57:16PM -0700, Stephen Boyd wrote:
> On 04/02/15 15:26, Mark Brown wrote:

> > Guenther sent a patch fixing that a while back.

> This one?

Yes.

>     regulator: Ensure unique regulator debugfs directory names

> Ok. Seems to be only in next. I'm not sure it will work though because
> in this case the parent device is the same for both regulators on
> different PMICs that the RPM is controlling. I could be wrong though
> because I haven't tested it.

I'd say that if the driver is doing this then the driver is buggy - the
user should be able to distinguish between two regulators appearing for
the same device.  Either the RPM should create dummy devices for the two
PMICs or something should insert the PMIC name into the regulator name
somewhere along the line (perhaps in the static data).

--rKOZBEg9ux5nbisz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVIrmpAAoJECTWi3JdVIfQ+9gH/042qrB334HjHkiGibwMsh4J
djcpk3ZmsrhPuEXswXRHNjU4EQsaIsYfmqU88Gv8IpjCLiMErhUVe9OViI+kLi9d
TfKln46+iw8s9LAvn3Vh3LKzoiogUHK0gkVgo3ERh/SrDNwiQoAmj+EfZa/vvGxT
Ga9CkdNofAYrQlo3dBLW8wC/wPVDyrU7G1xNel2aVmQC3p8Qy3VklmoVpWZkUbcF
oywKJoS3Sfl0pKJ9sAXZ8W5WTy+YdY7a5poyPt0ZHG9K+cRSsT6EWDu4/C0D3LC9
8b7o3Kz4zQ/PhuqT56K9vtvYKdVpUs0Lhh4dF4anAcMBZQ0C5YvEj2b2oy5zV0g=
=/rbk
-----END PGP SIGNATURE-----

--rKOZBEg9ux5nbisz--
