From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Wed, 23 Oct 2013 20:59:10 +0200
Message-ID: <20131023185909.GC7863@ulmo.nvidia.com>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <5267FA58.9050002@wwwdotorg.org>
 <20131023172001.GA3379@katana>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023172001.GA3379@katana>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 06:20:02PM +0100, Wolfram Sang wrote:
>=20
> > Do we really want to polute the drivers and DT files with a ! in the
> > compatible values? I thought we'd considered that, but chosen having the
> > drivers that use unstable bindings depend on a Kconfig option as an
> > alternative, not an additional step?
>=20
> I'd even go further and use "unstable-" as the prefix instead of "!"
> which is way more explicit.

I guess unstable- is as good as anything. I personally think that "!" is
disturbing enough to the eye to make it abundantly clear that something
is fishy.

> > The one issue with doing this is that if a binding is thought to be
> > unstable, but becomes stable later without any changes, we'll have to do
> > busy-work to remove the ! in all the DT files, thus artificially
> > introducing an incompatibility. Perhaps that's fine though?
>=20
> I'd say yes. Going from unstable to stable is quite a step for a binding
> and that should be visible and worth a patch IMO. Also, when looking at
> a DTS file or some driver code, it will avoid
> confusion/misinterpretation if one can see immediately the status of a
> binding.

Yes, I fully agree. It might look like churn, but I think this could
actually be a part of the formal process to stabilize a binding. It
would be final step of that process, actually.

Thierry

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaBx9AAoJEN0jrNd/PrOhEIUP/0nNAlgicFic5yEHsKXpdt4a
XVyACFK7h/XI+X6BnrOGUEF6qlIB8VanOtcxWVYdhws2LcPZ59gM9o+AoCC98UQP
hoASd3BPQSv4MlkjO0cD22DkYUICSGhKFEv5WpFEP7vdeYh/Yk7dWbQpVNdTv/j3
gkn32X2c7FVbzU3wiStS3YECm96x7+0Ue37GzOs83AnDdMC6e4+H3NeOyuDhR1Bn
8XnO95Hsv2tPMjGqa5lA7b8NaGJ5ZuglXU0IQHw6DGJQbUTp6EBQyxNcmfGIDQWM
1/tM/mT67Le/qwJRXFL5lO8Y8a1PZ4+C2IAERCdYM4qLn+tVe5E/CfqAjE9qR/Oi
frEoBw2ZnTvM31K5TQk5EV047yb8pJPFVBbPGhrxhOB6waK+bnKcEoaXWLKpLieL
s71Ql6hJjxLTOEPs0eEEg5UivIzBYu+yVjh1qYm3MCUgKZH1lAejOVY4rokoOkCH
kWcCU7Jopbe8rxS5yq7nBguGNFitTSuI8pW2D+ajgjgMt5JTr1NAa/RmqBF/WHF3
3Z2TSl9N8nAYF7KqCIRfYVVkfsk0bWD+0t73KZIcOa8DoNgBowFPwoYiPIU3ATE/
x8QiV3hDHsKKaKyavYJkZ1LxKiU0JUoRuEhuAfJ34Y1SraPje/dukmZ1FkJqVYqf
KZBoLXC0I/UjuAZHerHk
=Nzad
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
