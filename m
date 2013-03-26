From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/6] support other fsl SoCs with usbmisc + small fixes
Date: Tue, 26 Mar 2013 14:09:32 +0200
Message-ID: <20130326120932.GQ11244@arwen.pp.htv.fi>
References: <1354033021-10585-1-git-send-email-m.grzeschik@pengutronix.de>
 <20121128025217.GC18593@nchen-desktop>
 <87ip6mor1e.fsf@ashishki-desk.ger.corp.intel.com>
 <CAOMZO5ArDLKDLEzhYc7EP2CNQGcT=vO7ctbiEsjzsGs+EaT7Dw@mail.gmail.com>
 <20130325162931.GB22810@pengutronix.de>
 <87wqsujrdm.fsf@ashishki-desk.ger.corp.intel.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lt3WynA+XK9Fj6D4"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87wqsujrdm.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

--lt3WynA+XK9Fj6D4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 26, 2013 at 02:08:05PM +0200, Alexander Shishkin wrote:
> > http://git.pengutronix.de/git/mgr/linux.git v3.9/topic/usb-phy
> > 4414a59 Merge 'v3.9/topic/usb-phy' into usb-3.9
> > a806027 usb: otg: mxs-phy: remove clkgate/sftrst clearing
> > 026881b usb: otg: mxs-phy: Improve mxs phy initialization
> > ed42fa9 usb: mxs-phy: register phy at usb phy library
> > d2783aa usb: phy: remove NULL pointer check in usb_add_phy()
>=20
> looks like Felipe's call, doesn't it? I also can't seem to find these in
> my inbox. If you want me to ack them, you should at least send them to
> me. :)
>=20
> Felipe, btw, is also often not copied on chipidea-related phy patches
> that I see. And just in case, Cc'ing him on this thread.

if it's not in my tree yet, it needs to be rebased to my 'next' brach,
since PHY drivers have moved out of drivers/usb/otg/. Rebase and resend.

--=20
balbi

--lt3WynA+XK9Fj6D4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRUY/8AAoJEIaOsuA1yqRElkwP/1pCDlcTNrLUF7dEDOtNtBJp
ChPK5/j3d7rCQmQqBtf31Z6XAYtCEJTc9uyeoPTY5qserEUumVcnpWvfDR+xK8Ay
hrnzwmyp9o+u7b8HcJBSmv2Qf4UQoEry2KXX2fb0wAL0qkwG+x/io8jv0o8NZrYv
qWU+QoBzTNIY/wquTrSPIjJi5GmvqKSg2ztXZZake3yGRpEiCWShSJuezV7KCtR/
rEJK5N3uXj7AirqCEmId8M7YaEWwRQTlVCxB4y6AKRj1Nck3JSIVk/pYl7fTav6u
09CL3NAvUPLiwBlLtOZsoM9uO5MuH4LYTzRS5YSYXOsIDzOYJA17zjvEXOXoKdu+
ApkSqpkoiGvl9kUNRxk2jx1xmj9TclCIRPXnVabsh4/8tLSn6SwP5qhS2XzHcRNU
vA+vQZU7pM0WckMAOTmQRPMDNqyPG0GIOsJ3NVNr0w6pBlPeA6+SeDD+qHgz3nJL
sVE7pkudpZTYD1VltJU/ItuHGnfL14Bc1O8OMpEojCM2tq28AhlqNgAuqq/TQVfQ
qkzgSt49PiR74wWI8+zkHac0znJxIdllT6oAigDmD7fxbf9Iz+d2sELq7MH4Ipzi
lumIW74rNPE8wHc90ztmh/o2aSSo72AEl7whlGm299Xpjp/94W5rcGn+kzAnBUyl
8cN2rILw/UDeN85rJ19u
=3beB
-----END PGP SIGNATURE-----

--lt3WynA+XK9Fj6D4--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
