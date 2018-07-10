From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] regulator: uniphier: add regulator driver for
 UniPhier SoC
Date: Tue, 10 Jul 2018 18:44:51 +0100
Message-ID: <20180710174451.GE8104@sirena.org.uk>
References: <1531186037-16630-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1531186037-16630-3-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3223342288137316936=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531186037-16630-3-git-send-email-hayashi.kunihiko@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3223342288137316936==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline


--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 10, 2018 at 10:27:17AM +0900, Kunihiko Hayashi wrote:

> +static int uniphier_regulator_enable(struct regulator_dev *rdev)
> +{
> +	struct uniphier_regulator_priv *priv = rdev_get_drvdata(rdev);
> +
> +	return regmap_update_bits(priv->regmap, rdev->desc->enable_reg,
> +				  rdev->desc->enable_mask,
> +				  rdev->desc->enable_val);
> +}

This is just regulator_enable_regmap() isn't it?  Same for disable,
unless I'm missing something (which is possible).

> +static int uniphier_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct uniphier_regulator_priv *priv = rdev_get_drvdata(rdev);
> +	unsigned int val;
> +	int ret = -EINVAL;
> +
> +	regmap_read(priv->regmap, rdev->desc->enable_reg, &val);
> +	val &= rdev->desc->enable_mask;
> +
> +	if (val == rdev->desc->enable_val)
> +		ret = 1;
> +	else if (val == rdev->desc->disable_val)
> +		ret = 0;
> +
> +	return ret;
> +}

This isn't *quite* regulator_is_enabled_regmap() as it explicitly checks
if the disable value is set and errors otherwise which would be a good
fix for that.  Could you do a patch for that?

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltE8JMACgkQJNaLcl1U
h9C0lAf9EN7tiUq+OQLkqrSK5NlvtDJpVLLFZf7YOZnTyPDjYxPlWsJCfEOTkk0g
Sbz0YPx+oeyjNrmrBQR/lbBbyNRmYCHQusBRRpCBuUsIM2Cd425NfHeXoTf7syQX
PYqPNQO0T8X4lc4S6pxppvOI+lqQjQXeIVQ+DXjQZt93jVsjIf7VGzdVVNatYyRe
EcthOmX3lr6C4rDWQqkFTdl1NRqibzWnzA0HRaH4vtNeVarWemNRB6KGVMaTF3Pv
w+Y1iwJSF5H5j/NLRIHgi2IBIbqMmz1EixmxR64YC13MpxAilFv4vJV2s+xLYzZb
OCbVychkBg9G50+dypHDtaIis8qSdA==
=+Iz7
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--


--===============3223342288137316936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3223342288137316936==--
