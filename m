From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 1/3] net: phy: Add binding for vendor specific
 C45 MDIO address space
Date: Tue, 17 Apr 2018 11:29:27 -0700
Message-ID: <3966b12c-5764-d19c-a14d-4618bf039ee5@gmail.com>
References: <20180417090233.21548-1-vicentiu.galanopulo@nxp.com>
 <20180417090233.21548-2-vicentiu.galanopulo@nxp.com>
 <bc00cc86-2293-0fd2-4e98-c516f59f97ce@gmail.com>
 <20180417182741.GC6688@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180417182741.GC6688@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: vicentiu.galanopulo@nxp.com, robh@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org, alexandru.marginean@nxp.com, madalin.bucur@nxp.com
List-Id: devicetree@vger.kernel.org

On 04/17/2018 11:27 AM, Andrew Lunn wrote:
> On Tue, Apr 17, 2018 at 11:18:20AM -0700, Florian Fainelli wrote:
>> On 04/17/2018 02:02 AM, Vicentiu Galanopulo wrote:
>>> The extra property enables the discovery on the MDIO bus
>>> of the PHYs which have a vendor specific address space
>>> for accessing the C45 MDIO registers.
>>>
>>> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
>>> ---
>>>  Documentation/devicetree/bindings/net/phy.txt | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
>>> index d2169a5..82692e2 100644
>>> --- a/Documentation/devicetree/bindings/net/phy.txt
>>> +++ b/Documentation/devicetree/bindings/net/phy.txt
>>> @@ -61,6 +61,11 @@ Optional Properties:
>>>  - reset-deassert-us: Delay after the reset was deasserted in microseconds.
>>>    If this property is missing the delay will be skipped.
>>>  
>>> +- dev-addr: If set, it indicates the device address of the PHY to be used
>>> +  when accessing the C45 PHY registers over MDIO. It is used for vendor specific
>>> +  register space addresses that do no conform to standard address for the MDIO
>>> +  registers (e.g. MMD30)
>>
>> Rob made that comment earlier, and I have to ask again now, why don't we
>> have the Clause 45 PHY binding be modified such that you have a reg
>> property that has #address-size = 2? This should be entirely backwards
>> compatible, but it would allow you to specify that device address in a
>> more traditional way.
> 
> Hi Florian
> 
> I think we might get into trouble when we have both c22 and c45 on the
> same bus. Two different reg formats. I would have to try it and see to
> be sure.

Hum indeed, we would no longer be able to mix and match on the same MDIO
bus, unless we give C22 PHYs a "fake" second cell. Disregard that idea
then, and let's stick with 'dev-addr'.
-- 
Florian
