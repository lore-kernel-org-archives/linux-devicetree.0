From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Thu, 22 Mar 2012 10:13:16 +0200
Message-ID: <20120322081315.GG31160@arwen.pp.htv.fi>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203211009.40934.arnd@arndb.de>
 <20120321114546.GC3092@arwen.pp.htv.fi>
 <201203211317.38339.arnd@arndb.de>
 <20120321132230.GL3092@arwen.pp.htv.fi>
 <A2CA0424C0A6F04399FB9E1CD98E0304090B77CA@US01WEMBX2.internal.synopsys.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E0304090B77CA-Yu2iAY70zvrYN67daEjeMPufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "michael-QKn5cuLxLXY@public.gmane.org" <michael-QKn5cuLxLXY@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 08:06:12PM +0000, Paul Zimmerman wrote:
> > From: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-usb-owner-u79uwXL29Tb/PtFMR13I2A@public.gmane.org=
el.org] On Behalf Of Felipe Balbi
> > Sent: Wednesday, March 21, 2012 6:23 AM
> >=20
> > On Wed, Mar 21, 2012 at 01:17:38PM +0000, Arnd Bergmann wrote:
> > > On Wednesday 21 March 2012, Felipe Balbi wrote:
> > > > I have explained an easy way to achieve that to Alan Stern, but he =
did
> > > > not like it. Basically, we should add a platform_device to ehci-hcd=
=2Eko
> > > > and make ehci-{omap,mv,fsl,atmel,etc} a parent device/driver which
> > > > basically passes the correct resources and handle platform-specific
> > > > details.
> > > >
> > > > That way, we could build everything together and udev would load the
> > > > correct modules for us.
> > > >
> > > > For an example of what I mean, see drivers/usb/dwc3/core.c,
> > > > drivers/usb/dwc3/dwc3-omap.c, and drivers/usb/dwc3/dwc3-pci.c
> > >
> > > While that way clearly works and can solve the problem we have
> > > with ehci today, I think it's easier and more consistent with
> > > other drivers to do it the opposite way, as we have recently
> > > discussed in the context of ohci:
> > >
> > > Make the base driver a loadable module that does not register
> > > any struct device_driver at all, but just exports functions to
> > > other module. The hardware specific drivers then each register
> > > to their own bus and use the functions exported by the
> > > main driver, with a way to override them with their own versions.
> > >
> > > Alan suggested a variation of that where we actually export
> > > a default "struct hc_driver" instead of the individual functions,
> > > which has the advantage of having to export fewer symbols, but
> > > otherwise is similar to what we do elsewhere.
> > >
> > > See libata, sdhci, serial-8250 or xhci for examples of this way.
> >=20
> > that is likely to work, indeed. My suggestion would make PM simpler
> > though and avoid some code duplication in the long run, meaning that
> > ehci-hcd.ko could have its own dev_pm_ops which e.g. knows how to save
> > EHCI's context while ehci-omap.c knows how to save OMAP-specific
> > context, toggle clocks, set pads in safe mode (when needed) and so on.
> >=20
> > But fair enough, both ways would work fine.
>=20
> I would also recommend your/Alan's approach to this over Felipe's way.
> We have a DWC3 platform with an (admittedly oddball) PM implementation
> that requires the bus driver to have some knowledge of the base driver's
> internal state, and needs the two drivers to be able to communicate with
> each other. With the base driver being a separate platform device, this
> is nearly impossible to achieve in a clean way. If the DWC3 driver was
> designed the way you and Alan are recommending, it would be easy.
>=20
> I'm trying to convince Felipe to change the DWC3 driver design to
> accommodate this, but I hold out little hope for that :)

yeah, I'm not thinking on taking that patch, sorry. Didn't you say SNPS
had agreed on rebuilding the FPGA system so that it's a more standard
PCIe implementation ?

I still owe you another possible implementation for the whole PM thing,
sorry about the delay.

--=20
balbi

--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPat8bAAoJEIaOsuA1yqRE/4IQAKCJ3ffoxDCxymeJkqTZxk0x
l1d2ODA5z6tdzIHNIok2xuR/JmCKtKuJ7dSdiuLwu+UcvywmLEb6erF8UxEqNSNp
5x6W3/kiVz71bk8vDYPCZWCZwMk5u0xS36L9SZN2rI7r2HKss/Oe1mS0ju/Yt7Rt
jRj3xusGzDsJe+aESEUourbyMFJvsFVhQuecb4h2FjU655c4SoOWbSRB/D+PR0Tg
zluZJ6VtWKW+gZvyrpFhmLq/wlB3uM8JlE9L/kTBshtkBQnUnWzoZJFx3lueZgqu
fzflwMj2LGOtRpxmVqLkn7X+eoXzVpXUIuPaz4ruRWHVC9b0jPW8b6HRNFoI1Azg
tA6+Y1JzVZV25jRE8k/wPXkImtq18StcHO2YZvv91YemRnLGMCH61dGS4624xBKC
A2MMYcyD4LogBREuMLh+5ZUezM6i6EOG/NnkI0AeuTu0dXHTLU2xlsu/Biz7NIfm
ry3C9+2/N2ZSoyjKq6lKWQa8zQ3FA/RFR/IxJ2Ly2xA4M7i0vf+PviWfsBBTlTHO
gEj/lIWMnDKXgqWlSBHt7EqEQ9mtSBD/buu8UH2czUFaaCE1KNqmIa6IG9QPoRG/
9AXMqQjRoV8Ow/4LV4EBpjHLTZE9q7bg+2tVlbPlQfiYx1FrSg0hSL10M7ndnTB4
u5VkbJQHyiXSLnFZ7xdr
=N1Pv
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
