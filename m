From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Wed, 23 Oct 2013 20:56:04 +0200
Message-ID: <20131023185603.GB7863@ulmo.nvidia.com>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <1382544332.8522.40.camel@shinybook.infradead.org>
 <20131023165512.GB22394@roeck-us.net>
 <1382547916.8522.42.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382547916.8522.42.camel-Fexsq3y4057IgHVZqg5X0TlWvGAXklZc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 06:05:16PM +0100, David Woodhouse wrote:
> On Wed, 2013-10-23 at 09:55 -0700, Guenter Roeck wrote:
> >=20
> > So to avoid tainting the kernel and clogging the kernel log I'll have
> > to remove all the "!" from the dt sources, or not use any "!" in the
> > dt bindings in the first place. Given that, not sure if anyone will
> > really use this mechanism. And CONFIG_OF_EXPERIMENTAL/CONFIG_UNSTABLE_DT
> > might have the same ultimate fate as CONFIG_EXPERIMENTAL.
>=20
> It's not as if it's hard for you to patch out the check if you really
> want to do that. This is about making it clear to people what they
> should expect if they use staging code/bindings.=20

I agree. The kernel is open source, so people are free to patch it in
any way they want. The best we can do is to come up with a good solution
in an upstream kernel. But there's no way we can control things beyond
that, and we don't have to.

Thierry

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaBvDAAoJEN0jrNd/PrOh6nAQAKIUdXf5fDVNOZSk2xaZG74r
HV2Qhmk2CbHUyhcmRR6ItCV6eOfrFboCJgv61KEKJXju1vzW1+3bWXgW6FHgv+IQ
2iN/x55YsILchO2h3A2dYST8LEcDr/gZBgqrVUeCvPfXEWK/34/9RB1gkdIxTSr+
dCHvhtPkUDdzh38eHdQFI6ch0PWnoLu3gst6X8IdbJ1aGdndUoM/pAeHR9xGAwpA
i5Db/d6hQhbV3f1iTlNDnb9iEuxsmLaPmzupSmANnqC6HL4255W25ySlYDuM8Msq
zORT8KSeZuBcI33aFUZ7OaktMxJvhRM7AHU+ZQBUBpar3NUWR77RDxw7zhQrZHef
/EE8ss9p73tBsV6kxRmGaOdQKALa5nS+4MyANSO9JNfhoE/TRuv/I9eDZu52PobW
X3YNYSOI3RADbRaisbRzXZGbI0PZDTXTwgPKVM5dISDoC1cMXAuqBlzqWVYejb6y
Pu/2VaAkf6bHFT4xDOLU4ObtGI2x7H2ApasSPttXukLCEcEmRarW4d/Vu3uokrUg
EYdQYWM+Q+dGD43FbuUyU/vKrcTBU4c07iH39YHM6czeF+3rnUNW3klCf3b5YiCH
v5TgwNeblLFnSOjZSaAxFQXssOMM/8y5rOdY6Hx3dffkMZiIiYzfuQzzFb3wqrA3
oMgvbEQTbEYGfycsk4Z+
=proh
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
