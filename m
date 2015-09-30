From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: add all hi6220 uart nodes
Date: Wed, 30 Sep 2015 18:31:45 +0100
Message-ID: <20150930173145.GG15635@sirena.org.uk>
References: <1443558552-5734-1-git-send-email-tyler.baker@linaro.org>
 <1459065.BtzC7pyUYF@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7mxbaLlpDEyR1+x6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459065.BtzC7pyUYF@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7mxbaLlpDEyR1+x6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2015 at 10:24:56AM +0200, Arnd Bergmann wrote:
> On Tuesday 29 September 2015 13:29:12 Tyler Baker wrote:

> >         aliases {
> >                 serial0 = &uart0;
> > +               serial1 = &uart1;
> > +               serial2 = &uart2;
> > +               serial3 = &uart3;
> > +               serial4 = &uart4;
> >         };

> In the changelog you mention "both uarts", but here you have five of them.
> Are they all accessible on the connector? If not, only provide aliases
> for the ones that are, using numbering that makes most sense for given
> how one would use the board.

Unless I'm missing something there's only two UARTs brought out on the
low speed expansion connector (in addition to the one on the solder pads
which is currently supported).  We should also adjust the console
default to match whatever one of the low speed expansion connector UARTs
is being used by the bootloader.

While we're at it there was a recent talk which mentioned a fairly large
amount of functionality that's apparently already "upstream" for this
device but not included in the DT, assuming that means that driver
support is there it would be good to add the corresponding DT.

--7mxbaLlpDEyR1+x6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWDByAAAoJECTWi3JdVIfQsEsIAIYph8A2pjpoXs07RXPchvYF
Gz2pf11gG5lcwzDdYtVdZdXyBMSg5oOlC4jGEwcEmgZ/RNVS7DGk9r961ZWuibUG
Bkx2Hl2q+W4bXLh1t584CmW/IURS9pFdLiJrkiPPlKB9xHJJrRv3OCZHzN2hM5FR
1KgOLvdT6hkmu0wd3PMjtDuCiqzNRXoqUZKbgmyhFVe8jbodvCiUY6nyx2t4IIhZ
qGs0nNeVMXD+Au1vyoLz7UwVuarAFzx75O35UXk1CMTzTiFHZW6m1Qoj/+DuJMWN
wE48XUKmz1F5I1cfBpHCkjdRrkVH7N5aQi1SCfL0Z/YxTgpzuqYoKznbXhFyOU4=
=w6is
-----END PGP SIGNATURE-----

--7mxbaLlpDEyR1+x6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
