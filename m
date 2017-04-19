From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [v5,3/8] mfd: retu: Add OF device ID table
Date: Wed, 19 Apr 2017 21:40:27 +0200
Message-ID: <20170419194027.367zshrrfrknozds@ninjato>
References: <20170412172800.23035-4-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hogx7fuak2sc6fme"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170412172800.23035-4-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org


--hogx7fuak2sc6fme
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2017 at 02:27:54PM -0300, Javier Martinez Canillas wrote:
> The driver doesn't have a struct of_device_id table but supported devices
> are registered via Device Trees. This is working on the assumption that a
> I2C device registered via OF will always match a legacy I2C device ID and
> that the MODALIAS reported will always be of the form i2c:<device>.
>=20
> But this could change in the future so the correct approach is to have a
> OF device ID table if the devices are registered via OF.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Acked-by: Tony Lindgren <tony@atomide.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Wolfram Sang <wsa@the-dreams.de>


--hogx7fuak2sc6fme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlj3vSsACgkQFA3kzBSg
KbZHCBAAm3tzKN2Ksl9UrFrjSLcy4AL28Fywo5uSOVFn2RQQdjz25bRHYiHm0Xud
UVLXuy0MJgJIjgl00TbuoPI1LkpC6kVCnlw01PSLL6n0eLmycPmXQzMYgoyP09JB
Lx2rOU5VvqTnhMHw59+5s4MqLEHWSqU5/VAjtjAEYAqjPqwpZB1vw5dDa4Ld0yCq
eLNSGIR31IpyjmrP13W4qNUv4WDd8J+wo/EMZ4AvB/h4tmtIeummTz3kGGLqTgXf
4AicYpyvpyJmZ1JuR0XsV8KWSL+p8NYSIHml5Wrw6PXtkJH9K7b3n2l7IVysPrWo
bkhbnLtq8vSNr0kHRRWV6n/ZlphclPSpdCQcZEbuldGuzB0l5ENH5gnQQMZTE5ov
MtGn5UKkSAlUZ2UQ54NlGh2pzWMMud5/6NSvph2GalMGj5/v38cLnEAO30+JteF4
608emkC/tmjxJLR1Hl5jgI+/097BoDdRjgqGSHMBehlQ/WhAnOv1svpvo6pkovab
sQagLKM4TVwhwJbnvh3BgA6yIUKTVw3orWX+coyMQN8HYAd5CpUI8FzvkeRl/O0Y
uKe5JOlAN2SsNLLMBpMcklSZ+oVLVkCcuVaC4tao/QL/KESEPTTujP7K19rEKsQO
Q4EV4rqT3Ps/j3kWqafocKG2Umk31rEWF+7xASxlFiyo8VznMnM=
=5yNm
-----END PGP SIGNATURE-----

--hogx7fuak2sc6fme--
