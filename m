From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v6 1/3] USB: chipidea: add imx usbmisc support
Date: Wed, 29 Aug 2012 22:00:32 +0200
Message-ID: <503E74E0.6040503@pengutronix.de>
References: <1346137109-32247-1-git-send-email-richard.zhao@freescale.com> <1346137109-32247-2-git-send-email-richard.zhao@freescale.com> <871uiqkuhb.fsf@ashishki-desk.ger.corp.intel.com> <20120829081020.GX26594@pengutronix.de> <87ehmqj925.fsf@ashishki-desk.ger.corp.intel.com> <20120829110137.GA26594@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigCB2167000A1D371C83AE8C76"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120829110137.GA26594-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigCB2167000A1D371C83AE8C76
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 08/29/2012 01:01 PM, Sascha Hauer wrote:
> On Wed, Aug 29, 2012 at 01:18:10PM +0300, Alexander Shishkin wrote:
>> Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>>
>>> On Wed, Aug 29, 2012 at 10:50:08AM +0300, Alexander Shishkin wrote:
>>>> Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
>>>>
>>>>> i.MX usb controllers shares non-core registers, which may include
>>>>> SoC specific controls. We take it as a usbmisc device and usbmisc
>>>>> driver set operations needed by ci13xxx_imx driver.
>>>>>
>>>>> For example, Sabrelite board has bad over-current design, we can
>>>>> usbmisc to disable over-current detect.
>>>>
>>>> Why does this have to be part of the usb driver instead of SoC speci=
fic
>>>> code? It looks like you've created a whole new device/driver
>>>> infrastructure just to disable overcurrent for a specific board.
>>>
>>> Richards code indeed only handles overcurrent for a specific board, b=
ut
>>> there are more bits to configure in the longer run: power pin
>>> polarities, ULPI/serial mode select and some more.

We already have a patch adding a usbmisc_imx53_init() function to that
driver.

>> Sounds to me like these things that should be taken care of by the phy=

>> driver, which will likely be simpler from both driver's and devicetree=
's
>> perspective.
>=20
> Most i.MX SoCs have three instances of the chipidea core. These cores
> share a single register space for controlling the mentioned bits (the
> usbmisc register space). The usbmisc looks different on the different
> SoCs.
> Indeed they control some phy specific aspects, but the phy itself may
> also be an external ULPI or UTMI phy with a separate driver. So if we
> integrate the usbmisc into the phy wouldn't that mean that it has to
> be integrated into all possible phy drivers?
>=20
> From a devicetrees perspective it makes sense to integrate the flags
> into the chipidea nodes, because there is one node per chipidea core,
> but only one usbmisc unit for all ports on the SoC. So we can do a:
>=20
> 	chipidea@ofs {
> 		disable-overcurrent =3D <1>;
> 	};
>=20
> instead of
>=20
> 	usbmisc@ofs {
> 		disable-overcurrent-port0 =3D <1>;
> 		disable-overcurrent-port1 =3D <0>;
> 		...
> 	};

+1

IMHO looks much cleaner.

>>>> And the infrastructure boils down to a complex way of passing a call=
back
>>>> from imx driver to another imx driver, that only works if they are
>>>> probed in the right order. I don't see any point in doing it like th=
is
>>>> other than inflating the device tree tables even further.
>>>>
>>>> Why can't this be part of the SoC code like it is done, for example =
in
>>>> arch/arm/mach-omap2/control.c?
>>>
>>> The settings are board specific, so there must be some way to configu=
re
>>> them in the devicetree.
>>
>> But I'm sure there's a way to control board-specific settings/kludges
>> from devicetree?
>=20
> Hm, yes. That's what Richard does, right? I may be misunderstanding you=

> here.
>=20
> Sascha

Marc


--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enigCB2167000A1D371C83AE8C76
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iEYEARECAAYFAlA+dOQACgkQjTAFq1RaXHOEZQCfUIdIOuiuEEDC/AvI/5ysMJcb
PGUAnjPIy6QiYdpI/17qwi4y4ACDJQZx
=+WGS
-----END PGP SIGNATURE-----

--------------enigCB2167000A1D371C83AE8C76--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
