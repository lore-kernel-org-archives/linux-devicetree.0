From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/7] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Thu, 2 Nov 2017 11:53:08 -0700
Message-ID: <bad9f43c-b080-fe40-620e-d1e6e5ab0f75@gmail.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-7-david.daney@cavium.com>
 <20171102124339.GF4772@lunn.ch>
 <521d6b21-b7f0-66e0-4b49-cf95d83452d1@caviumnetworks.com>
 <20171102161016.GH24320@lunn.ch>
 <0f39046d-dc99-5c05-d918-10952cd20e1b@caviumnetworks.com>
 <20171102165605.GJ24320@lunn.ch>
 <0168761e-cb18-e489-4689-8c9062aa316b@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0168761e-cb18-e489-4689-8c9062aa316b-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/02/2017 11:31 AM, David Daney wrote:
> On 11/02/2017 09:56 AM, Andrew Lunn wrote:
>>> OK, now I think I understand.  Yes, the MAC can be hardwired to a
>>> switch.
>>> In fact, there are system designs that do exactly that.
>>>
>>> We try to handle this case by not having a "phy-handle" property in the
>>> device tree.  The link to the remote device (switch IC in this case) is
>>> brought up on ndo_open()
>>
>> O.K, so you totally ignore the Linux way of doing this and hack
>> together your own proprietary solution.
> 
> I am going to add handling of the "phy-mode" property, but other than
> that I don't know what the "Linux way" of specifying a hard MAC-to-MAC
> connection with no intervening phy devices is.  Wether the remote MAC is
> a switch, or something else, would seem to be irrelevant.  All we are
> concerned about in this code is putting the thing into a state where
> data flows in both directions through the MAC.

The canonical way to support that type of connections is to use use a
fixed-link property describing the link between the two MACs, ideally
putting the same fixed-link property on both sides.

> 
> A pointer to an existing device tree binding for an Ethernet device that
> has no (or an optional) phy device would be useful, we can try to do the
> same.
> 
> 
>>  
>>> There may be opportunities to improve how this works in the future,
>>> but the
>>> current code is serviceable.
>>
>> It might be serviceable, but it will never get into mainline. For
>> mainline, you need to use DSA.
>>
>> http://elixir.free-electrons.com/linux/v4.9.60/source/Documentation/networking/dsa/dsa.txt
>>
> 
> 
> I am truly at a loss here.  That DSA document states:
> 
>      Master network devices are regular, unmodified Linux
>      network device drivers for the CPU/management Ethernet
>      interface.
> 
> What modification do you suggest I make?

If you support normal phy_device and fixed-link devices, you should be
good as far as using PHYLIB and interfacing with Ethernet switchses
using DSA for instance. What Andrew is asking you though is to make sure
that the platform device dance between the bgx drivers and the other
modules preserves the Device Tree parenting, of_node pointers such that
a DSA switch, which needs to reference a CPU/management port, has a
chance to successfully look up that node via of_find_net_device_by_node().

> 
> 
>>
>> Getting back to my original point, having these platform devices can
>> cause issues for DSA. Freescale FMAN has a similar architecture, and
>> it took a while to restructure it to make DSA work.
>>
>> https://www.spinics.net/lists/netdev/msg459394.html
>>
>>     Andrew
>>
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
