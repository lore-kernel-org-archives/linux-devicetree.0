From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 6/6] slim: qcom: Add runtime-pm support using
 clock-pause feature
Date: Sat, 5 Mar 2016 14:29:00 +0900
Message-ID: <20160305052900.GF18327@sirena.org.uk>
References: <1454784265-5194-1-git-send-email-sdharia@codeaurora.org>
 <1454784265-5194-7-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/tscNM0QnUkXBx+G"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454784265-5194-7-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--/tscNM0QnUkXBx+G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 06, 2016 at 11:44:25AM -0700, Sagar Dharia wrote:

> @@ -253,6 +276,7 @@ static int msm_xfer_msg(struct slim_controller *ctrl,=
 struct slim_msg_txn *txn,
>  	if (txn->msg && txn->msg->wbuf)
>  		memcpy(puc, txn->msg->wbuf, txn->msg->num_bytes);
> =20
> +
>  	return msm_slim_queue_tx(dev, head, txn->rl, MGR_TX_MSG);
>  }
> =20

This change for some reason seems to have a few of these random
whitespace only changes here.

> +	ret =3D slim_ctrl_clk_pause(&dev->ctrl, false, SLIM_CLK_UNSPECIFIED);
> +	if (ret)
> +		dev_err(device, "clk pause not entered:%d", ret);
> +	else {
> +		clk_disable_unprepare(dev->hclk);
> +		clk_disable_unprepare(dev->rclk);
> +	}
> +	return ret;

Coding style, {} should be on both sides.  It's also a bit odd that we
don't ever reenable these clocks.

--/tscNM0QnUkXBx+G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW2m6aAAoJECTWi3JdVIfQeegH/REjuVJzp0UsBVkTefGqF8/w
09XW+VjYos9ckcuP1KS9GFKb71WERFtv9J5sIBx7pzelPodUdE3uHw6NRmOPybjU
6X+zxUl5zL6b6dEmSLihFDdVVuFMxuykkFDbEsgIdXRkptBB3r/z33dFxyp+c6lF
lfegLzfcX29FnY//5DFUxK/AV/7mYAykrnyqiKxBlVb0C7DQpg8W8EwXs7aD6pg3
TQez/p7+z+QkesXo9gW48ZV5IrlT7zfV7+o0E+NYPWX2OuYGo5NThQQkYOR3XgwT
VCXB1d91miIGACBB0dqUQ0a6luTZvxdQXNpwk93575lV/lR9zYgHGQnqlKLDR8I=
=JwAR
-----END PGP SIGNATURE-----

--/tscNM0QnUkXBx+G--
