From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 2/2] pci, pcie-thunder-pem: Add PCIe host driver for ThunderX
 processors.
Date: Tue, 22 Dec 2015 15:28:48 -0800
Message-ID: <5679DCB0.4040700@caviumnetworks.com>
References: <1450749222-15966-1-git-send-email-ddaney.cavm@gmail.com> <1450749222-15966-3-git-send-email-ddaney.cavm@gmail.com> <20151222100352.GC32623@arm.com> <5679A1E9.3050902@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <5679A1E9.3050902@caviumnetworks.com>
Sender: linux-pci-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On 12/22/2015 11:18 AM, David Daney wrote:
> On 12/22/2015 02:03 AM, Will Deacon wrote:
>> On Mon, Dec 21, 2015 at 05:53:42PM -0800, David Daney wrote:
>>> From: David Daney <david.daney@cavium.com>
[...]
>>> diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
>>> index f131ba9..16ed9c3 100644
>>> --- a/drivers/pci/host/Kconfig
>>> +++ b/drivers/pci/host/Kconfig
>>> @@ -172,4 +172,10 @@ config PCI_HISI
>>>       help
>>>         Say Y here if you want PCIe controller support on HiSilicon
>>> HIP05 SoC
>>>
>>> +config PCIE_HOST_THUNDER_PEM
>>> +    bool "Cavium Thunder PCIe controller to off-chip devices"
>>> +    depends on PCI_HOST_GENERIC && ARM64
>>
>> || COMPILE_TEST ?
>>
>> (or does the use of writeq get you? If so, maybe COMPILE_TEST && 64BIT)
>
> Yes, we must use writeq in the driver, I will change it to
> ||(COMPILE_TEST && 64BIT)
>

Actually, it turns out that this is not easily done.

For x86, it appears difficult to include asm-generic/pci-bridge.h which 
includes the needed definition of PCI_PROBE_ONLY.  So I think it is not 
worth supporting COMPILE_TEST

David Daney
