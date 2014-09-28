From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 0/2] regulator: get voltage & duty table from dts for
 pwm-regulator
Date: Sun, 28 Sep 2014 11:38:14 +0100
Message-ID: <20140928103814.GO27755@sirena.org.uk>
References: <1411871334-17692-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3dbUQUznexwzCA76"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1411871334-17692-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: dianders@chromium.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, lee.jones@linaro.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org


--3dbUQUznexwzCA76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 28, 2014 at 10:28:52AM +0800, Chris Zhong wrote:
> get voltage & duty table from device tree might be better, other platforms
> can also use this driver without any modify.
> Tested on a rk3288 sdk board as logic voltage regulator.

> Changes in v7:
> Adviced by Mark Brown
> - re-edit changelog
> - re-edit changelog

Applied both, thanks.  Please use subject lines matching the style for
the subsystem.

--3dbUQUznexwzCA76
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUJ+UWAAoJECTWi3JdVIfQrlsH/i8mZfTeEo+axv1Q4MFIAFSG
ReQoWD+pXNhyr4jjdHbIBb1P5d3/ArkcL6xdR77Y8kTVUFWrC+biU1gchL4ZM0dc
QLriKH9bSLqRzEB1r3OcMkNrGx86TlQ4Y0HW+RkJdGDl/fs7n7cJIdbw7Sen8xU7
3+4Kjd6lRAETiRS7CqRrKbspmcHWF7TY8CBlLKGE4sOqQvfantYgM0mCqYR044C5
US+Ga881d5xg38RT7gOPro4UW/OzmKUEu0pXRig4JiI3Nq4tLRIMt2uV8+29xDJs
i92ekTl45QpxqmrPdLXTrFqadFX9iKX38xmSk/1XPoO+XuqT9r3NkFQol2ZW78k=
=+CT1
-----END PGP SIGNATURE-----

--3dbUQUznexwzCA76--
