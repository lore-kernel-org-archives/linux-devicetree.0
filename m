From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: Add coupled regulator
Date: Fri, 5 Feb 2016 15:32:58 +0000
Message-ID: <20160205153258.GW4455@sirena.org.uk>
References: <1452605842-9317-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452605842-9317-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160112143100.GA14628@rob-hp-laptop>
 <20160115085734.GG4581@lukather>
 <20160117000434.GB7774@rob-hp-laptop>
 <20160118162538.GH6588@sirena.org.uk>
 <20160121154649.GE3997@lukather>
 <20160121162802.GL6588@sirena.org.uk>
 <20160205143328.GD31506@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t98UOKzcpBZ5uth4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160205143328.GD31506@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--t98UOKzcpBZ5uth4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2016 at 03:33:28PM +0100, Maxime Ripard wrote:
> On Thu, Jan 21, 2016 at 04:28:02PM +0000, Mark Brown wrote:
> > On Thu, Jan 21, 2016 at 04:46:49PM +0100, Maxime Ripard wrote:

> > > Anyway, I'm fine with both approaches, just let me know what you
> > > prefer.

> > Without seeing an implementation of the lists it's hard to say.

> Just to make sure we're on the same page: you want to keep the
> regulator, but instead of giving the parent through vinX-supplies
> properties, you want to have a single *-supply property, with a list
> of regulators, right?

Either that or an explicit regulator describing the merge.  Rob wants
the list I think but I really don't care.

--t98UOKzcpBZ5uth4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWtMCqAAoJECTWi3JdVIfQHgMH/22Mv0tmtSKgweJSjdnHwzsf
uH79vuOCzj57ggAmMk2bL6Klg+xDP5MC9B6YqtxnHl57f9YCjKEGD5iMFrnQ7stR
b+LnMYQP7BMKQk+rwT7IMJF+qYzsXLZIGjS1WZ1qWCYgyr2fP3Vi30Bv56na9n1Y
owAUpp4IEaRe2pMrma8RHMelAtJH3oRypUcqkBk5c8yRR3WHtDXCNVe0cq9c3P/s
vHYjcI/ZAVKktQEJSDXY/OHlUUTxeZ37FASEUOjXi3vQi/7iTILlFxoPFtFBCNa8
z7ocPWzbfBRSZUdnOiGibqPAsjEx4tjozhvcD32hnf4cCaeeeXw1ncng2WPxpHM=
=Oz4a
-----END PGP SIGNATURE-----

--t98UOKzcpBZ5uth4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
