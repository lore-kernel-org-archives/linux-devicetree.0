From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 8/9] ARM: berlin: Add phy-connection-type to BG2Q PHY
Date: Tue, 21 Oct 2014 16:08:35 +0400
Message-ID: <54464CC3.2050408@cogentembedded.com>
References: <1413881627-21639-1-git-send-email-sebastian.hesselbarth@gmail.com> <1413881627-21639-9-git-send-email-sebastian.hesselbarth@gmail.com> <54464401.20900@cogentembedded.com> <54464796.90804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <54464796.90804@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart@free-electrons.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/21/2014 3:46 PM, Sebastian Hesselbarth wrote:

>>> From: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>

>>> Internal FastEthernet PHY on BG2Q is connected via MII, add a
>>> corresponding phy-connection-type property.

>>> Tested-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
>>> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.c=
om>
>>> ---
>>> Cc: "David S. Miller" <davem@davemloft.net>
>>> Cc: "Antoine T=C3=A9nart" <antoine.tenart@free-electrons.com>
>>> Cc: Florian Fainelli <f.fainelli@gmail.com>
>>> Cc: Eric Miao <eric.y.miao@gmail.com>
>>> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: netdev@vger.kernel.org
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>   arch/arm/boot/dts/berlin2q.dtsi | 1 +
>>>   1 file changed, 1 insertion(+)

>>> diff --git a/arch/arm/boot/dts/berlin2q.dtsi
>>> b/arch/arm/boot/dts/berlin2q.dtsi
>>> index 891d56b03922..6dbc520bddc1 100644
>>> --- a/arch/arm/boot/dts/berlin2q.dtsi
>>> +++ b/arch/arm/boot/dts/berlin2q.dtsi
>>> @@ -127,6 +127,7 @@
>>>               status =3D "disabled";
>>>
>>>               ethphy0: ethernet-phy@0 {
>>> +                phy-connection-type =3D "mii";

>>     You're adding this prop to the PHY node? That's very weird...
>> normally, it's a property of a MDIO bus node.

> Sergei,

> How can this be a property of the MDIO bus node? Just think of an MDI=
O
> bus with two PHYs where one is connected via GMII and the other via
> RGMII? How should this work?

    Hm, this is an unexpected case...

> But you are right that the property should not be part of the PHY nod=
e
> but the controller node instead. I'll rework and send an update, than=
ks
> for the hint.

    Oh, not at all. :-)

> Sebastian

WBR, Sergei
