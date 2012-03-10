From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 4/5] MIPS: Octeon: Setup irq_domains for interrupts.
Date: Sat, 10 Mar 2012 10:20:09 -0600
Message-ID: <4F5B7F39.50106@gmail.com>
References: <1330563422-14078-1-git-send-email-ddaney.cavm@gmail.com>
 <1330563422-14078-5-git-send-email-ddaney.cavm@gmail.com>
 <4F50D7C2.7080204@gmail.com> <4F510B8E.3070201@cavium.com>
 <20120302190744.571E03E1C63@localhost> <4F511FB0.5070901@cavium.com>
 <4F527285.1020500@gmail.com> <4F52F90C.5060306@gmail.com>
 <20120309055704.465823E0901@localhost> <4F5A4FDE.1030305@gmail.com>
 <4F5A710A.1000408@gmail.com> <4F5A9B75.8090301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F5A9B75.8090301-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Daney <david.s.daney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/09/2012 06:08 PM, David Daney wrote:
> On 03/09/2012 01:07 PM, Rob Herring wrote:
>> On 03/09/2012 12:45 PM, David Daney wrote:
> [...]
>>>
>>> Probably I have not explained well enough why legacy will not work.
>>>
>>> We have three different interrupt controllers (although only one is
>>> currently in-tree).  hwirq to irq mapping for them is more or less as
>>> follows:
>>
>> I'll just repeat what others have said: if it's not upstream it doesn't
>> exist.
>>
>> We have no knowledge about out of tree h/w to understand what you need
>>
>>> irq                 hwirqCIU        hwirqCIU2      hwirqCIU3
>>> ----------------------------------------------------------------------
>>> OCTEON_IRQ_USB0     56               81             934562
>>> OCTEON_IRQ_TWSI     45              224             100543
>>> OCTEON_IRQ_UART0    34              228               4572
>>> .
>>> .
>>> .
>>
>> How many actual hwirqs in each case and what is the range?
>>
>> So for CIU3, it seems you would need to use a radix tree. CIU2 is
>> probably borderline depending on what is the max number. But because you
>> don't yet have code in tree for either yet, you can use a linear domain
>> for now. It shouldn't be hard to switch from linear to radix later.
>>
>>> Now what we notice here is that there is no possible 1:1 linearly
>>> increasing mapping possible for the irq and *all* three hwirq sets.  We
>>> want a single binary that contains support for all three interrupt
>>> controllers, so the OCTEON_IRQ_* values have to be the same for all
>>> three interrupt controllers.  Because of this, legacy mapping is
>>> *impossible*.
>>
>> OCTEON_IRQ_* values need to go. You may not have to do that now, but
>> certainly before doing support for CIU2 and CIU3 you do. Those platforms
>> should be DT only.
>>
>>>
>>> Since the possible ranges of the hwirq values is very large and quite
>>> sparse, probably the radix mapping will be required.
>>>
>>
>> Yes. You're not the only one with this issue.
>>
>>> Also to support non-OF drivers and architecture specific code for the
>>> near future, I really think the existing IRQ values *must* be preserved.
>>>
>>
>> For a legacy boot yes. But when you boot with DT, you should not need
>> them.
> 
> It is not a matter of how the system is booted, rather what all the
> drivers are expecting...
> 
>> This is certainly possible as several ARM platforms do this. You
>> need to start with minimal set of drivers enabled for DT and add them
>> back in 1 by 1.
>>
> 
> What I don't understand about this is what happens during the transition?
> 
> What if a shared interrupt were referred from one non-OF driver by its
> symbolic OCTEON_IRQ_? value, and from a second driver by its hwirq value
> extracted from the DT?  In that case you would be referring to the same
> interrupt line by two different irq values, clearly that should be
> prevented.
> 
> At a minimum, the change made for each converted driver would have to
> include: removing the OCTEON_IRQ_? values,  Maintain a list of hwirqs
> that are outside of the domain and report this by the.map() function,
> and then update this list.

Drivers should only deal with Linux irq numbers and should only get them
as a resource passed into the driver probe. This is true with or without
DT. I only see 2 drivers directly using OCTEON_IRQ defines: ethernet and
watchdog. Fix them. The serial setup code needs to use resources as
well. The other place you will see irq defines is platform device
declarations (i2c is an example in your case). For DT boot, you would
not register the static devices and the devices should be created
dynamically.

Rob
