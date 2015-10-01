From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: add all hi6220 uart nodes
Date: Thu, 1 Oct 2015 11:21:36 +0100
Message-ID: <20151001102136.GC12635@sirena.org.uk>
References: <1443558552-5734-1-git-send-email-tyler.baker@linaro.org>
 <1459065.BtzC7pyUYF@wuerfel>
 <20150930173145.GG15635@sirena.org.uk>
 <CANMBJr7yY1PJChnFSRknqfOLORuWZSEONV+e=M=9heX3i-ADKA@mail.gmail.com>
 <20150930191818.GZ15635@sirena.org.uk>
 <CANMBJr6aU4wPO5HqP-Oh-ND7_DZXSH30ykNHyvDtUp3nQFG6sA@mail.gmail.com>
 <20151001031552.GC15675@leoy-linaro>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151001031552.GC15675@leoy-linaro>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kevin's boot bot <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2015 at 11:15:52AM +0800, Leo Yan wrote:
> On Wed, Sep 30, 2015 at 04:54:51PM -0700, Tyler Baker wrote:
> > On 30 September 2015 at 12:18, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > > My understanding is that it applies to both with slightly different
> > > driver sets, the slides aren't online yet (!) but if you look at 10:52
> > > or so in the video we should have SD/eMMC on HiKey in v4.1 with thermal
> > > and CPUfreq added in v4.2.  It also looks like there's just some DT
> > > additions needed to enable reset, cpuidle and CPU hotplug using generic
> > > code (mainly the constants for PSCI I expect).

> > I just skimmed the video and I see your point. I'll need to
> > investigate a bit but I'm up for sending some follow up patches to get
> > these drivers functioning. First lets get the UART working :)

> If you think it's necessary, i could send out patches to enable cpuidle
> firstly (actually now PSCI has been enabled yet); for cpufreq and
> thermal features, need wait until mailbox driver has been merged.

It seems sensible to get the DT bits for functionality that is already
supported on the driver side upstream, that way we get the maximum
functionality available as soon as possible and even if other bits get
problems in review users can take advantage of things that are OK.

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWDQkvAAoJECTWi3JdVIfQ8PMH/1UL+GI8R3sqiwzKXeXRRTh8
1scdra4aREBsIYrkZ9h48Nfj3ZA4SmewQ9/R9WgRQdzG0GCBNj0lRYLQODzkB5F9
sLz5TvFa0CYdoot/HaMPoxxCRr9kJqBODHyuBnBTFsaeD2iQeSRi+234i3cuJCvq
cBXhDrHuj2l561t88CuASoLesXu2vg2nbH3k6keN7An0AwDNSNQ0vOJbGVQ5rubd
pV9++H6PTJuCIl98WPQv/D6ufbSV2BISTjXAHHwwZGS6i09Kb1DZZxXdL7Hu+Fqg
U1wGbxATJANQlNnSfvdifJNnLffIMQTupDgSAJtUP+UNIkfHeFNhnyF3+1MLvjo=
=UXiZ
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
