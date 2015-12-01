From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: Add coupled regulator
Date: Tue, 1 Dec 2015 18:58:52 +0000
Message-ID: <20151201185852.GO1929@sirena.org.uk>
References: <1448897346-17780-1-git-send-email-maxime.ripard@free-electrons.com>
 <1448897346-17780-2-git-send-email-maxime.ripard@free-electrons.com>
 <CANLsYkzBjDTCr1NPkPAQXnR5LCQ0MFFGb8EXXO2oVaxuZ0DH_A@mail.gmail.com>
 <20151201140436.GQ29263@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TN6tpTzbxVxIV0OU"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151201140436.GQ29263@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--TN6tpTzbxVxIV0OU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 01, 2015 at 03:04:36PM +0100, Maxime Ripard wrote:
> On Mon, Nov 30, 2015 at 10:17:45AM -0700, Mathieu Poirier wrote:
> > On 30 November 2015 at 08:29, Maxime Ripard

> > > +       for (i = 0; i < creg->n_regulators; i++) {
> > > +               ret = regulator_disable(creg->regulators[i]);
> > > +               if (ret)
> > > +                       break;
> > > +       }

> > What happens to the other regulators when an element of the chain
> > fails to disable?  Should they be powered on again?

> That's actually a very good question, and I don't have a good answer
> to it. I guess the safest approach would be to roll back and do the
> opposite operation on the one we previously enabled / disabled.

> I wonder whether it might damage the hardware or not though.

> Mark?

Yeah, I'd expect us to try to unwind everything - presumably if the
supplies are partially enabled we'll not be able to satisfy the power
demands of whatever is connected (otherwise why would you create such an
innovative hardware design?) and it'll also mean that the refcounting
will be off if we ever try to do anything with the supply again.

--TN6tpTzbxVxIV0OU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXe3rAAoJECTWi3JdVIfQ4msH/iSLfQ4PgUxK7wQj5+cIcccy
9ppKP5PSOo25/UGU6uwykAFAP96Q9RzSJWV4ce0b0PMkwTt5E7P0BSnp1+NkfXch
vAOuvBsIwFBTuLH+Zc1MYPELu6w5GgaciV1ogva8HwDsekfsw4xLZbppQAu1FyqR
/qKEyXtU6OWlRNcyOzO86yeLS6s5Z5ib04MfR3duQrl7nZvDzvbkKUy6WgJ6Yk/Q
4LheRlMZLzNR0NKFzhOk5EgT4QHULLXc76+l1HETbDRnIsBcyPDcO40z3tlmZ8xK
1MHOlhPF2ZKIplSoD/+dIiPKm/0ZE51n7gePMz6uczuJVekHB24LRYaxOS8uPvk=
=qv1c
-----END PGP SIGNATURE-----

--TN6tpTzbxVxIV0OU--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
