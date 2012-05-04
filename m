From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: [PATCH] OF: PCI: const usage needed by MIPS
Date: Thu, 03 May 2012 18:17:59 -0700
Message-ID: <4FA32E47.7020406@gmail.com>
References: <1335808019-24502-1-git-send-email-blogic@openwrt.org> <4F9ED1DC.3050007@gmail.com> <4F9FE4F6.5070909@openwrt.org> <CAErSpo4bZ=0=DtbDots_GOGeLNhX6Q4eJrdetaFQMv4iiv5+XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAErSpo4bZ=0=DtbDots_GOGeLNhX6Q4eJrdetaFQMv4iiv5+XA@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: John Crispin <blogic@openwrt.org>, Ralf Baechle <ralf@linux-mips.org>, Grant Likely <grant.likely@secretlab.ca>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 05/03/2012 05:30 PM, Bjorn Helgaas wrote:
> On Tue, May 1, 2012 at 7:28 AM, John Crispin<blogic@openwrt.org>  wrote:
>> On 30/04/12 19:54, David Daney wrote:
>>> On 04/30/2012 10:46 AM, John Crispin wrote:
>>>> On MIPS we want to call of_irq_map_pci from inside
>>>>
>>>> arch/mips/include/asm/pci.h:extern int pcibios_map_irq(
>>>>                  const struct pci_dev *dev, u8 slot, u8 pin);
>>>>
>>>> For this to work we need to change several functions to const usage.
>>>
>>> I think there is a mismatch on this throughout the kernel.
>>>
>>> Properly fixing it requires touching many more places than these.
>>> Although I haven't tried it, I wouldn't be surprised if doing this
>>> caused warnings to appear in non-MIPS code.
>>>
>>> Ralf had a patch at one point that tried to make this consistent
>>> tree-wide, but it is not yet applied.
>>>
>>> David Daney
>>
>> Hi,
>>
>> Ok, lets see what Ralf has to say.
>>
>> I just tested the patch on x86 with OF enabled and drivers turned on
>> that use the API. I did not see any errors appear.
>
> I'm far from a const expert, but I think this should be safe.

> Here's my reasoning:
>
> We're changing pci_swizzle_interrupt_pin() to take a pointer to a
> constant struct pci_dev.  pci_swizzle_interrupt_pin() only reads the
> struct pci_dev; it doesn't modify it.  It is legal to pass either
> "struct pci_dev *" or "const struct pci_dev *" to a function expecting
> "const struct pci_dev *"; the callee just won't be able to modify the
> struct, even if the caller can.
>

The problem is when you start declaring function pointers in various ops 
vectors.

Consider:

void (*foo)(const struct pci_dev *)
void (*bar)(struct pci_dev *)

foo and bar are not type compatible, and you will get compiler warnings 
if you use one where the other is expected.

So the question is:  Are we ever going to the address of any of the 
functions that are being modified?  If so, we have created a problem.

> Similar reasoning applies to of_irq_map_pci().
>
> So I'm fine with this.  You sent it to Grant, so I'll assume he'll
> merge it unless I hear otherwise.
>
> Acked-by: Bjorn Helgaas<bhelgaas@google.com>
>
