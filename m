From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Fri, 25 Oct 2013 11:24:46 +0200
Message-ID: <20131025092445.GI19622@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020231134.GR25034@n2100.arm.linux.org.uk>
 <20131021083242.GB30088@pengutronix.de>
 <20131021084854.GV25034@n2100.arm.linux.org.uk>
 <20131021092730.GF30088@pengutronix.de>
 <CAF6AEGtt_2sStiZCNBp9btxevWghSwLZZBdN6ir8eUpX1FXrCQ@mail.gmail.com>
 <20131024072811.GS30088@pengutronix.de>
 <CAF6AEGuEho9Ms7ifTE-EmBoQ-=_AXgvGcJxi5qEC0vsZ+H9C+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r4QXMf6/kyF/FvJJ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6AEGuEho9Ms7ifTE-EmBoQ-=_AXgvGcJxi5qEC0vsZ+H9C+A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--r4QXMf6/kyF/FvJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 05:21:54PM -0400, Rob Clark wrote:
> On Thu, Oct 24, 2013 at 3:28 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wr=
ote:
> > On Wed, Oct 23, 2013 at 09:14:17PM -0400, Rob Clark wrote:
> >> On Mon, Oct 21, 2013 at 5:27 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>=
 wrote:
> >> >> If a subsystem doesn't work well with DT, then the choices are eith=
er:
> >> >>
> >> >> (a) don't use DT with the subsystem
> >> >
> >> > The underlying problem has nothing to do with DT. Multi component
> >> > hardware does exist and won't vanish when we stop using DT.
> >> >
> >> >> (b) fix the subsystem
> >> >
> >> > I'd love to do that. Step one to this seems to be to increase the
> >> > awareness that there's something wrong with DRM.
> >>
> >>
> >> Note that I suspect your idea of "fixing drm" is going to break some
> >> userspace assumptions about the hw (ie. userspace isn't expecting
> >> crtcs/encoders/connectors to suddenly appear/disappear.  And the funny
> >> thing is, on all of this hw, that isn't going to happen anyways.
> >
> > I was talking about all SoC DRM drivers implementing variants of the
> > same glue between drm and the multidevice nature of the components.
> >
> > To make that sure: I never had the intention to implement hotplug for
> > drm. Also what the imx-drm driver does is not for hotplug, but only for
> > binding different components together.
>=20
> ahh, ok.  Yeah, we do need some way to make this easier, as it is a
> too-common pattern.  I do think we do need a way to know if something
> is missing because it isn't there vs it hasn't been probed yet.  Ie.
> late_initcall() is not the awesome solution.

Yes, that's particularly easy to do with DT because you can walk the
tree looking for status =3D "okay" to collect which device nodes are
supposed to be enabled and assume that they'll show up eventually. I
have no idea how this could be done without DT, though. Perhaps iterate
over all platform devices and look for matching name.id pairs? Then
again, it seems like this is primarily an issue on ARM, and eventually
all ARM SoCs will move to DT, so perhaps this may become a non-issue.
But it doesn't help with platforms that don't support DT yet.

Thierry

--r4QXMf6/kyF/FvJJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSajjdAAoJEN0jrNd/PrOh0CcQAIgdGrEpMmKb37VKOjt7YnuL
p1AtYtvUupujOfEkvvrjHLNZuV93txp8zelbfuECi6lj54N8xM3rb1tPZkYIG33Z
A7WSScvNj4GCtBi17NDecAeUlP8tULxSANYIidoEpNBMt9NHiG9247396SjO8LJf
nmfTRVDl7AdIpQXoEv4d9zaxQJIESxbJK5YtRMlPFLE9EvTBn9OeOmPc/Zzh7EGv
g7wzRm0/dW276OMDk9BPKOGmWeVHPOKRjaK/5S3kiZijbEOUyjB9yYlw6uj2qSYO
0/uFo9aBib6EKAfs8EZcLsuLJIQOVQY3u1T9fLf44NI1mOg3n962GH6KkXdVOqvD
VJkNEezYt/6vWr2cYpV3y4JElBHciVafqrfevjOFRSfoKjt7JTLZ+qc1QSU7Sm4R
B5McCJeXqXrP/8BNDcb7S2ZrwdyoHHS00ZXp1LsakSWEn83x1vtiG4QdUfgdM929
1mM5tWa3NFYWXJ+bSIaE4kA9KS6EuZB48iLyJWFB7eRluTcbtbPwgzypW/9bmG+j
lp3aJCwBlAfTSHc12cPFBh7oWTvoB3g0ncSWcpkHH4IcukiHUZpJK1nWUT2eTTXc
WZlKhu9KstY5hCQHez1oKbvKGSCeYpUCzATTn3p0T5TTtn5w3USwkqa4QOzHtU90
BTXJKQYaY0Lfo6vv4cBR
=yfII
-----END PGP SIGNATURE-----

--r4QXMf6/kyF/FvJJ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
