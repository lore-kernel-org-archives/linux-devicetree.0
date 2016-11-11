From: "Guilherme G. Piccoli" <gpiccoli-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] of/irq: improve error message on irq discovery process
 failure
Date: Fri, 11 Nov 2016 20:27:34 -0200
Message-ID: <582645D6.3040102@linux.vnet.ibm.com>
References: <1478700308-25481-1-git-send-email-gpiccoli@linux.vnet.ibm.com>
 <20161109190457.GC837@leverpostej> <1478813443.2592.2.camel@au1.ibm.com>
 <20161111163241.GL11945@leverpostej> <1478891547.2592.13.camel@au1.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478891547.2592.13.camel-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: benh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/11/2016 05:12 PM, Benjamin Herrenschmidt wrote:
> On Fri, 2016-11-11 at 16:32 +0000, Mark Rutland wrote:
>> On Fri, Nov 11, 2016 at 08:30:43AM +1100, Benjamin Herrenschmidt
>> wrote:
>>>
>>> On Wed, 2016-11-09 at 19:04 +0000, Mark Rutland wrote:
>>>>
>>>>
>>>> If we don't have an interrupt-map on a PCI controller, why don't
>>>> we
>>>> instead log a message regarding that being missing, and give up
>>>> early?
>>>
>>> Why ? It's legit to not support LSIs.
>>
>> Sure; I had envisioned a message like:
>>
>> 	pr_info("%s: no interrupt-map, INTx interrupts not possible\n",
>> 		pci_controller_name);
>>
>> ... Which tells the user exaclty what we know, and doesn't imply
>> either
>> an error or the actual absence of HW support.
> 
> Works for me.
> 
> Cheers,
> Ben.
> 

Thanks very much Ben and Mark, for the good suggestions you gave me.
I was talking on IRC today with Mark, about showing a message once per
device (and not in all its functions) about LSI being not available in
that slot, besides the simple/small messages per function, saying
interrupt-map wasn't found.

I'm working on V2, but will delay a bit to send - I'm out next 20 days.
When I'm back, I'll send the improved version. Oh, I removed positive
return value - never will use it again, noticed isn't that popular heheh

Thanks,


Guilherme

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
