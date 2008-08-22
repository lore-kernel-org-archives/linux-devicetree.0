From: Mitch Bradley <wmb@firmworks.com>
Subject: Re: [PATCH 0/3]: Sparc OF I2C support.
Date: Thu, 21 Aug 2008 19:19:06 -1000
Message-ID: <48AE4C4A.8040804@firmworks.com>
References: <48AE4093.8050504@firmworks.com>	<fa686aa40808212130l365c6f5eu767b9969c8171e2@mail.gmail.com>	<fa686aa40808212134l1e226845q41831ee567bb1a2@mail.gmail.com> <20080821.213747.159824681.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20080821.213747.159824681.davem@davemloft.net>
Sender: sparclinux-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: grant.likely@secretlab.ca, devicetree-discuss@ozlabs.org, linuxppc-dev@ozlabs.org, sparclinux@vger.kernel.org, scottwood@freescale.com
List-Id: devicetree@vger.kernel.org



David Miller wrote:
> From: "Grant Likely" <grant.likely@secretlab.ca>
> Date: Thu, 21 Aug 2008 22:34:31 -0600
>
>   
>> On Thu, Aug 21, 2008 at 10:30 PM, Grant Likely
>> <grant.likely@secretlab.ca> wrote:
>>     
>>> On Thu, Aug 21, 2008 at 10:29 PM, Mitch Bradley <wmb@firmworks.com> wrote:
>>>       
>>>> Hi, I wrote most of 1275.
>>>>
>>>> Mitch Bradley  (wmb@firmworks.com)
>>>>         
>>> Hi Mitch,
>>>
>>> What is your suggestion.  Where should we be discussing new device
>>> tree bindings?  Whether it be real Open Firmware, or flattened device
>>> tree, or something in between
>>>       
>> ...and along those lines: is there a place for documenting new
>> bindings?  Lacking anything better, those of us in PowerPC-Linux-land
>> have been adding documentation to Documentation/powerpc/dts-bindings/*
>> in the Linux kernel tree.
>>     
>
> In a discussion I am having with Greg Onufer, David K. and Tayfun
> at Sun, Greg said the some of the newer binding documents are
> being published on the opensolaris site, and he is trying to
> get some of the older cases (like this I2C one) published there
> too.
>
>   

This collection of mailing lists is as good a place as any to discuss 
new bindings.  I don't know how many Sun people are on the lists, but we 
might be able to persuade various Sun people to lurk on one or more of 
them;  I lurk on devicetree-discuss.

The opensolaris site seems as good as anywhere for publishing the 
bindings, especially if they can pull over the old ones from e.g. 
playground.sun.com .

Another possible site might be openbios.org .

