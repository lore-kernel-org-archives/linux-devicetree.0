From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 1/2] i2c: designware: use module_platform_driver
Date: Tue, 18 Jun 2013 18:27:11 +0200
Message-ID: <20130618162711.GG7718@katana>
References: <1370918230-24793-1-git-send-email-zhangfei.gao@linaro.org>
 <1370918230-24793-2-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5473805318291936015=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1370918230-24793-2-git-send-email-zhangfei.gao@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, baruch@tkos.co.il, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5473805318291936015==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MrRUTeZlqqNo1jQ9"
Content-Disposition: inline


--MrRUTeZlqqNo1jQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 10:37:09AM +0800, Zhangfei Gao wrote:
> Instead of use platform_driver_probe, use module_platform_driver
> To support deferred probing
> Also subsys_initcall may too early to auto set pinctl
>=20
> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> CC: Baruch Siach <baruch@tkos.co.il>

Basically OK, but please resend for 3.12, so we get enough testing
before entering mainline. I am a bit anxious of side
effects and 3.11 is too near.


--MrRUTeZlqqNo1jQ9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRwIpfAAoJEBQN5MwUoCm2ZQcP/03Q4zJRDyyT3+At4MPXITuE
LB27CizN62ltk0Yvdsh2Qt4waq88Ch8/EtEL71BWP0wlQzBG2KGnpGPc2Zz5n8tZ
irlP3kuDEUdCTSOMesppic71Ltl6+pKhgRqXrO71M7VmSqQ7ddpIV83NbtTKis+1
XjvbHwNnRqv4tZAB5xWV28y/ScdHe6lAJ1LR+xmu/hXFIRq1WoCKMnNacQkHIoK+
Z4VH23gb3o4ousfLlSLZlb/e3KIWnm4yBcJbCMRnHzM58XO0/pj/uN5O8LIf0BYf
bZrKYG/BXFUytiFsd/GItDIn1y+vtSNB4TQgu2aCjrbLKWxiJRscnUfrb/lMn05g
oUelDUUZuFokrQ/ZMWr7kLKKG61xB/EfPpH8nUYBc3WRNMU74Jt2zX8e82pUGXRd
MmFukhkyC0zQdYpI4xS0F0IU5D949u5P3QcvPCL7hDCn6LYByFZEsKo4uf47RzYR
gkCbGpqcx6IZh8RsuJu/T97U1nTukVE3/zykdLquub3kovtpHZCB5isGbIoSh9ei
m+WKojc0BJyxozHgxsMK/L28rJCpqib85sd/9IQzJ0iZaSDKWAPZnPBpO+mfEDRM
kd3mfC8GaFmgDEw4e06b2qA9152o+U1/iTtVbaLiNZ4XFrPzPx5UukfQKXJcTQJ7
uQajYdXJ/ywn66a5rsCC
=9Ywo
-----END PGP SIGNATURE-----

--MrRUTeZlqqNo1jQ9--


--===============5473805318291936015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5473805318291936015==--
