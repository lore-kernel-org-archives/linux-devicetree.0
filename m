From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Fri, 9 Dec 2016 15:54:21 -0800
Message-ID: <584B442D.4020104@gmail.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <20161118144651.275xz4gu6jaefhp7@rob-hp-laptop> <582F5DC0.4080804@gmail.com>
 <5834921F.2020809@gmail.com>
 <CAL_JsqLsw6BNSDY8pGJ8x3XF21WdciLC7WC+z796pYtDk_kvxA@mail.gmail.com>
 <195d492b-c674-e096-4f84-d37ca5448db2@arm.com>
 <CAL_JsqKioaP6JvihmJ3HK6cEfCgFRrtYr+EbJ2KvptxcrWCLnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKioaP6JvihmJ3HK6cEfCgFRrtYr+EbJ2KvptxcrWCLnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/09/16 08:03, Rob Herring wrote:
> On Wed, Nov 23, 2016 at 4:25 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>>
>> On 22/11/16 21:35, Rob Herring wrote:
>>>
>>> On Tue, Nov 22, 2016 at 12:44 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> wrote:
>>
>>
>> [...]
>>
>>>>
>>>> This patch adds a function that leads to conflating the "model" property
>>>> and the "compatible" property. This leads to opaque, confusing and
>>>> unclear
>>>> code where ever it is used.   I think it is not good for the device tree
>>>> framework to contribute to writing unclear code.
>>>>
>>>> Further, only two of the proposed users of this new function appear to
>>>> be proper usage.  I do not think that the small amount of reduced lines
>>>> of code is a good trade off for the reduced code clarity and for the
>>>> potential for future mis-use of this function.
>>>>
>>>> Can I convince you to revert this patch?
>>>
>>>
>>> Yes, I will revert.
> 
> I looked at this again and the users. They are all informational, so

A comment in the function docbook header stating that the intent of the
returned value is for informational use only would make me happy.

There is at least on proposed use in patch 2/2 that is not just
informational.  init_octeon_system_type() sometimes uses the value of
the model property to create the value of variable octeon_system_type.
octeon_pcie_pcibios_map_irq() checks the value of octeon_system_type
(via the function octeon_board_type_string()) to determine whether
to apply a fixup:

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


> I'm not worried if a compatible string could be returned with this
> change. The function returns the best name for the machine and having
> consistency is a good thing.

> 
> I was considering not reverting (as I'd not yet gotten around to it),
> but I'm still going to revert for the naming.
> 
>>>
>>>> If not, will you accept a patch to change the function name to more
>>>> clearly indicate what it does?  (One possible name would be
>>>> of_model_or_1st_compatible().)
>>>
>>>
>>> I took it as there's already the FDT equivalent function.
>>
>>
>> Yes it was mainly for non of_flat_* replacement for
>> of_flat_dt_get_machine_name
> 
> I would suggest just of_get_machine_name().
> 
> You might also add a fallback to return "unknown", and drop some of
> the custom strings. I don't think anyone should care about the actual
> string. However, it's an error to have a DT with no model or top level
> compatible, so maybe a WARN.

The name and other suggestions sound fine to me.

-Frank

> 
> Rob
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
