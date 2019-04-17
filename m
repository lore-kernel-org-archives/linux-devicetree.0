From: Eric Hyeung Dong Jeong <eric.jeong.opensource@diasemi.com>
Subject: RE: [PATCH V1 3/3] regulator: slg51000: add slg51000 regulator driver
Date: Wed, 17 Apr 2019 11:25:29 +0000
Message-ID: <VE1PR10MB288069C2FC4B6F79AE8F26A891250@VE1PR10MB2880.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1555389447.git.eric.jeong.opensource@diasemi.com>
 <5e4a6a007e45feac6d35203305cafd865be48755.1555389447.git.eric.jeong.opensource@diasemi.com>
 <20190416152448.GC4834@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416152448.GC4834@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Eric Hyeung Dong Jeong <eric.jeong.opensource@diasemi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Wednesday, April 17, 2019 12:25 AM +0900, Mark Brown wrote:
=20
> On Tue, Apr 16, 2019 at 01:37:27PM +0900, Eric Jeong wrote:
>=20
> > +static int slg51000_regulator_is_enabled(struct regulator_dev *rdev)
> > +{
> > +	struct slg51000 *chip =3D rdev_get_drvdata(rdev);
> > +	int ret, id =3D rdev_get_id(rdev);
> > +	unsigned int state;
> > +
> > +	ret =3D regmap_read(chip->regmap, es_reg[id].sreg, &state);
> > +	if (ret < 0) {
> > +		dev_err(chip->dev, "Failed to read status register(%d)\n",
> > +			ret);
> > +		return ret;
> > +	}
> > +
> > +	if (!(state & SLG51000_STA_ILIM_FLAG_MASK) &&
> > +	    (state & SLG51000_STA_VOUT_OK_FLAG_MASK))
> > +		return 1;
> > +	else
> > +		return 0;
>=20
> This looks like it should be a get_status() operation as it's reading
> status bits rather than the command we sent to the device - for that
> just use regulator_is_enabled_regmap().

I thought that it needs to return current status of a regulator when the fu=
nction is called.
I am wondering that the *is_enabled()* function is just to check=20
If a regulator has been turned on or not rather than getting current status=
 of the regulator.

Thanks
Eric
