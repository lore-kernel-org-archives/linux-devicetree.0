From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: Add coupled regulator
Date: Mon, 18 Jan 2016 16:25:38 +0000
Message-ID: <20160118162538.GH6588@sirena.org.uk>
References: <1452605842-9317-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452605842-9317-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160112143100.GA14628@rob-hp-laptop>
 <20160115085734.GG4581@lukather>
 <20160117000434.GB7774@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B/Xvj+5d6YUiV57r"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160117000434.GB7774@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--B/Xvj+5d6YUiV57r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 16, 2016 at 06:04:34PM -0600, Rob Herring wrote:
> On Fri, Jan 15, 2016 at 09:57:34AM +0100, Maxime Ripard wrote:

> > We could push that code in the consumer drivers, but that has some
> > significant drawbacks:
> >   - That would duplicate that code in all the drivers, leading to the
> >     usual drawbacks of code duplication, especially when it's not
> >     really trivial to handle (or at least, when there's a few
> >     gotchas).

> Either you could keep the driver and the consumer driver is responsible=
=20
> for instantiating the regulator. It could also be implemented as a helper=
=20
> library in the regulator core.=20

No, anything that is visible to consumer drivers is completely silly.
The whole point with both the DT bindings and the API is to hide details
of how the supply is implemented from the consumers, any implementation
must be transparent to consumers otherwise it's unusable.

> >   - When you come to consider it from an hardware point of view, the
> >     device usually have a single pin that powers it. It's the board
> >     designer that chose to route that pin to multiple regulators, so
> >     it's really the board that is wired that way, and putting that
> >     code in the consumer drivers would be an abstraction leak imho.

> That's a good point. Perhaps the regulator core needs to be able to=20
> parse the list and return the single ptr to the virtual regulator.

Exactly, if we don't want to represent the combination directly.  For
most uses it's probably OK but I can see us in a situation where we
might want to do things like only use one of the regulators in low load
situations where we might want to attach properties to the merge of the
two regulators rather than just referencing them both.  I'm not sure
that's realistic though or that we wouldn't just be working that use
case out dynamically at runtime.

I'm ambivalent on which way is better, it does complicate the
implementation to support doing this as lists and while it makes the DT
more elegant I'm not clear that it's worth the effort especially when it
comes to constraint combining.  But perhaps the implementation turns out
to be simpler than I would anticiapte.

> >   - We might not even have a driver for these regulators, or at least
> >     one that play by the rules. In our case, that's an out-of-tree
> >     WiFi driver.

> Support of out of tree things has never been a winning argument for=20
> upstream.

> With an out of tree binding as well?

Since the consumer driver shouldn't be worrying about implementation
details of the supply it doesn't matter if the device on this particular
board is out of tree.

> > In the latter case, I remember Mark saying several times that he was
> > not in favour of such a change, even recently:
> > https://lkml.org/lkml/2015/10/14/238

> I think this case is somewhat different. What I'm suggesting is closer=20

Yes, that's a different case - that's the case where all the supplies
in the device are combined into a single list rather than the case where
we have one supply with multiple regulators providing it.

--B/Xvj+5d6YUiV57r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWnRIBAAoJECTWi3JdVIfQs58H/28T+EeV6r6BylSxh1bTAG+T
wqGbzhxFsmhrmIAlEJpMkyJE+kOyXF9f5YxcBypZrpeyddl3jdpc3rhuV3W9/a5u
IrWE22qT1mGViv4PpQQazx80Cb84wOs6YkK2HiIdcYxpzf6APcsvnz2awBKp6HqP
KuOU0AWgY0aCCO9TJiN8sEjmBfYHyaq5cu4LVFv4VfDUEXGlXCat7g2Z5WuuLh9l
Wb1DqbZ5jp3YG06YyUcPMVppqcy3iEsAS6Y19lJExIVB9fT0yjxKimci3ZYY4nD/
miVD5hFcfqLIjI+U9AndO112VZr31et8J+zpTkbIUuHhhdhMXeWL/nLHAFu+CgQ=
=RZ9K
-----END PGP SIGNATURE-----

--B/Xvj+5d6YUiV57r--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
