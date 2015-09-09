From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v2] of_pci_irq: Silence bogus "of_irq_parse_pci() failed
 ..." messages.
Date: Wed, 9 Sep 2015 10:53:04 -0700
Message-ID: <55F07200.9060209@caviumnetworks.com>
References: <1441736911-2445-1-git-send-email-ddaney.cavm@gmail.com> <55F06FE3.9020600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55F06FE3.9020600@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: David Daney <ddaney.cavm@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On 09/09/2015 10:44 AM, Frank Rowand wrote:
> Second attempt at this reply.  The first reply was mangled.
>
> On 9/8/2015 11:28 AM, David Daney wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> It is perfectly legitimate for a PCI device to have an
>> PCI_INTERRUPT_PIN value of zero.  This happens if the device doesn't
>> use interrupts, or on PCIe devices, where only MSI/MSI-X are
>> supported.
>>
>> Silence the annoying "of_irq_parse_pci() failed with rc=-19" error
>> messages by moving the printing code into of_irq_parse_pci(), and only
>> emitting the message for cases where PCI_INTERRUPT_PIN == 0 is not the
>> cause for an early exit.
>>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> ---
>> Changes in v2: Move the print function in to of_irq_parse_pci() at a
>> common error exit point (as suggested by Frank Rowand).
>>
>>
[...]
>> @@ -87,6 +89,9 @@ int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq
>>   	laddr[0] = cpu_to_be32((pdev->bus->number << 16) | (pdev->devfn << 8));
>>   	laddr[1] = laddr[2] = cpu_to_be32(0);
>
>>   	return of_irq_parse_raw(laddr, out_irq);
>
> should be:
>
>          rc = of_irq_parse_raw(laddr, out_irq);
>          if (rc)
>                  goto err;
>          return 0;
>

You are right.  I will send v3.

Thanks,
David Daney

>> +err:
>> +	dev_err(&pdev->dev, "of_irq_parse_pci() failed with rc=%d\n", rc);
>> +	return rc;
