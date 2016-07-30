From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: add spiX aliases for rk3399
Date: Sat, 30 Jul 2016 02:05:36 +0100
Message-ID: <20160730010535.GO10376@sirena.org.uk>
References: <1468545873-134339-1-git-send-email-briannorris@chromium.org>
 <20160719192912.GA142821@google.com>
 <1841177.NDa9D09EGz@diego>
 <3484113.eKHnDqRbfE@diego>
 <20160729233950.GA102046@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U+NfgObvpQT1Q9Yq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160729233950.GA102046-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--U+NfgObvpQT1Q9Yq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2016 at 04:39:51PM -0700, Brian Norris wrote:

> + Mark

I very nearly deleted this unread based on the subject line...

> I had read that already. I figured that was just rationale for not
> documenting the feature (still silly IMO), and not for avoiding using
> the existing feature.

All in tree aliases provided for SPI buses are strings so if we're doing
anything with aliases we really ought to be parsing them as strings not
numbers (they're people describing the use of buses on their board). =20

I quite seriously am more inclined to remove the numbering functionality
as stands than document it as stands given how many layers of
implementation specifics are required to make practical use of it and
the existing practical use for human readable purposes, all we're doing
is trying to be helpful with some random string we found somewhere and
we don't want to encourage people to do that rather than doing what
they're currently doing any providing human readable names.  We
shouldn't preclude being more helpful if we get better ideas and we
shouldn't encourage people to make bad decisions about identifying
things from userspace.  Or I suppose we could go the way of all
standards and document useful behaviour without implementing it but that
doesn't seem awesome either.

> What is this "label" feature Rob speaks of? Does it exist in practice
> (AFAICT the answer is "no")? The description doesn't seem terrible,

It's a property called "label" which is a standard thing in DT for
providing descriptive labels, if you look in git you can see quite a few
examples for other subsystems.  I'd expect to see it show up in the
string for the device name in place of the numbers (both if used for a
device, the bus number for the bus).  Nobody has written any code yet,
I've never personally found the motivation and nobody sent me any
patches.

> depending on the implementation. Would that become the actual device
> name (i.e., dev_name(dev))? Or just a filesystem symlink? And how does
> one assign such a label?

It should really show up in dev_name() since for most devices it'll be
more likely to show up in a log message than anywhere else.

--U+NfgObvpQT1Q9Yq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXm/1eAAoJECTWi3JdVIfQqTQH/RvyN/P3QMISnk1i8QDTzuhl
sSeL5BVmbNfimG5PCgh7Qd0zmE+zacDEsZ+qBfSUqGYA2jdHB7kVZs1tA0q9B2fV
AwXek/w+h0tDClBpLTmwjShWDm3beKQu8nKSco1pU/8uyvIjyNM8wA9iF6TuuisQ
OR2/xg+jj9ye7Bimc3iRVnvgLP7vnVu3CDNh0jDuYQbZwIdKVi3ejDqCtFUarlSf
TxbCY099YkqlP6GH7lnr5pQSGuu8+CmC6jhasPgRUSnyAQcvkOSev56Sf1F7M3GO
K1Tq5sNMwEkU+t+EQZGbDRH9PClhZomZT1quroimo/amjcOcJWUBqfHxf70l6Oo=
=iVAU
-----END PGP SIGNATURE-----

--U+NfgObvpQT1Q9Yq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
