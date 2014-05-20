From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] mfd: bcm590xx: add support for secondary I2C
 slave address
Date: Tue, 20 May 2014 20:00:55 +0100
Message-ID: <20140520190055.GQ12304@sirena.org.uk>
References: <1398295293-11033-1-git-send-email-mporter@linaro.org>
 <1398295293-11033-3-git-send-email-mporter@linaro.org>
 <20140428115627.GY21279@lee--X1>
 <20140428140910.GB7719@beef>
 <20140520161131.GB32025@lee--X1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iIhT97GgYK2U/ufG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140520161131.GB32025@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--iIhT97GgYK2U/ufG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 20, 2014 at 05:11:31PM +0100, Lee Jones wrote:

> > > >  drivers/mfd/bcm590xx.c       | 60 +++++++++++++++++++++++++++++++++-----------
> > > >  include/linux/mfd/bcm590xx.h |  9 ++++---
> > > >  2 files changed, 52 insertions(+), 17 deletions(-)

> > There's cross-deps so the regulator driver will need to go with it.
> > Mark mentioned earlier in the thread that he wanted to merge through
> > the regulator tree though.

> Still nothing.

> Mark,
>   Can I apply this set and supply you with a pull-request?

Can someone please send me whatever it is you want me to look at, the
above diffstat doesn't look relevant.  Given the frequency of respins
I'm not always paying a huge amount of attention to MFD serieses which
look like they're going to be resent.

--iIhT97GgYK2U/ufG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTe6ZkAAoJELSic+t+oim9macP/1SDPc5vEwbgigR+RZ8Iz+2E
cF15aMsrSLbaBIzM79XSZ05LxG2V22ITglXBSZFjhrzMP7mF3Ux0Z1rQ4tWdm9nr
KP8L0O/GU/FfBMM7Dyz8935CqS26yzrbQrC1WHNNpV+w8PhSu4vgRBNGFhLd3Oqi
LwvU9GJhE0lOXTCFAwLWcC1ljgD9OyeSbhcLlWF9TkA04lDDqtpmvGJkFJ6n/8lS
w7Po9P2vxaRPP6hEGrV17Nulouhs1bPcCLQ97B2z00tsCJGFVEO+7VfQrsYttygz
oX51Mcg8AeJNYQ2eSzM/OqAyiiIqGotXkATSYaEY27ZVk6TAConF1Kz7w1pj/ZHh
0XF+9ERjch2PYydjTmCMkDM0RnlBEwgq7tEBlLLk9c+IMCOx3WN4fix5VadKYj+D
PZ0fsFEanr/aoqsNsXXIP+O8ne3hH345W85QpeMBs7DxXmD4XhKApa7ok5HOV8Pf
K2IC0jU3HDTmyVIl2jzJJcbZjD71/zSYu909BjqGWL3NJJY12Iv2ShwAAVCOEE0Y
QlsKOGL1VM5yZXa0XPThh/1rspamdISrclqj3IgGBD1njq9bBrCrHeABLl1j/EfF
9ddG3u/4KOJ/pJHkD23i4iXsDkCwccUPbkhFmouM2Jd8TXfgbWlNJWn5SV7F56th
r7JnUU+zYmN8vsIBgH5i
=sFbm
-----END PGP SIGNATURE-----

--iIhT97GgYK2U/ufG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
