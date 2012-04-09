From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: [PATCH] irq/irq_domain: Quit ignoring error returns from irq_alloc_desc_from().
Date: Mon, 09 Apr 2012 09:52:27 -0700
Message-ID: <4F8313CB.3020105@gmail.com>
References: <1333669933-25267-1-git-send-email-ddaney.cavm@gmail.com> <4F7E64E4.3080509@gmail.com> <4F7F1BDD.4070205@gmail.com> <20120406235607.DCCD53E15E9@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120406235607.DCCD53E15E9@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree-discuss@lists.ozlabs.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/06/2012 04:56 PM, Grant Likely wrote:
> On Fri, 06 Apr 2012 09:37:49 -0700, David Daney<ddaney.cavm@gmail.com>  wrote:
>> On 04/05/2012 08:37 PM, Rob Herring wrote:
>>> On 04/05/2012 06:52 PM, David Daney wrote:
>>>> From: David Daney<david.daney@cavium.com>
>>>> @@ -380,14 +381,14 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
>>>>    	hint = hwirq % irq_virq_count;
>>>>    	if (hint == 0)
>>>>    		hint++;
>>>> -	virq = irq_alloc_desc_from(hint, 0);
>>>
>>> You are not looking at mainline. hint was removed in later versions, and
>>> the referenced commit ids don't exist.
>>
>> Please look at Linus' tree before making incorrect statements about
>> whether or not code exists on the 'mainline'
>
> Rob is indeed mistaken here, but please let's keep things civil.

Sorry about that.  You are correct that it is not acceptable.

David Daney
