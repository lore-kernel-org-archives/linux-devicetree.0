From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] dsa device tree bindings: fix typo and wrong example
Date: Mon, 7 Jan 2019 10:53:52 -0800
Message-ID: <a998e0a6-120a-a096-88ca-aaaa67e0a4a2@gmail.com>
References: <20181115195111.GA9946@amd> <20181206130051.GA22343@amd>
 <20181206130513.GE22343@amd> <819595ee-9f3e-b7a2-6139-1ba265137f62@ysoft.com>
 <20190107184944.GA17979@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107184944.GA17979@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, =?UTF-8?B?Vm9rw6HEjSBNaWNoYWw=?= <Michal.Vokac@ysoft.com>, trivial@kernel.org
Cc: "andrew@lunn.ch" <andrew@lunn.ch>, "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "buytenh@marvell.com" <buytenh@marvell.com>, "buytenh@wantstofly.org" <buytenh@wantstofly.org>, "nico@marvell.com" <nico@marvell.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 1/7/19 10:49 AM, Pavel Machek wrote:
> On Thu 2018-12-06 13:28:56, Vokáč Michal wrote:
>> On 6.12.2018 14:05, Pavel Machek wrote:
>>>      
>>> Fix typo and fix compatible value that is not actually permitted by the
>>> description in the example.
>>
>> Ahoj Pavle, I think the subject should be more like:
>>
>> 	"dt-bindings: net: dsa: ..."
> 
> Ahoj!
> 
> Well, retrying with different subject only makes sense if someone is
> interested. Rob, Andrew -- can you take the patch?
> 
> Do you want me to edit the subject or can you just edit the subject
> while applying?

The next steps would likely be for you to resubmit this patch with a
re-subjected patch and I am fairly sure David can pick it up right away
since this is not a functional change.

> 
> Thanks,
> 								Pavel
> 
>> BR, Michal
>>
>>>     
>>> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/marvell.txt b/Documentation/devicetree/bindings/net/dsa/marvell.txt
>>> index feb007af13cb..abf1be036ac5 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/marvell.txt
>>> +++ b/Documentation/devicetree/bindings/net/dsa/marvell.txt
>>> @@ -41,7 +41,7 @@ Optional properties:
>>>   - mdio			: Container of PHY and devices on the switches MDIO
>>>   			  bus.
>>>   - mdio?		: Container of PHYs and devices on the external MDIO
>>> -			  bus. The node must contains a compatible string of
>>> +			  bus. The node must contain a compatible string of
>>>   			  "marvell,mv88e6xxx-mdio-external"
>>>   
>>>   Example:
>>> @@ -80,7 +80,7 @@ Example:
>>>   		#interrupt-cells = <2>;
>>>   
>>>   		switch0: switch@0 {
>>> -			compatible = "marvell,mv88e6390";
>>> +			compatible = "marvell,mv88e6190";
>>>   			reg = <0>;
>>>   			reset-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
>>>   
>>>
>>>
> 


-- 
Florian
