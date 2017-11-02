From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/7] dt-bindings: Add Cavium Octeon Common Ethernet
 Interface.
Date: Thu, 2 Nov 2017 09:06:36 -0700
Message-ID: <2ed0d20b-577e-9431-7a7a-34259b752e9e@caviumnetworks.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-2-david.daney@cavium.com>
 <af0de889-a34b-8346-9eeb-171498cc61ca@gmail.com>
 <20171102124719.GG4772@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171102124719.GG4772-g2DYL2Zd6BY@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/02/2017 05:47 AM, Andrew Lunn wrote:
> On Wed, Nov 01, 2017 at 06:09:17PM -0700, Florian Fainelli wrote:
>> On 11/01/2017 05:36 PM, David Daney wrote:
>>> From: Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>>
>>> Add bindings for Common Ethernet Interface (BGX) block.
>>>
>>> Signed-off-by: Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Steven J. Hill <Steven.Hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>> ---
>> [snip]
>>> +Properties:
>>> +
>>> +- compatible: "cavium,octeon-7360-xcv": Compatibility with cn73xx SOCs.
>>> +
>>> +- reg: The index of the interface within the BGX block.
>>> +
>>> +- local-mac-address: Mac address for the interface.
>>> +
>>> +- phy-handle: phandle to the phy node connected to the interface.
>>> +
>>> +- cavium,rx-clk-delay-bypass: Set to <1> to bypass the rx clock delay setting.
>>> +  Needed by the Micrel PHY.
>>
>> Is not that implied by an appropriate "phy-mode" property already?
> 
> Hi Florian
> 
> Looking at the driver patch, phy-mode is not used at
> all. of_phy_connect() passes a hard coded SGMII value!
> 
> David, you need to fix this.
> 

Yes, I think you are correct.

Thanks for reviewing this,

David Daney
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
