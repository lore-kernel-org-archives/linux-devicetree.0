From: Mark Brown <broonie@kernel.org>
Subject: Re: [rtc-linux] [PATCHv2] rtc: Add support for Intersil ISL12057 I2C
 RTC chip
Date: Wed, 20 Nov 2013 12:45:20 +0000
Message-ID: <20131120124520.GA2674@sirena.org.uk>
References: <87k3g5l9gw.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IlmwW192PJ8CjiJ7"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87k3g5l9gw.fsf@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Kent Yoder <key@linux.vnet.ibm.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org


--IlmwW192PJ8CjiJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 09:51:27PM +0100, Arnaud Ebalard wrote:

> +/* Block read. Returns 0 on success, or a negative errno. */
> +static int isl12057_i2c_read_regs(struct i2c_client *client, u8 reg, u8 buf[],
> +				  unsigned len)

This looks like the device would work well with regmap (8 bit register,
8 bit data).  This would save a bit of code here both for the I/O
functions and also for some of the debugging functionality you have
below like the proc file.

> +	dev_info(dev, "chip found, driver version " DRV_VERSION "\n");

This sort of print is generally frowned upon - it's not adding anything
to the message already displayed by the RTC core on registration.  It's
probably best to remove the driver version too, the kernel is already
versioned.

--IlmwW192PJ8CjiJ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSjK7dAAoJELSic+t+oim9JJEP/in9RKL60cnxRgXsHyHR6F3d
IydUj4BFoaobmMkWjbJSwWEk7BJcXBVBQ5Np/29Juy6RgFKaepV/DbaghEBTigAu
4QV9rmpS589aYrQyPShjKtZcqG0ekh5XwAj1v8MDF4alA6aXA/+QljLmlgzbtTvj
scyQVxvU6Au6CpLLR6/4Thpv3Q7v81jRa0/pFGrm2+9MRlbounbmpmZQhNjq64qk
dpDuYz0bmc81wctOhp9Yvaja2+MWPz8+wtXWM1y0ZfhrppYDOnhXtpVECJdyKwNs
dbfTBqXAyEkhu9C8tFDUvmXA91df1MB7l8qdiTSnG4RHISdNo8Sgh06VL8ll3jz9
drKFD2SLYZhoYuRXXGMck2MebR8udBqxRU+KXmy7ZMAsPKGApw5ZAdQ7I/z40vYR
ynoWVTgDPx/LS5RVqu/913d90SHql7syDX6BeVPtGdPWf9A1ztPqeZGce0VQkI/m
S+c57yL67h4m4lxWIwnmTH09SqWO2eTUJERo67GDQPayYU/0BT0ebOuw01LyR/2E
p9q3Dv8oZHu3xjHJjF0ppvPU1rIy9VIYFBtAoDyVyGHYMztmK16qjW1aaVd67e2j
5DyvnWsfqj6Qm0cSXiLKi/1v7Y1d8ehSfs8H7QxKHwk/kEsKUjMZ4QJn4GRJpLKC
32pxtPc4g+yNmuSON2Q+
=H5pO
-----END PGP SIGNATURE-----

--IlmwW192PJ8CjiJ7--
