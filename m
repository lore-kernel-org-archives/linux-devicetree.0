From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 03/11] drm: sun4i: ignore swapped
 mixer<->tcon connection for DE2
Date: Fri, 9 Jun 2017 16:45:40 +0200
Message-ID: <20170609144540.ijly4b4bp5kphubo@flea.home>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <01A7F22E-C4FF-4B4B-A9BC-FF0C96B996B9@aosc.io>
 <20170607143827.4ng5gedvzn3f5pyx@flea.lan>
 <74846068.xK7nHVXuC6@jernej-laptop>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gsmuqn7akc7lefqc"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBFPJ5LEQKGQE55J5C7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <74846068.xK7nHVXuC6@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gsmuqn7akc7lefqc
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Wed, Jun 07, 2017 at 08:15:12PM +0200, Jernej =C5=A0krabec wrote:
> Hi!
>=20
> Dne sreda, 07. junij 2017 ob 16:38:27 CEST je Maxime Ripard napisal(a):
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
> If I understand correctly, she wants to make sure that DT has mixer0 - tc=
on0=20
> and mixer1 - tcon1 relationship and discard mixed relationship. I also be=
lieve=20
> that this is just temporary measure until mixed relationship is supported=
 by=20
> the driver.

yeah, but all the component stuff doesn't care about the relationships
themselves, it just cares about the set of devices, and we use those
relationships to build that set. In this case, even with the swapped
connections, the set of devices remains the same, which is what
puzzles me.

> Maybe we could just leave this out for now and define only one endpoint i=
n DT=20
> for TVE instead of two? Vast majority of users will have 0-0 and 1-1=20
> relationship, since there is not much point connecting HDMI with less cap=
able=20
> mixer than TVE.

Yeah, but unfortunately, we have to have a perfect representation from
day one now...

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

--gsmuqn7akc7lefqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZOrSUAAoJEBx+YmzsjxAgFPoQAKgrSl1gbGCb4cOGjzG89Pyk
7dfn2a9bHwzSKA89yNpG6LkWMavDaKcE7Fe88Qeu5vhEWECYAJkTG2zUysGbbo9R
TPV9rd8uDHYeBRg70RzEYaG09jlqzOAzH5TKTg5atwx02aQzYKoECyC9BwrMt+dQ
g2pU9E3AkKucVY+LE1DdRKRHlUfSPz7cHjevIAcHwv4ZZ43mR9MhqLASSZWn3bOL
/84uOQd2Rs60bXZFbd6aAnH1DyZPKK0NOKaNNKBd3ShKSLTY249TfwGbTvy6VcwH
kCTztpgi9wWriERXJtLhrvpvM0W1ssA59NQ5X2GOR+mRkjSOJjp9uCRiX1x3aqH6
FWdtRS3IAh+mFsw2aWQ+ZJg1MQUeD2/MRlxFfrL3e41ki9wO3oz67c1oI/ZskMkN
KHeC0bGBAES2SlAftgRSg4DH08L29nf3RxPB1Q0UK6yh9RPw1bgyyhowWIFLZy3g
pbMTNlc2dQSCQZIAt7vQohf+fT8VfXyzFmnzEMbXB6nhD4gqMUH8uuTmAiR20sFM
u3nRRBOpscIzCM8DoQQbeB5OZAQpR41yGZ42xZ1qbGGcFIjlInwNvzeZfSzG8rvy
EQhWn/4dAwNC+466cv9/Y6iE/wGcM5cobrZbu+Tu7UB6I92wcL4goV2/TPuC/n+/
fovEsdE7geDI9xLPpyWt
=/lXg
-----END PGP SIGNATURE-----

--gsmuqn7akc7lefqc--
