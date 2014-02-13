From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v2 01/10] net: phy: add "internal" PHY mode
Date: Thu, 13 Feb 2014 12:41:15 -0800
Message-ID: <CAGVrzcb07OhvCGD0JtTBY5=P5Tv9d+zvNOPbomZmELih3Uwq6w@mail.gmail.com>
References: <1392269395-23513-1-git-send-email-f.fainelli@gmail.com>
 <1392269395-23513-2-git-send-email-f.fainelli@gmail.com> <20140213.153409.1193335923050383308.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20140213.153409.1193335923050383308.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: netdev <netdev@vger.kernel.org>, Kevin Cernekee <cernekee@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2014-02-13 12:34 GMT-08:00 David Miller <davem@davemloft.net>:
> From: Florian Fainelli <f.fainelli@gmail.com>
> Date: Wed, 12 Feb 2014 21:29:46 -0800
>
>> On some systems, the PHY can be internal, in the same package as the
>> Ethernet MAC, and still be responding to a specific address on the MDIO
>> bus, in that case, the Ethernet MAC might need to know about it to
>> properly configure a port multiplexer to switch to an internal or
>> external PHY. Add a new PHY interface mode for this and update the
>> Device Tree of_get_phy_mode() function to look for it.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>> Changes since v1:
>> - rebased against lastest net-next master branch
>
> This is over-engineering.
>
> The only thing that even uses this value is phy_is_internal(), and
> the only user of phy_is_internal() is the generic PHY layer ethtool
> operation for get-settings.
>
> The PHY layer already has a place to indicate whether a PHY is
> internal or not, overriding that using the PHY mode is trouble
> waiting to happen.
>
> Please, just provide some way to propagate this device tree property
> into phy->is_internal.

I just realized that I am able to drop this change completely since I
add a PHY driver for the Ethernet MAC which already flags particular
devices of interest as internal PHYs. This change originally came up
as I needed to know that before probing for the PHY, which can be
resolved by doing some re-ordering.

Thanks for the feedback.
-- 
Florian
