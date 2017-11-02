From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/7] MIPS: Octeon: Add a global resource manager.
Date: Thu, 2 Nov 2017 10:49:19 -0700
Message-ID: <6ff04462-88ec-a972-4084-e26ea3cb630a@gmail.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-4-david.daney@cavium.com>
 <20171102122327.GE4772@lunn.ch>
 <caeae680-915a-d08c-d220-899db0970328@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <caeae680-915a-d08c-d220-899db0970328-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/02/2017 09:03 AM, David Daney wrote:
> On 11/02/2017 05:23 AM, Andrew Lunn wrote:
>>> +static void res_mgr_lock(void)
>>> +{
>>> +    unsigned int tmp;
>>> +    u64 lock = (u64)&res_mgr_info->rlock;
>>> +
>>> +    __asm__ __volatile__(
>>> +        ".set noreorder\n"
>>> +        "1: ll   %[tmp], 0(%[addr])\n"
>>> +        "   bnez %[tmp], 1b\n"
>>> +        "   li   %[tmp], 1\n"
>>> +        "   sc   %[tmp], 0(%[addr])\n"
>>> +        "   beqz %[tmp], 1b\n"
>>> +        "   nop\n"
>>> +        ".set reorder\n" :
>>> +        [tmp] "=&r"(tmp) :
>>> +        [addr] "r"(lock) :
>>> +        "memory");
>>> +}
>>> +
>>> +static void res_mgr_unlock(void)
>>> +{
>>> +    u64 lock = (u64)&res_mgr_info->rlock;
>>> +
>>> +    /* Wait until all resource operations finish before unlocking. */
>>> +    mb();
>>> +    __asm__ __volatile__(
>>> +        "sw $0, 0(%[addr])\n" : :
>>> +        [addr] "r"(lock) :
>>> +        "memory");
>>> +
>>> +    /* Force a write buffer flush. */
>>> +    mb();
>>> +}
>>
>> It would be good to add some justification for using your own locks,
>> rather than standard linux locks.
> 
> Yes, I will add that.
> 
> 
>>
>> Is there anything specific to your hardware in this resource manager?
>> I'm just wondering if this should be generic, put somewhere in lib. Or
>> maybe there is already something generic, and you should be using it,
>> not re-inventing the wheel again.
> 
> The systems built around this hardware may have other software running
> on CPUs that are not running the Linux kernel.  The data structures used
> to arbitrate usage of shared system hardware resources use exactly these
> locking primitives, so they cannot be changed to use the Linux locking
> implementation de jour.

Would hwspinlock be a possible option so this is abstracted on the Linux
side using these locking primitives through the hwspinlock layer which
in turn does exactly what is above?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
