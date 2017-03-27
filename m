From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/7] regulator: rk808: Add regulator driver for RK805
Date: Mon, 27 Mar 2017 10:40:46 +0100
Message-ID: <20170327094046.rav53kz5zzujewnx@sirena.org.uk>
References: <1490595705-28844-1-git-send-email-zhangqing@rock-chips.com>
 <1490595705-28844-4-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8353501959017419832=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1490595705-28844-4-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============8353501959017419832==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ozr2dvjsiatex4ic"
Content-Disposition: inline


--ozr2dvjsiatex4ic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2017 at 02:21:41PM +0800, Elaine Zhang wrote:
> Add support for the rk805 regulator. The regulator module consists
> of 4 DCDCs, 3 LDOs.
>=20
> The output voltages are configurable and are meant to supply power
> to the main processor and other components.

Acked-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--ozr2dvjsiatex4ic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAljY3h4ACgkQJNaLcl1U
h9CnAgf/X+oRDps33ZbH8h81NTJpNj/6mB2fa1cg/Aa8wTpr5riDPK0yiqHZkrIy
6II14llV9SURWMY7eLatta/5+VXwnQZSqHdm4mrxZxtJwYR7/mmOCJNtUQuqv33s
S9Es7Rxap8epQ2+Q/bajkYYXjU6/5mCnZP8+u+up1R7r85CX/SUbchJc+ye2MLD3
vRsL639Om5aGs5zXDIHNjxhggmDa9wyJkKMpT+HYWUbwCM2NRJWhSNe3bzuPbRfM
Xa1/ZlJf1b9XoPqhxumCOvs4H+okUZJ3B0wzJiiVyF9kuM89MVV8fzojNlnfvW+V
bGbrsYBDUZARUolFaVR8wIoYjacXDg==
=2tAJ
-----END PGP SIGNATURE-----

--ozr2dvjsiatex4ic--


--===============8353501959017419832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============8353501959017419832==--
