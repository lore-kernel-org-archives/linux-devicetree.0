From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of_pci_irq: Silence bogus "of_irq_parse_pci() failed
 ..." messages.
Date: Mon, 07 Sep 2015 16:44:58 -0700
Message-ID: <55EE217A.5090301@gmail.com>
References: <1441393926-23225-1-git-send-email-ddaney.cavm@gmail.com> <55EA41E3.5010103@gmail.com> <CAL_JsqK0uW4F7HAcUMSQ-2wCvp_i3a5MTxsyW3XerHAxBrW=SQ@mail.gmail.com> <55ECF37D.7050401@gmail.com> <55ED099B.2000009@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55ED099B.2000009@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: Rob Herring <robherring2@gmail.com>, David Daney <ddaney.cavm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On 9/6/2015 8:50 PM, Frank Rowand wrote:
> On 9/6/2015 7:16 PM, Frank Rowand wrote:
>> On 9/6/2015 1:46 PM, Rob Herring wrote:
>>> On Fri, Sep 4, 2015 at 8:14 PM, Frank Rowand <frowand.list@gmail.com> wrote:
>>>> On 9/4/2015 12:12 PM, David Daney wrote:
>>>>> From: David Daney <david.daney@cavium.com>
>>>>>
>>>>> It is perfectly legitimate for a PCI device to have an
>>>>> PCI_INTERRUPT_PIN value of zero.  This happens if the device doesn't
>>>>> use interrupts, or on PCIe devices, where only MSI/MSI-X are
>>>>> supported.
>>>>>
>>>>> Silence the annoying "of_irq_parse_pci() failed with rc=-19" error
>>>>> messages by making them conditional on !-ENODEV (which can only be
>>>>> produced in the PCI_INTERRUPT_PIN == 0 case).
>>>>>
>>>>> Signed-off-by: David Daney <david.daney@cavium.com>
>>>>> ---
>>>>>  drivers/of/of_pci_irq.c | 4 +++-
>>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/of/of_pci_irq.c b/drivers/of/of_pci_irq.c
>>>>> index 1710d9d..33d242a 100644
>>>>> --- a/drivers/of/of_pci_irq.c
>>>>> +++ b/drivers/of/of_pci_irq.c
>>>>> @@ -106,7 +106,9 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
>>>>>
>>>>>       ret = of_irq_parse_pci(dev, &oirq);
>>>>>       if (ret) {
>>>>> -             dev_err(&dev->dev, "of_irq_parse_pci() failed with rc=%d\n", ret);
>>>>> +             if (ret != -ENODEV)
>>>>> +                     dev_err(&dev->dev,
>>>>> +                             "of_irq_parse_pci() failed with rc=%d\n", ret);
>>>>>               return 0; /* Proper return code 0 == NO_IRQ */
>>>>>       }
>>>>>
>>>>>
>>>>
>>>> It is not safe to assume that the functions that of_irq_parse_pci() calls
>>>> will never be modified to return -ENODEV, thus resulting in of_irq_parse_pci()
>>>> returning -ENODEV for a reason other than PCI_INTERRUPT_PIN == 0.
>>>
>>> Yes, but we're talking about a print statement.
>>>
>>>>
>>>> A more robust solution would be something like:
>>
>> < snip my bad solution >
>>
>>>> I'm not sure I like my solution, there might be a better way.
>>>
>>> I don't like it. That's way too complex for just silencing an
>>> erroneous error message.
>>>
>>> Perhaps just move the error message into of_irq_parse_pci and then you
>>> can control the print more easily. Or just change to dev_dbg would be
>>> okay by me.
>>
>> I knew I was making it way too hard.  Yes, just move the error message
>> to of_irq_parse_pci(), where the "/* No pin, exit */" test occurs.
> 
> And this time I replied too quickly, not really thinking through my comment.
> There are several error return points in of_irq_parse_pci(), so moving the
> error message into of_irq_parse_pci() is not the answer.

                                        is not the answer unless of_irq_parse_pci()
  is changed over to the single point of return style.

I realized I should have typed the whole thought...

-Frank
