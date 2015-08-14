From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 0/6] Introduce framework for SLIMbus device drivers
Date: Fri, 14 Aug 2015 19:46:37 +0100
Message-ID: <20150814184637.GH10748@sirena.org.uk>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tJKub4+frm2HVP3B"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--tJKub4+frm2HVP3B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2015 at 12:59:44AM -0600, Sagar Dharia wrote:

> Sagar Dharia (6):
>   SLIMbus: Device management on SLIMbus
>   of/slimbus: OF helper for SLIMbus
>   slimbus: Add messaging APIs to slimbus framework
>   slim: qcom: Add Qualcomm Slimbus controller driver
>   slimbus: Add support for 'clock-pause' feature
>   slim: qcom: Add runtime-pm support using clock-pause feature

This looks pretty good overall but I did have a few fairly specific
comments that I've sent on some bits.  I see there are a number of users
of this API onn the CC list, it'd be really nice to see some more
participation from them on the review here - are you using this code, do
you have testing reports or any more specific comments on the code?

--tJKub4+frm2HVP3B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVzjeMAAoJECTWi3JdVIfQgGAH/1mSUGpYn4IRTgz9DAajGO1y
rpi8JS4bEec1X1oW+czfqU9JtC2eXJpExva5MHeVpBm1G+YQXnDTIU1m//PHcCzx
iWwLisxAXddpYj7H8cL6vqjtv/F44A1+fCBjTM1XgE56kowSfgsMxX1Ja9H0Tyjo
j0Z6kc8i2e+OJ7HOVhF7hebJJi6kQRd1BAsyEqOx1uZJQmPBhpx3YEn6Vry4fZlF
Nzg3md7idSigwACJDy6Pm5MFV7sY207nFGqDqfipaBSyMaD4MhFoJ5Dd8L6Eg/Yk
y/Gz6YqVRfpJIuNuEO3xG/Gk7ZpaE19l/2D9p9gg5Owc1pzzZxIsmMDsDbHW+O4=
=yYE1
-----END PGP SIGNATURE-----

--tJKub4+frm2HVP3B--
