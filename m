From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 11:49:04 +0200
Message-ID: <20131023094903.GD11954@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <20131022171346.GE4061@obsidianresearch.com>
 <20131023080630.GA14413@netboy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023080630.GA14413@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 10:06:31AM +0200, Richard Cochran wrote:
> On Tue, Oct 22, 2013 at 11:13:46AM -0600, Jason Gunthorpe wrote:
> > The question I asked last time this came up, which was left unaswered:
> >=20
> >  Who does this stable DT ABI vision benifit, and how much is that
> >  benifit worth?
>=20
> [Sigh]
>=20
> I already answered this question more than once. I guess it doesn't
> hurt to answer it again: It helps the users. Please, don't forget
> about them.

But DT ABI stability doesn't help our users if we can't get them any new
features because we're afraid of not getting the binding perfect from
the start.

Real world example: we currently can't settle on the DT binding for
display panels, so while our users may not have to worry about having to
upgrade their DTBs, they can't use their devices because we're too
afraid of ABI stability to allow us to power up the panel. That's
ridiculous.

> If I, as an embedded developer, design my board to work with kernel
> version N and a given DTB, then I can upgrade to any kernel version
> M (where M > N) using the *same* DTB, and it still works.

I get that. I even agree that a stable DTB is a good thing to strive
for. But I also thing requiring every DTB to be stable absolutely is an
unnecessary burden. DT on ARM isn't very mature yet and I think we could
use some flexibility until we've figured a lot more of it out.

We could even add infrastructure to give people a choice. If we start
marking unstable bindings (which arguable would be the majority of the
bindings for the time being) and output a big warning when a device is
matched whose driver implements an unstable binding or which refers to
an unstable binding in the DTB, then it would discourage people from
relying on it if they don't want to be faced with the hassle of having
to update the DTB occasionally. But it also gives people the choice to
consciously ignore the warning if they prefer functionality over ABI
stability. That's nothing unheard of, we've been doing it for quite some
time using the staging tree.

If a runtime warning isn't good enough, we can easily add a Kconfig
option too. If people want to test-drive new functionality and accept
that they might have to update the DTB even on a regular basis, they
could activate that option and use all supported devices, even those
with experimental bindings. Such an option could default to n, upon
which the OF core just wouldn't match anything that carries the
experimental marker.

Does that sound like a good compromise?

Thierry

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZ5uPAAoJEN0jrNd/PrOhgfMP/0GmxM2LcI74//hGSeMWZJzc
nXtfF02kPEub/JD/apdYKuk+PcduA5xb2e1/IHAtoEIpZC3j8cAnkzmkFbhrrNPV
tOr44N+hphRNTAYJtMJEWJmBwpKw7a0xT2qsaQzpSUs67wMcT+kro1OeIzJ+iuLR
HgW7452oCVzFxxH3nwOtjW8LgSF5Ei8SzYa96+dW6JvxQHSPkeikzdkbBLwOj6s0
xmOuZUKFQHQ7W6odlnGSk5dnGFMBzz1NfxFuesaJCZRWXWtNAFqBp5h2MvktFDf5
E6OlAUJ47aQRlHA2SpKuYKqzcp/d1pI7s8gR9sEB4c6jDIm+6XDdFDqz2/gQkWPN
ZXBUNXJ1Xte36Zz+SZnPjSPSk0lzUd1U8WjfK2LCuNosVl6xUe7RSmiM9jqYl8mx
QduGH9ZFxJgpdE7WjH8ud5Cwg0m8kamZTe42CoqW+oQ43eKzv23gkBYK3eC+RuuP
4S/33ECrgQdC3Jk29tOfsu27lWPqEZcS8TcM5s2Rp+MOkL65G9vKz1p6HsWe51GB
TyetjV3R5v5HkBE2aZuchpW6jckpgCRi5mvOqDnR//GySSmaO+o2Xbbpuk0rjlX+
hnBBTEjpCcnmy+l91PzN2BYtiT8SR8eQifeoYb7mtIa/jB6oGZGlFQtxjQAnYATQ
ejAt7jzj+6fZ4W7R2H2L
=0Dtf
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
