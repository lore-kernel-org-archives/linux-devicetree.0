From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/7] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Thu, 2 Nov 2017 09:37:18 -0700
Message-ID: <0f39046d-dc99-5c05-d918-10952cd20e1b@caviumnetworks.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-7-david.daney@cavium.com>
 <20171102124339.GF4772@lunn.ch>
 <521d6b21-b7f0-66e0-4b49-cf95d83452d1@caviumnetworks.com>
 <20171102161016.GH24320@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171102161016.GH24320-g2DYL2Zd6BY@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/02/2017 09:10 AM, Andrew Lunn wrote:
> On Thu, Nov 02, 2017 at 08:55:33AM -0700, David Daney wrote:
>> On 11/02/2017 05:43 AM, Andrew Lunn wrote:
>> [...]
>>>> +
>>>> +		i = atomic_inc_return(&pki_id);
>>>> +		pki_dev = platform_device_register_data(&new_dev->dev,
>>>> +							is_mix ? "octeon_mgmt" : "ethernet-mac-pki",
>>>> +							i, &platform_data, sizeof(platform_data));
>>>> +		dev_info(&pdev->dev, "Created %s %u: %p\n",
>>>> +			 is_mix ? "MIX" : "PKI", pki_dev->id, pki_dev);
>>>
>>> Is there any change of these ethernet ports being used to connect to
>>> an Ethernet switch. We have had issues in the past with these sort of
>>> platform devices combined with DSA.
>>>
>>
>> There are only two possibilities.  The BGX MACs have a multiplexer that
>> allows them to be connected to either the "octeon_mgmt" MIX packet
>> processor, or to the "ethernet-mac-pki" PKI/PKO packet processor.  The SoCs
>> supported by these drivers do not contain any hardware that would be
>> considered an "Ethernet switch".
> 
> Hi David
> 
> I was thinking of an external Ethernet switch. You generally connect
> via RGMII to a port of the switch.
> 

OK, now I think I understand.  Yes, the MAC can be hardwired to a 
switch.  In fact, there are system designs that do exactly that.

We try to handle this case by not having a "phy-handle" property in the 
device tree.  The link to the remote device (switch IC in this case) is 
brought up on ndo_open()

There may be opportunities to improve how this works in the future, but 
the current code is serviceable.

> http://elixir.free-electrons.com/linux/v4.9.60/source/Documentation/networking/dsa/dsa.txt
> 
> 	Andrew
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
