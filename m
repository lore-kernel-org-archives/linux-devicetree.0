From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv0 3/3] rtc: rtc-isl12057: add alarm support to Intersil
 ISL12057 RTC driver
Date: Thu, 6 Nov 2014 05:50:17 +0000
Message-ID: <20141106055017.GL8509@sirena.org.uk>
References: <cover.1415222752.git.arno@natisbad.org>
 <148403c0ab1d556cbb99d9242c65f714a77843e5.1415222752.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RNGrj7vazCqBHNw7"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <148403c0ab1d556cbb99d9242c65f714a77843e5.1415222752.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
List-Id: devicetree@vger.kernel.org


--RNGrj7vazCqBHNw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2014 at 10:42:52PM +0100, Arnaud Ebalard wrote:

> +static int _isl12057_rtc_toggle_alarm(struct device *dev, int enable)
> +{
> +	struct isl12057_rtc_data *data =3D dev_get_drvdata(dev);

I can't help but think that toggle is a confusing name for this.
enable?

> +	ret =3D regmap_update_bits(data->regmap, ISL12057_REG_INT,
> +				 ISL12057_REG_INT_A1IE,
> +				 enable ? ISL12057_REG_INT_A1IE : 0);
> +	if (ret)
> +		dev_err(dev, "%s: writing INT failed\n", __func__);

It's generally helpful to log the error code as well.

> +static int _isl12057_rtc_read_time(struct device *dev, struct rtc_time *=
tm)
>  {
>  	struct isl12057_rtc_data *data =3D dev_get_drvdata(dev);
>  	u8 regs[ISL12057_RTC_SEC_LEN];
>  	int ret;
> =20
> -	mutex_lock(&data->lock);
>  	ret =3D regmap_bulk_read(data->regmap, ISL12057_REG_RTC_SC, regs,
>  			       ISL12057_RTC_SEC_LEN);
> -	mutex_unlock(&data->lock);
> -

This is a perfectly sensible change (there's no need for the lock,
regmap locks the physical I/O and there's no other interaction) but it's
not related to enabling alarm functionality so should be in a separate
patch.

> +static int isl12057_rtc_read_time(struct device *dev, struct rtc_time *t=
m)
> +{
> +	struct isl12057_rtc_data *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	mutex_lock(&data->lock);
> +	ret =3D _isl12057_rtc_read_time(dev, tm);
> +	mutex_unlock(&data->lock);

Why lock?  I guess this is due to the above change but it seems better
to just not lock since it's redundant.

> +	ret =3D rtc_tm_to_time(&rtc_tm, &rtc_secs);
> +	if (ret)
> +		goto err_unlock;
> +
> +	ret =3D rtc_tm_to_time(alarm_tm, &alarm_secs);
> +	if (ret)
> +		goto err_unlock;
> +
> +	/* If alarm time is before current time, disable the alarm */
> +	if (!alarm->enabled || alarm_secs <=3D rtc_secs) {
> +		enable =3D 0;

Shouldn't there be some margin for time rolling forwards when checking
for alarm times in the past (or just refuse to set them, I've not
checked if this is following existing practice for RTC drivers)?=20

> +	if (client->irq > 0) {
> +		ret =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +						isl12057_rtc_interrupt,
> +						IRQF_SHARED|IRQF_ONESHOT,
> +						DRV_NAME, client);
> +		if (!ret) {
> +			device_init_wakeup(&client->dev, true);
> +		} else {
> +			dev_err(dev, "irq %d unavailable, no alarm support\n",
> +				client->irq);
> +			client->irq =3D 0;
> +		}
> +	}
> +

None of the alarm functionality checks to see if there's actually an IRQ
- is that OK?  I'd at least expect the alarm interrupt enable call to
check if the interrupt is wired up.

It's also bad form to overwrite client->irq - it's possible a future
probe might work (eg, if the driver for the interrupt controller gets
loaded).  Ideally we'd handle deferred probe, though I don't think the
interrupt core supports that yet.

> +err:
> +	if (client->irq > 0)
> +		free_irq(client->irq, client);

The whole point with devm_ is that you don't need to manually free
anything, remove this (and the entire remove function).

--RNGrj7vazCqBHNw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUWwwYAAoJECTWi3JdVIfQloQH/iR7Sd0b2+ISj0s9JiEyeyX+
9+YEwfHE8xnHgAaTxwuvUdIabuk1Y/50u3QiOHqn89Q3rb4Cg/laK0XXYM3XwolA
9OPjgxveWUeu6D04dhs9Sh6TgG4Cp6XVBmShy3kbHKK3GW4ZDGpT3mvrBW4rQ4Mh
WPe1vuDFGgFwAqFt13DmvXuYEKs4eHSni/f7Wt5U4zaFZs+eznTZwB8SALZ06Gp8
SdHnOkLplUF7oHjlTfusu0jLQNhvjxTDHz4rCObSumRTG34URBBR+NWFxbaKwD+Q
ZwLNmRf5WRS+A1LYYODuA1fTjb/nZPSnTM69JegXK05PJ2hukbdfF1wNsKqgDIg=
=pNIy
-----END PGP SIGNATURE-----

--RNGrj7vazCqBHNw7--
