From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: add all hi6220 uart nodes
Date: Fri, 2 Oct 2015 17:48:36 +0100
Message-ID: <20151002164836.GS12635@sirena.org.uk>
References: <1443558552-5734-1-git-send-email-tyler.baker@linaro.org>
 <1459065.BtzC7pyUYF@wuerfel>
 <20150930173145.GG15635@sirena.org.uk>
 <CANMBJr7yY1PJChnFSRknqfOLORuWZSEONV+e=M=9heX3i-ADKA@mail.gmail.com>
 <20150930191818.GZ15635@sirena.org.uk>
 <CANMBJr6aU4wPO5HqP-Oh-ND7_DZXSH30ykNHyvDtUp3nQFG6sA@mail.gmail.com>
 <20151001031552.GC15675@leoy-linaro>
 <20151001102136.GC12635@sirena.org.uk>
 <20151002142809.GA13483@leoy-linaro>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bk6L21jbBNK7V1Rv"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151002142809.GA13483@leoy-linaro>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kevin's boot bot <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Bk6L21jbBNK7V1Rv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2015 at 10:28:09PM +0800, Leo Yan wrote:
> On Thu, Oct 01, 2015 at 11:21:36AM +0100, Mark Brown wrote:

> > It seems sensible to get the DT bits for functionality that is already
> > supported on the driver side upstream, that way we get the maximum
> > functionality available as soon as possible and even if other bits get
> > problems in review users can take advantage of things that are OK.

> Okay, i will prepare patches for enabling CPUIdle ASAP.

Excellent, thanks!

--Bk6L21jbBNK7V1Rv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWDrVkAAoJECTWi3JdVIfQTGEH/2qOPRky9SHGfltFQwqSTxPH
cw+VFLt+tXbCMRYNZI/+UTiULaUmF55sbsvPnkpZv9JbGv0lc2Ah/ioIaV4JNvQX
yFEXXUxQXibGS21TkJT7Z85C+UgrcaFBRzDqCPSaxN+naE6cbvHaKG+rJcnQx2e1
0XsnfIWr9147KISH+b3EXjRPGnPkhvaSjdpIbzj5CFdxLApGBeAr8wNm7//ElTcG
Azg7HDB8jV7NoFciClYne44Ky91Q3fJWz89kLIHquLiP972TOrFE0jmkDirNrFM6
2Vn+VACDk4izjweO0PJhvKDSnIILojFAEyjklpt9Kt6lPgmnqrgjmeC3UU3L4rs=
=cpN8
-----END PGP SIGNATURE-----

--Bk6L21jbBNK7V1Rv--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
