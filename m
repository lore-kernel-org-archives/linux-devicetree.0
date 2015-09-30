From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: add all hi6220 uart nodes
Date: Wed, 30 Sep 2015 20:18:18 +0100
Message-ID: <20150930191818.GZ15635@sirena.org.uk>
References: <1443558552-5734-1-git-send-email-tyler.baker@linaro.org>
 <1459065.BtzC7pyUYF@wuerfel>
 <20150930173145.GG15635@sirena.org.uk>
 <CANMBJr7yY1PJChnFSRknqfOLORuWZSEONV+e=M=9heX3i-ADKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YPAu9GJT3m1iC0FS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANMBJr7yY1PJChnFSRknqfOLORuWZSEONV+e=M=9heX3i-ADKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Kevin's boot bot <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--YPAu9GJT3m1iC0FS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2015 at 11:12:58AM -0700, Tyler Baker wrote:
> On 30 September 2015 at 10:31, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> + Peter as he has been submitting u-boot patches recently for the HiKey.

> Obviously, both UEFI and u-boot can be configured to use either UART,
> and at the moment u-boot defaults to using the on board UART. Whereas
> UEFI is using UART1 on the LS connector. I'm fine with switching the
> console default to use the UART1 on the LS connector as long as there
> is agreement to do so.

Given that UEFI is switching and the requirement for soldering to get to
the on board UART it does seem to make sense, though it will create some
pain for current users.

> > While we're at it there was a recent talk which mentioned a fairly large
> > amount of functionality that's apparently already "upstream" for this
> > device but not included in the DT, assuming that means that driver
> > support is there it would be good to add the corresponding DT.

> Indeed, I think this comment is targeted to toward the d410c though as
> there are drivers for eMMC, and microsd drivers upstream but no DT
> bindings. I do not believe currently this is the case for HiKey.

My understanding is that it applies to both with slightly different
driver sets, the slides aren't online yet (!) but if you look at 10:52
or so in the video we should have SD/eMMC on HiKey in v4.1 with thermal
and CPUfreq added in v4.2.  It also looks like there's just some DT
additions needed to enable reset, cpuidle and CPU hotplug using generic
code (mainly the constants for PSCI I expect).

--YPAu9GJT3m1iC0FS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWDDV5AAoJECTWi3JdVIfQ9y8H/RU3WROzGKt08qXiArUrWZGy
wNnkhzWN5Mh5jemZQGaZRQQ6rzBkEgfUuPLAeh6FFejMUB+J//R4klHteVE3z5v6
F9tUe5rmPe/GIeLixGBSCqzQJXHrYVJ9CGlSzIyrUqxDGyvLPIFckdDhCJ4eeyXr
8McMebxqhWb0ZpVR5RUw/JvPqtY+Xbd+dLwoOXeF/QxbGJCQCE4PYu7Q0wYOFxug
ACwNFFVrDFnTNmhem1sI8kr/9bbAyxjcyO6uJm6XifkYR2j5yPOXVv+w49FYhlxU
64JOg31fWIW17f3LgFAIzVZ+f7x9jD/UmgFmpLw3Ny3tvrE3YWZHNBnoHXxzKN0=
=KD/Q
-----END PGP SIGNATURE-----

--YPAu9GJT3m1iC0FS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
