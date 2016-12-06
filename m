From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 2/5] ARM: BCM5301X: Specify USB controllers in DT
Date: Tue, 6 Dec 2016 09:36:48 -0800
Message-ID: <cbb8f2e0-864f-8c95-d9fe-2de46ed0fce0@broadcom.com>
References: <20161206171714.22738-1-zajec5@gmail.com>
 <20161206171714.22738-2-zajec5@gmail.com>
 <c721c71c-117f-185d-0544-954981dbcf04@broadcom.com>
 <CACna6rw4iY_xhEUyWkGrchs0SOn3nLBKYMuA7qa0UHAbxpGN0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACna6rw4iY_xhEUyWkGrchs0SOn3nLBKYMuA7qa0UHAbxpGN0A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org



On 12/6/2016 9:31 AM, Rafał Miłecki wrote:
> On 6 December 2016 at 18:28, Ray Jui <ray.jui@broadcom.com> wrote:
>> On 12/6/2016 9:17 AM, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> There are 3 separated controllers, one per USB /standard/. With PHY
>>> drivers in place they can be simply supported with generic drivers.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>  arch/arm/boot/dts/bcm5301x.dtsi | 33 ++++++++++++++++++++++++++++++++-
>>>  1 file changed, 32 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
>>> index f09a2bb..bfc98d19 100644
>>> --- a/arch/arm/boot/dts/bcm5301x.dtsi
>>> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
>>> @@ -248,8 +248,26 @@
>>>
>>>                       #address-cells = <1>;
>>>                       #size-cells = <1>;
>>> +                     ranges;
>>>
>>> -                     phys = <&usb2_phy>;
>>> +                     interrupt-parent = <&gic>;
>>> +
>>> +                     ohci: ohci@21000 {
>>> +                             #usb-cells = <0>;
>>> +
>>> +                             compatible = "generic-ohci";
>>> +                             reg = <0x00022000 0x1000>;
>>
>> Your label ohci@21000 does not match the 'reg' at 0x22000.
>>
>>> +                             interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     };
>>> +
>>> +                     ehci: ehci@22000 {
>>> +                             #usb-cells = <0>;
>>> +
>>> +                             compatible = "generic-ehci";
>>> +                             reg = <0x00021000 0x1000>;
>>
>> Looks like you got the label of ohci and ehci reversed?
> 
> Nice catch, thanks! I'll fix it in V2 (just let me wait a day to see
> if there will be other comments).
> 

In V2, please remember to put the nodes in ascending order based on the
base address of the registers, i.e., ehci@21000, and then followed by
ohci@22000.

Thanks,

Ray
