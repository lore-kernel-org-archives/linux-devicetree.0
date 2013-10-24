From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 10:17:33 +0200
Message-ID: <20131024081733.GG9403@ulmo.nvidia.com>
References: <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <20131022171346.GE4061@obsidianresearch.com>
 <20131023080630.GA14413@netboy>
 <20131023172955.GA17145@obsidianresearch.com>
 <20131023180108.GA23728@roeck-us.net>
 <20131023182502.GC32563@obsidianresearch.com>
 <20131023183041.GH5208@netboy>
 <20131023185435.GD32563@obsidianresearch.com>
 <20131024080624.GV30088@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5UGlQXeG3ziZS81+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131024080624.GV30088-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--5UGlQXeG3ziZS81+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 10:06:24AM +0200, Sascha Hauer wrote:
> On Wed, Oct 23, 2013 at 12:54:35PM -0600, Jason Gunthorpe wrote:
> > On Wed, Oct 23, 2013 at 08:30:42PM +0200, Richard Cochran wrote:
> > > On Wed, Oct 23, 2013 at 12:25:02PM -0600, Jason Gunthorpe wrote:
> >=20
> > > > On ARM the package of 'stuff' can very reasonably include dtb. Dist=
ro
> > > > scripts can package modules+DTB+vmlinuz into something the bootload=
er
> > > > can understand. (The next pain point will be to standardize that)
> > > >=20
> > > > The DTB doesn't have to be 'outside' the distro/kernel to give user=
s a
> > > > seamless upgrade experience.
> > >=20
> > > How can a distro possibly provide me a DTB?
> > >=20
> > > They don't know what hardware I am using. Only I know that.
> >=20
> > I'm not sure what you are asking? Treat DTBs like kernel drivers. If
> > you make hardware and you want distros to run on it, you have to
> > provide the DTB for that hardware to mainline+distros.
> >=20
> > Remember, there are two ways to view DTB:
> >   a) It comes from the firmware and you have to live with whatever
> >      crap the firmware does
> >   b) It comes from the kernel, must match the kernel, and we don't
> >      have to tolerate crap in the DTB.
>=20
> c) It comes from the firmware and is at least good enough to bring up a
>    kernel to install a better devicetree.

That's an interesting new view. And I think that makes a lot of sense
because it matches the product cycle pretty well. Typically I wouldn't
expect an upstream kernel to be fully featured when first shipped in a
product, for all the known reasons, but it should be possible to come
up with stable bindings good enough to perhaps boot to a command-line
prompt and have some way of accessing other files (network, block
device, ...).

Then again you could argue that the bootloader should be able to update
itself (and the DTB while at it).

Thierry

--5UGlQXeG3ziZS81+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaNedAAoJEN0jrNd/PrOhkgsP/3hhvstmdfXDZGz18qG41IwC
NYbrOtOSiHbklZRUsiJWUwmpOZGXxgBClmES9rPwT5ya8blCOHgH2Z6yj0tc5Afd
26iIceeKYLUofi/LQl2PTTmzcx1ZdaUBNTaONj82DdS6GL3JmoUKsFRQvmeLNbzd
Q/yd0FcNNIPt9ZIWu6xuvVShYb0nghFyb7IjMBBHcVEouFNqjmbmh7yhdxsqx5cA
UBzWi2mc4cdQvP68VfZf0/pj6hKSrK7eF1EN8B7glFLP34ewnzSl+k6sZ/fNogHf
Acg0WZzULpJ5a9zBUPBgSjKxWzEzaWEq5XpMR7qPV1ey7KJwX4zA4NKUTgAO0Nmr
yEcQg2Tiu8/sZo1fV7CozqeTyK2sM0OmqWHG0aU7P5enk1+43TalpDfANqgEHG7H
pZ+NvN2laZ7QlEklMqjfCoxGz1MVLBjmzgCmgVyqy5txuA91u1+f6mtMUNkHPQ/2
dPoXn2hIIepBlfAfwoAHuC8WSQaMIqmJKsymu0Udo4ZUQGXyQi9pwKmnQzU47k/c
V6yah/iX0d5X4jNrxuj1LIK6W53EcmP80XAxVwVGRcYlMd925U/weCzKm6Skvk6P
fPv7g0fBLTuKYo1uzhe0RD8Spa6ZCA86Fsv4399MZEmtrldTw9osPcmprRIR4LbG
4DF2x5nBkmej460+HDSn
=Qj0W
-----END PGP SIGNATURE-----

--5UGlQXeG3ziZS81+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
