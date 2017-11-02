From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/7] MIPS: Octeon: Add Free Pointer Unit (FPA) support.
Date: Thu, 2 Nov 2017 11:04:26 -0700
Message-ID: <70fa7ec2-3e6d-e420-ff57-b34dc7ec311e@gmail.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-5-david.daney@cavium.com>
 <d473b10c-ae5d-efa1-7329-de7b68152725@gmail.com>
 <fc2d71e2-cdd4-1cf8-13b0-ea462b5e7e75@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fc2d71e2-cdd4-1cf8-13b0-ea462b5e7e75-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/02/2017 09:27 AM, David Daney wrote:
> On 11/01/2017 08:29 PM, Florian Fainelli wrote:
>> Le 11/01/17 à 17:36, David Daney a écrit :
>>> From: Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>>
>>>  From the hardware user manual: "The FPA is a unit that maintains
>>> pools of pointers to free L2/DRAM memory. To provide QoS, the pools
>>> are referenced indirectly through 1024 auras. Both core software
>>> and hardware units allocate and free pointers."
>>
>> This looks like a possibly similar implement to what
>> drivers/net/ethernet/marvell/mvneta_bm.c, can you see if you can make
>> any use of genpool_* and include/net/hwbm.h here as well?
> 
> Yikes!  Is it permitted to put function definitions that are not "static
> inline" in header files?

Meh well, this is not even ressembling what we initially discussed, so I
was hoping we could build more interesting features on top of this.

> 
> The driver currently doesn't use page fragments, so I don't think that
> the hwbm thing can be used.
> 
> Also the FPA unit is used to control RED and back pressure in the PKI
> (packet input processor), which are features that are features not
> considered in hwbm.
> 
> The OCTEON-III hardware also uses the FPA for non-packet-buffer memory
> allocations.  So for those, it seems that hwbm is also not a good fit.

OK, let me see if I understand how FPA works, can we say that this is
more or less a buffer tokenizer in that, you give it a buffer physical
address and it returns an unique identifier that the FPA uses for actual
packet passing, transmission and other manipulations?

There were a few funky things in the network driver, I will comment there.
--
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
