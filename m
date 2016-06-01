From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: BCM5301X: Specify PHY of USB 2.0 in DT
Date: Wed, 1 Jun 2016 12:50:06 -0700
Message-ID: <574F3C6E.4090001@gmail.com>
References: <1464808585-14996-1-git-send-email-zajec5@gmail.com>
 <574F35C3.6050004@gmail.com>
 <CACna6ryjSYcxKcCaTtkdkExo0G1qiDMQCUCAgx-bMtnjziAoUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6ryjSYcxKcCaTtkdkExo0G1qiDMQCUCAgx-bMtnjziAoUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/01/2016 12:35 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 1 June 2016 at 21:21, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>> On 06/01/2016 12:16 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>> Driver for Northstar USB 2.0 PHY was added in 4.7-rc1 by:
>>> commit d3feb4067335 ("phy: bcm-ns-usb2: new driver for USB 2.0 PHY =
on
>>> Northstar").
>>> It should be used to let EHCI platform driver init PHY.
>>>
>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/bcm5301x.dtsi | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bc=
m5301x.dtsi
>>> index 7d4d29b..9300e19 100644
>>> --- a/arch/arm/boot/dts/bcm5301x.dtsi
>>> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
>>> @@ -140,6 +140,22 @@
>>>               };
>>>       };
>>>
>>> +     phys {
>>> +             compatible =3D "simple-bus";
>>> +             ranges =3D <0x00000000 0x18000000 0x00100000>;
>>> +             #address-cells =3D <1>;
>>> +             #size-cells =3D <1>;
>>> +
>>> +             usb2_phy2: usb2-phy {
>>> +                     compatible =3D "brcm,ns-usb2-phy";
>>> +                     reg =3D <0x0000c000 0x1000>;
>>> +                     reg-names =3D "dmu";
>>> +                     #phy-cells =3D <0>;
>>> +                     clocks =3D <&genpll BCM_NSP_GENPLL_USB_PHY_RE=
=46_CLK>;
>>> +                     clock-names =3D "phy-ref-clk";
>>> +             };
>>
>> You guys need to get everything straigthen up when it comes to busin=
g
>> and child nodes for bcm53101x.dtsi, why do we need a "simple-bus" no=
de
>> here which overlaps in part with the brcm-bus-axi node's range?
>=20
> I believed I'm making things cleaner by adding a separated node for
> PHYs (in the future there will be also USB 3.0 PHY and probably a PCI=
e
> PHY). I'm fine with placing this PHY node somewhere else if you think
> it better fits there.

The intent looks good, but it seems to me (and the datasheet helps here
too) that extending the brcm,bus-axi node to cover a wider register
range size could allow you to put the different PHYs as child nodes of
that bus. That way even if the core is probed with BCMA you still have =
a
proper of_node refefence that your driver can use.

Maybe as a better immediate solution, something like the NAND controlle=
r
node would be more elegant, where it only consumes its register space
and not more?
--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
