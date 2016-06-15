From: Guenter Roeck <groeck@google.com>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Wed, 15 Jun 2016 08:47:43 -0700
Message-ID: <CABXOdTdD-DFjzZszvTBoxviwsdu=HZSRy5iTzrkgOjg5qae05Q@mail.gmail.com>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com>
 <7225720.0AClDW7eQ6@diego> <CABXOdTfzDeg3KOmEkJkeUWs76wFind89D-bSrs=7-jSxmdhSHQ@mail.gmail.com>
 <4065185.1IWsBDlcMJ@diego> <24acf224-e792-6648-fcdb-8729ded6df84@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <24acf224-e792-6648-fcdb-8729ded6df84@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>, Guenter Roeck <linux@roeck-us.net>, Guenter Roeck <groeck@chromium.org>, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, Ziyuan Xu <xzy.xu@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 14, 2016 at 6:14 PM, Frank Wang <frank.wang@rock-chips.com>=
 wrote:
> Hi Heiko & Guenter,
>
>
> On 2016/6/14 22:00, Heiko St=C3=BCbner wrote:
>>
>> Am Dienstag, 14. Juni 2016, 06:50:31 schrieb Guenter Roeck:
>>>
>>> On Tue, Jun 14, 2016 at 6:27 AM, Heiko St=C3=BCbner <heiko@sntech.d=
e> wrote:
>>>>
>>>> Am Montag, 13. Juni 2016, 10:10:10 schrieb Frank Wang:
>>>>>
>>>>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
>>>>> than rk3288 and before, and most of phy-related registers are als=
o
>>>>> different from the past, so a new phy driver is required necessar=
ily.
>>>>>
>>>>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +static int rockchip_usb2phy_init(struct phy *phy)
>>>>> +{
>>>>> +     struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy=
);
>>>>> +     struct rockchip_usb2phy *rphy =3D dev_get_drvdata(phy->dev.=
parent);
>>>>> +     int ret;
>>>>> +
>>>>>
>>>>          if (!rport->port_cfg)
>>>>                           return 0;
>>>>
>>>> Otherwise the currently empty otg-port will cause null-pointer
>>>> dereferences
>>>> when it gets assigned in the devicetree already.
>>>
>>> Not really, at least not here - that port should not have port_id s=
et
>>> to USB2PHY_PORT_HOST.
>>>
>>> Does it even make sense to instantiate the otg port ? Is it going t=
o
>>> do anything without port configuration ?
>>
>> Ok, that would be the other option - not creating the phy in the dri=
ver.
>
>
> Well, I will put this conditional inside *_host_port_init(), if it is=
 an
> empty, the phy-device should not be created.
> Something like the following:
>
> --- a/drivers/phy/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/phy-rockchip-inno-usb2.c
> @@ -483,9 +483,13 @@ static int rockchip_usb2phy_host_port_init(struc=
t
> rockchip_usb2phy *rphy,
>  {
>         int ret;
>
> -       rport->port_id =3D USB2PHY_PORT_HOST;
>         rport->port_cfg =3D &rphy->phy_cfg->port_cfgs[USB2PHY_PORT_HO=
ST];
> +       if (!rport->port_cfg) {
> +               dev_err(rphy->dev, "no host port-config provided.\n")=
;
> +               return -EINVAL;
> +       }

This would never be NULL. At issue is that you don't assign port_cfg
if the port is _not_ a host port.

Guenter

>
> +       rport->port_id =3D USB2PHY_PORT_HOST;
>
>> Or from what I've seen, handling it as similar to the host-port shou=
ld
>> work
>> initially as well most likely, supplying the additional otg-parts la=
ter
>> on.
>
>
> @Guenter, just as Heiko said, the otg-parts is not ready now, it will=
 be
> supplied later.
>
>
> BR.
> Frank
>
