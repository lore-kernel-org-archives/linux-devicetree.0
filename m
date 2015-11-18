From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v7 28/50] powerpc/pci: Rename
 pcibios_{add,remove}_pci_devices()
Date: Wed, 18 Nov 2015 13:43:06 +1100
Message-ID: <564BE5BA.30907@ozlabs.ru>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1446642770-4681-29-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1446642770-4681-29-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On 11/05/2015 12:12 AM, Gavin Shan wrote:
> This renames pcibios_{add,remove}_pci_devices() to avoid conflicts
> with names of the weak functions in PCI subsystem, which have the
> prefix "pcibios". No logical changes introduced.


As you mentioned before, the patchset is organized as "code refactoring,
IO/M32/M64, DMA, PE allocation/releaseing". This patch fits into the 
refactoring category so it goes to the beginning of the series :)


-- 
Alexey
