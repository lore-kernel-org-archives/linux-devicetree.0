From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 5/6] slimbus: Add support for 'clock-pause' feature
Date: Fri, 14 Aug 2015 19:39:18 +0100
Message-ID: <20150814183918.GF10748@sirena.org.uk>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
 <1438585190-11894-6-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="34/PV/2fFpU6TJrn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438585190-11894-6-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--34/PV/2fFpU6TJrn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2015 at 12:59:49AM -0600, Sagar Dharia wrote:

> @@ -459,6 +459,8 @@ int slim_register_controller(struct slim_controller *ctrl)
>  	mutex_init(&ctrl->m_ctrl);
>  	spin_lock_init(&ctrl->tx.lock);
>  	spin_lock_init(&ctrl->rx.lock);
> +	mutex_init(&ctrl->sched.m_reconf);
> +	init_completion(&ctrl->sched.pause_comp);

Should there not be more interaction with the rest of the framework on
clock pauses - the bus will need to be started to do transfers for
example?

> +#include <linux/slimbus.h>
> +/**

Missing blank line.

> + * slim_ctrl_clk_pause: Called by slimbus controller to enter/exit 'clock pause'

Is the controller the best place to initiate bus pausing?  It's
surprising to me that it would be, the bus being idle isn't something
that needs controller specific knowledge so I'd expect the framework to
have standard support for this.

--34/PV/2fFpU6TJrn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVzjXVAAoJECTWi3JdVIfQ3MoH/2nfw8dLmdY55cE4euR6//lg
IsvE57tlIMnVMRjFhLQIV4zMwS7RD59nKQUORfkm0jSlIUuEDc9THPi35ivvkKzk
YQ38umQSZ3ukzvGYdWWAyqkR7ajDlFCyjqW+PTG0rMLxi0b6SdZRTSK+ygr15Tb/
matAjlMIb1kwX63ebpa1oaUI0O+eE/iTbJhkdtNWfaiNC7A569X/8L2KNSU1FAsP
0IdM5TLRSZZrtgDB8iC7QWEDVo3JQ/7lTtCbgDAaHnavc+mbh20UDyW+UAhrBRu4
qlajIkWRfH596l96t5Izg0ohBJwZVR2Ohifb8NBUqFonGyXXbQe/AIKz3Zk1nqk=
=Qo6G
-----END PGP SIGNATURE-----

--34/PV/2fFpU6TJrn--
