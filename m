From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/5] regulator: rk808: add RK809 and RK817 support.
Date: Wed, 1 Aug 2018 10:25:12 +0100
Message-ID: <20180801092512.GA5509@sirena.org.uk>
References: <1533023850-29004-1-git-send-email-tony.xie@rock-chips.com>
 <1533023850-29004-3-git-send-email-tony.xie@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3757494064456138012=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1533023850-29004-3-git-send-email-tony.xie@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tony Xie <tony.xie@rock-chips.com>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, huangtao@rock-chips.com, heiko@sntech.de, devicetree@vger.kernel.org, sboyd@kernel.org, zhangqing@rock-chips.com, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, xsf@rock-chips.com, lee.jones@linaro.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, chenjh@rock-chips.com
List-Id: devicetree@vger.kernel.org


--===============3757494064456138012==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 31, 2018 at 03:57:27PM +0800, Tony Xie wrote:

> +	default:
> +		pr_warn("%s ramp_delay: %d not supported, setting 10000\n",
> +			rdev->desc->name, ramp_delay);
> +	}

This looks mostly good but I notice that most of the prints in the
driver are pr_ rather than dev_ ones - using dev_ is better as it allows
people to see which device was affected.

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlthfHcACgkQJNaLcl1U
h9C8Igf/dgHh7kVnRuWvWyT7b/+8mMS+HNtVuTBMtiUf5textB9vCDqH+oOZoZE/
2PEPQccsJdhF2tkxfuArUQtY8lxO7BQFu3HFxD70ROweX9CfuvfnJBVDAw094Wx6
Z4G8HLLp0WqLiqSdGvASehN8jspMmWRkV4ucf6ED/yUjGKZMUf3ow7cwgfg2e6S/
It4Yp/5Z4QrXpQchKhRWYvJZ6xAbtGevKaEvjBWegj7L9vFJTZn1uSJJeDrrnste
b0I0q4MUN6cfgQwYFK8JeBLvJWkmAC4bBQYv0ulDzboDtRB5VcP6WnjnDiWHBCnj
G39mcKBy/R9YlALxB1kxGxp2Aj3Y9g==
=3sW2
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--


--===============3757494064456138012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3757494064456138012==--
