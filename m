From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] OF: PCI: const usage needed by MIPS
Date: Thu, 17 May 2012 17:14:58 -0500
Message-ID: <4FB57862.5000700@gmail.com>
References: <1335808019-24502-1-git-send-email-blogic@openwrt.org> <4F9ED1DC.3050007@gmail.com> <4F9FE4F6.5070909@openwrt.org> <CAErSpo4bZ=0=DtbDots_GOGeLNhX6Q4eJrdetaFQMv4iiv5+XA@mail.gmail.com> <4FA32E47.7020406@gmail.com> <4FA3B596.3050106@openwrt.org> <CAErSpo4AQh3cJzULkmP_Dqsf0cSPRP1WqvhuQR3gePXw2rN7rQ@mail.gmail.com> <4FADFB39.6010100@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <4FADFB39.6010100@openwrt.org>
Sender: linux-pci-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-mips@linux-mips.org, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Ralf Baechle <ralf@linux-mips.org>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: devicetree@vger.kernel.org

On 05/12/2012 12:55 AM, John Crispin wrote:
> 
>> I compiled alpha, ia64, mips, parisc, powerpc, sh, sparc, and x86 and
>> didn't see any issues related to this patch.  There might still be
>> something,  but I'm willing to help work through them or revert this
>> if it turns out to be a problem.  I'm still assuming that Grant will
>> handle this.
>>
>> Bjorn
> Hi Grant,
> 
> Is this patch ok with you ? If so would you mind if Ralf takes this via
> his tree ? (this would avoid merge order problems)
> 

This looks fine to me and merging thru Ralf's tree is fine.

Acked-by: Rob Herring <rob.herring@calxeda.com>

Rob

> Thanks,
> John
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
