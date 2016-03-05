From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 3/6] slimbus: Add messaging APIs to slimbus framework
Date: Sat, 5 Mar 2016 14:13:25 +0900
Message-ID: <20160305051325.GD18327@sirena.org.uk>
References: <1454784265-5194-1-git-send-email-sdharia@codeaurora.org>
 <1454784265-5194-4-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yE1BLVtZVXFaWOJJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454784265-5194-4-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--yE1BLVtZVXFaWOJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 06, 2016 at 11:44:22AM -0700, Sagar Dharia wrote:

> +	spin_lock_irqsave(&ctrl->txn_lock, flags);
> +	msg = ctrl->tid_tbl[tid];
> +	if (msg == NULL || msg->rbuf == NULL) {
> +		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
> +		dev_err(&ctrl->dev, "Got response to invalid TID:%d, len:%d\n",
> +				tid, len);
> +		return;
> +	}
> +	memcpy(msg->rbuf, reply, len);
> +	ctrl->tid_tbl[tid] = NULL;
> +	if (msg->comp_cb)
> +		msg->comp_cb(msg->ctx, 0);
> +	spin_unlock_irqrestore(&ctrl->txn_lock, flags);

Do we need to hold the lock for so long (especially with things like the
memcpy())?  As far as I can tell we only need the lock for this:

> +	msg = ctrl->tid_tbl[tid];
> +	ctrl->tid_tbl[tid] = NULL;

> +	if (mc == SLIM_MSG_MC_REQUEST_CHANGE_VALUE ||
> +		mc == SLIM_MSG_MC_CHANGE_VALUE ||
> +		mc == SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION ||
> +		mc == SLIM_MSG_MC_CLEAR_INFORMATION)
> +		txn->rl += msg->num_bytes;

A switch statement might be nicer here.

--yE1BLVtZVXFaWOJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW2mrzAAoJECTWi3JdVIfQ7BIH/07SMxl+dPGoEcbrDfYQmNnq
4ZhsyVLzOwXycI/yqIn6O5TJoekGTZvs4+ZmT5tfwbF+emowNIj1izCq+Cv4xET7
eEStolQpnhGbNdPxZ6sOoclbrEdbT1L2H+/uQ1Lu+EsBxTjOiLBzOrb7I/WSgnr8
DExHzq4Zk0nmFtC2UW2Bp+erlifqm1H11Aq5a3KtMFLTBuX84P58kLspLdgX9iC+
3QWDygGNX2csMlVH//E83cVgzx48iVg8RdfP4Ub3PNVOTPfbpPRAk8Pns1IHOzST
riMfOhVu2v0mOLihWZTSZ2pqOZQayQhU5to8wPk4OM2WFIBCynHmXrrkpyIXvHQ=
=xo15
-----END PGP SIGNATURE-----

--yE1BLVtZVXFaWOJJ--
