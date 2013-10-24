From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Thu, 24 Oct 2013 10:04:19 +0200
Message-ID: <20131024080418.GE9403@ulmo.nvidia.com>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <5267FA58.9050002@wwwdotorg.org>
 <20131023172001.GA3379@katana>
 <20131023185909.GC7863@ulmo.nvidia.com>
 <20131023193450.GE32563@obsidianresearch.com>
 <20131023195849.GA8828@mithrandir>
 <20131023210849.GB2912@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="10jrOL3x2xqLmOsH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023210849.GB2912-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--10jrOL3x2xqLmOsH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 03:08:49PM -0600, Jason Gunthorpe wrote:
> On Wed, Oct 23, 2013 at 09:58:50PM +0200, Thierry Reding wrote:
[...]
> > > Also, what happens during development? If you incompatibly change the
> > > binding you should change the name, so maybe <version>!marvell,foo is
> > > the way to go.=20
> > >=20
> > > v1 of the binding is 1!marvell,foo - version 2 is 2!marvell,foo, etc.
> > >=20
> > > When stablized the last bang is kept and the non-bang version is
> > > added. The boot warning is supressed once stable no matter the
> > > compatible string used in the dt...
> >=20
> > Why would we want to go through all that trouble if we define up front
> > that the binding is experimental in the first place? Encoding a version
> > number in it somehow entails that earlier versions are still supported
> > in some way.
>=20
> No, certainly not. It just says the binding has changed and every DT
> stanza that uses the old version needs to be reviewed and updated.
>=20
> > But the whole point of experimental bindings is so that we don't have to
> > worry about backwards compatibility.
>=20
> The purpose is to not silently throw users/testers under the bus. A
> driver that doesn't bind is much better than a driver that blows up in
> some crazy, hard to determine way because the DT binding has been
> silently incompatibly changed.
>=20
> The rule for experimental bindings should be that incompatible changes
> to the binding must bump the version number at the same time, clearly
> signalling to everyone using that binding that they need to take some
> action.

I disagree. I think that we should apply the same rule to DT bindings
(at least experimental ones) that we apply to code within the Linux
kernel. If you change an experimental binding in an incompatible way
then it should be your responsibility to update all users of it so that
they don't break.

In reality I would hope that this isn't much of a problem really. Given
the nature of a compatible value there will typically only be a single
driver implementing it. Any users of it (DTS files) should be pretty
easy to fix up at the same time.

That's the same way that platform data used to work, except it had the
advantage of the compiler actually pointing out incompatible changes.
There has been some discussion about adding validation functionality to
DTC, which should make it easy to find DTS files that require updating
as well.

The above would also indicate that because of their nature, experimental
bindings might be better kept within the Linux kernel tree. That would
make it easy to keep a good overview of what needs to be updated when a
binding changes. It would also make the promotion to stable much more
explicit by physically moving the binding document to a different
repository. Obviously that comes with its own set of problem that we'll
need to find a way to extend the board DTS files that will presumably be
kept in the external stable binding repository with experimental content
only available in the Linux kernel tree.

Thierry

--10jrOL3x2xqLmOsH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaNSCAAoJEN0jrNd/PrOhJQ4QAMHwXedCYRltj21DN/A54/8+
nkqKQJd5v5mnh9Y5ZFLETlUjK/p1h2sbKjuA8i4zZ9KHUQ0ImNNTpACZY9dAmGfw
T9wDIByIEoj26Ngu2aptTVp/g7fZgzyrpgFVWka/E3TTHPpMvjPVNKT3V6G732iy
tNbN3Cy8CzSMIHw9d7M1ghIe4TE/+1sasyKf7jYhPlPI32SA55qSgQE4Pi6wXv6g
XQrXFsENv8IiZ/fJ36MDDuerOkVzG04tZHkfsQO6S/qe4loWQ5zzoNBZ8Nc/ZvQ/
/Iflx0IjVXoEX9zKbC2liKNhprGwYkRKEw9/Ge6KTVnsK/QCG40wi3sxD18lrKqS
NA+Xx31UF+KGgSL3TYd2WkDjNkLdHa6sKQjcC7gZhWCvPGIg1mbLZwwZXkv3dzgY
yt7UZWWiiwPlOEi2ZLaLWlUuyPsEg71o65vA7l9TYEG+Xy1xCzMiFtWCy8zh4FCV
wFvDXs56DGciN9X3BkaSblg5qJIH202pNARouMfUJZ7goeJPvxyUXVrVpy1ZWZ2+
ktm9se1bJvPpC3h9smutsRf9ODH9Ht8PKJdCVBOpFvm+pcfj0NUHHYe6QX06IWVO
mHgfFdiBUD+gVLuTRX0ACTBInmre1kZfmhbkn5glCivOO8MGcWTw6mV+jX9wOa/i
Sll9081F7pI/iXcKaHo4
=OckY
-----END PGP SIGNATURE-----

--10jrOL3x2xqLmOsH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
