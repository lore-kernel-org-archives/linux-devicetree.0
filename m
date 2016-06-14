From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for Rockchip usb2phy
Date: Tue, 14 Jun 2016 16:00:24 +0200
Message-ID: <4065185.1IWsBDlcMJ@diego>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com> <7225720.0AClDW7eQ6@diego> <CABXOdTfzDeg3KOmEkJkeUWs76wFind89D-bSrs=7-jSxmdhSHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABXOdTfzDeg3KOmEkJkeUWs76wFind89D-bSrs=7-jSxmdhSHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 14. Juni 2016, 06:50:31 schrieb Guenter Roeck:
> On Tue, Jun 14, 2016 at 6:27 AM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> > Am Montag, 13. Juni 2016, 10:10:10 schrieb Frank Wang:
> >> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
> >> than rk3288 and before, and most of phy-related registers are also
> >> different from the past, so a new phy driver is required necessari=
ly.
> >>=20
> >> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> ---

[...]

> >> +static int rockchip_usb2phy_init(struct phy *phy)
> >> +{
> >> +     struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy)=
;
> >> +     struct rockchip_usb2phy *rphy =3D dev_get_drvdata(phy->dev.p=
arent);
> >> +     int ret;
> >> +
> >>=20
> >         if (!rport->port_cfg)
> >        =20
> >                 return 0;
> >=20
> > Otherwise the currently empty otg-port will cause null-pointer
> > dereferences
> > when it gets assigned in the devicetree already.
>=20
> Not really, at least not here - that port should not have port_id set
> to USB2PHY_PORT_HOST.
>=20
> Does it even make sense to instantiate the otg port ? Is it going to
> do anything without port configuration ?

Ok, that would be the other option - not creating the phy in the driver=
=2E

Or from what I've seen, handling it as similar to the host-port should =
work=20
initially as well most likely, supplying the additional otg-parts later=
 on.

[...]

> >> +static int rockchip_usb2phy_exit(struct phy *phy)
> >> +{
> >> +     struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy)=
;
> >> +
> >>=20
> >         if (!rport->port_cfg)
> >        =20
> >                 return 0;
>=20
> No access to port_cfg here ?

sorry, one copy'n'paste to many :-)

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
