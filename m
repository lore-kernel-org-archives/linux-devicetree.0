From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 6/7] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Thu, 2 Nov 2017 11:31:45 -0700
Message-ID: <0168761e-cb18-e489-4689-8c9062aa316b@caviumnetworks.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-7-david.daney@cavium.com>
 <20171102124339.GF4772@lunn.ch>
 <521d6b21-b7f0-66e0-4b49-cf95d83452d1@caviumnetworks.com>
 <20171102161016.GH24320@lunn.ch>
 <0f39046d-dc99-5c05-d918-10952cd20e1b@caviumnetworks.com>
 <20171102165605.GJ24320@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171102165605.GJ24320@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Carlos Munoz <cmunoz@cavium.com>
List-Id: devicetree@vger.kernel.org

On 11/02/2017 09:56 AM, Andrew Lunn wrote:
>> OK, now I think I understand.  Yes, the MAC can be hardwired to a switch.
>> In fact, there are system designs that do exactly that.
>>
>> We try to handle this case by not having a "phy-handle" property in the
>> device tree.  The link to the remote device (switch IC in this case) is
>> brought up on ndo_open()
> 
> O.K, so you totally ignore the Linux way of doing this and hack
> together your own proprietary solution.

I am going to add handling of the "phy-mode" property, but other than 
that I don't know what the "Linux way" of specifying a hard MAC-to-MAC 
connection with no intervening phy devices is.  Wether the remote MAC is 
a switch, or something else, would seem to be irrelevant.  All we are 
concerned about in this code is putting the thing into a state where 
data flows in both directions through the MAC.

A pointer to an existing device tree binding for an Ethernet device that 
has no (or an optional) phy device would be useful, we can try to do the 
same.


>   
>> There may be opportunities to improve how this works in the future, but the
>> current code is serviceable.
> 
> It might be serviceable, but it will never get into mainline. For
> mainline, you need to use DSA.
> 
> http://elixir.free-electrons.com/linux/v4.9.60/source/Documentation/networking/dsa/dsa.txt


I am truly at a loss here.  That DSA document states:

      Master network devices are regular, unmodified Linux
      network device drivers for the CPU/management Ethernet
      interface.

What modification do you suggest I make?


> 
> Getting back to my original point, having these platform devices can
> cause issues for DSA. Freescale FMAN has a similar architecture, and
> it took a while to restructure it to make DSA work.
> 
> https://www.spinics.net/lists/netdev/msg459394.html
> 
> 	Andrew
> 
