From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH] OF: PCI: const usage needed by MIPS
Date: Fri, 04 May 2012 12:55:18 +0200
Message-ID: <4FA3B596.3050106@openwrt.org>
References: <1335808019-24502-1-git-send-email-blogic@openwrt.org> <4F9ED1DC.3050007@gmail.com> <4F9FE4F6.5070909@openwrt.org> <CAErSpo4bZ=0=DtbDots_GOGeLNhX6Q4eJrdetaFQMv4iiv5+XA@mail.gmail.com> <4FA32E47.7020406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <4FA32E47.7020406@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Ralf Baechle <ralf@linux-mips.org>, Grant Likely <grant.likely@secretlab.ca>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi David,

> The problem is when you start declaring function pointers in various
> ops vectors.
>
> Consider:
>
> void (*foo)(const struct pci_dev *)
> void (*bar)(struct pci_dev *)
>
> foo and bar are not type compatible, and you will get compiler
> warnings if you use one where the other is expected.
>
> So the question is:  Are we ever going to the address of any of the
> functions that are being modified?  If so, we have created a problem.
>



i could not find any place in the code where this happens, which does
not mean that there are none.


>> Similar reasoning applies to of_irq_map_pci().
>>
>> So I'm fine with this.  You sent it to Grant, so I'll assume he'll
>> merge it unless I hear otherwise.
>>
>> Acked-by: Bjorn Helgaas<bhelgaas@google.com>
>>
>

Thanks for the Ack, i hope this patch gets accepted as is. I am simply
missing the overview of the pci subsystem to evaluate if this can cause
regressions.


John
