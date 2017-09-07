From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v4 1/6] irqdomain: rename variables in
 irq_domain_{push,pop}_irq()
Date: Thu, 7 Sep 2017 10:45:34 -0700
Message-ID: <c9fd0412-6dce-95e9-4ca3-d4d61f9feeca@caviumnetworks.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
 <1504784522-26841-2-git-send-email-yamada.masahiro@socionext.com>
 <fb4a28cb-2005-4e9b-8b3d-4d9f4c667c8f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fb4a28cb-2005-4e9b-8b3d-4d9f4c667c8f@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Masami Hiramatsu <mhiramat@kernel.org>, David Daney <david.daney@cavium.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/07/2017 05:47 AM, Marc Zyngier wrote:
> On 07/09/17 12:41, Masahiro Yamada wrote:
>> The meaning of "root" in irq_domain_{push,pop} is opposite to the
>> documentation.  Documentation/IRQ-domain.txt depicts the hierarchy
>> IRQ domain as follows:
>>
>>      CPU Vector irq_domain (root irq_domain to manage CPU vectors)
>>              ^
>>              |
>>      Interrupt Remapping irq_domain (manage irq_remapping entries)
>>              ^
>>              |
>>      IOAPIC irq_domain (manage IOAPIC delivery entries/pins)
>>
>>  From above, the inner-most domain (nearest to the CPU) is "root".
>>
>> The document also says, "When building irq_domain hierarchy, the
>> irq_domain near to the device is child and the irq_domain near to
>> CPU is parent."  This is how irq_data->parent_data works.  In
>> contrast, these function use a variable "child_irq_data" for that.
> The exact opposite argument could be used for the data structure. The
> irq_desc is the root of the list ordered with parent_data.
> 
> Yes, this is confusing, but because we're using the same English words
> to describe two different things, we're bound to make one thing more
> difficult. I'm unconvinced that this change helps anything (it certainly
> confuses me more than anything else).
> 

There may be room for improvement here.

Here is my recollection of how I choose the names:

"root" is the thing embedded in the struct irq_desc, if you think about 
a typical linked list structure like this, we can refer to the starting 
point as the "root".  Sometimes it might be referred to as the "head" of 
the list, but usually not the "tail"

"child" was used to indicate the thing we get to by traversing the link 
in the list.  The fact that ->parent is the name of the next pointer and 
that it points to something called "child" is confusing here.

So what do I think should be done?  This:

Either
   A) s/child_irq_data/parent_irq_data/g  As this patch does, but leave 
the root_irq_data name unchanged.

   B) Change the name of the ->parent in struct irq_data to ->next

But that is just my $0.02

I fear we risk a Bike Shedding type of discussion here.


David Daney

> Thanks,
> 
> 	M.
> 
