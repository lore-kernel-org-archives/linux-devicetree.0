From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] regulator: don't emit errors in
 {devm_}regulator_bulk_get when defering
Date: Tue, 10 Mar 2015 12:07:50 +0000
Message-ID: <20150310120750.GE28806@sirena.org.uk>
References: <1429128.MSqYm0qZ9p@phil>
 <9261130.uPvufuEFrr@phil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wr26kid6E8rFCMyi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9261130.uPvufuEFrr@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, djkurtz@chromium.org, Yakir Yang <ykk@rock-chips.com>, Fabio Estevam <fabio.estevam@freescale.com>, dianders@chromium.org, Andy Yan <andy.yan@rock-chips.com>, Mark Yao <mark.yao@rock-chips.com>, linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--Wr26kid6E8rFCMyi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2015 at 12:22:06AM +0100, Heiko Stuebner wrote:
> When {devm_}regulator_get returns -EPROBE_DEFER the driver in question will
> try probing again at a later time. So don't spam the log with failure messages
> as this is an expected result of probe ordering.

> -			dev_err(dev, "Failed to get supply '%s': %d\n",
> -				consumers[i].supply, ret);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to get supply '%s': %d\n",
> +					consumers[i].supply, ret);

No, this is not good - you get a nice quiet boot even if the regulator
does not appear which means people have no idea why the driver isn't
loading.  That's not a good user experience, silent error handling is
the main problem I see people running into trying to get their systems
up and running these days.

Really deferred probe is just fundamentally noisy since it's
intentionally tolerating errors like this and of course a lot of the
noise comes from the deferral messages the core prints.

This is also not really connected to the series you're posting it in...

--Wr26kid6E8rFCMyi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU/t6WAAoJECTWi3JdVIfQ7eEH/2J2gcg/F7qtu2lU8XD1JRJQ
5LPE2bjm96nmyrH3cge41SicMsemkAakgJN5K18SXigYCW+FPYtBTibwkncSXgJr
3ljSe6Qiuv9LToz5cIKCjxXZMbA06YGlScpbDl7y0BCBqISZCENklZZrKfM2f4+8
B9evGBZGqWN2xFsMZz+ZGIMXx47uL2pVH0b0bzJttAlnk+xdpLLdhHfAjl8Y8sdm
npzyJJ6lHV1ipXLjcoPmfy6UXIdftQ5ztc/QU1q5DeSJL8MwVr1/lS4K6MfFcB5B
2QgN+Z/0TH/80KUDIZb5E+XTQ6lrjRiSWlA96BogLdWf5v6esD+O27POMtm7wB0=
=4ehk
-----END PGP SIGNATURE-----

--Wr26kid6E8rFCMyi--
