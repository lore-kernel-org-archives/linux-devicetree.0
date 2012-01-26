From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 8/9] usb: dwc3: gadget: dynamically re-size TxFifos
Date: Thu, 26 Jan 2012 14:15:30 +0200
Message-ID: <20120126121528.GO15110@legolas.emea.dhcp.ti.com>
References: <1327406053-31738-1-git-send-email-balbi@ti.com>
 <1327406053-31738-9-git-send-email-balbi@ti.com>
 <F6C4814A9B336243ABC3D1FB44E08AE801D53C8B66@US01WXMBX1.internal.synopsys.com>
 <20120125075732.GA4489@legolas.emea.dhcp.ti.com>
 <20120125084658.GC4489@legolas.emea.dhcp.ti.com>
 <F6C4814A9B336243ABC3D1FB44E08AE801D53C9116@US01WXMBX1.internal.synopsys.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wqJr86X7F8PBspU2"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <F6C4814A9B336243ABC3D1FB44E08AE801D53C9116-uiPIUNf6hlr3OT/vyeh27fufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wqJr86X7F8PBspU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 25, 2012 at 10:54:56AM -0800, Paul Zimmerman wrote:
> On Wed, 25 Jan 2012, Felipe Balbi wrote:
>=20
> > > > You probably don't want a module parameter. Maybe we could enable t=
his depending
> > > > on the PCI ID, or from platform data?
> > >=20
> > > Platform data will be vanishing soon, but we can have a devicetree
> > > attribute to select that, for sure ;-)
> > >=20
> > > Will hack that up quickly and send a revised patch.
>=20
> > here's the differential diff to add a flag for fifo resizing:
>=20
> <snip>
>=20
> Thanks Felipe, looks good.
>=20
> One question, though. I am completely ignorant about the device tree stuf=
f.
> Will a standard PC platform have a device tree for the PCI devices, and if
> so, where will this option flag get set?

I'm not sure how devicetree is implemented for the PCI stuff, maybe the
guys in the devicetree mailing list can help. Any tips guys ?

Anyway, when I actually figure out a nice way to allocate fifo space
based on enabled endpoints, I believe most users will just start setting
that flag because it's far better to use the FIFO for enabled endpoints
then not allocate it at all (image a situation where we have 4 IN eps
and 1024 bytes FIFO space for each one of them, if we're running with
only 1 IN ep enabled, we could allocate all 4x 1024 to the only enabled
endpoint).

--=20
balbi

--wqJr86X7F8PBspU2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPIUPgAAoJEIaOsuA1yqREsmcQAJb9RV76gipxSBN82MG46M5q
12wGT19Q5WfsY4uVhMhZOEPyHMEjyMtVqV8nPadBiHHkYtRTTRX/tHg5uUfEIAhH
hU6UaGJKqWrB3oZKEUtKk1KN4x53WEwlMkYtw9dz4xpWm+drVerV9liSJl8IAGCF
VAQusBQ/mPgiQ8zYNwQOpXAr7ZMZUn+zoUp9TwL3sI5vowVGAjBuGLDMrTa55++f
Toto/oFuh4/5iyMffXH1PKgmbdM04/y5LS7+rjKBETXiSnkRavwn2Vg7mDENClTC
G8ZTdd2+XnNPu6xPTdS7wchuGBjHQObWxy2mkKzxD0SBSr/HC95Xg5r6UnIBV5nr
Cc0jm5Bl6heuZgegMraBLCfRgGy7SAokX13O3H7Mg9YOLvB44weFykd0yeSTWQEK
3OUOyB2XOzBb4WbYBfHhAI+7CYYJ5mItnaxPDioDBB8m1CKLMZaI83UGELcjC/7N
esZvAPXsuUsdjNcNmphj18uIky62EyeccBlaqJ2QlvlZmlgapymBQGL2CoCweNw9
JSaEX+LBtUmGlvFuQz8Qmw7aLmx82kMgX13lvhQiQIFN7LYbqlDczBwMlkpGKGJv
U9RFye3UhsFYtytFWD1KK+o4GcI5MElBhF2llLC3wwUVQjiDvJkrE7dNAs0Rbm3v
wTkHO9kF+rOjbJdbuED1
=tqPT
-----END PGP SIGNATURE-----

--wqJr86X7F8PBspU2--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
