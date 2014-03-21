From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: topology: Make it clear that all CPUs need to be
 described
Date: Fri, 21 Mar 2014 13:39:17 +0000
Message-ID: <20140321133917.GQ11706@sirena.org.uk>
References: <1395320374-29576-1-git-send-email-broonie@kernel.org>
 <20140321133202.GQ23372@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XM7A/tkezi/Jef8o"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140321133202.GQ23372-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--XM7A/tkezi/Jef8o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 21, 2014 at 01:32:02PM +0000, Mark Rutland wrote:
> On Thu, Mar 20, 2014 at 12:59:34PM +0000, Mark Brown wrote:

> > -Any other configuration is consider invalid and therefore must be ignored.
> > +The nodes describing the CPU topology (cluster/core/thread) can only
> > +be defined within the cpu-map node and every core/thread in the system
> > +must be defined within the topology.  Any other configuration is
> > +consider invalid and therefore must be ignored.

> s/consider/considered/ (or drop the word entirely?).

Yup (that's a preexisting thing in the text that got reflowed).

--XM7A/tkezi/Jef8o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTLEEBAAoJELSic+t+oim9xSUP/1nSq2UTcGEQKvEGzwZW3WaM
0p9VulnEgx5jBPPjzFE/Qo3qMsA4Bj8S3U6pESkrHRVqSvsZ1RrKfUiY5wWkEiZZ
vY5ObhN0rDYFrISFPPABF51BTZ2XsS7jP3RYwhcBqGfFSDg+fonuVd5o+ueWVlHi
Q61OM3wiybDJjAT6QS7yrLBahioyUy+6xVcuD9OnHpW4/A+t27vHYx2BObxlhiJW
p26Nj7xU3tDsdD1fQnrNXF81RjjYGthzl7nUPW7lZmEJGgWwGpLD7gMTLNBQpMMT
1wocUNqZk5YzHrS3FmV5Uz2UQnIo2jqu46eoQjOBbAcOIdFzCtObgXx4Jfz9uLAz
xPU/erXzTi7Dtn6rdspY0xiMIoIp4NQgnV1q4zSV3V3bS51dTEf0A/Gdtjl6KZHt
CJSYac+1+UbDhYHWOhy1uqmVX5FUOlmKqreY06MygkjGw+b3Yc41DpppVUZygUPK
WGGDV8TV4ZTDsFVqFOBrOQxsftUyQTU35nuwiI13v9DUJ2V+X4AbPsjBIm7d8O7+
zD4PfLYXj5vO8CfBggVJZKCm9Og5XPltn/5HxXdBp5AreQ3yBwS7osQp2irUtC1d
h6DlpGE/ug8wPjlgrSTfy5nnwiIeQkihgBST+b7d27bIoOo87noBEnPfGHCY2wfU
Cn4OHlfjjArmfBGvD4Cb
=Yq1Q
-----END PGP SIGNATURE-----

--XM7A/tkezi/Jef8o--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
