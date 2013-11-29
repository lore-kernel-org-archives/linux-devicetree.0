From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Fri, 29 Nov 2013 10:37:14 +0100
Message-ID: <20131129093713.GC22771@ulmo.nvidia.com>
References: <20131127172806.GC2291@e103592.cambridge.arm.com>
 <20131128203322.GB14689@mithrandir>
 <20131128211009.GA26447@obsidianresearch.com>
 <20131128222232.GF14689@mithrandir>
 <20131128233147.GA19387@obsidianresearch.com>
 <20131129023554.GA14239@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131129023554.GA14239-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2013 at 06:35:54PM -0800, Greg KH wrote:
> On Thu, Nov 28, 2013 at 04:31:47PM -0700, Jason Gunthorpe wrote:
> > > Perhaps this is just another way of saying what Greg has already said.
> > > If we continue down this road, we'll eventually end up having to
> > > describe all sorts of nitty gritty details. And we'll need even more
> >=20
> > Greg's point makes sense, but the HW guys are not designing things
> > this way for kicks - there are real physics based reasons for some of
> > these choices...
> >=20
> > eg An all-to-all bus cross bar (eg like Intel's ring bus) is engery
> > expensive compared to a purpose built muxed bus tree. Doing coherency
> > look ups on DMA traffic costs energy, etc.
>=20
> Really?  How much power exactly does it take / save?  Yes, hardware
> people think "software is free", but when you can't actually control the
> hardware in the software properly, well, you end up with something like
> itanium...
>=20
> > > code to deal with those descriptions and the hardware they represent.=
 At
> > > some point we need to start pushing some of the complexity back into
> > > hardware so that we can keep a sane code-base.
> >=20
> > Some of this is a consequence of the push to have the firmware
> > minimal. As soon as you say the kernel has to configure the address
> > map you've created a big complexity for it..
>=20
> Why the push to make firmware "minimal"?  What is that "saving"?  You
> just push the complexity from one place to the other, just because ARM
> doesn't seem to have good firmware engineers, doesn't mean they should
> punish their kernel developers :)

In my experience the biggest problem here is that people working on
upstream kernels and therefore confronted with these issues are seldom
able to track the latest developments of new chips.

When the time comes to upstream support, most of the functionality has
been implemented downstream already, so it actually works and there's no
apparent reason why things should change.

Now I know that that's not an ideal situation and upstreaming should
start a whole lot earlier, but even if that were the case, once the
silicon tapes out there's not a whole lot you can do about it anymore.
Starting with upstreaming even before that would have to be a solution,
but I don't think that's realistic at the current pace of development.

There's a large gap between how fast new SoCs are supposed to tape out
and the rate at which new code can be merged upstream. Perhaps some of
that could be mitigated by putting more of the complexity into firmware
and that's already happening to some degree for ARMv8. But I suspect
there's a limit to what you can hide away in firmware while at the same
time giving the kernel enough information to do the right thing.

I am completely convinced that our goal should be to do upstreaming
early and ideally there shouldn't be any downstream development in the
first place. The reason why we're not there yet is because it isn't
practical to do so currently, so I'm very interested in suggestions or
finding ways to improve the situation.

Thierry

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmGBJAAoJEN0jrNd/PrOhcEwQAJy2Dn9SUc1jnBxiPdJuV0aF
ntc+9RsList3K3qUobm2EHCb73QbBw+lymNRTExMpr8GUWot9CiyeJjNJb8B8mK2
//Yy7auv5/8ts14AW6MGjzFC23AS/zvBVQxaMjIqn8YiRmLJ5VuTtRb+miiKa9qI
a4n97TNeuZVai2t7c3WnmZPPrICcJ+Hp+D1Tb606Up9HRxHUJ0DZrao0KztqIIhr
2xywhA7/7+AMusNHesTyCl3OoY83SU0S9M8zpPVslw9nFSLVO3q8qwunijTTsXeE
xuwMoUjgRBLWYou9KaEUhZvOVom8jTbkulqFzLVZgHfkg7VI5VZ/A/yRaHZra1Jh
uDIHTW8G01B+/HW/MyVKLDJS6K3oC10zWN0NsktKQ8AWIgvSIaNx7AToEQbHxGAe
O3ec3OlVqBStd+X6ekmx9WpcuCGJ7AMODnhTn9bYwElDFiOp8ziCeTACpWdLC1Fr
n/8jj3M5ZKymDi5fr6VjCcBLghT6nEYEqreSPeORRSF2vrBGwsTN+F264Vog9pWy
ICBcou0YW/8zE0NsS9DSl4zOnlgrl7xPz3yxu2aC5nn50UM3lYz/IMBUuD5xbPkW
QxU9vB/hyekLrG+bToYl6N6e2y8SKbabf7Rw4nCUFegdQ1zRoHmjyDlFeLrqzJ3I
nWAVTNivmYMqeKvgtaLL
=YzOX
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
