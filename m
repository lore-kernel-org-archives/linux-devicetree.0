From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Wed, 23 Oct 2013 18:20:02 +0100
Message-ID: <20131023172001.GA3379@katana>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <5267FA58.9050002@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5267FA58.9050002-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Do we really want to polute the drivers and DT files with a ! in the
> compatible values? I thought we'd considered that, but chosen having the
> drivers that use unstable bindings depend on a Kconfig option as an
> alternative, not an additional step?

I'd even go further and use "unstable-" as the prefix instead of "!"
which is way more explicit.


> The one issue with doing this is that if a binding is thought to be
> unstable, but becomes stable later without any changes, we'll have to do
> busy-work to remove the ! in all the DT files, thus artificially
> introducing an incompatibility. Perhaps that's fine though?

I'd say yes. Going from unstable to stable is quite a step for a binding
and that should be visible and worth a patch IMO. Also, when looking at
a DTS file or some driver code, it will avoid
confusion/misinterpretation if one can see immediately the status of a
binding.


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJSaAVBAAoJEBQN5MwUoCm2j0oP/2/TA5OJWrcwtQ7nLvosdDwy
ioTLwDM7rG4cJmtDbO1M2neEsX/iOF20iZnbmSX61oyZqUvAi/Q6FOm31XH2GghI
oiG7NwYuQLTuW7kn1uy+R3aqpdVGoJcaF7v4zOM35oqydIEno9cZgXeFjRuHs23P
W3no3zFfdJUYkn9EJYGyb/VIu7fE1q+Zf/6HbQiKfQLgweJYd5k281uhmjHzQQMY
NUmAJSYCvKcj9oZj7Tv6eN5O07c8gJOR9+MJONQlxpwI1XRFrRMffO1wmr5JnLQQ
BEPmwk/ghiYhVIU/FH+K08wETCXS0+YpBq9bpKGoN00CmGyvBb4XhVXS+VhFenT6
qheGG3zDlcFHm0Xsa6jD8p2p+3xo77w36o6np7jyduKsphnyq08YAzQYiWFnwBGj
hpiuDxyPqZxVxHEVqkH8LYVhCgMpawAAR0fSv3jOyFdZhzYZT7tj6fRAmpGXFMm8
QTrBJn1lDpAarUZjMxFvK7dvJ+7Cbdgg4tqAjtTkkFdHUp5tqgt5W/pwMAjH6ZZB
FJNsi9oZh+YpJ44vkjL77jhSINLUdi88B5ZDLpRYhMhY6jzUWrfsVfRBMqRrjQXd
znAg3oNw/wbNhcKEBPaTGH896l7VyHnPNHuJem7gUueZzXCjv+qSXdafI4cGQhWq
DK7U47OzRGyF1bkO9SAF
=lmYi
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
