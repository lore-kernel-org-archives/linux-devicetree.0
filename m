From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: Add coupled regulator
Date: Mon, 7 Nov 2016 16:47:38 +0100
Message-ID: <20161107154738.ewliwzx5plams4ni@lukather>
References: <1452605842-9317-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452605842-9317-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160112143100.GA14628@rob-hp-laptop>
 <20160115085734.GG4581@lukather>
 <20160117000434.GB7774@rob-hp-laptop>
 <20160118162538.GH6588@sirena.org.uk>
 <20160121154649.GE3997@lukather>
 <20160121162802.GL6588@sirena.org.uk>
 <20160205143328.GD31506@lukather>
 <20160205153258.GW4455@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7x3mqhksf43kuy7w"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160205153258.GW4455-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7x3mqhksf43kuy7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, Feb 05, 2016 at 03:32:58PM +0000, Mark Brown wrote:
> On Fri, Feb 05, 2016 at 03:33:28PM +0100, Maxime Ripard wrote:
> > On Thu, Jan 21, 2016 at 04:28:02PM +0000, Mark Brown wrote:
> > > On Thu, Jan 21, 2016 at 04:46:49PM +0100, Maxime Ripard wrote:
>=20
> > > > Anyway, I'm fine with both approaches, just let me know what you
> > > > prefer.
>=20
> > > Without seeing an implementation of the lists it's hard to say.
>=20
> > Just to make sure we're on the same page: you want to keep the
> > regulator, but instead of giving the parent through vinX-supplies
> > properties, you want to have a single *-supply property, with a list
> > of regulators, right?
>=20
> Either that or an explicit regulator describing the merge.  Rob wants
> the list I think but I really don't care.

So, I'm reviving this old thread after speaking to you about it at
ELCE and trying to code something up, and getting lost..

To put a bit of context, I'm still trying to tackle the issue of
devices that have two regulators powering them on the same pin for
example when each regulator cannot provide enough current alone to
power the device (all the setups like this one I've seen so far were
for WiFi chips, but it might be different).

I guess we already agreed on the fact that the DT binding should just
be to allow a *-supply property to take multiple regulators, and mark
them as "coupled" (or whatever name we see fit) in such a case.

Since regulator_get returns a struct regulator pointer, it felt
logical to try to add the list of parent regulators to it, especially
as this structure is per-consumer, and different consumers might have
different combinations of regulators.

However, this structure embeds a pointer to a struct regulator_dev,
which seems to model the regulator itself, but will also contain
pointer to the struct regulator, probably to model its parent? I guess
my first question would be do we care about nesting? or having a
regulator with multiple parents?

It also contains the constraints on each regulator, which might or
might not be different for each of the coupled regulators, but I'm
guessing the couple might have contraints of its own too I guess. Is
it something that might happen? Should we care about it?

And finally, my real question is, do we want to aggregate them in
struct regulator, at the consumer level, which might make the more
sense, or do we want to create an intermediate regulator internally?
What is your take on this?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7x3mqhksf43kuy7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIKIRAAoJEBx+YmzsjxAg0nwQAKWXccjBa63DnUwal3omyjsp
Voe09CShusBVQbcQleXCgPAjhJFZElgwF6v11tCLTqYFVUO8xoidBtWDYOC5JeUK
owSulSogJjNIhPSOz9VOe+1Gw6IFLkzCMyrFof0UkpYkgGJ6EzH4RXDjynsOrWMu
EHBByjfTLZrACl1cKUjhM5VrVOUyPNwA6JuNRKUSjYNgEgDKN16ZKBFAO4GYfP9+
+vGdCeYI2NP48lhjsIm2FdvyDXEqWIPYAtMbNTkW9ojrg4t2LZ9y15Ub1m6AZeUa
Zrtxs2ZmcQ2g4K8BEtROTGnjaoDK52yaK30EDR2WmIt3jJ3kvJg+jxvgX2rzEujv
VU0XWx3bdxB3JD9uBor2h0XFtgytm0QQ86jlNkQY0whJEA6I62ojeq3joLzdpkyJ
sdh4uLOjqq9awCeqEvXgqRwPv8lLPibvkkaZMU+bXtJto0NAqJ4jbGrQcBmN1IZl
XytgXKN3cd/twFBrhUyueYye4lR2MSUFRuDY2NVZEYWZZJ9djnMfv5sGjf4mD3nZ
HOjNEH7iQd8hDhtXhG1TVnKbVk3C5MAdo4RSm/CbA1EOi5B7WqhfNvd4zy+lAM83
1u+szQW6telJrKxq7zR82hrWl7voZMS3SkdrkYsmEHepsuJ4VQMAYVyYrzuSiD3k
FdCYht3Bq79N9gaHCYV4
=+1Ak
-----END PGP SIGNATURE-----

--7x3mqhksf43kuy7w--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
