From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of_pci_irq: Silence bogus "of_irq_parse_pci() failed ..." messages.
Date: Sun, 6 Sep 2015 15:46:41 -0500
Message-ID: <CAL_JsqK0uW4F7HAcUMSQ-2wCvp_i3a5MTxsyW3XerHAxBrW=SQ@mail.gmail.com>
References: <1441393926-23225-1-git-send-email-ddaney.cavm@gmail.com> <55EA41E3.5010103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55EA41E3.5010103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 4, 2015 at 8:14 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 9/4/2015 12:12 PM, David Daney wrote:
>> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>> It is perfectly legitimate for a PCI device to have an
>> PCI_INTERRUPT_PIN value of zero.  This happens if the device doesn't
>> use interrupts, or on PCIe devices, where only MSI/MSI-X are
>> supported.
>>
>> Silence the annoying "of_irq_parse_pci() failed with rc=-19" error
>> messages by making them conditional on !-ENODEV (which can only be
>> produced in the PCI_INTERRUPT_PIN == 0 case).
>>
>> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/of/of_pci_irq.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/of_pci_irq.c b/drivers/of/of_pci_irq.c
>> index 1710d9d..33d242a 100644
>> --- a/drivers/of/of_pci_irq.c
>> +++ b/drivers/of/of_pci_irq.c
>> @@ -106,7 +106,9 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
>>
>>       ret = of_irq_parse_pci(dev, &oirq);
>>       if (ret) {
>> -             dev_err(&dev->dev, "of_irq_parse_pci() failed with rc=%d\n", ret);
>> +             if (ret != -ENODEV)
>> +                     dev_err(&dev->dev,
>> +                             "of_irq_parse_pci() failed with rc=%d\n", ret);
>>               return 0; /* Proper return code 0 == NO_IRQ */
>>       }
>>
>>
>
> It is not safe to assume that the functions that of_irq_parse_pci() calls
> will never be modified to return -ENODEV, thus resulting in of_irq_parse_pci()
> returning -ENODEV for a reason other than PCI_INTERRUPT_PIN == 0.

Yes, but we're talking about a print statement.

>
> A more robust solution would be something like:
>
>
> (1) Change of_irq_parse_pci() to _of_irq_parse_pci(), adding an argument and
> use it to report the case of PCI_INTERRUPT_PIN == 0.
>
> static int _of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq, int *no_pin)
> {
>
> ...
>         *no_pin = 0;
> ...
>         /* No pin, exit */
>         if (pin == 0) {
>                 *no_pin = 1;
>                 return -ENODEV;
>         }
> ...
>
>
> int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq)
> {
>         int no_pin;
>         return _of_irq_parse_pci(pdev, out_irq, &no_pin)
> }
>
>
> (2) Then the fix to of_irq_parse_and_map_pci() would be:
>
>   +     int no_pin;
>>       ret = of_irq_parse_pci(dev, &oirq, &no_pin);
>>       if (ret) {
>> -             dev_err(&dev->dev, "of_irq_parse_pci() failed with rc=%d\n", ret);
>> +             if (!no_pin)
>> +                     dev_err(&dev->dev,
>> +                             "of_irq_parse_pci() failed with rc=%d\n", ret);
>>               return 0; /* Proper return code 0 == NO_IRQ */
>>       }
>
>
> I'm not sure I like my solution, there might be a better way.

I don't like it. That's way too complex for just silencing an
erroneous error message.

Perhaps just move the error message into of_irq_parse_pci and then you
can control the print more easily. Or just change to dev_dbg would be
okay by me.


> I also noticed another bug while looking at of_irq_parse_pci().  It returns
> the non-zero return value from pci_read_config_byte().  But that value is
> one of the PCI function error values from include/linux/pci.h, such as:
>
>    #define PCIBIOS_BAD_REGISTER_NUMBER     0x87
>
> instead of a negative errno.

I was puzzled by why this is not standard error codes a while back. My
best guess is that that there is some legacy here. Changing error
values on widely used functions is impossible to audit. NO_IRQ being 0
or -1 is one such case.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
