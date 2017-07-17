From: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: RE: [patch v1] Documentation: dt-bindings: aspeed-pwm-tacho cooling
 device.
Date: Mon, 17 Jul 2017 11:05:19 +0000
Message-ID: <DB5PR05MB1224B743F33DFA632EC08DD9EFA00@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170711131827.64045-1-c_mykolak@mellanox.com>
 <20170715013346.fgqysvlu2prts7zn@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170715013346.fgqysvlu2prts7zn@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ohad Oz <ohado-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Saturday, July 15, 2017 4:34 AM
> To: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>;
> Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>;
> openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>; Vadim
> Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>; Ohad Oz <ohado-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> Subject: Re: [patch v1] Documentation: dt-bindings: aspeed-pwm-tacho
> cooling device.
>=20
> On Tue, Jul 11, 2017 at 04:18:27PM +0300, Mykola Kostenok wrote:
> > This binding adds description for interface supporting
> > aspeed-pwm-tacho driver cooling device creation.
> > This cooling device could be bound to a thermal zone for the thermal
> > control.
>=20
> Bindings are for devices, not drivers.
>=20
>=20
> > It adds extra level of hierarchy -  for tachometer channel with fan
> > subnodes and pwm channels with pwm subnodes.
>=20
> Why this binding was just added and now it is changing?
>=20

Hi, Rob.
Thanks for reply.
=20
This controller supports fan tacho channels and pwm channels. In the previo=
us dts version, only tachometers channels were configurable.
We need to set pwm channels as cooling device, since we use it for the ther=
mal control. So, these channels are added to dts as well.
And it added extra level hierarchy in dts.

For now this driver is used only by 2 two platforms: our Mellanox and Quant=
a (openbmc project).
We sent first this patch to openbmc first the for approval from the Quanta =
owners (Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> approved this change).
=20
The support of this change in dts is introduce in the patch for drivers/hwm=
on/aspeed-pwm-tacho.c, which has been sent to hwmon maintainers.


Best regards. Mykola Kostenok.

> >
> > Signed-off-by: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 56
> > ++++++++++++++++++----
> >  1 file changed, 47 insertions(+), 9 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
