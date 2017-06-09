From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 03/11] drm: sun4i: ignore swapped
 mixer<->tcon connection for DE2
Date: Fri, 9 Jun 2017 16:46:49 +0200
Message-ID: <20170609144649.67i3zscq26jt5hhe@flea.home>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-4-icenowy@aosc.io>
 <20170607093512.rfvpefmyskgjw3ik@flea.lan>
 <01A7F22E-C4FF-4B4B-A9BC-FF0C96B996B9@aosc.io>
 <20170607143827.4ng5gedvzn3f5pyx@flea.lan>
 <66881eac1dd06d918692482bdb1ea9e6@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="35hmrjg7ko7l5c5v"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWXJ5LEQKGQEMWEEC4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <66881eac1dd06d918692482bdb1ea9e6-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--35hmrjg7ko7l5c5v
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2017 at 01:01:53PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-06-07 22:38=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Wed, Jun 07, 2017 at 06:01:02PM +0800, Icenowy Zheng wrote:
> > > >I have no idea what this is supposed to be doing either.
> > > >
> > > >I might be wrong, but I really feel like there's a big mismatch
> > > >between your commit log, and what you actually implement.
> > > >
> > > >In your commit log, you should state:
> > > >
> > > >A) What is the current behaviour
> > > >B) Why that is a problem
> > > >C) How do you address it
> > > >
> > > >And you don't.
> > > >
> > > >However, after discussing it with Chen-Yu, it seems like you're tryi=
ng
> > > >to have all the mixers probed before the TCONs. If that is so, there=
's
> > > >nothing specific to the H3 here, and we also have the same issue on
> > > >dual-pipeline DE1 (A10, A20, A31). Chen-Yu worked on that a bit, but
> > > >the easiest solution would be to move from a DFS algorithm to walk
> > > >down the graph to a BFS one.
> > > >
> > > >That way, we would add all mixers first, then the TCONs, then the
> > > >encoders, and the component framework will probe them in order.
> > >=20
> > > No. I said that they're swappable, however, I don't want to
> > > implement the swap now, but hardcode 0-0 1-1 connection.
> >=20
> > We're on the same page, it's definitely not what I was mentionning
> > here. This would require a significant rework, and the usecase is
> > still unclear for now.
> >=20
> > > However, as you and Chen-Yu said, device tree should reflect the
> > > real hardware, there will be bonus endpoints for the swapped
> > > connection.
> >=20
> > If by bonus you mean connections from mixer 0 to tcon 1 and mixer 1 to
> > tcon 0, then yes, we're going to need it.
> >=20
> > > What I want to do is to ignore the bonus connection, in order to
> > > prevent them from confusing the code.
> > >=20
> > > If you just change the bind sequence, I think it cannot be
> > > prevented that wrong connections will be bound.
> >=20
> > This is where I don't follow you anymore. The component framework
> > doesn't list connections but devices. The swapped connections do not
> > matter here, we have the same set of devices: mixer0, mixer1, tcon0
> > and tcon1.
> >=20
> > The thing that does change with your patch is that before, the binding
> > sequence would have been mixer0, tcon0, tcon1, mixer1. With your
> > patch, it's mixer0, tcon0, mixer1, tcon1.
> >=20
> > So, again, stating what issue you were seeing before making this patch
> > would be very helpful to see what you're trying to do / fix.
>=20
> So maybe I can drop the forward search (searching output) code, and keep
> only the backward search (search input) code in TCON?
>=20
> Forward search code is only used when binding, but backward search is use=
d
> for TCON to find connected mixer.

It is hard to talk about a solution, when it's not clear what the
issue is.

So please state=20
> > > >A) What is the current behaviour
> > > >B) Why that is a problem
> > > >C) How do you address it

We'll talk about a solution once this is done.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--35hmrjg7ko7l5c5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZOrTZAAoJEBx+YmzsjxAge1kP/ir/KB6PzJXupxsu/zx2crOT
ovELSJVD/peATXWCpGDLvawT4CsH4d+dIIXbcP7Z4fyc6L04eMk3G34CKY5ZQf3J
0/L6KdujncFO0U/CUUbw5ZxKwlVgeoqZKm1aaWbc+bjDBrknqyc/z72xEaNYv4ma
q05r7SLjHdxDEYODjkaYKAT9HJ8AYELZYm4tJbxL8fjZijnQj+iwcxX7aiSmBYr7
lAST6HAXR9hHtzsMZGtfQzgdoeMyM8YaSwdLi2uFc8SB9397MSTcCmEk8KfaXE1L
7w6NThfPC9XT311jwUc+G9HdDIUmG2niNYTgKEFLuPVuzwlMarmLVi529ee8Ol5H
PWlnPhW5b0Vs6oHI7dtW6Ek1qhJY4kBNhnSvbwsnLGKlxUdOTI5cBkwSKJ4hPcTG
DurO4PpGKNvYsgRLAnkKufwq8mTC01kXlLdHyxpkxCyDE84TKgXLty8aBJNwqo9w
y/C0ZnPL6rKYJhdjgzy6LvuPaSNwjQ6fYmVaBGEkNJvDgO5T0Z2wOBrb9i88wrOL
x2nvfj6stytT4WAMIw2qiwovfg8vw3xcLWEgJTWzPm7RZkgh1SuKERr84anU0NWw
fh9DdGpLvqW9fotwvC9N3xxXMwKe1eF/DeQ9TNMo/uGZqLhpPv2n3i1B3lNYmIre
l6KjKpALxgUSMrNmXeix
=o/oI
-----END PGP SIGNATURE-----

--35hmrjg7ko7l5c5v--
