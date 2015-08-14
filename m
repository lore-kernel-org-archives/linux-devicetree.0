From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 6/6] slim: qcom: Add runtime-pm support using
 clock-pause feature
Date: Fri, 14 Aug 2015 19:43:44 +0100
Message-ID: <20150814184344.GG10748@sirena.org.uk>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
 <1438585190-11894-7-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rz/qo3iW6Lu5yGf1"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438585190-11894-7-git-send-email-sdharia@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--rz/qo3iW6Lu5yGf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2015 at 12:59:50AM -0600, Sagar Dharia wrote:

> +	if (cur_clk_state == SLIM_CLK_ENTERING_PAUSE) {
> +		if (txn->mc != SLIM_MSG_MC_BEGIN_RECONFIGURATION &&
> +		    txn->mc != SLIM_MSG_MC_RECONFIGURE_NOW &&
> +		    txn->mc != SLIM_MSG_MC_NEXT_PAUSE_CLOCK)
> +			return -EBUSY;
> +	} else {
> +		int ret = pm_runtime_get_sync(dev->dev);
> +
> +		if (ret < 0) {

This is taking a runtime PM reference whenever we're about to start a
transfer - this is the sort of thing I was talking about expecting the
framework to do rather than individual drivers.

> +			pm_runtime_set_suspended(dev->dev);
> +			dev_err(dev->dev, "runtime-pm vote failed:%d\n", ret);
> +			return ret;

If the get failed there should be no need to suspend the device, the
get() should leave us in a sensible state...

> +static int msm_slim_suspend(struct device *dev)
> +{
> +	int ret = 0;
> +
> +	if (!pm_runtime_enabled(dev) ||
> +		(!pm_runtime_suspended(dev))) {
> +		dev_dbg(dev, "system suspend");
> +		ret = msm_slim_runtime_suspend(dev);
> +	}
> +	if (ret == -EISCONN) {
> +		/**
> +		* If the clock pause failed due to active channels, there is
> +		* a possibility that some audio stream is active during suspend
> +		* We dont want to return suspend failure in that case so that
> +		* display and relevant components can still go to suspend.
> +		* If there is some other error, then it should prevent
> +		* system level suspend
> +		*/

Best mention that this is for the modem use case for Android's suspend
model since it's really surprising to see.

--rz/qo3iW6Lu5yGf1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVzjbfAAoJECTWi3JdVIfQJX4H/2Tl4PLAjRJC4XCaVMqm4Sgh
6tv6bIfMzsJ1kJGuq1wZrpeoGHQvC9y3Cb8e5deU6Acrcs/skC5yqDtk+RQqfF95
XuTtZSOslHpmrAl23oFnkzcg+oC22pCZBQOXWG/uKkL7K/2sy5mCi+vBkpw+PGBz
iQhZobgqWrYzb2ix3GiAKDIR0vVvmR0Cx5B+KlfRTjkGY+WCPK8Ohmj42QpKm0Hk
oYdFIrL2NaTAugf7Qh/D4SYR6GMMYPfzxJk7vr/5S2pe7rrKdEhzgv+MYqSFt2aT
FFzk8P2RpyQt/k5RLtVUMvJreUOIPbSMUlBdawlWvpgEo2rhT3cZ55o5Bp1j32Y=
=YnBe
-----END PGP SIGNATURE-----

--rz/qo3iW6Lu5yGf1--
