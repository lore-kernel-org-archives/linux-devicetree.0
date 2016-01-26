From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/3] irqdomain: Allow domain lookup with
 DOMAIN_BUS_WIRED token
Date: Tue, 26 Jan 2016 16:33:14 +0100
Message-ID: <20160126163314.3a3e5b67@free-electrons.com>
References: <1453816347-32720-1-git-send-email-marc.zyngier@arm.com>
	<1453816347-32720-2-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453816347-32720-2-git-send-email-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Marc Zyngier,

On Tue, 26 Jan 2016 13:52:25 +0000, Marc Zyngier wrote:
> Let's take the (outlandish) example of an interrupt controller
> capable of handling both wired interrupts and PCI MSIs.
> 
> With the current code, the PCI MSI domain is going to be tagged
> with DOMAIN_BUS_PCI_MSI, and the wired domain with DOMAIN_BUS_ANY.
> 
> Things get hairy when we start looking up the domain for a wired
> interrupt (typically when creating it based on some firmware
> information - DT or ACPI).
> 
> In irq_create_fwspec_mapping(), we perform the lookup using
> DOMAIN_BUS_ANY, which is actually used as a wildcard. This gives
> us one chance out of two to end up with the wrong domain, and
> we try to configure a wired interrupt with the MSI domain.
> Everything grinds to a halt pretty quickly.
> 
> What we really need to do is to start looking for a domain that
> would uniquely identify a wired interrupt domain, and only use
> DOMAIN_BUS_ANY as a fallback.
> 
> In order to solve this, let's introduce a new DOMAIN_BUS_WIRED
> token, which is going to be used exactly as described above.
> Of course, this depends on the irqchip to setup the domain
> bus_token, and nobody had to implement this so far.
> 
> Only so far.
> 
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 - On Marvell Armada XP, which uses the Marvell MPIC for both wired
   interrupts and MSI interrupts

 - On Marvell Armada 38x, which uses the ARM GIC for most wired
   interrupts and the Marvell MPIC for MSI interrupts

With an Intel e1000e PCIe NIC, with both PCI_MSI=y and PCI_MSI disabled
cases have been tested. When MSI support is disabled it gracefully
falls back to a wired interrupt, as expected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
