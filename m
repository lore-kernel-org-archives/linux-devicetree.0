From: NeilBrown <neilb@suse.de>
Subject: Re: [PATCH 2/3] TTY: add support for tty_slave devices.
Date: Tue, 31 Mar 2015 10:45:20 +1100
Message-ID: <20150331104520.1002b7f0@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
	<20150318055831.21025.85317.stgit@notabene.brown>
	<55113D1B.1030906@suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/9JgButTXUC85yqUwwsq5yGX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55113D1B.1030906@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Slaby <jslaby@suse.cz>
Cc: NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/9JgButTXUC85yqUwwsq5yGX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Mar 2015 11:31:55 +0100 Jiri Slaby <jslaby@suse.cz> wrote:

> Hi,
>=20
> On 03/18/2015, 06:58 AM, NeilBrown wrote:
> > --- /dev/null
> > +++ b/drivers/tty/slave/tty_slave_core.c
> > @@ -0,0 +1,136 @@
>=20
> ...
>=20
> > +static int tty_slave_match(struct device *dev, struct device_driver *d=
rv)
> > +{
> > +	return of_driver_match_device(dev, drv);
> > +}
> > +
> > +static void tty_slave_release(struct device *dev)
> > +{
> > +	kfree(dev);
>=20
> This should free the slave where the dev is contained. This is never
> called IMO due to missing put_device's in the code.

Yes of course, thanks.  I've fix the 'kfree'.


>=20
> > +}
> > +
> > +struct bus_type tty_slave_bus_type =3D {
> > +	.name		=3D "tty-slave",
> > +	.match		=3D tty_slave_match,
> > +};
> > +
> > +int tty_slave_register(struct device *parent, struct device_node *node,
> > +		       struct device *tty, struct tty_driver *drv)
> > +{
> > +	struct tty_slave *slave;
> > +	int retval;
> > +
> > +	if (!of_get_property(node, "compatible", NULL))
> > +		return -ENODEV;
> > +
> > +	slave =3D kzalloc(sizeof(*slave), GFP_KERNEL);
> > +	if (!slave)
> > +		return -ENOMEM;
> > +
>=20
> device_initialize();

device_initialize is only needed if you call device_add()
I use device_register() which calls both.


>=20
> > +	slave->dev.bus =3D &tty_slave_bus_type;
> > +	slave->dev.parent =3D parent;
> > +	slave->dev.release =3D tty_slave_release;
> > +	slave->dev.of_node =3D of_node_get(node);
> > +	dev_set_name(&slave->dev, "%s", node->name);
> > +	slave->tty_dev =3D tty;
> > +	slave->tty_drv =3D drv;
> > +	slave->ops =3D *drv->ops;
> > +	retval =3D device_register(&slave->dev);
> > +	if (retval) {
> > +		of_node_put(node);
> > +		kfree(slave);
>=20
> Do device_put() instead of the two. And do the two in .release.

Done, thanks.

>=20
> > +	}
> > +	return retval;
> > +}
> > +EXPORT_SYMBOL(tty_slave_register);
> ...
> > --- a/drivers/tty/tty_io.c
> > +++ b/drivers/tty/tty_io.c
> ...
> > @@ -3205,6 +3208,29 @@ static void tty_device_create_release(struct dev=
ice *dev)
> >  	kfree(dev);
> >  }
> > =20
> > +int tty_register_finalize(struct tty_driver *driver, struct device *de=
v)
> > +{
> > +	int retval;
> > +	bool cdev =3D false;
> > +	int index =3D dev->devt - MKDEV(driver->major,
> > +				      driver->minor_start);
> > +	printk("REGISTER %d %d 0x%x %d\n", driver->major, driver->minor_start=
, dev->devt, index);
> > +	if (!(driver->flags & TTY_DRIVER_DYNAMIC_ALLOC)) {
> > +		retval =3D tty_cdev_add(driver,
> > +				      dev->devt,
> > +				      index, 1);
> > +		if (retval)
> > +			return retval;
> > +		cdev =3D true;
> > +	}
> > +	retval =3D device_register(dev);
> > +	if (retval =3D=3D 0)
> > +		return 0;
> > +	if (cdev)
> > +		cdev_del(&driver->cdevs[index]);
> > +	return retval;
> > +}
> > +EXPORT_SYMBOL(tty_register_finalize);
> >  /**
> >   *	tty_register_device_attr - register a tty device
> >   *	@driver: the tty driver that describes the tty device
> > @@ -3234,7 +3260,8 @@ struct device *tty_register_device_attr(struct tt=
y_driver *driver,
> >  	dev_t devt =3D MKDEV(driver->major, driver->minor_start) + index;
> >  	struct device *dev =3D NULL;
> >  	int retval =3D -ENODEV;
> > -	bool cdev =3D false;
> > +	struct device_node *node;
> > +	bool slave_registered =3D false;
> > =20
> >  	if (index >=3D driver->num) {
> >  		printk(KERN_ERR "Attempt to register invalid tty line number "
> > @@ -3247,13 +3274,6 @@ struct device *tty_register_device_attr(struct t=
ty_driver *driver,
> >  	else
> >  		tty_line_name(driver, index, name);
> > =20
> > -	if (!(driver->flags & TTY_DRIVER_DYNAMIC_ALLOC)) {
> > -		retval =3D tty_cdev_add(driver, devt, index, 1);
> > -		if (retval)
> > -			goto error;
> > -		cdev =3D true;
> > -	}
> > -
> >  	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
> >  	if (!dev) {
> >  		retval =3D -ENOMEM;
> > @@ -3268,16 +3288,24 @@ struct device *tty_register_device_attr(struct =
tty_driver *driver,
> >  	dev->groups =3D attr_grp;
> >  	dev_set_drvdata(dev, drvdata);
> > =20
> > -	retval =3D device_register(dev);
> > -	if (retval)
> > -		goto error;
> > +	if (device && device->of_node)
> > +		for_each_available_child_of_node(device->of_node, node) {
> > +			if (tty_slave_register(device, node, dev, driver) =3D=3D 0)
> > +				slave_registered =3D true;
> > +			if (slave_registered)
> > +				break;
> > +		}
> > +
> > +	if (!slave_registered) {
> > +		retval =3D tty_register_finalize(driver, dev);
> > +		if (retval)
> > +			goto error;
> > +	}
> > =20
> >  	return dev;
>=20
> And what about ttys not using the tty_register_device* helpers?

I guess they are on their own - they don't get any help...
Is there a problem that I'm not seeing here?

I think this only applies to code that calls device_create(tty_class, ...)
which is pty.c, vt.c, and "/dev/tty".  These are all virtual devices so
having a slave doesn't make much sense... does it?

>=20
> What happens when the tty is unregistered?

Good question.  I hadn't thought that through.

When the tty is unregistered, it will drop the reference it has on ->parent
which the tty_slave.  So we want that to be the last reference.
So in tty_slave_finalize() I need a put_dev() on the slave.
That must be the "put_dev" that you thought was missing earlier.

However that leaves a loose end. destruct_tty_driver() calls
tty_unregister_device() on all registered ttys for that driver.
If one had a tty_slave which was finalized, that will drop the reference on
the slave so it will disappear, which is all good.
But if one has a slave for which the driver hasn't been found yet, then the=
re
will be no tty to unregister so the tty_slave cannot be dropped.

I guess I need to either take a reference to the driver - which doesn't seem
like a good idea - or use bus_find_device() to find any tty_slaves with that
driver, and drop them.
I'll see how that works out.


Thanks a lot!

NeilBrown

--Sig_/9JgButTXUC85yqUwwsq5yGX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVRngEDnsnt1WYoG5AQKkNw//frOLgbOyjyYBshyBBBlOMClyLDrQwxnD
P2KRGjyzQeQYAiVicW8gS8fdVPlhriY+n48NyWI4Fn1CBepYKIqUCT5tQA/QK9B6
uWYVVqQj2AMQuX+sa8sUNio8BkxW2skm5y4q/Cc1ypVzjWwxJAQX2TKK9OiFHNFr
u56uwrCrGu2XsLRc+WnYxUh764CVdZ+U8F4gzJiVLuYRDoGLcpRNDAweHtW+OufL
HrM2cltl4c+aZ/VgzXKZFmnSCADF11+/GNV73RXuei/XO9gVF3G49aZ2ZTYkWf/z
gmbALfL6ncROqNgQ4lc1B1FoRNhbkB0Ml6WN0WQMImvtosvfapa1wnvGImlS3Wvx
zzdSCjZyS+YIl7etcrCvXM5Z+8kV8awNagCw9fHnteulCKJfGjIKbmLhit9cn0vD
6ycyO1gpPgLnF98BhHYqV2hwrLDqNhmNNxN+XVly7OaukRS3Z6tMt9gzK4yYtdOX
TcAqu7Nb4tw4Z+mqJLIMIBRY9rqSPbFW3gUbttmdy+UMAb3v5jLqwlDgvKI4iwtr
E6ka+ogZayH6H50r/zF3/1vLRwzEPi+DF6FJJt+q6n+CsHpCYrh4jcVljyZnNlG1
SkYkVA9+5T+wfhIkrnTHb+VpexoM+OIrCj5+pN3ftwfG5fBqB/M1wsynjGFD7UBY
dvre6Yp0XHU=
=KoJW
-----END PGP SIGNATURE-----

--Sig_/9JgButTXUC85yqUwwsq5yGX--
