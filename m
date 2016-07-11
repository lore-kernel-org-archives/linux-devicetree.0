From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V8 1/2] regulator: Add document for MT6323 regulator
Date: Mon, 11 Jul 2016 20:22:11 +0100
Message-ID: <20160711192211.GI3701@sirena.org.uk>
References: <1468240179-7558-1-git-send-email-john@phrozen.org>
 <20160711180805.GG3701@sirena.org.uk>
 <cef78bd8-9a4a-e848-d7cb-13a27127f11e@phrozen.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nO3oAMapP4dBpMZi"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cef78bd8-9a4a-e848-d7cb-13a27127f11e-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nO3oAMapP4dBpMZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 11, 2016 at 08:55:24PM +0200, John Crispin wrote:
> On 11/07/2016 20:08, Mark Brown wrote:
> > On Mon, Jul 11, 2016 at 02:29:38PM +0200, John Crispin wrote:

> >> This is a resend as V7 was dropped due to a merge order conflict.

> > What were the dependencies and why will simply resending this resolve
> > them?

> the dependency was the mt6323 support inside the mt6397 MFD device [1]
> and the headers that it included. this has been merged so the regulator
> driver is good to go for 4.8

No, that's not resolving the dependencies - if I apply these patches
without the dependencies in the regulator tree that will still break the
build for my tree until after the merge window.  It'll also break Linus'
tree if (as is normal) I send my pull requests early on.  I'd need to
merge the MFD commits into my tree which would need coordination with
Lee, he'd need to make a tag for me to pull in.

--nO3oAMapP4dBpMZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXg/HiAAoJECTWi3JdVIfQ9ZYH/RHe04hNjqfmSARVP7bZryh0
pW1CsKmuKz8Vr/kszKZ+X2yZK1UFn6lwEPNal8R3l6n63B0i/wVDi9eYsm8VuGFQ
IHJ61u2V0UMkHLd1W+s8cEBsoLz5niGA6UEH27BUDZ96hGY6oBvjfeHBHu68Ht66
t/PFaSY1aU6Iy1YJtnPjBWoB16ltha6B5ZCD7C3IgLxwmx9NJbO7UrBMYlVp7t1v
9c6oc5x7/MOlyE+geiYKj7EgHLGDdebqf0zFmL9mFFvZ2Xo7zRgX9FjCL4FAf15O
+K10LAn7iSyg0XUwRmilwKciMlZ9iRnrHqntraxZGs2+LINq2NAVeADESCKvQ5Y=
=ZhPf
-----END PGP SIGNATURE-----

--nO3oAMapP4dBpMZi--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
