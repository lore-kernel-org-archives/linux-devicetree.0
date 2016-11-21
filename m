From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Mon, 21 Nov 2016 12:21:43 -0800
Message-ID: <58335757.6020105@gmail.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <582E1A59.7040502@gmail.com> <075d4718-8cd2-e390-b755-bc24e7497eae@arm.com>
 <582F6312.5040009@gmail.com> <0f150e21-ba46-d4f2-98e8-a226eb82ca3e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0f150e21-ba46-d4f2-98e8-a226eb82ca3e-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/21/16 08:20, Sudeep Holla wrote:
> 
> 
> On 18/11/16 20:22, Frank Rowand wrote:
>> On 11/18/16 02:41, Sudeep Holla wrote:
>>>
>>>
>>> On 17/11/16 21:00, Frank Rowand wrote:
>>>> On 11/17/16 07:32, Sudeep Holla wrote:
>>>>> Currently platforms/drivers needing to get the machine model name are
>>>>> replicating the same snippet of code. In some case, the OF reference
>>>>> counting is either missing or incorrect.
>>>>>
>>>>> This patch adds support to read the machine model name either using
>>>>> the "model" or the "compatible" property in the device tree root node
>>>>> to the core OF/DT code.
>>>>>
>>>>> This can be used to remove all the duplicate code snippets doing exactly
>>>>> same thing later.
>>>>
>>>> I find five instances of reading only property "model":
>>>>
>>>>   arch/arm/mach-imx/cpu.c
>>>>   arch/arm/mach-mxs/mach-mxs.c
>>>>   arch/c6x/kernel/setup.c
>>>>   arch/mips/cavium-octeon/setup.c
>>>>   arch/sh/boards/of-generic.c
>>>>
>>>
>>> Ah sorry you were not Cc-ed in 2/2, but that shows all the instances
>>> that this will be used for.
>>
>> I have not seen 2/2.  I do not see it on the devicetree list or on lkml.
>>
> 
> Yes on both [1][2]
> 
>> I did see a list of drivers in the RFC patch that you sent several hours
>> before this patch.
>>
>> In that patch you replaced reading the model name from the _flat_ device
>> tree with the new function in at least one location.  That is not
>> correct.
>>
>>
>>>
>>>> I find one instance of reading property "model", then if
>>>> that does not exist, property "compatible":
>>>>
>>>>   arch/mips/generic/proc.c

Just for completeness, now that I have seen patch 2/2, there is a
second location that currently uses "compatible" if "model" does
not exist: drivers/soc/fsl/guts.c

>>>>
>>>
>>> Correct as you can check in patch 2/2
>>>
>>>> The proposed patch matches the code used in one place, and thus
>>>> current usage does not match the patch description.
>>>>
>>>
>>> Yes, but does it matter ? compatibles are somewhat informative about the
>>> model IMO.
>>
>> Yes it does matter.  That is just sloppy and makes devicetree yet harder
>> to understand.  It hurts clarity.  The new function name says get "model",
>> not get "model" or "first element of the compatible list".

An example of a function name that would not hurt clarity would be
of_model_or_1st_compatible().


>>
> 
> This is a implementation in the Linux and it doesn't change anything in
> DT semantics. I am not able to get your concern.

The existing code in five locations that patch 2/2 changes only attempt
to read the value of property "model".  Changing those five locations
to use of_machine_get_model_name() results in those locations using the
first string of the "compatible" property if "model" does not exist.

The value found is potentially used to determine whether to execute
model specific code.  An example of this is: octeon_pcie_pcibios_map_irq().
Can you guarantee that there is no device tree that does not contain
a "model" property in the root node, but does contains a "compatible"
property in the root node whose first value is "EBH5600"?

I have pasted the relevant code from octeon_pcie_pcibios_map_irq()
below for convenient reference:

int __init octeon_pcie_pcibios_map_irq(const struct pci_dev *dev,
                                       u8 slot, u8 pin)
{
        /*
         * The EBH5600 board with the PCI to PCIe bridge mistakenly
         * wires the first slot for both device id 2 and interrupt
         * A. According to the PCI spec, device id 2 should be C. The
         * following kludge attempts to fix this.
         */
        if (strstr(octeon_board_type_string(), "EBH5600") &&
            dev->bus && dev->bus->parent) {

My point is that it is not possible to review patch 2/2 to verify whether
any change in kernel behavior results from the change, because we do not
have access to all device tree sources.  patch 2/2 is intended to clean
up code, not to change behavior.


> 
>> And using the _first_ element only of the compatible list to determine
>> model is not a good paradigm.  It is yet another hidden, special case,
>> undocumented trap to lure in the unwary.
>>
> 
> The function is documented and again this doesn't enforce anything in
> the bindings. It's just the way it's used by the Linux kernel.
> 
> [...]
> 
>>
>> You also ignored Arnd's comment in reply to your RFC patch.
>>
> 
> OK, all I can see is that Arnd wanted to reuse of_root, which I did.
> Did I miss anything else ?
> 

My mistake, sorry.  I misread the patch.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
