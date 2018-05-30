From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 2/6] PCI: iproc: Add INTx support with better modeling
Date: Wed, 30 May 2018 10:27:12 -0700
Message-ID: <9f4aedd8-17e0-3747-3bdb-2f2dc0a20756@broadcom.com>
References: <1527631130-20045-1-git-send-email-ray.jui@broadcom.com>
 <1527631130-20045-3-git-send-email-ray.jui@broadcom.com>
 <CAHp75VfwfKbikfat3tTbMzSfNgt4v9nFpExyDvhOdX9ko1Z4Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfwfKbikfat3tTbMzSfNgt4v9nFpExyDvhOdX9ko1Z4Fw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-pci@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 5/29/2018 5:59 PM, Andy Shevchenko wrote:
> On Wed, May 30, 2018 at 12:58 AM, Ray Jui <ray.jui@broadcom.com> wrote:
>> Add PCIe legacy interrupt INTx support to the iProc PCIe driver by
>> modeling it with its own IRQ domain. All 4 interrupts INTA, INTB, INTC,
>> INTD share the same interrupt line connected to the GIC in the system,
>> while the status of each INTx can be obtained through the INTX CSR
>> register
> 
>> +       while ((status = iproc_pcie_read_reg(pcie, IPROC_PCIE_INTX_CSR) &
>> +               SYS_RC_INTX_MASK) != 0) {
>> +               for_each_set_bit(bit, &status, PCI_NUM_INTX) {
>> +                       virq = irq_find_mapping(pcie->irq_domain, bit + 1);
>> +                       if (virq)
>> +                               generic_handle_irq(virq);
>> +                       else
>> +                               dev_err(dev, "unexpected INTx%u\n", bit);
>> +               }
>> +       }
> 
> do {
>    status = ...;
>    for_each_set_bit() {
>      ...
>    }
> } while (status);
> 
> would look slightly better for my opinion.
> 

Indeed. I agree with you. I'll wait for comments before sending out v2 
which will include this improvement.

Thanks,

Ray
