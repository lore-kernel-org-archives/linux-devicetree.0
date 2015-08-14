From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 1/6] SLIMbus: Device management on SLIMbus
Date: Fri, 14 Aug 2015 19:17:54 +0100
Message-ID: <20150814181754.GC10748@sirena.org.uk>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
 <1438585190-11894-2-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nc+Vvx0JXuqp7Zy0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438585190-11894-2-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--Nc+Vvx0JXuqp7Zy0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2015 at 12:59:45AM -0600, Sagar Dharia wrote:

> +	INIT_WORK(&sbw->wd, slim_report);
> +	sbw->sb = sb;
> +	sbw->report = report;
> +	if (!queue_work(ctrl->wq, &sbw->wd))
> +		kfree(sbw);

Should we not complain if we fail to schedule the work?

> +#define slim_device_attr_gr NULL
> +#define slim_device_uevent NULL
> +
> +static struct device_type slim_dev_type = {
> +	.groups		= slim_device_attr_gr,
> +	.uevent		= slim_device_uevent,

Why these NULL defines?  Just add the struct members as definitions are
added.

> +	dev_set_name(&sbdev->dev, "%s", sbdev->name);
> +	mutex_lock(&ctrl->m_ctrl);
> +	list_add_tail(&sbdev->dev_list, &ctrl->devs);
> +	mutex_unlock(&ctrl->m_ctrl);

Doesn't the driver model list of children of the controller give you
a list of devices connected to the controller?

> +	/* Can't register until after driver model init */
> +	if (WARN_ON(!slimbus_type.p)) {
> +		ret = -EAGAIN;
> +		goto out_list;
> +	}

Shouldn't the core code handle this for us?

--Nc+Vvx0JXuqp7Zy0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVzjDRAAoJECTWi3JdVIfQhgwH/RfFrk/MlmLgOYwpMnmV/RXl
dEjztte8fyrZZa007SclpTo5Qo1ShvIrhNhFyOlZ9cCZcO78RYB24PjWEg8ddJ/R
KZdq+OORtkbXS/7O2mAnhFMM+03+J+6K0pgD3T/TVcxJqbxIkVnugXeTfMuvKoeu
4fkUDXNMF/D9hTjQXuaiLx0Podby6YwpJ4Xs/DZ1r32d3DCl5hTzd8KI47wXpGJ1
ztnj9yKZw/1SvzHEIgW3PK2MUhiukSPqkvpDSkifKsWWKkuSqnWC/xfRXxPmhYu1
fbdvYoc17mzyjJtUk2HDXQyM32cP/awJhgKrWH/qaip6Ev/HVKGuyQT9cJn+sgY=
=PilN
-----END PGP SIGNATURE-----

--Nc+Vvx0JXuqp7Zy0--
