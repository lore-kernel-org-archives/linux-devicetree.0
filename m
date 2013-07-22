From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 01/31] spi: mpc512x: cleanup clock API use
Date: Mon, 22 Jul 2013 15:09:04 +0100
Message-ID: <20130722140904.GU9858@sirena.org.uk>
References: <1374166855-7280-1-git-send-email-gsi@denx.de>
 <1374495298-22019-1-git-send-email-gsi@denx.de>
 <1374495298-22019-2-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5277476896289759578=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374495298-22019-2-git-send-email-gsi@denx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Mike Turquette <mturquette@linaro.org>, Detlev Zundel <dzu@denx.de>, Wolfram Sang <wsa@the-dreams.de>, David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Mauro Carvalho Chehab <m.chehab@samsung.com>
List-Id: devicetree@vger.kernel.org


--===============5277476896289759578==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yKucn/VR3FthLjAA"
Content-Disposition: inline


--yKucn/VR3FthLjAA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 22, 2013 at 02:14:28PM +0200, Gerhard Sittig wrote:

> +	ret = clk_prepare_enable(clk);
> +	if (ret) {
> +		devm_clk_put(dev, clk);
> +		goto free_irq;

The main point of the devm_ APIs is to avoid the need for explicit
freeing so you should just remove these puts.

--yKucn/VR3FthLjAA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR7Tz9AAoJELSic+t+oim98nsP/27loR3uzD6vU4Iq6PIP9XrZ
oeTT4jiRvolsbAQ2b8FnWtJYqf61S/ql+yHFvous9eeIWHiYCQZgu+1QYy5DeUwG
IyG9qGrrFGa8rZS+VnXxPUOFjmgYkxmadQN/tvnqM0TJnfRoM2x77MODjJ65d1Yf
wjIFjwUGKY4c/CkhMDD3eglA4jyXE94uLZ1gU1EByw3RTtdpTBcZirBY3kuxE3Sk
kEOyLgAEzIUfgHLQBYk+Uv3REwkxJJboZdcNx9G9fnY6mz9YVEvis+DhJzhZEd6u
syAcYSoZwNSPhtd2IfpclQSF9illzIHPHkoSxm+nFaUv41phl1A9iWmkEgHzd0Rn
paFBjdbDXOg884mzUzdbcZnTsroCL89avzGts+YnjgHWTD4ISAdze361e1GVXCTn
yuOaMuLiOyKL8TLI015ICLKj8xKL/mjUhpXfqoDRWipcYSdKbZcwfVTLbGnUXSmU
+zIvwwmt9XXaD4nbKtwqamOL94iEja7WAtVncxPYkpEkM3lT8QDqOfxxDU5VEh6B
SWfiG9pgcJhujsAeoADdvv6d9nt8oOSIlVunWqcaQX8OCKNmU2xz4pf+xpiJcABv
aP3xe5w9y1kbGHZT9JMqOoUYQS4DdTaEimLjTNoITzR/5IGbnmCz9ZmYUKSXYivW
BYhitlq7N2WFm5VQiznq
=yo5g
-----END PGP SIGNATURE-----

--yKucn/VR3FthLjAA--


--===============5277476896289759578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5277476896289759578==--
