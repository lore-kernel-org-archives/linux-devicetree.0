From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 28/50] powerpc/pci: Rename
 pcibios_{add,remove}_pci_devices()
Date: Tue, 24 Nov 2015 10:08:21 +1100
Message-ID: <20151123230821.GD5375@gwshan>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1446642770-4681-29-git-send-email-gwshan@linux.vnet.ibm.com>
 <564BE5BA.30907@ozlabs.ru>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <564BE5BA.30907@ozlabs.ru>
Sender: linux-pci-owner@vger.kernel.org
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18, 2015 at 01:43:06PM +1100, Alexey Kardashevskiy wrote:
>On 11/05/2015 12:12 AM, Gavin Shan wrote:
>>This renames pcibios_{add,remove}_pci_devices() to avoid conflicts
>>with names of the weak functions in PCI subsystem, which have the
>>prefix "pcibios". No logical changes introduced.
>
>
>As you mentioned before, the patchset is organized as "code refactoring,
>IO/M32/M64, DMA, PE allocation/releaseing". This patch fits into the
>refactoring category so it goes to the beginning of the series :)
>

I don't think so. As said in PATCH[00/50], this patchset consists of 3
separate parts: PowerNV PCI rework; Using PCI slot; Hotplug driver; this
patch is one of the second part. So I don't think it needs to be move to
the beginning of the series.

Thanks,
Gavin
