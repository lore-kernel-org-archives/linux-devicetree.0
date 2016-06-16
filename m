From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Thu, 16 Jun 2016 06:12:14 -0700
Message-ID: <5762A5AE.5030400@roeck-us.net>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com>
 <7225720.0AClDW7eQ6@diego>
 <CABXOdTfzDeg3KOmEkJkeUWs76wFind89D-bSrs=7-jSxmdhSHQ@mail.gmail.com>
 <4065185.1IWsBDlcMJ@diego>
 <24acf224-e792-6648-fcdb-8729ded6df84@rock-chips.com>
 <CABXOdTdD-DFjzZszvTBoxviwsdu=HZSRy5iTzrkgOjg5qae05Q@mail.gmail.com>
 <328485b0-2c5d-5d5e-a21b-6a26e487a923@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <328485b0-2c5d-5d5e-a21b-6a26e487a923@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>, Guenter Roeck <groeck@google.com>
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>, Guenter Roeck <groeck@chromium.org>, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, Ziyuan Xu <xzy.xu@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

On 06/15/2016 06:47 PM, Frank Wang wrote:
> Hi Guenter & Heiko,
>
> On 2016/6/15 23:47, Guenter Roeck wrote:
>> On Tue, Jun 14, 2016 at 6:14 PM, Frank Wang <frank.wang@rock-chips.c=
om> wrote:
>>> Hi Heiko & Guenter,
>>>
>>>
>>> On 2016/6/14 22:00, Heiko St=C3=BCbner wrote:
>>>> Am Dienstag, 14. Juni 2016, 06:50:31 schrieb Guenter Roeck:
>>>>> On Tue, Jun 14, 2016 at 6:27 AM, Heiko St=C3=BCbner <heiko@sntech=
=2Ede> wrote:
>>>>>> Am Montag, 13. Juni 2016, 10:10:10 schrieb Frank Wang:
>>>>>>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP blo=
ck
>>>>>>> than rk3288 and before, and most of phy-related registers are a=
lso
>>>>>>> different from the past, so a new phy driver is required necess=
arily.
>>>>>>>
>>>>>>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
>>>>>>> ---
>>>> [...]
>>>>
>>>>>>> +static int rockchip_usb2phy_init(struct phy *phy)
>>>>>>> +{
>>>>>>> +     struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(p=
hy);
>>>>>>> +     struct rockchip_usb2phy *rphy =3D dev_get_drvdata(phy->de=
v.parent);
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>>
>>>>>>           if (!rport->port_cfg)
>>>>>>                            return 0;
>>>>>>
>>>>>> Otherwise the currently empty otg-port will cause null-pointer
>>>>>> dereferences
>>>>>> when it gets assigned in the devicetree already.
>>>>> Not really, at least not here - that port should not have port_id=
 set
>>>>> to USB2PHY_PORT_HOST.
>>>>>
>>>>> Does it even make sense to instantiate the otg port ? Is it going=
 to
>>>>> do anything without port configuration ?
>>>> Ok, that would be the other option - not creating the phy in the d=
river.
>>>
>>> Well, I will put this conditional inside *_host_port_init(), if it =
is an
>>> empty, the phy-device should not be created.
>>> Something like the following:
>>>
>>> --- a/drivers/phy/phy-rockchip-inno-usb2.c
>>> +++ b/drivers/phy/phy-rockchip-inno-usb2.c
>>> @@ -483,9 +483,13 @@ static int rockchip_usb2phy_host_port_init(str=
uct
>>> rockchip_usb2phy *rphy,
>>>   {
>>>          int ret;
>>>
>>> -       rport->port_id =3D USB2PHY_PORT_HOST;
>>>          rport->port_cfg =3D &rphy->phy_cfg->port_cfgs[USB2PHY_PORT=
_HOST];
>>> +       if (!rport->port_cfg) {
>>> +               dev_err(rphy->dev, "no host port-config provided.\n=
");
>>> +               return -EINVAL;
>>> +       }
>> This would never be NULL. At issue is that you don't assign port_cfg
>> if the port is _not_ a host port.
>
> Sorry, I made a mistake. How about something like the following:
>
Yes, that should work. Just keep in mind that there could always be
a port named "something-port", so you'll always need some kind of check
(and possibly return an error if a port with a wrong name is provided).

Thanks,
Guenter

> @@ -574,6 +579,15 @@ static int rockchip_usb2phy_probe(struct platfor=
m_device *pdev)
>                  struct rockchip_usb2phy_port *rport =3D &rphy->ports=
[index];
>                  struct phy *phy;
>
> +               /*
> +                * This driver aim to support both otg-port and host-=
port,
> +                * but unfortunately, the otg part is not ready in cu=
rrent,
> +                * so this comments and below codes are interim, whic=
h should
> +                * be removed after otg-port is supplied soon.
> +                */
> +               if (of_node_cmp(child_np->name, "host-port"))
> +                       goto next_child;
> +
>                  phy =3D devm_phy_create(dev, child_np, &rockchip_usb=
2phy_ops);
>                  if (IS_ERR(phy)) {
>                          dev_err(dev, "failed to create phy\n");
> @@ -582,17 +596,13 @@ static int rockchip_usb2phy_probe(struct platfo=
rm_device *pdev)
>                  }
>
>                  rport->phy =3D phy;
> -
> -               /* initialize otg/host port separately */
> -               if (!of_node_cmp(child_np->name, "host-port")) {
> -                       ret =3D rockchip_usb2phy_host_port_init(rphy,=
 rport,
> - child_np);
> -                       if (ret)
> -                               goto put_child;
> -               }
> -
>                  phy_set_drvdata(rport->phy, rport);
>
> +               ret =3D rockchip_usb2phy_host_port_init(rphy, rport, =
child_np);
> +               if (ret)
> +                       goto put_child;
> +
> +next_child:
>                  /* to prevent out of boundary */
>                  if (++index >=3D rphy->phy_cfg->num_ports)
>                          break;
>
>
> BR.
> Frank
>
>
