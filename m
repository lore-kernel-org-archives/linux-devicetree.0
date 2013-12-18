From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv5,RESEND] rtc: Add support for Intersil ISL12057 I2C RTC
 chip
Date: Wed, 18 Dec 2013 12:24:19 +0000
Message-ID: <20131218122419.GM28455@sirena.org.uk>
References: <28bfd1b8cd4725a70fb713a8b6503e7f5db13d71.1387305663.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AO40I52Xc3kOyr3I"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <28bfd1b8cd4725a70fb713a8b6503e7f5db13d71.1387305663.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--AO40I52Xc3kOyr3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2013 at 08:07:28PM +0100, Arnaud Ebalard wrote:
>=20
> Intersil ISL12057 is an I2C RTC chip also supporting two alarms. This
> patch only adds support for basic RTC functionalities (i.e. getting and
> setting time). Tests have been performed on NETGEAR ReadyNAS 102 w/
> startup/shutdown scripts, hwclock, ntpdate and openntpd.

Reviewed-by: Mark Brown <broonie@linaro.org>

but

> +static int isl12057_rtc_proc(struct device *dev, struct seq_file *seq)
> +{
> +	struct isl12057_rtc_data *data =3D dev_get_drvdata(dev);
> +	int reg, ret;
> +
> +	mutex_lock(&data->lock);
> +
> +	/* Status register */
> +	ret =3D regmap_read(data->regmap, ISL12057_REG_SR, &reg);
> +	if (ret) {
> +		dev_err(dev, "%s: reading SR failed\n", __func__);
> +		goto out;
> +	}
> +
> +	seq_printf(seq, "status_reg\t:%s%s%s (0x%.2x)\n",
> +		   (reg & ISL12057_REG_SR_OSF) ? " OSF" : "",
> +		   (reg & ISL12057_REG_SR_A1F) ? " A1F" : "",
> +		   (reg & ISL12057_REG_SR_A2F) ? " A2F" : "", reg);
> +
> +	/* Control register */
> +	ret =3D regmap_read(data->regmap, ISL12057_REG_INT, &reg);
> +	if (ret) {
> +		dev_err(dev, "%s: reading INT failed\n", __func__);
> +		goto out;
> +	}
> +
> +	seq_printf(seq, "control_reg\t:%s%s%s%s%s%s (0x%.2x)\n",
> +		   (reg & ISL12057_REG_INT_A1IE) ?  " A1IE"  : "",
> +		   (reg & ISL12057_REG_INT_A2IE) ?  " A2IE"  : "",
> +		   (reg & ISL12057_REG_INT_INTCN) ? " INTCN" : "",
> +		   (reg & ISL12057_REG_INT_RS1) ?   " RS1"   : "",
> +		   (reg & ISL12057_REG_INT_RS2) ?   " RS2"   : "",
> +		   (reg & ISL12057_REG_INT_EOSC) ?  " EOSC"  : "", reg);
> +
> + out:
> +	mutex_unlock(&data->lock);

I'm not sure the lock is achieving anything any more - the only time it
actualy protects more than one operation is the above but since the
status register is volatile anyway it might change between it being read
and the control register being read.

--AO40I52Xc3kOyr3I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsZPwAAoJELSic+t+oim9bDkP/iqsa5KN05NE/ckTL4BWUmn7
DNiiCO3RntHVG+fewhmzyUJCYYAqsXesCz+sMM9gA51/uk/KOW/ZJNEVOiNiFcjr
SOI4pSs2u+Zfhmgn6Ue32I5L2ybyt1vKkP3G01A0HC7/pJZzheGpZrUPvi8XVNwd
Z0DNjjsUPzF7LmThOdwGA4Tu/vfiFs0QD7yPWXGQNATPUdcwN64pajuINCYuWfEM
uLF9ZiKbsMPIWf+XjkgP89XEH5X+BYFQQpdIizc4Zkng2QxqetkgdE9NhM8GH/qF
ann0FC62umhaUiVRuUBKynUSO61xo2umG3vwK9MJ98nLFDorEydt6uOqMv1WEu8Q
lKPCeF6ErqPp465LrenZxcFEotmdDoZSWbhikLXa/S75Exex1z8CbziBqzDe1oPP
vtrVXVRNYAopadZIkl78dhJr/mrZu9kYi1VwhUSYGcpe9uvA86j6RdHRSYNysie8
rVIYM23JIXb5KaP6tqAdqN2VUtR2xkBzbjvRx0MVAOpqG31BUii7hQFvPrdGHtzg
Vu0N1M0xV1TRoIJWS4PzV3cnEiP3svK9o7FSf6uKJ1Xq700zttlriRgASlB7lGEU
NiQXEbx2fmr7R0kMed5p4D/8tcJfd616ko9GXwgxZ6aJZuurRLD2wTlZvr/t8NN0
PN/3F+ejj9JCk8TyTdgk
=UxOl
-----END PGP SIGNATURE-----

--AO40I52Xc3kOyr3I--
