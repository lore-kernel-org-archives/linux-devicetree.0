From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Wed, 23 Oct 2013 21:58:50 +0200
Message-ID: <20131023195849.GA8828@mithrandir>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <5267FA58.9050002@wwwdotorg.org>
 <20131023172001.GA3379@katana>
 <20131023185909.GC7863@ulmo.nvidia.com>
 <20131023193450.GE32563@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023193450.GE32563-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 01:34:50PM -0600, Jason Gunthorpe wrote:
> On Wed, Oct 23, 2013 at 08:59:10PM +0200, Thierry Reding wrote:
>=20
> > > I'd say yes. Going from unstable to stable is quite a step for a bind=
ing
> > > and that should be visible and worth a patch IMO. Also, when looking =
at
> > > a DTS file or some driver code, it will avoid
> > > confusion/misinterpretation if one can see immediately the status of a
> > > binding.
> >=20
> > Yes, I fully agree. It might look like churn, but I think this could
> > actually be a part of the formal process to stabilize a binding. It
> > would be final step of that process, actually.
>=20
> I actually think this makes things worse.
>=20
> Ostensibly the purpose of stable DT is to allow the DT and kernel to
> be separate, so you should minimize the churn in the DTs, and they
> should trend to stable.

Well, I do think that stable DT has benefits. And quite frankly I think
the majority of bindings will eventually converge to some stable state
anyway, if only because active development stops. In an ideal world that
would be when a product ships.

So this proposal isn't so much about making a decision for stable or
experimental DT, but rather about giving users a choice. If they are
willing to live with the additional "burden" of updating the DTB every
once in a while, then they can enable the option and get additional
functionality. If they don't want any part of that, they can just leave
the option disabled and only get the parts that are stable.

> Having a flag day where someone goes and churns the DT to remove a !,
> and then changes the kernel so all old DTs with a ! won't work at all
> makes this whole thing seem kinda contrary to the basic motivating
> premis.

No. Matching doesn't include the ! marker. So if you remove it from DTS
files and/or drivers, the only thing that goes away is the warning at
runtime. Feature-wise there should be no difference.

> Also, what happens during development? If you incompatibly change the
> binding you should change the name, so maybe <version>!marvell,foo is
> the way to go.=20
>=20
> v1 of the binding is 1!marvell,foo - version 2 is 2!marvell,foo, etc.
>=20
> When stablized the last bang is kept and the non-bang version is
> added. The boot warning is supressed once stable no matter the
> compatible string used in the dt...

Why would we want to go through all that trouble if we define up front
that the binding is experimental in the first place? Encoding a version
number in it somehow entails that earlier versions are still supported
in some way.

But the whole point of experimental bindings is so that we don't have to
worry about backwards compatibility.

Thierry

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaCp5AAoJEN0jrNd/PrOhCyAQAKRbdgnJ3M3obpjZ+zukbGXo
ep4wK8fPWimbWjHO54cLK1cRzCjcp/VL/r1g9HrliD89aUrSD65wkP/4DGtDa4JL
SaVySCHVQupJNHAeF3ERyrsL9O98R2Zmv6XLFaQ1v1PigseMwMm8ESwg5uqz+ZwN
fcmAU7o+FWHxfcElKKBj35DOhRBioWGFottSUti0LFBFzxn/U0FffQ/e2eOVLRzb
qzn+JSpY30bIcNcMQWsSsnO/PlqGCRpsh+iHAWDXmVdUx+nMexR4EwEdl1hHQIOW
axbbHVs0PI7+alv65q21Ktl5qRkz3BhOq4VgmNbfPox8B/uJL4M6ibm35ruOqS38
VOpXV+OHI2Y0Ixjgg3aRz5JB+t2dYSGqVjOZXFS3B4cnoqrtWypOGHeWUpexLMnP
J1tDUHvCacZevsYRh+90RqoOD4Bqf7ldSTzqRoW5nDgjxBTl22lNHpKChg8sWLIS
+1ynzZTqDwh6qDr8KqibfOnuVvOouZNsRab6HFg5i5OZ0/jzeFbghraBjW3ZzPWn
b+d+6jF41OvGvUWXxfC1uJIYDZpB0e9UG+rjBdfgqwFRP9KRq+pRXysRa9y3Hhz7
UaOc8qjMM+lxzIy3Y+IR+gef5+4yrRcjsSKzs8NAV0jLwWf6uQqZOGHwGyBLzN7h
WA+vyxYRAimX7Eglku21
=1MGr
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
