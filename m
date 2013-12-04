From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Wed, 4 Dec 2013 18:43:45 +0000
Message-ID: <20131204184345.GA29268@sirena.org.uk>
References: <20131127172806.GC2291@e103592.cambridge.arm.com>
 <20131128203322.GB14689@mithrandir>
 <20131128211009.GA26447@obsidianresearch.com>
 <20131128222232.GF14689@mithrandir>
 <20131128233147.GA19387@obsidianresearch.com>
 <20131129023554.GA14239@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i6UfSqW8aw8u8VxJ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131129023554.GA14239-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--i6UfSqW8aw8u8VxJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2013 at 06:35:54PM -0800, Greg KH wrote:
> On Thu, Nov 28, 2013 at 04:31:47PM -0700, Jason Gunthorpe wrote:

> > Greg's point makes sense, but the HW guys are not designing things
> > this way for kicks - there are real physics based reasons for some of
> > these choices...

> > eg An all-to-all bus cross bar (eg like Intel's ring bus) is engery
> > expensive compared to a purpose built muxed bus tree. Doing coherency
> > look ups on DMA traffic costs energy, etc.

> Really?  How much power exactly does it take / save?  Yes, hardware
> people think "software is free", but when you can't actually control the
> hardware in the software properly, well, you end up with something like
> itanium...

If you look at the hardware design decisions this stuff tends to be
totally sensible; there's a bunch of factors at play (complexity, area
and isolation tend to be other ones).  There's a lot of the stuff that
we're complaining about where they can reasonably question why this is
so complex for us.  That doesn't mean that everything that it's possible
to do is sensible but there's definitely limitations on the kernel side
here.

> > > code to deal with those descriptions and the hardware they represent. At
> > > some point we need to start pushing some of the complexity back into
> > > hardware so that we can keep a sane code-base.

> > Some of this is a consequence of the push to have the firmware
> > minimal. As soon as you say the kernel has to configure the address
> > map you've created a big complexity for it..

> Why the push to make firmware "minimal"?  What is that "saving"?  You
> just push the complexity from one place to the other, just because ARM
> doesn't seem to have good firmware engineers, doesn't mean they should
> punish their kernel developers :)

These firmwares have tended to be ROMed or otherwise require expensive
validation to change for sometimes sensible reasons, keeping the amount
of code that's painful to change low will tend to make people happier if
a change is needed.  Most people like the risk mitigation.

--i6UfSqW8aw8u8VxJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSn3feAAoJELSic+t+oim9J5YP/i9uVW3el3f9Jar3w/kP709N
+ACS0JRZwJNkYeHftxZAwFuufDqrfbfbd/LRyGKTCLuoMOakrkWrX4NSx6sId+kX
OCqT/zBsndsOVSjEY6EBcIQebEqYU94s1A1f3yn2lRNrkxTZMOGzNslBwpIQflHL
JcaXTVm7NReLgY1l4xHpJW5YLoNbq+h6Gq0EAsYLc7gJl8u9jAT3x7zJD2cY58iO
9mJxhQmq7FuvItlhIrgUABd5K95hw8RGA4dkx3yJNXDww1m8H213XjzVdcVhngbq
UZVuQLum2iWFS+uJTdtGIlleqhf+guTbs+1MHO9FpEbllk6379yoTHM/824dOe/M
emZFelu5mgjvibvrbskYTaYcknrszcFvmhyWJJd2hdB67hMeyi29VYX3EW+nVUAT
PlwqnxE4NskhyldCBINSK6FK17RMoXMsPZsa0RzpDbcgtvVVmhWECnTIbJ8W7w6L
0hXSMOBndhf8LmP3Ru5cL0KqU5CPKDeCHG9py5IdYwFbIRUHnJeX4nSUgtj/1yHi
J5E0g0EbVlwfufxX5WB1nETD2CGgPFHOgxrkt+v9/enXyCq3Ig9t1MACROb+TyB0
hLHRuR2UnozUkNU6nZLIJ9pSKYkn9DWR6b0qDS9cr87T/AIG94BMZeahuWzW4otW
JrO74dZ27F5xacT8jC3V
=etWJ
-----END PGP SIGNATURE-----

--i6UfSqW8aw8u8VxJ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
