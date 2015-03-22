From: NeilBrown <neilb@suse.de>
Subject: Re: [Gta04-owner] [PATCH 2/3] TTY: add support for tty_slave
 devices.
Date: Sun, 22 Mar 2015 14:42:09 +1100
Message-ID: <20150322144209.14abc603@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
	<20150318055831.21025.85317.stgit@notabene.brown>
	<20150320194150.GB28194@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/GC5Hw7IIpGcGzwLM0jL3Gfq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150320194150.GB28194@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, GTA04 owners <gta04-owner@goldelico.com>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
List-Id: devicetree@vger.kernel.org

--Sig_/GC5Hw7IIpGcGzwLM0jL3Gfq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Mar 2015 20:41:50 +0100 Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
>=20
> (And yes, I now see dts examples, sorry for the noise.)
>=20
> Acked-by: Pavel Machek <pavel@ucw.cz>
>=20
> Minor nits below.
>=20
> > --- /dev/null
> > +++ b/drivers/tty/slave/tty_slave_core.c
> > @@ -0,0 +1,136 @@
> > +/*
> > + * tty-slave-core - device bus for tty slaves
>=20
> Filename actually uses underscores.

The filename uses underscores because all the filenames in drivers/tty do.
And this isn't a file name, it is more like a module name, and the module
tools treat '-' and '_' as equivalent.
And I prefer hyphen....

I looked at other files in drivers/tty and decided noticed that they use
spaces to separate words in this context (novel concept :-) so I've done the
same.

>=20
> > +			container_of(parent, struct tty_slave, dev);
> > +		tty->ops =3D &dev->ops;
> > +	}
> > +}
> > +EXPORT_SYMBOL(tty_slave_activate);
>=20
> Not "_GPL"?

Other exports in the files are just EXPORT_SYMBOL, so I copied.
I don't feel strongly (the code is GPL anyway) so just follow what
surrounding code does.

>=20
> > +postcore_initcall(tty_slave_init);
> > +module_exit(tty_slave_exit);
>=20
> Should it have MODULE_LICENSE tag?

Yes. Added.

>=20
>=20
> > +int tty_register_finalize(struct tty_driver *driver, struct device *de=
v)
> > +{
> > +	int retval;
> > +	bool cdev =3D false;
> > +	int index =3D dev->devt - MKDEV(driver->major,
> > +				      driver->minor_start);
> > +	printk("REGISTER %d %d 0x%x %d\n", driver->major, driver->minor_start=
, dev->devt, index);
>=20
> That printk should probably be removed for merge?

Gone.

>=20
> > +	if (!(driver->flags & TTY_DRIVER_DYNAMIC_ALLOC)) {
> > +		retval =3D tty_cdev_add(driver,
> > +				      dev->devt,
> > +				      index, 1);
>=20
> You can put this on one line.

Indeed.  Done.

>=20
> > --- /dev/null
> > +++ b/include/linux/tty_slave.h
> > @@ -0,0 +1,26 @@
> > +
> > +struct tty_slave {
> > +	struct device *tty_dev;
> > +	struct tty_driver *tty_drv;
> > +	struct tty_operations ops;
> > +	struct device dev;
> > +};
>=20
> Header files usually have #include guards, and some kind of comment on
> top.
>=20
> 									Pavel

Of 1996 files in include/linux, 1851 seem to do that.  That's enough to
convince me.  I've done it too.

Thanks,
NeilBrown


--Sig_/GC5Hw7IIpGcGzwLM0jL3Gfq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVQ46ETnsnt1WYoG5AQJCsBAAvAuB+FGWqj78XJoUkdIlvwdarJaU3MqI
yJfJ17XGwg3/D1uWQnOS+dpur9mWgavu6KwwMkJXdY7bg1wDD0LnBvceWCyeAWyV
8AYSWv5DqE6mnisiWMSRn6xdgWBbEZX6RSqeA4f6bM5RUU9KSIQtY6/NMd2TsUYY
24CmBRhi8uJmhn21T+2JwVLOYn1NlGLcDjJgHwetzzlxNg0wHtSBR9VbpTCoYf6E
l/D5K6+8SzijwRqgd5Fx/+dAPHt1+8UdUkSh9WcqS64pQlNS1Y+Id+nUIgMVGKPA
34lV+eMXudV4WVfZqRPZT3t9elnFsyFoLF9qqR5/AdYvM1otCmy0kaLNTJ3+y58b
Rde/Wdp69oXY1mhUMqmGsPDtGa06DenBC5eYh0J/nBsog4lpV4R2PCyHBPqBUIps
5UOvWv8k8EaowaL2PDzE/qrW7Aww+q9xYaHwaivXlR9UHKfIjHECvHBEbjgfZiiY
RbyevqKjk+buc9utZXEc4jVBXHUzWfjzBF0+Ngheno40EUZ/HbYdK9Ih/b2Dj10a
6SmASbet7mOAgoDlR0k04nwbkp2iyRQs3mCukl3qpYDBPZ+loXBn4NMhyabsJSsM
+xIcOfWOv8KjSfNQ/F3nEUdOKvbNPWmW/DPklUcaCwbT9g7BtKhA7OWc53dy7vMz
0gl+f+YHLoQ=
=D4t7
-----END PGP SIGNATURE-----

--Sig_/GC5Hw7IIpGcGzwLM0jL3Gfq--
