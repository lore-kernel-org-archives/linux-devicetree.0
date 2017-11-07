From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add phy-reset property for rk3066a-rayeager
 emac
Date: Tue, 7 Nov 2017 10:26:01 -0800
Message-ID: <ac15ef59-3b5e-1752-09db-0a773615f44c@gmail.com>
References: <1510022959-19440-1-git-send-email-zyw@rock-chips.com>
 <e6f2393e-cb3b-9006-d0f5-6b30fd2a5192@mentor.com>
 <e08d8ea2-40c5-a5b3-e570-44c90388fcdd@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e08d8ea2-40c5-a5b3-e570-44c90388fcdd-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, andrew-g2DYL2Zd6BY@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/07/2017 01:51 AM, Chris Zhong wrote:
> 
> 
> On 2017年11月07日 15:54, Vladimir Zapolskiy wrote:
>> Hello Chris,
>>
>> On 11/07/2017 04:49 AM, Chris Zhong wrote:
>>> The ethernet phy of rk3066a-rayeager has a reset pin, it controlled by
>>> GPIO1_D6, this pin should be pull down then pull up to reset the phy.
>>> Add a phy-reset property in emac, make the phy can be reset when emac
>>> power on.
>> for PHY reset there are properties 'reset-gpios' and 'reset-delay-us',
>> please reference to Documentation/devicetree/bindings/net/mdio.txt
>>
>> Can you try to reuse them instead of adding new custom properties?
> This phy-reset is from Documentation/devicetree/bindings/net/arc_emac.txt.
> And copy from arch/arm/boot/dts/rk3036-kylin.dts.
> Can we just use these properties, they are not new.

Because it already exists does not mean it's correct, in fact, it is not
at all because it places the reset property for a PHY into the MAC node,
which is just not what this is, what we should be using instead is the
following patch series:

http://patchwork.ozlabs.org/project/netdev/list/?series=9267

http://patchwork.ozlabs.org/patch/828499/
http://patchwork.ozlabs.org/patch/828505/
http://patchwork.ozlabs.org/patch/828501/
http://patchwork.ozlabs.org/patch/828502/

>> As a side question, which is mainly addressed to Sergei and Roger,
>> I don't quite understand why PHY properties were initially added to
>> MAC/MDIO bus device tree nodes, in my opinion they must be moved under
>> PHY device tree nodes.
>>
>> -- 
>> With best wishes,
>> Vladimir
>>
>>> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> ---
>>>
>>>   arch/arm/boot/dts/rk3066a-rayeager.dts | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/rk3066a-rayeager.dts
>>> b/arch/arm/boot/dts/rk3066a-rayeager.dts
>>> index 570157f..6064a0a 100644
>>> --- a/arch/arm/boot/dts/rk3066a-rayeager.dts
>>> +++ b/arch/arm/boot/dts/rk3066a-rayeager.dts
>>> @@ -173,6 +173,8 @@
>>>       pinctrl-0 = <&emac_xfer>, <&emac_mdio>, <&rmii_rst>;
>>>       phy = <&phy0>;
>>>       phy-supply = <&vcc_rmii>;
>>> +    phy-reset-gpios = <&gpio1 RK_PD6 GPIO_ACTIVE_LOW>; /* PHY_RST */
>>> +    phy-reset-duration = <10>; /* millisecond */
>>>       status = "okay";
>>>         phy0: ethernet-phy@0 {
>>>
>>
>>
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
