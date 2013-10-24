From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 10:34:12 +0200
Message-ID: <20131024083411.GH9403@ulmo.nvidia.com>
References: <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <20131022171346.GE4061@obsidianresearch.com>
 <20131023080630.GA14413@netboy>
 <20131023172955.GA17145@obsidianresearch.com>
 <20131023174736.GD5208@netboy>
 <20131023180240.GA32563@obsidianresearch.com>
 <20131023182345.GG5208@netboy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bygAmIonOAIqBxQB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023182345.GG5208@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bygAmIonOAIqBxQB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 08:23:47PM +0200, Richard Cochran wrote:
> On Wed, Oct 23, 2013 at 12:02:40PM -0600, Jason Gunthorpe wrote:
> > On Wed, Oct 23, 2013 at 07:47:37PM +0200, Richard Cochran wrote:
> > >=20
> > > The effort is no more or less than is required of every other kernel
> > > development.
> >=20
> > Bollocks. User space API development is the single most difficult
> > thing to do in the kernel. It is much harder than any other change,
> > and stable ABI DT is elevated to *that* level.=20
>=20
> Yes, that is the kind of effort needed. It comes with the territory.
> System calls and ioctls are added all the time. Yes, they do require
> some thought and review to get them right.
>=20
> Creating new DT bindings also requires effort, but I don't agree with
> the idea of making a mess for the end user just to avoid this effort.

There's another thing with DT bindings that makes them needlessly hard
to settle on. Let's say you come up with a binding that accurately
describes the hardware at hand and has been proven to work. Now people
keep telling you that it might not be good enough, for whatever reason
so eventually you decide to be bold and tell them that you're aware of
everything that stable DT bindings imply and that there might be some
risk of having to maintain two bindings because the first one didn't
turn out to be perfect and yada yada.

So you are actually prepared to take the risk of having to maintain two
different bindings and do all the work to get a new feature supported.
Now people tell you that you can't do that either because you might not
be around forever and some poor sod will have to maintain it for you.

What do you do then? You try to convince people that we are in a big
mess right now and that we need to find a way out of it.

Thierry

--bygAmIonOAIqBxQB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaNuDAAoJEN0jrNd/PrOh9ksP/1mo/ggpoookiimbJAB68kqA
uE6JRa6bmBRR49H7RCYCRofihuzq4EscDsVgW4HoOVHyKW07vQsUjwtgPY+0kKjN
K/xv4qPMqh/UgCDhaXv1PXkqb1ZK9G62RS6WQTgZivUAvLvFkRs7s/v5Rw2jqssR
WwXqZyVCmbkaY1cbf93aoHptCkU6lrduyR34D6pVtAAIlPSWCYms1KTMa/XujK6Q
FPoA9roVd6ZrmdFNnmyUBkFY6otT2zchbc5BtBTLhgmHtXZeuxD5+doD03bEW7nJ
txSZFvV8RwMowF2Am7/KWbj1KZNNyXe5pb/mqGxWRNB6enBVoHSXq1nt7t6XUE3c
1pD7yN2Uexk1qp2DA9FILaCyv01RYkJu6f/gT6EoAhBR7YdvyiEwYwML7R15GpF/
dxfnvh29N+GsZ4NR3JJ4iVaJLFa3dpSuIhJLmEtNoNJoFE+6mz0TmBC1+I1Gbrhl
M2M9MHBZK6fkYv+IqL9XP74kKFkodEtt+MUOv5ACpRz/Ypzjy9L4mrluuZuBNMHv
1w7pd8UKA17gC4vFFA6Iw8lFAWsDlGWLsrtBypbY0rsuHBh2v0cXzMh7VnnXwuXJ
h0x35aTfatU2kpEzo50UjT24ZJ3x/tEE+Lk2HV7jQwb+EAWF5ub+HrZKR0XAFlZ8
UleKN76/kybh09MSQr/S
=CR5I
-----END PGP SIGNATURE-----

--bygAmIonOAIqBxQB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
