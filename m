From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 10:50:27 +0200
Message-ID: <20131023085027.GA11954@ulmo.nvidia.com>
References: <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <alpine.LFD.2.03.1310221333300.1951@syhkavp.arg>
 <20131022201228.GB8037@mithrandir>
 <alpine.LFD.2.03.1310221624390.1951@syhkavp.arg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.03.1310221624390.1951-hIgblCxmbi8OMTOF05IoTw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2013 at 04:41:23PM -0400, Nicolas Pitre wrote:
> On Tue, 22 Oct 2013, Thierry Reding wrote:
>=20
> > On Tue, Oct 22, 2013 at 01:42:48PM -0400, Nicolas Pitre wrote:
> > > On Tue, 22 Oct 2013, Matt Porter wrote:
> > >=20
> > > > DT has many benefits. It would be great to leverage them as long as=
 it
> > > > doesn't interfere with the rate of change and willingness to evolve=
 code
> > > > that's always been the strength of the kernel process. That strengt=
h is
> > > > too valuable to trade away for the "DT as ABI" vision.
> > >=20
> > > Amen.  This is the best statement I've read about DT so far.
> > >=20
> > > Having "stable" DT bindings is just a dream.  Experience so far is=20
> > > showing that this is neither practical nor realistic.
> > >=20
> > > The unstructured free-for-all approach isn't good either.  Some=20
> > > compromise between the two extremes needs to be found.
> >=20
> > I agree. I think we need an easy way to mark bindings as unstable.
>=20
> No, that's not a solution.
>=20
> It is fairly easy to qualify a small set of bindings as "stable" for=20
> interoperability purpose (e.g. for qemu/kvm).
>=20
> But for the vast majority it is very hard to decide when a particular=20
> binding has reached stability.  By definition, a binding may be=20
> considered "stable" only after seeing no change for a reasonable period=
=20
> of time being tested and used.  So stability may simply not be a=20
> criterion for upstream merging.

That's not what I was suggesting. I've been arguing all along that it
should be possible to upstream code that relies on unstable bindings
precisely so that we could get some reasonable amount of testing.

Perhaps I should also restate that stable doesn't actually mean "can
never change". If we're only concerned about stable ABI, then the
bindings can still change, *if* they do so in a backwards-compatible
way.

Furthermore, it's also been stated in this thread and elsewhere, that
it's entirely possible to pull something like that off even without
unstable bindings. The only additional requirement is that if a change
is introduced that causes backwards-incompatibility, then we cannot
change the binding, but instead have to add a new one. That's the same
thing we do with syscalls as Russell has said.

It is true that this requires additional code will have to be written.
At the same time it's likely that most of the driver code will still be
possible to be shared between two differing bindings, so perhaps the
result won't even be as catastrophic as people like to make it sound.
We're currently lacking functionality, even trivial things, because of
what? Because we're afraid of making mistakes.

I'm beginning to think that we need to grow a pair.

Thierry

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZ43TAAoJEN0jrNd/PrOhOh0P/09DLTKlpFvUwj0SrJzEEKvm
viN05sEVve+sDzu9z5qRDhgEGJCgTj1CwlxUX7nyzlESEFmoWNAzIV0s+Cno3Weu
HnpgIWGX0EVl7alZWCMWLrxGNsBx9GmQW6kUFTyAPw2s6qJlN3gg+ZvcLyMhQVkI
VngUQW+h4HRZDuM9KVwyYtT2L0TLJQ7b/i/KzA8RonSVCvySOZDLmzJgNeJQLNHB
HkXHZBraUHpPfCwG/XH6NvN3YN9M89tfsSjkvqZCf/TkVkPpYXsF9MAOChsPtI8u
wbyuhtSRzeUuYWE+7wjGKinBnJ9ua39lDy07RJqkhukrfM6hXUPHjW6a7BXXpP98
7BmYYfMwyElcvPBLjD0wY1VEfEYuTldjIWF+asfoK84NTjzqBazGy4EzSEfIX+wk
8IDTvx1yMCmdKcKrDZQZ60HhckufqESI2o8EK/7MyWPmRE3H233NaPL2VRWvyvrn
QUOY6tMVcyCDkvptPWd/PfW2u1A3t6ETVBgWuHa18f+wBdrbpY2BjHUzs3GojC3v
lM4if8k0Zp7TQnS7DWhDoaZX/oelrl8Ib8DUWIbPnlJXyJkH3qrKt0jwBSRoA7zl
/VEs+tTPjDmYJ2XXrwhvIjJC4YB2iei9D5KwIeTqmzFAcoTyn/qraXPWLra671Va
ZVo3cBlKT4W4b0eTmj21
=Sgoj
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
