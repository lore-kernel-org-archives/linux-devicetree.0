From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v4 1/6] irqdomain: rename variables in irq_domain_{push,pop}_irq()
Date: Sat, 9 Sep 2017 00:05:49 +0900
Message-ID: <CAK7LNARboWo4-zkioMAxtpM84f9avtL8Z4z_s0cU5UHXkGotPg@mail.gmail.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
 <1504784522-26841-2-git-send-email-yamada.masahiro@socionext.com>
 <fb4a28cb-2005-4e9b-8b3d-4d9f4c667c8f@arm.com> <c9fd0412-6dce-95e9-4ca3-d4d61f9feeca@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <c9fd0412-6dce-95e9-4ca3-d4d61f9feeca@caviumnetworks.com>
Sender: linux-gpio-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Masami Hiramatsu <mhiramat@kernel.org>, David Daney <david.daney@cavium.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Marc, David,


2017-09-08 2:45 GMT+09:00 David Daney <ddaney@caviumnetworks.com>:
> On 09/07/2017 05:47 AM, Marc Zyngier wrote:
>>
>> On 07/09/17 12:41, Masahiro Yamada wrote:
>>>
>>> The meaning of "root" in irq_domain_{push,pop} is opposite to the
>>> documentation.  Documentation/IRQ-domain.txt depicts the hierarchy
>>> IRQ domain as follows:
>>>
>>>      CPU Vector irq_domain (root irq_domain to manage CPU vectors)
>>>              ^
>>>              |
>>>      Interrupt Remapping irq_domain (manage irq_remapping entries)
>>>              ^
>>>              |
>>>      IOAPIC irq_domain (manage IOAPIC delivery entries/pins)
>>>
>>>  From above, the inner-most domain (nearest to the CPU) is "root".
>>>
>>> The document also says, "When building irq_domain hierarchy, the
>>> irq_domain near to the device is child and the irq_domain near to
>>> CPU is parent."  This is how irq_data->parent_data works.  In
>>> contrast, these function use a variable "child_irq_data" for that.
>>
>> The exact opposite argument could be used for the data structure. The
>> irq_desc is the root of the list ordered with parent_data.
>>
>> Yes, this is confusing, but because we're using the same English words
>> to describe two different things, we're bound to make one thing more
>> difficult. I'm unconvinced that this change helps anything (it certainly
>> confuses me more than anything else).
>>
>
> There may be room for improvement here.
>
> Here is my recollection of how I choose the names:
>
> "root" is the thing embedded in the struct irq_desc, if you think about a
> typical linked list structure like this, we can refer to the starting point
> as the "root".  Sometimes it might be referred to as the "head" of the list,
> but usually not the "tail"
>
> "child" was used to indicate the thing we get to by traversing the link in
> the list.  The fact that ->parent is the name of the next pointer and that
> it points to something called "child" is confusing here.
> So what do I think should be done?  This:
>
> Either
>   A) s/child_irq_data/parent_irq_data/g  As this patch does, but leave the
> root_irq_data name unchanged.


Sounds better than the current situation.




>   B) Change the name of the ->parent in struct irq_data to ->next


This is a bad idea.

irq_data->parent_data corresponds to irq_domain->parent.
We should not lose consistency/symmetry.

irq_domain->parent originates in the "parent" argument
passed to irq_domain_create_hierarchy().
If we change this, it will introduce horrible confusion.

As the document says, when we talk about the hierarchy,
"the irq_domain near to the device is
child and the irq_domain near to CPU is parent"
This is the original concept, and should not be changed.


We can excuse that all the variables in these two helpers
were named from the point of linked-list view,
not talking about the hierarchy.


However, what I thought more confusing was the comment block.

/**
 * irq_domain_push_irq() - Push a domain in to the top of a hierarchy.


This comment is talking about the "hierarchy" at first glance.
So, what is my mind is the picture in Documentation/IRQ-domain.txt

But, from the term "top", this is talking about the linked list here too.
The linked list is just implementation detail...




> But that is just my $0.02
>
> I fear we risk a Bike Shedding type of discussion here.

-- 
Best Regards
Masahiro Yamada
