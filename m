From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Wed, 15 Jun 2016 09:14:44 +0800
Message-ID: <24acf224-e792-6648-fcdb-8729ded6df84@rock-chips.com>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com>
 <7225720.0AClDW7eQ6@diego>
 <CABXOdTfzDeg3KOmEkJkeUWs76wFind89D-bSrs=7-jSxmdhSHQ@mail.gmail.com>
 <4065185.1IWsBDlcMJ@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4065185.1IWsBDlcMJ@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko & Guenter,

On 2016/6/14 22:00, Heiko St=C3=BCbner wrote:
> Am Dienstag, 14. Juni 2016, 06:50:31 schrieb Guenter Roeck:
>> On Tue, Jun 14, 2016 at 6:27 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org=
> wrote:
>>> Am Montag, 13. Juni 2016, 10:10:10 schrieb Frank Wang:
>>>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
>>>> than rk3288 and before, and most of phy-related registers are also
>>>> different from the past, so a new phy driver is required necessari=
ly.
>>>>
>>>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>> ---
> [...]
>
>>>> +static int rockchip_usb2phy_init(struct phy *phy)
>>>> +{
>>>> +     struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy)=
;
>>>> +     struct rockchip_usb2phy *rphy =3D dev_get_drvdata(phy->dev.p=
arent);
>>>> +     int ret;
>>>> +
>>>>
>>>          if (!rport->port_cfg)
>>>         =20
>>>                  return 0;
>>>
>>> Otherwise the currently empty otg-port will cause null-pointer
>>> dereferences
>>> when it gets assigned in the devicetree already.
>> Not really, at least not here - that port should not have port_id se=
t
>> to USB2PHY_PORT_HOST.
>>
>> Does it even make sense to instantiate the otg port ? Is it going to
>> do anything without port configuration ?
> Ok, that would be the other option - not creating the phy in the driv=
er.

Well, I will put this conditional inside *_host_port_init(), if it is a=
n=20
empty, the phy-device should not be created.
Something like the following:

--- a/drivers/phy/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/phy-rockchip-inno-usb2.c
@@ -483,9 +483,13 @@ static int rockchip_usb2phy_host_port_init(struct=20
rockchip_usb2phy *rphy,
  {
         int ret;

-       rport->port_id =3D USB2PHY_PORT_HOST;
         rport->port_cfg =3D &rphy->phy_cfg->port_cfgs[USB2PHY_PORT_HOS=
T];
+       if (!rport->port_cfg) {
+               dev_err(rphy->dev, "no host port-config provided.\n");
+               return -EINVAL;
+       }

+       rport->port_id =3D USB2PHY_PORT_HOST;

> Or from what I've seen, handling it as similar to the host-port shoul=
d work
> initially as well most likely, supplying the additional otg-parts lat=
er on.

@Guenter, just as Heiko said, the otg-parts is not ready now, it will b=
e=20
supplied later.


BR.
=46rank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
