From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 4/6] slim: qcom: Add Qualcomm Slimbus controller driver
Date: Mon, 18 Apr 2016 10:19:39 +0100
Message-ID: <20160418091939.GK3217@sirena.org.uk>
References: <1454784265-5194-1-git-send-email-sdharia@codeaurora.org>
 <1454784265-5194-5-git-send-email-sdharia@codeaurora.org>
 <20160305052315.GE18327@sirena.org.uk>
 <57111420.8060208@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sdEQJo40s7ofW8iR"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57111420.8060208@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: robh@kernel.org, gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--sdEQJo40s7ofW8iR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 15, 2016 at 10:17:36AM -0600, Sagar Dharia wrote:

Please leave blank lines between paragraphs, it makes things much easier
to read than a wall of uninterrupted text.

> >>+	ret = devm_request_irq(&pdev->dev, dev->irq, msm_slim_interrupt,
> >>+				IRQF_TRIGGER_HIGH, "msm_slim_irq", dev);
> >>+	if (ret) {
> >>+		dev_err(&pdev->dev, "request IRQ failed\n");
> >>+		goto err_request_irq_failed;
> >>+	}

> >Are you sure this is safe and we don't deallocate things the interrupt
> >handler uses before we disable the interrupt?

> Since clock is not enabled before this step, we won't be getting any
> interrupts from HW at this stage.

No, that's not what I'm saying - I'm asking about the *disable* path on
remove.

--sdEQJo40s7ofW8iR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXFKaqAAoJECTWi3JdVIfQHF4H/RZ7vQ4xVWEyNrNP5cpNVFYy
kzqhy4AvXybpB08bYxaicspEIKXctr4xa5wlPwPbHIWRQzshhEckGVHFb0Ici8SM
mRaPLhzgEZB9WGJt6ZPOqMtBH5NTvSv18qpEewjXlBAC2SuMWFarzff9XMV+3lfn
Ak9/ubwmisMAZmomqJFOjB4nPjDbi1qibGtkyKHveAKXzmAjaf65CLpTDc58mx5+
Ke8h7y0nw52IU1diFbIJqbdu14qV/0MlmaGnUKo6Zre8U3ZHjrH8D2WduEIxz/JK
9ykq8bF40L90eBgHc4EmEWuU7SHD6jXP+CMZUy8+PLaSKdJc+EcM1KvGyJT6Tss=
=nETp
-----END PGP SIGNATURE-----

--sdEQJo40s7ofW8iR--
