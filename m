From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 07/10] regulator: mt6358: Add support for MT6358
 regulator
Date: Mon, 5 Aug 2019 14:10:30 +0100
Message-ID: <20190805131030.GE6432@sirena.org.uk>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1564982518-32163-8-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9031348581794275148=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1564982518-32163-8-git-send-email-hsin-hsiung.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Allison Randal <allison@lohutok.net>, linux-rtc@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, Kate Stewart <kstewart@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============9031348581794275148==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xJK8B5Wah2CMJs8h"
Content-Disposition: inline


--xJK8B5Wah2CMJs8h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 05, 2019 at 01:21:55PM +0800, Hsin-Hsiung Wang wrote:

> +static const u32 vmch_voltages[] = {
> +	2900000, 3000000, 3300000,
> +};

> +static const u32 vemc_voltages[] = {
> +	2900000, 3000000, 3300000,
> +};

Several of these tables appear to be identical.

> +static inline unsigned int mt6358_map_mode(unsigned int mode)
> +{
> +	return mode == MT6358_BUCK_MODE_AUTO ?
> +		REGULATOR_MODE_NORMAL : REGULATOR_MODE_FAST;
> +}

There is no need for this to be an inline and please write normal
conditional statements to improve legibility.  There's other examples in
the driver.

> +static int mt6358_get_buck_voltage_sel(struct regulator_dev *rdev)
> +{
> +	int ret, regval;
> +	struct mt6358_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	ret = regmap_read(rdev->regmap, info->da_vsel_reg, &regval);
> +	if (ret != 0) {
> +		dev_info(&rdev->dev,
> +			 "Failed to get mt6358 Buck %s vsel reg: %d\n",
> +			 info->desc.name, ret);

dev_err() for errors here and throughout the driver.

> +		return ret;
> +	}
> +
> +	ret = (regval >> info->da_vsel_shift) & info->da_vsel_mask;
> +
> +	return ret;
> +}

This looks like a standard get_voltage_sel_regmap()?

> +err_mode:
> +	if (ret != 0)
> +		return ret;
> +
> +	return 0;

Or just return ret unconditionally?

--xJK8B5Wah2CMJs8h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1IKsYACgkQJNaLcl1U
h9AMIggAg397SgwCnQsqUm0bErtFXMF3frCb8lQZCc/BOEjOShATbn9igZbM6ZTU
QxQabCCpti0hAUqGHB6ye8q+OlI13w8ShOMg6+VJxOhec2ihBGLtkbhJguoZtfVI
v+cqPZf3DxmDs1QCqMQTHdKK47Zjf2GN7XMEubNifpcWlkAHTcrQ8NGTC+8vGcCj
5Ss9eBuRyAO0c5Z08Nsxh70MhK6FnHzwXDzlaOPDXbQWfxouTBvNLHN2LtGeNLDO
St8mmX2B4jwvOLjItqqhsATzbH+DwoBGSOUtRNFbwIh+/UeZfwpwQJJk5U0FsgwC
4K6rYZLMhm8RQGlTWwS3xPlqirZbvg==
=1DeU
-----END PGP SIGNATURE-----

--xJK8B5Wah2CMJs8h--


--===============9031348581794275148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9031348581794275148==--
