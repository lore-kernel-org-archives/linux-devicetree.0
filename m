From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 10:11:13 +0200
Message-ID: <20131024081113.GF9403@ulmo.nvidia.com>
References: <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <20131022171346.GE4061@obsidianresearch.com>
 <20131023080630.GA14413@netboy>
 <20131023172955.GA17145@obsidianresearch.com>
 <20131024080126.GU30088@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zs/RYxT/hKAHzkfQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131024080126.GU30088-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Zs/RYxT/hKAHzkfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 10:01:26AM +0200, Sascha Hauer wrote:
> On Wed, Oct 23, 2013 at 11:29:55AM -0600, Jason Gunthorpe wrote:
> > On Wed, Oct 23, 2013 at 10:06:31AM +0200, Richard Cochran wrote:
> > > On Tue, Oct 22, 2013 at 11:13:46AM -0600, Jason Gunthorpe wrote:
> > > > The question I asked last time this came up, which was left unaswer=
ed:
> > > >=20
> > > >  Who does this stable DT ABI vision benifit, and how much is that
> > > >  benifit worth?
> > >=20
> > > [Sigh]
> > >=20
> > > I already answered this question more than once. I guess it doesn't
> > > hurt to answer it again: It helps the users. Please, don't forget
> > > about them.
> >=20
> > I've seen that nebulous answer before. It is awfully vauge. Don't you
> > think a better, more excting answer is required to commit the kernel
> > community to such a huge amount of work+pain?
> >=20
> > What users? What use cases? Who exactly?
> >=20
> > Crucially: Does the above justify the huge effort on the kernel side?
> >=20
> > I'm a user of the kernel and I'm sitting here saying I don't need
> > this.
>=20
> When you want to create images which run on multiple boards
> (Distribution installers?) you depend on the board being able to
> describe itself. Currently this is the purpose if the devicetree, so it
> really makes sense to put it on the board.
>=20
> I'm not mandating a 100% stable devicetree and I think the devicetree
> in firmware still needs to be exchangable. Anyway, incompatible changes
> will cause pain for users who don't ship a devicetree with each kernel.

Okay. I think we all can agree that we won't find one single answer to
this. But I don't think we need to. That's why I keep saying we should
give users a choice. If somebody wants to use only stable bindings
because they can't or don't want to ship DTB updates along with kernel
updates, then by all means, let give them that option.

At the same time I don't think we should force *everyone* to abide by
the same restrictions. People have said that they don't care about the
bindings being experimental and changing in incompatible ways, and if
they don't mind updating the DTB along with every kernel update, then
why wouldn't we want to give them that option as well?

Every discussion about this topic so far seems to have concluded with
one party saying that we absolutely must have stable bindings and the
other party saying that we don't. We can certainly go on doing that
forever, or we find a compromise that both parties can live with.

Thierry

--Zs/RYxT/hKAHzkfQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaNYhAAoJEN0jrNd/PrOhYMgP/RTZ5f8Ns3FZ/CMQAtY1uC4M
UrEoHShNoImA9myoodN2cz/NKuMdkzdImLcAmkcjZpjUDkrnK3/xI7BENvUrqkxy
ArFqbe7XFOS4HKwJdoN2wa80jXP3MFPlolGacwwKXySU+MhfqdH/jSnzs/Eyf7Ut
BA2RWJtTg8OkWdNezzQmhciYJfgPYwFPE7ekUCfJGgM9coNNpyt29nUtHt6ZnGka
CXHAxXUDQJLqQLG/ySMZRq1G0zz3KQWde74/hRMJbWND4ARdX9Is3SvWUyx75n0A
HCHUODDuPRnJTUCPbnDLHedn1I82AWJZWzvOeuMWPJuSmk1lUKICx98XQi7J9/x0
/mDonbTD1umIGiLmIan2OSri4Dzy9sSh1Dtt6eW8vXDAfawR/q4m/3VnXeYwm/so
Ymly00y3LnTjMjQSUw+g3r1O3J85tdjf8xJoUE9GUOKp98TglzKQsNRlmH4rdo+V
MZwetNsnUd0ZeyMPgpmAheneQDlWmH+DQi7Z7Ob/1MieTQsyd93pHt1B7c16eU90
4YPvOOsplGfx3j//rH8dN75yDD7GXxOmro4xcHTXcXzI97geLQdBNfezIBN27cuH
h7oDfz+r+tI0ZkuF/xmHpnhRezIlYusO8TIcqBSqTc40VpEFF2/aipG+aFr2lr/m
SuO5kSUJSSLh9gSoig46
=bHBx
-----END PGP SIGNATURE-----

--Zs/RYxT/hKAHzkfQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
