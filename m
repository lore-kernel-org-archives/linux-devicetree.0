From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 3/6] slimbus: Add messaging APIs to slimbus framework
Date: Fri, 14 Aug 2015 19:25:25 +0100
Message-ID: <20150814182525.GD10748@sirena.org.uk>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
 <1438585190-11894-4-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+hZM3YBJafcqGfHn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438585190-11894-4-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--+hZM3YBJafcqGfHn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2015 at 12:59:47AM -0600, Sagar Dharia wrote:

> +	sema_init(&ctrl->tx_sem, (ctrl->tx.n - 1));

This sempahore counts the number of free slots in the statically
allocated list of transfers we have allocated.  It would be good to see
some discussion in the changelog as to why we've got this statically
allocated pool rather than just dynamically allocating them as needed -
I can see a performance argument there but it'd be good to have the
thinking documented.

> +	buf = slim_get_tx(ctrl, txn, need_tid, async);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	if (need_tid) {
> +		spin_lock_irqsave(&ctrl->txn_lock, flags);
> +		for (i = 0; i < ctrl->last_tid; i++) {
> +			if (ctrl->tid_tbl[i] == NULL)
> +				break;
> +		}
> +		if (i >= ctrl->last_tid) {
> +			if (ctrl->last_tid == (SLIM_MAX_TIDS - 1)) {
> +				spin_unlock_irqrestore(&ctrl->txn_lock, flags);
> +				return -ENOMEM;

We don't undo slim_get_tx() here but the definition looks like we ought
to be returning the buffer we allocated.

--+hZM3YBJafcqGfHn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVzjKUAAoJECTWi3JdVIfQ1uEH/A7TLbhIMxghLXCiB4YOfLQH
VBdgWz+Fog4OUaG84LTyC9suNyHUhWIfwUQsDcIYxzrL2lx2wSQEtNKZZ+NBvk78
87DPxks09nMo4/ryEIneYR3/S5v2PyM0WamIIY7SR2vjXBuv44MEpFsoGjyH9AgH
rH5So/HoGmwAduMp7IM5WJwYctmoSe7V45P/ZBd3IVi8/pfLUu+sLI+aryAFat9Q
deg60Y3kmrBSO97RY/kcXe3h0NLx4qaIZpBwFAa8JKmLRNLzdtAQXrMnV44irJW2
zSXHLTuhNqN2OVyT2TFxjeQbspPAOpF6V+9nmo7bhWQlqiojVuYlCnVq/xSIqUs=
=V56d
-----END PGP SIGNATURE-----

--+hZM3YBJafcqGfHn--
