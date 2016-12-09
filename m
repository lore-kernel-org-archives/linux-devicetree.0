From: "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] of/irq: improve error report on irq discovery process
 failure
Date: Fri, 9 Dec 2016 16:19:08 -0200
Message-ID: <584AF59C.50500@linux.vnet.ibm.com>
References: <1480946356-16778-1-git-send-email-gpiccoli@linux.vnet.ibm.com>
 <CAL_JsqKg4+SANVuhfjFQRrC4Ax7OhAjwuBpo0Xes9UFevFAdWg@mail.gmail.com>
 <5845B980.2030609@linux.vnet.ibm.com>
 <CAL_JsqJQEYmxbUaL5qhym1MHRvUbo=PvUWDMKRDqLnBhuJAYzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJQEYmxbUaL5qhym1MHRvUbo=PvUWDMKRDqLnBhuJAYzQ@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Frank Rowand <frowand.list@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

On 12/09/2016 02:25 PM, Rob Herring wrote:
> On Mon, Dec 5, 2016 at 1:01 PM, Guilherme G. Piccoli
> <gpiccoli@linux.vnet.ibm.com> wrote:
>> On 12/05/2016 12:28 PM, Rob Herring wrote:
>>> On Mon, Dec 5, 2016 at 7:59 AM, Guilherme G. Piccoli
>>> <gpiccoli@linux.vnet.ibm.com> wrote:
>>>> On PowerPC machines some PCI slots might not have level triggered
>>>> interrupts capability (also know as level signaled interrupts),
>>>> leading of_irq_parse_pci() to complain by presenting error messages
>>>> on the kernel log - in this case, the properties "interrupt-map" and
>>>> "interrupt-map-mask" are not present on device's node in the device
>>>> tree.
>>>>
>>>> This patch introduces a different message for this specific case,
>>>> and also reduces its level from error to warning. Besides, we warn
>>>> (once) that possibly some PCI slots on the system have no level
>>>> triggered interrupts available.
>>>> We changed some error return codes too on function of_irq_parse_raw()
>>>> in order other failure's cases can be presented in a more precise way.
>>>>
>>>> Before this patch, when an adapter was plugged in a slot without level
>>>> interrupts capabilitiy on PowerPC, we saw a generic error message
>>>> like this:
>>>>
>>>>     [54.239] pci 002d:70:00.0: of_irq_parse_pci() failed with rc=-22
>>>>
>>>> Now, with this applied, we see the following specific message:
>>>>
>>>>     [16.154] pci 0014:60:00.1: of_irq_parse_pci: no interrupt-map found,
>>>>     INTx interrupts not available
>>>>
>>>> Finally, we standardize the error path in of_irq_parse_raw() by always
>>>> taking the fail path instead of returning directly from the loop.
>>>>
>>>> Signed-off-by: Guilherme G. Piccoli <gpiccoli@linux.vnet.ibm.com>
>>>> ---
>>>>
>>>> v2:
>>>>   * Changed function return code to always return negative values;
>>>
>>> Are you sure this is safe? This is tricky because of differing values
>>> of NO_IRQ (0 or -1).
>>
>> Thanks Rob, but this is purely bad wording from myself. I'm sorry - I
>> meant to say that I changed only my positive return code (that was
>> suggested to be removed in the prior revision) to negative return code!
>>
>> So, I changed only code I added myself in v1 =)
>>
>>
>>>
>>>>   * Improved/simplified warning outputs;
>>>>   * Changed some return codes and some error paths in of_irq_parse_raw()
>>>> in order to be more precise/consistent;
>>>
>>> This too could have some side effects on callers.
>>>
>>> Not saying don't do these changes, just need some assurances this has
>>> been considered.
>>
>> Thanks for your attention. I performed a quick investigation before
>> changing this, all the places that use the return values are just
>> getting "true/false" information from that, meaning they just are
>> comparing to 0 basically. So change -EINVAL to -ENOENT wouldn't hurt any
>> user of these return values, it'll only become more informative IMHO.
>>
>> Now, regarding the only error path that was changed: for some reason,
>> this was the only place in which we didn't goto fail label in case of
>> failure - it was added by a legacy commit from Ben, dated from 2006:
>> 006b64de60 ("[POWERPC] Make OF irq map code detect more error cases").
>> Then it was carried by Grant Likely's commit 7dc2e1134a ("of/irq: merge
>> irq mapping code"), 6-year old commit.
>> I wasn't able to imagine a scenario in which changing this would break
>> something; I believe the change improve consistency, but I'd remove it
>> if you or somebody else thinks it worth be removed.
> 
> Okay. It's a bit late for 4.10 now and want this to be in -next for a
> while, so I'll queue it after the merge window.
> 

OK, perfect! Thanks Rob
Cheers,


Guilherme

> Rob
> 
