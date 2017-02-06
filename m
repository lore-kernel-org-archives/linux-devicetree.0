From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/7] drm/tinydrm: Add helper functions
Date: Mon, 6 Feb 2017 12:08:47 +0100
Message-ID: <20170206110847.GH27607@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-3-noralf@tronnes.org>
 <20170206085629.GD27607@ulmo.ba.sec>
 <20170206090918.6rqr6l7pd62znl5j@phenom.ffwll.local>
 <20170206093556.GF27607@ulmo.ba.sec>
 <CAKMK7uHgW15EPpPSU2se7r89JCGD_oTvn9ZJptYaNJAWMKb9Fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q6STzHxy03qt/hK9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uHgW15EPpPSU2se7r89JCGD_oTvn9ZJptYaNJAWMKb9Fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Q6STzHxy03qt/hK9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 11:07:42AM +0100, Daniel Vetter wrote:
> On Mon, Feb 6, 2017 at 10:35 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
>=20
> > > > > +EXPORT_SYMBOL(tinydrm_disable_backlight);
> > > > > +#endif
> > > >
> > > > These look like they really should be part of the backlight subsyst=
em.
> > I
> > > > don't see anything DRM specific about them. Well, except for the er=
ror
> > > > messages.
> > >
> > > So this is a bit an unpopular opinion with some folks, but I don't
> > require
> > > anyone to submit new code to subsystems outside of drm for new driver=
s.
> > > Simply because it takes months to get stuff landed, and in general it=
's
> > > not worth the trouble.
> >
> > "Not worth the trouble" is very subjective. If you look at the Linux
> > kernel in general, one of the reasons why it works so well is because
> > the changes we make apply to the kernel as a whole. Yes, sometimes that
> > makes things more difficult and time-consuming, but it also means that
> > the end result will be much more widely usable and therefore benefits
> > everyone else in return. In my opinion that's a large part of why the
> > kernel is so successful.
> >
> > > We have piles of stuff in drm and drm drivers that should be in core =
but
> > > isn't.
> > >
> > > Imo the only reasonable way is to merge as-is, then follow-up with a
> > patch
> > > series to move the helper into the right subsystem. Most often
> > > unfortunately that follow-up patch series will just die.
> >
> > Of course follow-up series die. That's because nobody cares to follow-up
> > once their code has been merged.
> >
> > Collecting our own helpers or variants of subsystems is a great way of
> > isolating ourselves from the rest of the community. I don't think that's
> > a good solution in the long run at all.
> >
>=20
> We have a bunch of patch series that we resubmit for months and they go
> exactly nowhere. They don't die because we stop caring, they die because
> they die. Some of them we even need to constantly rebase and carry around
> in drm-tip since our CI would Oops or spew WARNIGs all over the place.
> There's simply some areas of the kernel which seem overloaded under patch=
es
> and no one is willing or able to fix things, and I can't fix the entire
> kernel. Nor expect contributors (who have much less political weight to
> throw around than me) to do that and succeed. And we don't end up with
> worse code in the drm subsystem, since we can still do the refactoring
> within drm helpers and end up with clean drivers.
>=20
> I fully agree that it's not great for the kernel's future, but when I'm
> stuck with the option to get shit done or burning out playing the
> upstreaming game, the choice is easy. And in the end I care about open
> source gfx much more than the kernel, and I think for open source gfx's
> success it's crucial that we're welcoming to new contributors and don't
> throw up massive roadblocks. Open source gfx is tiny and still far away
> from world domination, we need _lots_ more people. If that means routing
> around other subsystems for them, I'm all for it.

I can't say I fully agree with that sentiment. I do see how routing
around subsystems can be useful occasionally. If nobody will merge the
code, or if nobody cares, then by all means, let's make them DRM-
specific helpers.

But I think we need to at least try to do the right thing. If only to
teach people what the right way is. If we start accepting such things
by default, how can we expect contributors to even try?

I also think that contributors will often end up contributing not only
to DRM but to the kernel as a whole. As such it should be part of our
mentoring to teach them about how the process works as a rule, even if
the occasional exception is necessary to get things done.

In this particular case, I know for a fact that both backlight and SPI
maintainers are very responsive, so that's not a good excuse.

Thierry

--Q6STzHxy03qt/hK9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYWTwACgkQ3SOs138+
s6GkSg/+JOHsBBsXt6A4GGbcWNmLhziDIMWHogdlN4xdFYDW3qzkG7XAGqg9nMU2
3SSK2yLVcdwv3qaniMrEA5WNjGbjWtbNR+ofVZ52kWQVEsBfMf6e6LTCrOrJOivN
8Y2UQvfLRDL0p4oIwxn4FChuFZbi1Nhy5bXcV/KfwSJABscDw/9KZerINAqqyZ3C
K6w2ah+/8pJ1m1x6AKoAYoIqFWGTA7K8uSJlrl68IbzSxyK1A8dOgdts+6kj/ilD
qFFHXD++J4cOvDbHhek5u6T5Mdp8eRpVv9Qcn6F/ezIYBfaWxeSswsnfgrxHIN2T
IHtwomk97Wn0ac6+ic+5TfI/6gd58FrBPmQV0UV/ALbGqTi9QQ+rbIAF75sVeoZb
2bbBnxRozVcci44BSYzPhTU9OqyXLjuQi7yQ6MLLiurs0XQ+RozIlvXeYKJIADcq
3iAvYGqm3HH97z0/E1oQomI5pbMYBfrEJQysAJs+hUZDdL9+01QZEsVBEh8uCtZ+
zUD39UY6qEKLyjhLWssAevSDQio9ZAfYdrZVPwx82jl/gYM1UUeTP8AEoJ4dKBWB
zBFOcwYbkKO4Wa9onR7+b12nOIyHLyWKvWhLs6N5FyAnZP6YB75VAZftnCtT4ES1
YNb+7t/In3G8M7jjh3AeRua6VJ+SN5XOm6u9xqrWjmTPlWejFhA=
=NexL
-----END PGP SIGNATURE-----

--Q6STzHxy03qt/hK9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
