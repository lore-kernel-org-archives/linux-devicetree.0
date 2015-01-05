From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 1/3] TTY: add support for "tty slave" devices.
Date: Mon, 5 Jan 2015 20:09:36 +1300
Message-ID: <20150105200936.2ba8f596@notabene.brown>
References: <20141211214801.4127.93914.stgit@notabene.brown>
	<20141211215943.4127.24792.stgit@notabene.brown>
	<20141228142010.GA3922@amd>
	<20150103103357.2406fc23@notabene.brown>
	<20150104101847.GA6122@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/R0CNfmCzBnwXvKdDqnBSZfZ"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150104101847.GA6122@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/R0CNfmCzBnwXvKdDqnBSZfZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sun, 4 Jan 2015 11:18:47 +0100 Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:

> Hi!
>=20
> > > > +Optional child node:
> > > > +- a platform device listed as a child node will be probed and
> > > > +  powered-on whenever the tty is in use (open).
> > > > +
> > > >  Example:
> > > > =20
> > > >  	uart@80230000 {
> > >=20
>=20
> > But some line disciplines don't really want the char_dev.
> > N_MOUSE wants a serio device.
> > N_HCI wants an HCI device
> > N_GSM07010 wants 63 different tty char_devs.
> > N_IRDA and N_PPP ultimately want a net_dev.
> > etc.
> >=20
> > It would be really nice if the uart would register the line disciple as=
 a
> > child device, then the line discipline would register whatever it wants.
>=20
> Yes.
>=20
> > N_HCI activates (registers the hci dev) on HCIUARTSETPROTO ioctl.  A ch=
ild
> >   device would need a way to specify the protocol I resume.
> > N_MOUSE activates on a 'read' on the tty - and deactivates when the read
> >   completes.
> > N_GSM0710 activates immediately that the ldisc is activated, as does N_=
IRDA
> > N_PPP seems to want a PPPIOCNEWUNIT ioctl to fully register.
> >=20
> > Doing any of these in a driver for a uart slave device would certainly =
be
> > possible.  I wonder if it is something we really want to do in the kern=
el
> > though.  What is the gain over providing sufficient information in the
> > KOBJ_ADD uevent so that udev can do the required work in user-space?
>=20
> Consistency. If you have bluetooth on USB, it automatically works,
> without userspace help. If we have mouse on USB, it automatically
> works, etc...

My point is: why is the kernel/userspace distinction important?  As long as
it "automatically works", does it really matter where the code is?
We can put a little bit of code in the kernel (to report the details of the
attached device) and a little bit of code in udev (to run hciattach) and it
will still be automatic.

NeilBrown


>=20
> > However I do like the idea of having the UART probe the child instead of
> > registering a tty.  It could pass the tty_operations structure to the c=
hild,
> > and the child could then register a tty with a slightly different
> > tty_operations structure, allowing it to capture any operations that it=
 wants
> > to capture (such as open/close).
> > I might try coding that and see what it looks like...
>=20
> Lets have a look...
> 									Pavel


--Sig_/R0CNfmCzBnwXvKdDqnBSZfZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVKo4sDnsnt1WYoG5AQLVCxAAnPXeRUkB8zzq65LaekcR9MY3bHpU45cK
SSqYvjWfWhTr1bisVHoFUk/qOh/vH8IdCCRfUrV9bPx5Rj2N1R0uQJ7+cN40/Bu1
h86M3xFLjOWZbj1t6v0/ImVhYcTGH93KENnp6Ho9G2eaqEaQ633w6PC4Apss81WE
5RdJ80lLfcEiwsv/+xFAIvj/nUQQ3fJs5DCamW3OAWAJMjFDQwypw1TqDFkgSro2
sKgHbakD/CjqzRV72lliNAKNM4lMxTqa+aMuEkrugklvLFufzMPvNWfOlkPPmQJz
Z7OyUdTthcj5DvHWXCWy66QwkysMRSO42soagoFIoma+tI8TGdD2tVPEOYcNtGEq
Fyq4v7APOpzfG3GOw5ZJUy4Z2ZhM56lYw4YKSAwjO2kYzXQAqfZetIOFBDKOPGQ2
R8pnTPwrkr5qwwSKOKlPSOGGBSO23uKWb4a442p+g5dkQxzbyi6ZZlKrnD43VWTz
NKYScqQuL9C5j00wzEtsqQaFW/CnDPwavfx0cldp9q+LEATCRgu1xh07/c4KQGpW
sSYLRh+7WXFgNntt3xsUOB5yHi0w0puU/KaGvhUAKL4KX49SefdHm+l7nJFn0DFv
RSwzo7kYM4JkCGEPXJE9ysqem75XM4lWYatseZNDLExVRhy/z/y5nN0qiD7b5TPe
w75ct0oW0tA=
=K6x5
-----END PGP SIGNATURE-----

--Sig_/R0CNfmCzBnwXvKdDqnBSZfZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
