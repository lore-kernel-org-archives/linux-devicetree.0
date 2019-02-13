From: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Change Ethernet switch management
 port
Date: Wed, 13 Feb 2019 09:24:11 -0800
Message-ID: <56eae00a-0090-0b57-8615-0a331bc1c984@broadcom.com>
References: <20190213042600.27729-1-f.fainelli@gmail.com>
 <43f75739-b592-35d3-e711-13f05218133d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <43f75739-b592-35d3-e711-13f05218133d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, "maintainer:BROADCOM BCM5301X ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 2/13/19 12:07 AM, Rafał Miłecki wrote:
> On 13.02.2019 05:25, Florian Fainelli wrote:
>> BCM5301X has 3 Ethernet controllers: GMAC0, 1, 2 which map to ports 5, 7
>> and 8 respectively of the internal switch. Future changes will turn on
>> management mode in the Ethernet switch driver (b53) which will require
>> us to use port 8.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
>> b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
>> index 3fced3b7f1a8..affa9cc7422d 100644
>> --- a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
>> +++ b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
>> @@ -150,10 +150,15 @@
>>               label = "wan";
>>           };
>>   -        port@5 {
>> -            reg = <5>;
>> +        port@8 {
>> +            reg = <8>;
>>               label = "cpu";
>> -            ethernet = <&gmac0>;
>> +            ethernet = <&gmac2>;
>> +
>> +            fixed-link {
>> +                speed = <1000>;
>> +                full-duplex;
>> +            };
>>           };
>>       };
>>   };
> 
> I'm not exactly sure how Linux switch driver works, but from DT
> perspective I think we should rather have *hardware* described instead
> of a common Linux case.
> 
> If I'm right, we should rather have all 3 switch ports described (5, 7,
> 8) and have Linux just use the one it needs.

Yes, let's do that.
-- 
Florian
