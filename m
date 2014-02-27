From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH v2 1/4] pci: OF: Fix the conversion of IO ranges into IO
 resources.
Date: Thu, 27 Feb 2014 11:19:51 -0700
Message-ID: <20140227181951.GC24656@obsidianresearch.com>
References: <1393506402-11474-1-git-send-email-Liviu.Dudau@arm.com>
 <1393506402-11474-2-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393506402-11474-2-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 27, 2014 at 01:06:39PM +0000, Liviu Dudau wrote:
> +	if (res->flags & IORESOURCE_IO) {
> +		unsigned long port;
> +		port = pci_address_to_pio(range->pci_addr);

This looks very suspicious, pci_addr is not unique across all domains,
so there is no way to convert from a pci_addr to the virtual IO
address without knowing the domain number as well.

I would like to see it be:
  port = pci_address_to_pio(range->cpu_addr);

cpu_addr is unique across all domains.

Looking at the microblaze and PPC versions I think the above version
is actually correct (assuming io_base_phys is the CPU address of the
IO window)

Jason
