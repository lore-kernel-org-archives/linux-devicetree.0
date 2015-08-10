From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v6 00/42] powerpc/powernv: PCI hotplug suppport
Date: Mon, 10 Aug 2015 16:05:40 +1000
Message-ID: <55C83F34.9040306@ozlabs.ru>
References: <1438834307-26960-1-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1438834307-26960-1-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com
List-Id: devicetree@vger.kernel.org

On 08/06/2015 02:11 PM, Gavin Shan wrote:
> The series of patches intend to support PCI slot for PowerPC PowerNV platform,
> which is running on top of skiboot firmware. The patchset requires corresponding
> changes from skiboot firmware, which is sent to skiboot@lists.ozlabs.org
> for review. The PCI slots are exposed by skiboot with device node properties,
> and kernel utilizes those properties to populated PCI slots accordingly.


This does not apply on top of any actual trees I have - torvalds/master, 
powerpc/master, powerpc/next.

The problem patches are (at least):
powerpc/powernv: Enable M64 on P7IOC
powerpc/powernv: Release PEs dynamically

What did you base them on (sha1)? It is always worth mentioning.




-- 
Alexey
