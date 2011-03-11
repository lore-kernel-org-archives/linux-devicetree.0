From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [RFC PATCH v2 06/12] MIPS: Octeon: Add a irq_create_of_mapping()
 implementation.
Date: Fri, 11 Mar 2011 10:27:53 -0800
Message-ID: <4D7A69A9.40206@caviumnetworks.com>
References: <1299267744-17278-1-git-send-email-ddaney@caviumnetworks.com> <1299267744-17278-7-git-send-email-ddaney@caviumnetworks.com> <20110305010746.GD7579@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110305010746.GD7579@angua.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/04/2011 05:07 PM, Grant Likely wrote:
> On Fri, Mar 04, 2011 at 11:42:18AM -0800, David Daney wrote:
[...]
>> +/*
>> + * irq_create_of_mapping - Hook to resolve OF irq specifier into a Linux irq#
>> + *
>> + * Octeon irq maps are a pair of indexes.  The first selects either
>> + * ciu0 or ciu1, the second is the bit within the ciu register.
>> + */
>
> Is each 'ciu' an interrupt controller, or a 'bank' within the
> controller?

The ciu0 and ciu1 are 'banks' within a single interrupt controller. 
Each of these 'banks' has 64 bits, each bit corresponds to the finest 
grained source that can be routed via the interrupt infrastructure. 
Each interrupt source can therefore be completely specified by its bank 
and bit numbers.

> Also, it is typical to have another cell for specifying
> flags if there is any kind of configuration for each irq line, like
> edge vs. level and active high or active low.  (the counter example is
> PCI which doesn't use a flags cell because all PCI irqs are level
> active.
>

If you look in patch 04/12, you will see that I have added such a flag 
cell to the device tree.  In the next revision of this patch, I will be 
adding the logic to actually configure the polarity and triggering based 
on the flag cell.

There are only 16 sources (GPIO pins that can actually be configured. 
The remaining sources will ignore the triggering flags as they are hard 
wired.


> You'll need to supply documentation for the ciu binding to
> Documentation/devicetree/bindings before this patch gets merged.

OK, I will work on that too.

Thanks,
David Daney
