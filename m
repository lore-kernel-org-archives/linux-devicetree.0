From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 1/3] TTY: add support for "tty slave" devices.
Date: Fri, 12 Dec 2014 16:23:52 +1100
Message-ID: <20141212162352.66be5b5e@notabene.brown>
References: <20141211214801.4127.93914.stgit@notabene.brown>
	<20141211215943.4127.24792.stgit@notabene.brown>
	<548A264D.8070103@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/r6W0ELitUTuY7jd=PsTOxD."; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <548A264D.8070103-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/r6W0ELitUTuY7jd=PsTOxD.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Dec 2014 18:18:37 -0500 Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
wrote:

> On 12/11/2014 04:59 PM, NeilBrown wrote:
> > A "tty slave" is a device connected via UART.
> > It may need a driver to, for example, power the device on
> > when the tty is opened, and power it off when the tty
> > is released.
> >=20
> > A "tty slave" is a platform device which is declared as a
> > child of the uart in device-tree:
> >=20
> > &uart1 {
> > 	bluetooth {
> > 		compatible =3D "tty,regulator";
> > 		vdd-supply =3D <&vaux4>;
> > 	};
> > };
> >=20
> > runtime power management is used to power-up the device
> > on tty_open() and  power-down on tty_release().
>=20
> I have a couple of issues with this:
> 1) why does a child device imply power management and a platform
>    device? iow, what happens when someone else wants to have a
>    child device that does something different?

Why does it imply power management?
 Because it seems to make obvious sense to turn something on when the tty is
 open.  If the device has other reason to remain on when the tty is closed,
 it can arrange for extra references to be taken of course.
 Is it conceivable that you would want the device to remain off when the
 tty device is open?  In that case just make it a regular platform device.

Why a platform device?
 Things on an i2c bus are i2c devices.  Things on a usb bus are usb devices.
 Ideally a thing on a uart 'bus' would be a 'uart device', but no such thing
 exists.  I did contemplate the possibility of creating an explicit "uart" =
or
 "tty" bus type, but I could find no value in that.
 The door is certainly still open to that possibility if a meaning for the
 idea becomes apparent.  As far as device tree is concerned it is just a
 child device node.  The fact that it is implemented as a "platform" device
 could easily be changed later if needed without device tree noticing.

What could conceivably want to be different?  The only (purely hypothetical)
concept I can come up with which wouldn't fit is a device with both an UART
port and a USB port, or similar.  However device tree, and the device model
in general, just isn't geared towards devices being on multiple buses so
if that were real it would have much greater implications that just here.

But maybe I misunderstand...


> 2) why is this tied to the tty core and not the serial core
>    if this is only for UART?

Because the knowledge of "the device is being opened" or "the device is bei=
ng
closed" seems to exist in the tty core but not in the serial core.

The "of_platform_populate()" call could certainly go in serial_core.c, in
uart_add_one_port() I think.  I did have it there originally.  I moved it f=
or
a reason that I think is no longer relevant.  As the on/off code is (and I
think has to be) in tty_io.c, I left all of it there.

I'm happy to move it to serial_core.c if that is preferred.
I'll also move the open/close handling if you can point to where it should =
go.


Thanks,
NeilBrown


>=20
> Regards,
> Peter Hurley
>=20
> > Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
> > ---
> >  .../devicetree/bindings/serial/of-serial.txt       |    4 ++++
> >  drivers/tty/tty_io.c                               |   22 ++++++++++++=
++++++++
> >  2 files changed, 26 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/serial/of-serial.txt b/D=
ocumentation/devicetree/bindings/serial/of-serial.txt
> > index 8c4fd0332028..b59501ee2f21 100644
> > --- a/Documentation/devicetree/bindings/serial/of-serial.txt
> > +++ b/Documentation/devicetree/bindings/serial/of-serial.txt
> > @@ -39,6 +39,10 @@ Optional properties:
> >    driver is allowed to detect support for the capability even without =
this
> >    property.
> > =20
> > +Optional child node:
> > +- a platform device listed as a child node will be probed and
> > +  powered-on whenever the tty is in use (open).
> > +
> >  Example:
> > =20
> >  	uart@80230000 {
> > diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> > index 0508a1d8e4cd..7acdc6f093f4 100644
> > --- a/drivers/tty/tty_io.c
> > +++ b/drivers/tty/tty_io.c
> > @@ -95,6 +95,8 @@
> >  #include <linux/seq_file.h>
> >  #include <linux/serial.h>
> >  #include <linux/ratelimit.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/of_platform.h>
> > =20
> >  #include <linux/uaccess.h>
> > =20
> > @@ -1683,6 +1685,17 @@ static int tty_release_checks(struct tty_struct =
*tty, struct tty_struct *o_tty,
> >  	return 0;
> >  }
> > =20
> > +static int open_child(struct device *dev, void *data)
> > +{
> > +	pm_runtime_get_sync(dev);
> > +	return 0;
> > +}
> > +static int release_child(struct device *dev, void *data)
> > +{
> > +	pm_runtime_put_autosuspend(dev);
> > +	return 0;
> > +}
> > +
> >  /**
> >   *	tty_release		-	vfs callback for close
> >   *	@inode: inode of tty
> > @@ -1712,6 +1725,8 @@ int tty_release(struct inode *inode, struct file =
*filp)
> >  	long	timeout =3D 0;
> >  	int	once =3D 1;
> > =20
> > +	if (tty->dev)
> > +		device_for_each_child(tty->dev, NULL, release_child);
> >  	if (tty_paranoia_check(tty, inode, __func__))
> >  		return 0;
> > =20
> > @@ -2118,6 +2133,8 @@ retry_open:
> >  		__proc_set_tty(current, tty);
> >  	spin_unlock_irq(&current->sighand->siglock);
> >  	tty_unlock(tty);
> > +	if (tty->dev)
> > +		device_for_each_child(tty->dev, NULL, open_child);
> >  	mutex_unlock(&tty_mutex);
> >  	return 0;
> >  err_unlock:
> > @@ -3207,6 +3224,11 @@ struct device *tty_register_device_attr(struct t=
ty_driver *driver,
> >  	retval =3D device_register(dev);
> >  	if (retval)
> >  		goto error;
> > +	if (device && device->of_node)
> > +		/* Children are platform devices and will be
> > +		 * runtime_pm managed by this tty.
> > +		 */
> > +		of_platform_populate(device->of_node, NULL, NULL, dev);
> > =20
> >  	return dev;
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--Sig_/r6W0ELitUTuY7jd=PsTOxD.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVIp76Dnsnt1WYoG5AQL8mw//WWOSKdB8/HiWaIQ5nZBG7TsIpo+H3rRF
vRxzeHdBtdkQvMXKIvtdZNOs274OdkVdQKA4mnkF5Znvw0pNDMYy3Vk1wJPZYq+F
Te0KJ0Vkof1tHWV9L58MEnlBU9t2dhOYpL3Fbq+INwqpqJAjplCT0+JH6dFijJyj
/LduRc134iWYzd3DobH14BWaWhr7WXpK1OMpvlwfoD0rgrSwHe6h+EAjLDwkIOWD
1rqjhhZGtIqOGIHKi1aLeAOgk/HHyWpss4ooUDO+VKVFAn89STUkQAOd+vvLOu5g
9purF1+JcpzgOevUysCzMR0snje6tWRQOvsZuAjOQlm5ePH7vJmUjVsbI4/IAngx
cWGVrWurooD0CgDSNNLJuHBniEfvpZ6EDoWWbSXfbgU96e++WBu4ZFlsAWStBtkO
R8SwMYtx6WPhEHZppx4O66T/WPs2/vyV4/lH0wj0g/KjXpZ9oBF4I0PwEfWa8mO7
41VhH81FBPeI2/DtdH0axknsp+5phME6P46KtAKdDtaf3gsODhsu/W0m8BAPi2uh
eS1TIQeg54TLJDbRF1cOhwIIFspGhPMdFep9yY5U2H6ydM6UX29W8A4Q57BWJCBC
IEuKxKzzGVamB2kHijz8o6HRh1l3gh8QzJ+BxY20ptv7lKtOtZjfNtUwwfvO21N+
5pmwd65UAHU=
=uENo
-----END PGP SIGNATURE-----

--Sig_/r6W0ELitUTuY7jd=PsTOxD.--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
