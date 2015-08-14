From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 4/6] slim: qcom: Add Qualcomm Slimbus controller driver
Date: Fri, 14 Aug 2015 19:31:06 +0100
Message-ID: <20150814183106.GE10748@sirena.org.uk>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
 <1438585190-11894-5-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qzBiUkG7YMMDZbZI"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438585190-11894-5-git-send-email-sdharia@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--qzBiUkG7YMMDZbZI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2015 at 12:59:48AM -0600, Sagar Dharia wrote:

> +/**
> + * Qualcomm slimbus controller may experience interference on the lines
> + * causing some early messages (e.g. logical-address assignment) to be
> + * NACKed. Retry after sometime (typically 1 superframe)
> + */
> +static void msm_slim_wait_retry(struct msm_slim_ctrl *dev)
> +{
> +	int msec_per_frm = 0;
> +	int sfr_per_sec;
> +
> +	/* Wait for 1 superframe, or default time and then retry */
> +	sfr_per_sec = dev->framer.superfreq /
> +			(1 << (SLIM_MAX_CLK_GEAR - dev->ctrl.clkgear));
> +	if (sfr_per_sec)
> +		msec_per_frm = MSEC_PER_SEC / sfr_per_sec;
> +	if (msec_per_frm < DEF_RETRY_MS)
> +		msec_per_frm = DEF_RETRY_MS;
> +	msleep(msec_per_frm);
> +}

This looks like logic which might be usefully pulled out to the
framework - I bet this isn't an issue unique to your controller, the
users (well, one user) look like cases where the bus might be
destabilised by devices powering up and trying to enumerate under less
than ideal electrical conditions which seems like something that's
likely to affect other hardware.

> +	rclk = devm_clk_get(&pdev->dev, "core_clk");
> +	if (IS_ERR(rclk)) {
> +		/* unlikely that this is probe-defer */
> +		dev_err(&pdev->dev, "rclk get failed:%ld\n", PTR_ERR(rclk));
> +		devm_clk_put(&pdev->dev, hclk);

No need to call devm_clk_put() explicitly in your probe function.

--qzBiUkG7YMMDZbZI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVzjPqAAoJECTWi3JdVIfQZJ8H/3uBa2sbg6Q3DJHXO5EP73eb
wiXryLVsZW11Gphdj+XfdzpzCUD2iOnsVgipcbUAyZTXGumzCOCBOrWiha1U25zK
vPrSV3j8isa23F+Wto6k+X5CYZDWqXe3TL8Ux7KgQ9CKasvRfOSZCsYCEsgAk/jl
nBoft8qIX7rGF44LaqAMjd7aRuHMfeIb5GmabHZeQSgGljD2sF/PhCFEmsDMNHtV
QecfEaMQ3NwcifzYgMUPC+u5WEXFnjv/2y793MZUURCOriAxXhknVWVbiFltO9dP
Efrqel9PktB5aawea6QQ5Ioqze8EXgBBOMBEZh4SJmJHryQlrPCSsRC5+ZqEHgY=
=3cLC
-----END PGP SIGNATURE-----

--qzBiUkG7YMMDZbZI--
