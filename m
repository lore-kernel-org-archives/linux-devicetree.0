From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Wed, 21 Mar 2012 13:45:48 +0200
Message-ID: <20120321114546.GC3092@arwen.pp.htv.fi>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <20120321083428.GA25111@lunn.ch>
 <CAN1soZyObqAPq=fhn8eB1z0aYqTs87oNBsF_AXbo6kq9fpvhMA@mail.gmail.com>
 <201203211009.40934.arnd@arndb.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z3ND3gJe4e1E4uwh"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203211009.40934.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


--z3ND3gJe4e1E4uwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 10:09:40AM +0000, Arnd Bergmann wrote:
> On Wednesday 21 March 2012, Haojian Zhuang wrote:
> > The driver isn't used by any other platform. It's only used in
> > arch-pxa & arch-mmp.
> >=20
> > I can't find the original mail. But I remembered that maintainer said
> > the driver should be built with any other platform, even with x86. So
> > we aren't allowed to append it in Kconfig.
>=20
> I generally make the recommendation that any driver should be able to
> get built on any system. However, in this particular case, it's clearly
> a bug, because you cannot build it together with another platform driver.
>=20
> That will change when we get to multiplatform builds on ARM that where we
> actually need to find a way to make that possible.

I have explained an easy way to achieve that to Alan Stern, but he did
not like it. Basically, we should add a platform_device to ehci-hcd.ko
and make ehci-{omap,mv,fsl,atmel,etc} a parent device/driver which
basically passes the correct resources and handle platform-specific
details.

That way, we could build everything together and udev would load the
correct modules for us.

For an example of what I mean, see drivers/usb/dwc3/core.c,
drivers/usb/dwc3/dwc3-omap.c, and drivers/usb/dwc3/dwc3-pci.c

--=20
balbi

--z3ND3gJe4e1E4uwh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPab9qAAoJEIaOsuA1yqREdrgP/0d8vumi/aprJpp86tJ7susO
8fKw5F2F1TRb/hufA1qaQfj6xaejOLHjnhYzEcVgI+pUUXYM8dcfzOgs/MXfcmKh
9IaJ35JZOfA732gUEZT5KxpHpNSYDwSrDQhA29j2Z74P8VP2uMapW8paCpoeYQE1
xIv7QY5YkviuWBkb0yF4NvTA+UMfbHJp7GxazO0GNZ3tAXQPu34gOo73d6TTYkZw
t7MoIVLlPauN4N6qefzY3F6RUz9/q3rN5Jxi7bvZwcPyppmZ8GmMuJm5yY356Q4B
Spbv5p9IdfBWM/kkwH4Li2DE0Xkl1yRWaDPEvqB0bvXJmYRRhs9IzhR6cypqDNet
phX31/D6M68k2sbvnrpQlj43kEt53ushOa1r2IsOE3tNokq6l0WCmqQGg0JRgG+L
cEd3gH3gv8PI3MosKBbJiI/fgMgt6Adzs7QZjOiOn8p2DvonED+xTKpM7W+ycNPy
XgNWzUmD/4w8Pjl5EMFiJdGgixGSPHdOpnqHeEYsuAL92zrdYwjEPSLGflv2pj++
gCSKL+vcTcM9DLW/+PKYMvqPYn3AXa9PdARsa9rHtZOu/gPKKlo+IfKb/GIpoeL7
8yMtaEDJMQRCNpMmVBjJeqec7p/TAIunrKtZeUogu49ziFQzJzDZB0qYtHYbOLd9
3M4gHgpL+XSkSVK/UDzH
=b4qB
-----END PGP SIGNATURE-----

--z3ND3gJe4e1E4uwh--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
