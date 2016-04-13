From: Alistair Popple <alistair@popple.id.au>
Subject: Re: [PATCH v8 00/45] powerpc/powernv: PCI hotplug support
Date: Thu, 14 Apr 2016 09:57:32 +1000
Message-ID: <8771729.bnzLL9sLJY@new-mexico>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com> <570E0E13.6080409@ozlabs.ru> <20160413234246.GA5330@gwshan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20160413234246.GA5330@gwshan>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org, Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, devicetree@vger.kernel.org, grant.likely@linaro.org, robherring2@gmail.com, linux-pci@vger.kernel.org, bhelgaas@google.com, dja@axtens.net
List-Id: devicetree@vger.kernel.org

Hi Gavin,

<snip>

> >Why exactly cannot EEH reset changes go to a smaller separate patchset
> >(before hotplug)?
> >
> 
> As I explained before, the patchset's order is: PCI generic part,
> PowerNV PCI related, EEH related, device-tree part and hotplug driver.
> 
> The EEH reset change is included in PATCH[37/45]. There is no point
> to reorder the patches.
 
I don't understand all of the dependencies but if possible splitting the 
series up into a set of smaller self-contained patch series makes things 
easier to review and may make it easier for you to get this functionality 
reviewed and accepted into upstream.

Regards,

Alistair
