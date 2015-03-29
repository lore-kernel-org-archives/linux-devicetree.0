From: NeilBrown <neilb@suse.de>
Subject: Re: [Gta04-owner] [PATCH 1/3] TTY: use class_find_device to find
 port in uart_suspend/resume.
Date: Mon, 30 Mar 2015 08:49:52 +1100
Message-ID: <20150330084952.0becad98@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
	<20150318055831.21025.27864.stgit@notabene.brown>
	<5512E044.4080700@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/YT0pLvdxuAaeRAda/HS+.Kh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5512E044.4080700@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, GTA04 owners <gta04-owner@goldelico.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
List-Id: devicetree@vger.kernel.org

--Sig_/YT0pLvdxuAaeRAda/HS+.Kh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Mar 2015 12:20:20 -0400 Peter Hurley <peter@hurleysoftware.com>
wrote:

> Hi Neil,
>=20
> On 03/18/2015 01:58 AM, NeilBrown wrote:
> > uart_{suspend,resume}_port seach the children of a uart device
> > to find a particular tty device.
> > This requires all the ttys to be direct children of the uart.
> >=20
> > A future patch will allow a 'tty_slave' to intervene between
> > the port and the uart, voiding this requirement.
> >=20
> > So change to use class_find_device.  This is made possibly by
> > exporting a "tty_find_device" from tty_io.c
>=20
> Comments below.
>=20
> > Signed-off-by: NeilBrown <neil@brown.name>
> > ---
> >  drivers/tty/serial/serial_core.c |   21 ++++++++-------------
> >  drivers/tty/tty_io.c             |    6 ++++++
> >  include/linux/tty.h              |    1 +
> >  3 files changed, 15 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/seri=
al_core.c
> > index 6a1055ae3437..7abb7474870a 100644
> > --- a/drivers/tty/serial/serial_core.c
> > +++ b/drivers/tty/serial/serial_core.c
> > @@ -1960,26 +1960,19 @@ struct uart_match {
> >  	struct uart_driver *driver;
> >  };
> > =20
> > -static int serial_match_port(struct device *dev, void *data)
> > -{
> > -	struct uart_match *match =3D data;
> > -	struct tty_driver *tty_drv =3D match->driver->tty_driver;
> > -	dev_t devt =3D MKDEV(tty_drv->major, tty_drv->minor_start) +
> > -		match->port->line;
> > -
> > -	return dev->devt =3D=3D devt; /* Actually, only one tty per port */
> > -}
> > =20
> >  int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
> >  {
> >  	struct uart_state *state =3D drv->state + uport->line;
> >  	struct tty_port *port =3D &state->port;
> >  	struct device *tty_dev;
> > -	struct uart_match match =3D {uport, drv};
> > +	dev_t devt =3D MKDEV(drv->tty_driver->major,
> > +			   drv->tty_driver->minor_start) +
> > +		uport->line;
> > =20
> >  	mutex_lock(&port->mutex);
> > =20
> > -	tty_dev =3D device_find_child(uport->dev, &match, serial_match_port);
> > +	tty_dev =3D tty_find_device(devt);
> >  	if (device_may_wakeup(tty_dev)) {
> >  		if (!enable_irq_wake(uport->irq))
> >  			uport->irq_wake =3D 1;
> > @@ -2039,12 +2032,14 @@ int uart_resume_port(struct uart_driver *drv, s=
truct uart_port *uport)
> >  	struct uart_state *state =3D drv->state + uport->line;
> >  	struct tty_port *port =3D &state->port;
> >  	struct device *tty_dev;
> > -	struct uart_match match =3D {uport, drv};
> >  	struct ktermios termios;
> > +	dev_t devt =3D MKDEV(drv->tty_driver->major,
> > +			   drv->tty_driver->minor_start) +
> > +		uport->line;
> > =20
> >  	mutex_lock(&port->mutex);
> > =20
> > -	tty_dev =3D device_find_child(uport->dev, &match, serial_match_port);
> > +	tty_dev =3D tty_find_device(devt);
> >  	if (!uport->suspended && device_may_wakeup(tty_dev)) {
> >  		if (uport->irq_wake) {
> >  			disable_irq_wake(uport->irq);
> > diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> > index 51f066aa375e..27632ad17d6f 100644
> > --- a/drivers/tty/tty_io.c
> > +++ b/drivers/tty/tty_io.c
> > @@ -3077,6 +3077,12 @@ static struct device *tty_get_device(struct tty_=
struct *tty)
> >  	return class_find_device(tty_class, NULL, &devt, dev_match_devt);
> >  }
> >
> > +struct device *tty_find_device(dev_t devt)
> > +{
> > +	return class_find_device(tty_class, NULL, &devt, dev_match_devt);
> > +}
> > +EXPORT_SYMBOL(tty_find_device);
> > +
>=20
> Would you please replace tty_get_device() usage with tty_find_device()
> (and keep the function comment from tty_get_device())?
>=20

I was wondering what would be the best thing to do to tty_get_device.
As there is only one caller, replacing at you suggest seems best.
I've done that - thanks.

NeilBrown

--Sig_/YT0pLvdxuAaeRAda/HS+.Kh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVRhzgDnsnt1WYoG5AQKAIA//UB3QkdDeqdsD1xAsmsJxImOsRZMbtJvu
QIal7EQgRUK6M3K9xASD0kpdFxT+2Srp2KsEKramLtQKMqILaLZdh3UJF5ZNUlLG
HKdT2AWq+5+qlHKx2/x4U/tk3yXF64pKD4tLu1U7VVMDuPG3J4ksdYUA4dI+Bus6
dYEazUbzHrdwVjp4uXeY/QN3AoW9X1ul3TupEe7JOWOHeVgxf2lwLJgvVQbSSyM3
GnP3nuLGe3ROeydHpqcEWhjYlmemRaOWxd5p7QvE6y8QXcdZlUL5H1O9nvns26b/
RBPuVCxzqBPrH+xxyuTh1zJzI5ytsIs5bQM8flpeiQAcc9CClYuwE56HnfFZKlTa
uIoLMoh2mTdl86bQFBxGpQbsXPNWf+f0RkCAwICvByFaxppcODY3Hu/LDZtzbIac
Jv4wCgJGvs5qPaDyE0G3T53uOCRF6HLZaa9T4eABREFk9Cs6i1DQyinNaAyjvg74
spob2kFBnxhWkyojk6OohwYwcv6YmgP2icDGWy/aQz/rmIgQG4kkjDOuI2eXahU3
reqU1WFE+kkjJWPNwnXk1owWULdx9wom+i0Giwz9Tb/beF8bJ2XVeeMdzI/sf7Mr
C3s6blS0LCd67ZrWN3lw2nhARs1wT420+fvklq3grdLF3LbauNsLvHSJ8Si6qX2y
9HYu4fC6Fks=
=5kqo
-----END PGP SIGNATURE-----

--Sig_/YT0pLvdxuAaeRAda/HS+.Kh--
