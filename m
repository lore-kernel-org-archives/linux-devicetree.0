From: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform
 driver
Date: Fri, 26 Oct 2012 10:02:54 +0200
Message-ID: <20121026080254.GD3009@breakpoint.cc>
References: <20121025102301.GA3469@breakpoint.cc>
 <Pine.LNX.4.44L0.1210251035270.1278-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1210251035270.1278-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2012 at 10:36:14AM -0400, Alan Stern wrote:
> What happens if the drivers get probed in the wrong order?  That is, =
if=20
> ehci-platform gets probed before ehci-spear (or whatever)?

The "wrong" driver may get loaded. Right now, you should have them all =
in
one driver. For instance the crypto node in mpc8315erdb.dts:
|   crypto@30000 {
|           compatible =3D "fsl,sec3.3", "fsl,sec3.1", "fsl,sec3.0",
|                        "fsl,sec2.4", "fsl,sec2.2", "fsl,sec2.1",
|                        "fsl,sec2.0";
=E2=80=A6

The higher the version, the more features are available by the hardware=
=2E
The driver [0] probes only for "fsl,sec2.0" but it uses
of_device_is_compatible() to check for the other entries. You could als=
o add
all 7 compatible entries to the driver and distinguish them by the driv=
er_data
field. This is an implementation detail.
However, having two drivers, one for "fsl,sec3.3" and one for "fsl,sec2=
=2E0",
would "randomly" load one of the two driver depending on link order and=
 so on.

[0] drivers/crypto/talitos.c

>=20
> Alan Stern
>=20

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
