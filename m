From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 5/6] regulator: mt6358: Add support for MT6358 regulator
Date: Wed, 30 Jan 2019 15:18:25 +0000
Message-ID: <20190130151825.GA10665@sirena.org.uk>
References: <1548839891-20932-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1548839891-20932-6-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4738306183067756951=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548839891-20932-6-git-send-email-hsin-hsiung.wang@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4738306183067756951==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 30, 2019 at 05:18:10PM +0800, Hsin-Hsiung Wang wrote:

> +static const struct of_device_id mt6358_of_match[] = {
> +	{ .compatible = "mediatek,mt6358-regulator", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mt6358_of_match);

There should be no need for a separate compatbile string here - we
aren't describing the hardware any more than we already did with the
parent node for the MFD, we're describing how Linux currently splits the
software that controls the hardware up.  Just have the MFD instantiate
the regulator driver when it probes.

Otherwise this driver looks very good and clean.

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxRwEAACgkQJNaLcl1U
h9Aikgf/Y+gvwbaHHnHQ0m8MNdKRqSYNJudae95ToA35RJTxhcN+utenn65RCAbl
wMdcbp2yfyGBbfGu8AMOG9P+9aF+IIaigPFsLWqo7PMhIz7GwoVW0lqo7viKIXv8
EZe5yLTk9famVTksAOQaDpd3KymoSU5r5keiK+4StsPw3+uc4xAgmOnNrRHBQyCD
1Sjy8egYfQHEKtP0anNEoIqVN6nKGk+cpdXyuTum32aE5P7cUuQrX5sVBVQ+jNlw
kKxIa8Pesrr3VJivGgtrcwIC3UIXEbOPS2MjBKe/qplqeuxqkdfz+3k5DfygC/5T
k0gmxZsGWBc4PlqPX9Q0MLTKsT8h4A==
=iJPx
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--


--===============4738306183067756951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4738306183067756951==--
