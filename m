From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] regulator: core: Add support for active-discharge
 configuration
Date: Wed, 2 Mar 2016 12:13:38 +0900
Message-ID: <20160302031338.GU18327@sirena.org.uk>
References: <1456835895-16503-1-git-send-email-ldewangan@nvidia.com>
 <1456835895-16503-3-git-send-email-ldewangan@nvidia.com>
 <20160302014421.GM18327@sirena.org.uk>
 <56D64984.8080405@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kJ9+PbHdtOUIdE1S"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56D64984.8080405-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kJ9+PbHdtOUIdE1S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 02, 2016 at 07:31:40AM +0530, Laxman Dewangan wrote:

> Yaah, I agree.
> I had other option to use 0 as default, 1 as disable and 2 as enable. but
> generally for disable, we use 0 and for enable 1 and that's why I went to
> -1,0,1 approach.

> Will it be fine to have this as
>   0: Default i..e do not change.
>   1: disable.
>   2: Enable.

I'd suggest defining an enum here with default explicitly set to 0 but
yes.

--kJ9+PbHdtOUIdE1S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW1lphAAoJECTWi3JdVIfQswAIAIHJctOV0GylJiC5Nmq+/i6q
YpOHi3S5nVl4OODk7x+n/dsSvU7kfCc0neobMezGyDuFyBUNw78yFHSDo/WXenhO
lSzD9tY1NDDAL8CzfVLL6YmZFjqEzlFNfpN/w7GQf3uZsgYs09AEpQgT3zQvE0/E
MpmMqv9XLJVZ3HQV+p6UJamuyRcGG/mNuJc3GucY9a6Y2SvwCm0SnuJPeXHDO3qs
T8Kw9wB2/COFmaJ08n7PW21Hzn4gJJJ73MqPvKFWAYgcvjsRLl84mYZ9QhMsfdzT
qnZreyPecyppnx0ME39U9xqYmVC74nwsfbl3rlZnx5gbHbvNInAsk8NUr5g6ueI=
=BY0U
-----END PGP SIGNATURE-----

--kJ9+PbHdtOUIdE1S--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
