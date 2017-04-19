From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Specify MDIO bus in the DT
Date: Wed, 19 Apr 2017 09:43:06 -0700
Message-ID: <94250925-7d5d-ac31-58ad-918406d904f1@gmail.com>
References: <20170402210840.11429-1-zajec5@gmail.com>
 <5a6ecda9-2cf6-2171-7210-6b3a1d4c6012@gmail.com>
 <c3a0455a-821f-d8a8-bf8a-7ad06ad0466e@milecki.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c3a0455a-821f-d8a8-bf8a-7ad06ad0466e-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/02/2017 02:25 PM, Rafał Miłecki wrote:
> On 04/02/2017 11:14 PM, Florian Fainelli wrote:
>> Le 04/02/17 à 14:08, Rafał Miłecki a écrit :
>>> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>>
>>> Northstar devices have MDIO bus that may contain various PHYs attached.
>>> A common example is USB 3.0 PHY (that doesn't have an MDIO driver yet).
>>>
>>> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/bcm5301x.dtsi | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi
>>> b/arch/arm/boot/dts/bcm5301x.dtsi
>>> index acee36a61004..6a2afe7880ae 100644
>>> --- a/arch/arm/boot/dts/bcm5301x.dtsi
>>> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
>>> @@ -320,6 +320,13 @@
>>>          };
>>>      };
>>>
>>> +    mdio@18003000 {
>>> +        compatible = "brcm,iproc-mdio";
>>> +        reg = <0x18003000 0x8>;
>>> +        #size-cells = <1>;
>>> +        #address-cells = <0>;
>>> +    };
>>
>> This looks fine, but usually the block should be enabled on a per-board
>> basis, such that there should be a status = "disabled" property here by
>> default.
> 
> I think we have few blocks in bcm5301x.dtsi enabled by default. I guess
> it's
> for stuff that is always present on every SoC family board: rng, nand,
> spi to
> name few.
> 
> It makes some sense, consider e.g. spi. Every Northstar board has SPI
> controller so it's enabled by default. Not every board has SPI flash, so
> it's
> disabled by default.
> 
> It's there and it make sense to me. Is that OK or not?

Even though there are devices that are always enabled on a given SoC,
because the board designs are always consistent does not necessarily
make them good candidates to be enabled at the .dtsi level. This is
particularly true when there are external connections to blocks (SPI,
NAND, USB, Ethernet, MDIO to name a few), having them disabled by
default is safer as a starting point to begin with.

> 
> I find MDIO situation quite simiar. It seems every Northstar board has
> MDIO bus
> just devices may differ and should not be enabled by default.

In which case, the only difference, for you would be to do to, at the
board-level DTS:

&mdio {
	status = "okay";

	phy@0 {
		reg = <0>;
		...
	};
};

versus:

&mdio {
	phy@0 {
		reg = <0>;
		...
	};
};

I think we can afford putting the mdio node's status property in each
board-level DTS and make it clear that way that it is enabled because
there are child nodes enabled?

NB: with a CONFIG_OF system, there is no automatic probing of MDIO child
devices because it relies on child nodes being declared, but you would
still get the driver to be probed and enabled, which is a waste of
resources at best.

Thanks
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
