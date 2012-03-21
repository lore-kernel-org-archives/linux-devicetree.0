From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Wed, 21 Mar 2012 15:22:31 +0200
Message-ID: <20120321132230.GL3092@arwen.pp.htv.fi>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203211009.40934.arnd@arndb.de>
 <20120321114546.GC3092@arwen.pp.htv.fi>
 <201203211317.38339.arnd@arndb.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QUAc4O4i7jPlU8jt"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203211317.38339.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--QUAc4O4i7jPlU8jt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 01:17:38PM +0000, Arnd Bergmann wrote:
> On Wednesday 21 March 2012, Felipe Balbi wrote:
> > I have explained an easy way to achieve that to Alan Stern, but he did
> > not like it. Basically, we should add a platform_device to ehci-hcd.ko
> > and make ehci-{omap,mv,fsl,atmel,etc} a parent device/driver which
> > basically passes the correct resources and handle platform-specific
> > details.
> >=20
> > That way, we could build everything together and udev would load the
> > correct modules for us.
> >=20
> > For an example of what I mean, see drivers/usb/dwc3/core.c,
> > drivers/usb/dwc3/dwc3-omap.c, and drivers/usb/dwc3/dwc3-pci.c
>=20
> While that way clearly works and can solve the problem we have
> with ehci today, I think it's easier and more consistent with
> other drivers to do it the opposite way, as we have recently
> discussed in the context of ohci:
>=20
> Make the base driver a loadable module that does not register
> any struct device_driver at all, but just exports functions to
> other module. The hardware specific drivers then each register
> to their own bus and use the functions exported by the
> main driver, with a way to override them with their own versions.
>=20
> Alan suggested a variation of that where we actually export
> a default "struct hc_driver" instead of the individual functions,
> which has the advantage of having to export fewer symbols, but
> otherwise is similar to what we do elsewhere.
>=20
> See libata, sdhci, serial-8250 or xhci for examples of this way.

that is likely to work, indeed. My suggestion would make PM simpler
though and avoid some code duplication in the long run, meaning that
ehci-hcd.ko could have its own dev_pm_ops which e.g. knows how to save
EHCI's context while ehci-omap.c knows how to save OMAP-specific
context, toggle clocks, set pads in safe mode (when needed) and so on.

But fair enough, both ways would work fine.

--=20
balbi

--QUAc4O4i7jPlU8jt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPadYWAAoJEIaOsuA1yqREW+8QAIFf0ytGboIcb6cAtnjLeIT9
N2FLvdRgg4fq0hqYy9hjrar6fvoFnnLheqajt76ga3uM5ZTotio6EjEMdV2vBlPv
qqHYfI6CtnovosyaxkyNHsPj9AxAqok0oXmKhoJF2di7E5Y1PapS1xvfovD7NwhY
8CXQrgJFAkmUq91J18crgJ6VBVESSAVqGPlTnk8zaHIvUkk9M6/OJpbPx+FrOyrd
5TMKW6MqDlVyL47LBvAyugen2im/h8nGGWaD8ykelZa1b/KD1O4UVrrufUdlYu/I
kljoYCRGT/GIg9/gDCEwO+i5jBe3jZbxdS4PZBJ5HMeCM7SbYGRWWhPq52PnUh9H
yXqT2NLMzgkg7avHisAbKxq6cDjAuvpmRVKINJk7io6IF666nGyifrjVwhoqR6nE
aN7WQ4iqLn7p6zVYOssnb+Fn3adb8nkYXOcRfMNwo9V9xF78MGoX0fQR7AHx0nDm
uoBOcgI757RqL/Dmhu1PcWzWm5eIHKSOdYm8OxF8SYQqHOBGyPJYUrKPLa/KxT4q
ComyBJXMsRRya+xjcTeGBjtaKBrF+HFbwHMHzcWOSeCLDSgiH9m9llCZV1cyWZsj
g3DcCiKMbUQ0GGh69ZtBRMm3th4kwT2/WiQ1D3K/r9DSElHquYm/sQHmqFgyzABl
HlrpL9HBluqVe4xOy/z3
=OBcJ
-----END PGP SIGNATURE-----

--QUAc4O4i7jPlU8jt--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
