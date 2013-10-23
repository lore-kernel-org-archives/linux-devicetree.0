From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 12:04:57 +0200
Message-ID: <20131023100456.GE11954@ulmo.nvidia.com>
References: <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <alpine.LFD.2.03.1310221333300.1951@syhkavp.arg>
 <20131022201228.GB8037@mithrandir>
 <20131022204238.GG29341@beef>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xJK8B5Wah2CMJs8h"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131022204238.GG29341@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xJK8B5Wah2CMJs8h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2013 at 04:42:38PM -0400, Matt Porter wrote:
> On Tue, Oct 22, 2013 at 10:12:29PM +0200, Thierry Reding wrote:
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
> > I agree. I think we need an easy way to mark bindings as unstable. One
> > possible solution that I can think of would be to use some kind of
> > special marker within the compatible value defined by a binding that
> > would be used to qualify it as unstable. Perhaps something as simple as
> > a preceding exclamation mark (!) would do.
> >=20
> > 	gpio {
> > 		compatible =3D "!foo-gpio";
> > 	};
> >=20
> > The DT core code could look for that when matching device nodes to the
> > list of compatible values supported by a driver and output a big warning
> > message to make users aware of the fact that the binding may change. The
> > driver could use the same marker in the OF device ID table to make it
> > clear that it implements an experimental binding. Whenever a binding is
> > deemed stable we can simply remove the marker from both the driver and
> > the binding, as well as DTS files.
>=20
> From a technical POV this seems nice.
>=20
> What does stable mean at this point? DTBs using the stable binding are
> forever guaranteed compatibility with newer kernels? We really need to
> define *exactly* what this implies for future support.

I think there's some broad agreement about what stable bindings entail.
Essentially it means at no point in the future a new kernel is allowed
to stop working with an old binding.

It also entails that bindings can change, but only in ways that don't
break backwards-compatibility.

> More than likely, most bindings will choose to stay experimental/testing
> indefinitely if stable means a lifetime of ugly backward compatibility
> hacks.

Possibly, yes. I'd like to think that having an explicit marker for
unstable bindings would be incentive enough to keep efforts ongoing to
make it stable. Think of it as the DT equivalent of the staging tree.
Nobody wants code to stay in staging forever because, well, it's just
ugly. If we furthermore output a warning at runtime whenever the DT core
encounters a compatible string marked as experimental, then people will
likely be under pressure even more to stabilize.

I've also proposed in another subthread that we could easily add a
Kconfig option that could be used for people to decide whether they want
to use experimental bindings or not. If they don't, then their device
may simply run with degraded functionality. In my opinion that will also
help to get experimental bindings to a more stable state. I expect that
there will always be people that run a "conservative" configuration with
only stable bindings allowed, and if they end up missing out on much of
the functionality there's even more incentive to get bindings tested and
stabilized.

Marking bindings as experimental will also allow us to go and remove a
binding altogether when it has failed to stabilize after some period of
time. I believe there's a similar policy in the staging tree.

Thierry

--xJK8B5Wah2CMJs8h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZ59IAAoJEN0jrNd/PrOhnRQQAITe0CwA1EUJdi6/JH5K2ebX
iJVdY0/rnxweZKiZl7mDwRe7br9624k4oD9a1ve9cOjjCeUz6GmrlaMBA0HEmJIK
Y8ItJdvnrCfnVRcdX3mBpXSRl9SSoMrYv6fV5Rn/Qg9bD+Tqh/Lw6jNPHkCqYMBA
mw7FzVstEGvrx3/uBN161c0EUGVZ80ziZgIsMcyuPZgq1S7xcc7UgOr/Z5QA9UQt
4hGxo7osw789kv/cDUffNe6Tj4qI3Q2MFtbAUKtj8E4KBXxECBlkYkAjuj6voH27
tRC+bGEYDOQOG9YhS7VazZWuajomkMj35TvkpwG06e6p92y7oJLxSDNAEm5IEunN
HwBOIa8UsgRXoVIHPa0BUhbI48zGynzZbHADtuaQD845hTDZMfu4L2Cs1rto20Xx
b6wEo3HOTSSjw/Ny87ocCFxlX6NeElReIQf2n/iltGEEN5t0PVUWsQpjhguRusom
EqJIi6LhwYF/Aj+ydb9UQJHDsEjP2979gUb7/iyt7eJTR/0JXzMV5OBBT49YWdo2
1x8InAzg7Xot5QqFqnhjI8g0xgqRiWLZGrjspVBAVeaE019Us9UFjWqfETr1N2vU
QdnCzT8TOl8zQP0zIQ5Ljs5ELSm+mizpNuNE6Kf/cmYOrEqhlErBUKotemA80ke5
vJRqTuzzrgZPh+pxAefQ
=y54P
-----END PGP SIGNATURE-----

--xJK8B5Wah2CMJs8h--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
