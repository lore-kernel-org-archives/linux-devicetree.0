From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v7 3/3] arm64: Add architecture support for PCI
Date: Fri, 14 Mar 2014 17:14:57 +0000
Message-ID: <20140314171457.GK18126@arm.com>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811258-1500-4-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394811258-1500-4-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 14, 2014 at 03:34:18PM +0000, Liviu Dudau wrote:
> --- /dev/null
> +++ b/arch/arm64/kernel/pci.c
[...]
> +int pci_register_io_range(phys_addr_t address, resource_size_t size)
[...]
> +unsigned long pci_address_to_pio(phys_addr_t address)
[...]
> +void pcibios_fixup_bus(struct pci_bus *bus)
[ actually most of this file ]

Maybe it was raised before already but can we have __weak generic
definitions of these functions? They don't seem to be arm64 specific in
any way.

-- 
Catalin
