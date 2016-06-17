From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Fri, 17 Jun 2016 08:57:32 +0800
Message-ID: <cafd87b3-8afd-c3a3-f70a-a32944f39fe4@rock-chips.com>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com>
 <7225720.0AClDW7eQ6@diego>
 <CABXOdTfzDeg3KOmEkJkeUWs76wFind89D-bSrs=7-jSxmdhSHQ@mail.gmail.com>
 <4065185.1IWsBDlcMJ@diego>
 <24acf224-e792-6648-fcdb-8729ded6df84@rock-chips.com>
 <CABXOdTdD-DFjzZszvTBoxviwsdu=HZSRy5iTzrkgOjg5qae05Q@mail.gmail.com>
 <328485b0-2c5d-5d5e-a21b-6a26e487a923@rock-chips.com>
 <5762A5AE.5030400@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5762A5AE.5030400-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On 2016/6/16 21:12, Guenter Roeck wrote:
> On 06/15/2016 06:47 PM, Frank Wang wrote:
>> Hi Guenter & Heiko,
>>
>> On 2016/6/15 23:47, Guenter Roeck wrote:
>>> On Tue, Jun 14, 2016 at 6:14 PM, Frank Wang=20
>>> <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>>>> Hi Heiko & Guenter,
>>>>
>>>>
>>>> On 2016/6/14 22:00, Heiko St=C3=BCbner wrote:
>>>>> Am Dienstag, 14. Juni 2016, 06:50:31 schrieb Guenter Roeck:
>>>>>> On Tue, Jun 14, 2016 at 6:27 AM, Heiko St=C3=BCbner <heiko@sntec=
h.de>=20
>>>>>> wrote:
>>>>>>> Am Montag, 13. Juni 2016, 10:10:10 schrieb Frank Wang:
>>>>>>>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP bl=
ock
>>>>>>>> than rk3288 and before, and most of phy-related registers are =
also
>>>>>>>> different from the past, so a new phy driver is required=20
>>>>>>>> necessarily.
>>>>>>>>
>>>>>>>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>>>>> ---
>>>>> [...]
>>>>>
>>>>>>>> +static int rockchip_usb2phy_init(struct phy *phy)
>>>>>>>> +{
>>>>>>>> +     struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(=
phy);
>>>>>>>> +     struct rockchip_usb2phy *rphy =3D=20
>>>>>>>> dev_get_drvdata(phy->dev.parent);
>>>>>>>> +     int ret;
>>>>>>>> +
>>>>>>>>
>>>>>>>           if (!rport->port_cfg)
>>>>>>>                            return 0;
>>>>>>>
>>>>>>> Otherwise the currently empty otg-port will cause null-pointer
>>>>>>> dereferences
>>>>>>> when it gets assigned in the devicetree already.
>>>>>> Not really, at least not here - that port should not have port_i=
d=20
>>>>>> set
>>>>>> to USB2PHY_PORT_HOST.
>>>>>>
>>>>>> Does it even make sense to instantiate the otg port ? Is it goin=
g to
>>>>>> do anything without port configuration ?
>>>>> Ok, that would be the other option - not creating the phy in the=20
>>>>> driver.
>>>>
>>>> Well, I will put this conditional inside *_host_port_init(), if it=
=20
>>>> is an
>>>> empty, the phy-device should not be created.
>>>> Something like the following:
>>>>
>>>> --- a/drivers/phy/phy-rockchip-inno-usb2.c
>>>> +++ b/drivers/phy/phy-rockchip-inno-usb2.c
>>>> @@ -483,9 +483,13 @@ static int rockchip_usb2phy_host_port_init(st=
ruct
>>>> rockchip_usb2phy *rphy,
>>>>   {
>>>>          int ret;
>>>>
>>>> -       rport->port_id =3D USB2PHY_PORT_HOST;
>>>>          rport->port_cfg =3D=20
>>>> &rphy->phy_cfg->port_cfgs[USB2PHY_PORT_HOST];
>>>> +       if (!rport->port_cfg) {
>>>> +               dev_err(rphy->dev, "no host port-config provided.\=
n");
>>>> +               return -EINVAL;
>>>> +       }
>>> This would never be NULL. At issue is that you don't assign port_cf=
g
>>> if the port is _not_ a host port.
>>
>> Sorry, I made a mistake. How about something like the following:
>>
> Yes, that should work. Just keep in mind that there could always be
> a port named "something-port", so you'll always need some kind of che=
ck
> (and possibly return an error if a port with a wrong name is provided=
).
>
>

OK, thanks for your reminding, I am going to send out it with a new=20
version later.

BR.
=46rank

>
>> @@ -574,6 +579,15 @@ static int rockchip_usb2phy_probe(struct=20
>> platform_device *pdev)
>>                  struct rockchip_usb2phy_port *rport =3D=20
>> &rphy->ports[index];
>>                  struct phy *phy;
>>
>> +               /*
>> +                * This driver aim to support both otg-port and=20
>> host-port,
>> +                * but unfortunately, the otg part is not ready in=20
>> current,
>> +                * so this comments and below codes are interim,=20
>> which should
>> +                * be removed after otg-port is supplied soon.
>> +                */
>> +               if (of_node_cmp(child_np->name, "host-port"))
>> +                       goto next_child;
>> +
>>                  phy =3D devm_phy_create(dev, child_np,=20
>> &rockchip_usb2phy_ops);
>>                  if (IS_ERR(phy)) {
>>                          dev_err(dev, "failed to create phy\n");
>> @@ -582,17 +596,13 @@ static int rockchip_usb2phy_probe(struct=20
>> platform_device *pdev)
>>                  }
>>
>>                  rport->phy =3D phy;
>> -
>> -               /* initialize otg/host port separately */
>> -               if (!of_node_cmp(child_np->name, "host-port")) {
>> -                       ret =3D rockchip_usb2phy_host_port_init(rphy=
,=20
>> rport,
>> - child_np);
>> -                       if (ret)
>> -                               goto put_child;
>> -               }
>> -
>>                  phy_set_drvdata(rport->phy, rport);
>>
>> +               ret =3D rockchip_usb2phy_host_port_init(rphy, rport,=
=20
>> child_np);
>> +               if (ret)
>> +                       goto put_child;
>> +
>> +next_child:
>>                  /* to prevent out of boundary */
>>                  if (++index >=3D rphy->phy_cfg->num_ports)
>>                          break;
>>
>>
>>
>


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
