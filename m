From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 16:12:42 +0200
Message-ID: <20131024141241.GA25061@ulmo.nvidia.com>
References: <20131023080630.GA14413@netboy>
 <20131023172955.GA17145@obsidianresearch.com>
 <20131023174458.GC5208@netboy>
 <1382553982.31058.10.camel@sakura.staff.proxad.net>
 <20131024095232.27BBCC4039D@trevor.secretlab.ca>
 <1382614439.6040.16.camel@sakura.staff.proxad.net>
 <1382615278.8522.72.camel@shinybook.infradead.org>
 <20131024122346.GD11296@ulmo.nvidia.com>
 <1382619655.6040.52.camel@sakura.staff.proxad.net>
 <516bfc7f9366ff3ef9187c36dd160888.squirrel@twosheds.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <516bfc7f9366ff3ef9187c36dd160888.squirrel-fWAbwA/6YHlc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 01:10:22PM -0000, David Woodhouse wrote:
>=20
> >
> > On Thu, 2013-10-24 at 14:23 +0200, Thierry Reding wrote:
> > my point
> >
> > before DT scenario for my hw crypto driver example:
>=20
> Note that you are not describing a normal "DT scenario" here. You are
> describing a case in which we screwed up and allowed non-invariant
> features of the hardware to be left out of the DT schema for the device in
> question - apparently because the Linux driver at the time didn't happen
> to use them yet. That was a fundamental mistake and should not have
> happened that way.
>=20
> So yes, after the public flogging has happened, and we're trying to work
> out how best to cope with the screwup, we don't necessarily have any
> perfect choices. The perfect choice was to do it properly in the first
> place.

The original point that I was arguing and which triggered my proposal to
allow bindings to be experimental is that we're currently being hindered
to add new features because we're afraid of screwing up. How are we to
know that a binding is sufficient if we can't put it through some real
world testing.

I think asking for DT bindings to be specified in all completeness from
the beginning is unrealistic. There's simply no process in place to do
that. It's taken us the better part of two years to figure out that we
even have a problem.

We've ended up in a situation where software engineers that write the
drivers are required to define hardware in it's entirety before any code
can be merged. In my experience that's very difficult, if not impossible
to do. At the same time hardware engineers aren't very likely to have
heard of DT at all, so they won't be able to come up with a good binding
either.

We can argue forever that DT should describe hardware, but at some point
software engineers need to get involved and work out whether what's in
the binding is sufficient to write a functional driver. This is further
complicated by the fact that unless the people involved *really* know
what they're doing, and even then they may overlook something, the only
way you can be reasonably sure that a DT binding is accurate and
complete is if you have a fully functional driver that implements it.
And the majority of people don't have much experience with DT at all.

Perhaps the solution to aim for in the long run would be to take what we
have learned over the past few years back to vendors and try to get them
to provide the DT bindings along with new hardware. My understanding is
that that's what people have done on architectures that have implemented
DT in the past.

At the same time, the situation we're in is fairly unique, because from
what I can tell, none of the existing DT architectures are anywhere near
as complex or diverse as ARM. Also, even if we can solve this by getting
vendors involved from the start, that doesn't help us now. Unless we
want the better part of ARM to come to a halt for a year or more we need
to find a temporary solution.

Experimental bindings could be a suitable temporary measure, but perhaps
other, better solutions exist.

Thierry

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaSrZAAoJEN0jrNd/PrOhzn4QALSZzSC+Us343n3rsF61BvK6
FNxPU9R6RCCgACNX733HWYrpf5UC/rWKYYYRpRASodbG0DO0QYsXPiLO5QwrqjWf
6yiltZgwpnFMaUEvb3XQZbTmFlFGdNbrCLE30tu3D2ofTdqv6l2VauPLjSWfMOa3
OCo7WMfszX83pRHwnRsI6iY20BteUAFyrcfKuoblklug7xmIt5Gs84Zi4bj3Olxe
BtUekkypss1kfGf+x23DrPBF/vd53X9Lk+L8IVundyT45VMgM147w/+mTZD9Avtf
XJIXTMfDvrhUhg+WWjl3xokI4lR7+up7XxcLTvVc8vA5gY3G/ImGSzTsR9HWQRG8
u6jNtJhYdPE/viUYNorBfM9hbLOAXu9RZpdhBrbeAhDTE9xtRnmzSrT6zjzTWLlx
Dmgtz1ksIgrujNcK3EAhcPnLjfMtKJko4JN5elbxKdM5zwVYGh2ZKcoUAtuQTxGy
nVy6dLzFM8ownDPTwcRo3e1MKNRWHlakCf9ygZsyz7iJ8zuCwlvNVw9hXCvLNlug
8Fp/6A9APAVP3ton2Rwlt4lwFyRP5vYpxLwo2oTR+do2RciixzgpHvCmQrf6xHnZ
KcnFBgeVK0ZNxXXMaVot+SpgGhQ9o6yd0Wgw+HDtleh3uk2JYLvW4ICemY3ZQ62W
bwwiS5/AHuK3iHOOyKMp
=cbCN
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
