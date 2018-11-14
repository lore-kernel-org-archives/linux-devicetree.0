From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v6 1/6] regmap: add a new macro:REGMAP_IRQ_REG_LINE(_id,
 _reg_bits)
Date: Wed, 14 Nov 2018 14:22:15 -0800
Message-ID: <20181114222215.GD2089@sirena.org.uk>
References: <1540894081-31270-1-git-send-email-tony.xie@rock-chips.com>
 <1540894081-31270-2-git-send-email-tony.xie@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5771941759502530252=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540894081-31270-2-git-send-email-tony.xie@rock-chips.com>
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
Cc: mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, huangtao@rock-chips.com, heiko@sntech.de, devicetree@vger.kernel.org, sboyd@kernel.org, zhangqing@rock-chips.com, linux-kernel@vger.kernel.org, xsf@rock-chips.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, chenjh@rock-chips.com, lee.jones@linaro.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============5771941759502530252==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zokm/imjT5TjLIDZ"
Content-Disposition: inline


--zokm/imjT5TjLIDZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 30, 2018 at 06:07:56PM +0800, Tony Xie wrote:
> if there are lots of irqs for a device and the register addresses for these
> irqs is continuous, we can use this macro to initialize regmap_irq value.

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-irq-line

for you to fetch changes up to 43fac3238c1d9363b2a93d8d56c2be0c29c64e6c:

  regmap: add a new macro:REGMAP_IRQ_REG_LINE(_id, _reg_bits) (2018-11-14 14:20:45 -0800)

----------------------------------------------------------------
regmap: Add an IRQ_LINE macro to help defining regmap-irq tables

----------------------------------------------------------------
Tony Xie (1):
      regmap: add a new macro:REGMAP_IRQ_REG_LINE(_id, _reg_bits)

 include/linux/regmap.h | 6 ++++++
 1 file changed, 6 insertions(+)

--zokm/imjT5TjLIDZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvsoBYACgkQJNaLcl1U
h9AohQf8DKOpuLYQeprG6Yd0xJvtsXz1Ktv2508YsUJgX45xIZTt1Svw88D8+xhB
9t2feqe8HSskGnQ2PU9ecDAGYMcUqzfaAp+3EvVynZme+tENOZRT5oAJpQjOw3mI
6rZadavHxlGyLoVuCXJC3hdpu1dsjoclMWX0aYVLTGun631DCHya8ubJSX7Qu+4Y
5AZNvT4GPCEUaHNmEi6Dr8eZH4oxlIec2NqmV1CsHUTsOf+XCKwpIVlzP7eEKNj0
WPZ4ZYO0TVbqfXgXlV2/hajafjF3q3GabrJwreD8T/+ZbnrwuHGqSsXGblK37IGp
Qm8ZZIpLs4N3BxadCAl/7jMJYHsQMw==
=KajA
-----END PGP SIGNATURE-----

--zokm/imjT5TjLIDZ--


--===============5771941759502530252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5771941759502530252==--
