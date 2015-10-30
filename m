From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Setup ethernet0 alias for u-boot
Date: Fri, 30 Oct 2015 10:47:03 +0100
Message-ID: <1446198423.4092.285.camel@collabora.co.uk>
References: <1446151497-29833-1-git-send-email-sjoerd.simons@collabora.co.uk>
	 <CAMuHMdXBcZAXSm1hXv6E-hW9Zp-bPLpp-HxuWukS-Y837LBneQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXBcZAXSm1hXv6E-hW9Zp-bPLpp-HxuWukS-Y837LBneQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2015-10-30 at 10:15 +0100, Geert Uytterhoeven wrote:
> Hi Sjoerd,
>=20
> On Thu, Oct 29, 2015 at 9:44 PM, Sjoerd Simons
> <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> > Add an ethernet0 alias for the wired network card and an all 0
> > default
> > mac address so that u-boot can find the device-node and fill in the
> > mac address.
>=20
> Thanks a lot!
>=20
> I had the same issue on another board, and adding an "ethernet0"
> alias
> fixes it.

Happy to help, this stuff is really not that well document
unfortunately.

> > @@ -130,6 +134,8 @@
> > =C2=A0};
> >=20
> > =C2=A0&gmac {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* To be filled in by U-=
Boot */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac-address =3D [00 00 0=
0 00 00 00];
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "ok";
> > =C2=A0};
>=20
> Note that in my case I didn't have to add an empty mac-address
> property.
> U-Boot (2015.04-something --- don't have the sources) seems to add a
> "local-mac-address" property automatically.

After submitting the patch i actually dived a bit deeper at how this
all hangs together.

The linux kernel checks for mac-address, local-mac-address and address
in the fdt node, in that order of preference. u-boot (at least recent
ones like you have), will set the mac-address property *if* it's
already defined but will always create the local-mac-address property
regardless.

So indeed practially, as you noticed, just setting the alias is enough.
I'm now just very confused about the intended meanings of the
properties, Documentation/devicetree/bindings/net/ethernet.txt doesn't
shed a lot of light on it:

- local-mac-address: array of 6 bytes, specifies the MAC address that=C2=
=A0
=C2=A0 was assigned to the network device;
- mac-address: array of 6 bytes, specifies the MAC address that was=C2=A0
=C2=A0 last used by the boot program; should be used in cases where the=
 MAC=C2=A0
=C2=A0 address assigned to the device by the boot program is different =
from=C2=A0
=C2=A0 the "local-mac-address"property;

So yeah, I'm not sure what the "correct" fix is. It's tempting to
indeed just leave out the mac-address property though :)

--=20
Sjoerd Simons
Collabora Ltd.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
