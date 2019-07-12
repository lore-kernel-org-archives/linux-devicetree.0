From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 4/8] PCI: Add quirk to disable MSI support for Amazon's
 Annapurna Labs host bridge
Date: Fri, 12 Jul 2019 08:04:19 -0500
Message-ID: <20190712130419.GA46935@google.com>
References: <20190710164519.17883-1-jonnyc@amazon.com>
 <20190710164519.17883-5-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190710164519.17883-5-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>
Cc: lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com, dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 11, 2019 at 05:56:25PM +0300, Jonathan Chocron wrote:
> On some platforms, the host bridge exposes an MSI-X capability but
> doesn't actually support it.
> This causes a crash during initialization by the pcieport driver, since
> it tries to configure the MSI-X capability.

Nit: The formatting above is jarring to read because I can't tell
whether it's one paragraph or two.

Either rewrap it into a single paragraph or add a blank line to make
two paragraphs.  I noticed this elsewhere, too, in a comment, I think.

s/host bridge/Root Port/, if I understand correctly.

I don't understand the "on some platforms..." part.  Do you mean that
on *every* platform, this particular host bridge (identified by
[1c36:0031]) advertises an MSI-X capability that doesn't work?

Or are there some platforms that configure the bridge so it doesn't
advertise MSI-X at all, while other platforms configure it so it
*does* advertise MSI-X?

If there's a line or two of diagnostics from the crash you could
include here, that would help people who encounter the crash find
the solution.

> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> ---
>  drivers/pci/quirks.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 11850b030637..0fb70d755977 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2925,6 +2925,14 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATTANSIC, 0x10a1,
>  			quirk_msi_intx_disable_qca_bug);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATTANSIC, 0xe091,
>  			quirk_msi_intx_disable_qca_bug);
> +
> +static void quirk_al_msi_disable(struct pci_dev *dev)
> +{
> +	dev->no_msi = 1;
> +	dev_warn(&dev->dev, "Annapurna Labs pcie quirk - disabling MSI\n");

s/pcie/PCIe/ in English text, comments, printk strings, etc.

Actually, I think the whole "Annapurna Labs pcie quirk" part is
probably unnecessary, since we can identify the device via the
dev_printk() info.

Speaking of which, you can use "pci_warn(dev)" here to be consistent
with the rest of the file.

> +}
> +DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031,
> +			      PCI_CLASS_BRIDGE_PCI, 8, quirk_al_msi_disable);

Why do you use the class fixup here instead of the simpler
DECLARE_PCI_FIXUP_FINAL()?  Requiring the class to match
PCI_CLASS_BRIDGE_PCI suggests that there may be other [1c36:0031]
devices that are not Root Ports.  If that's the case, please mention
it so it's clear why we need DECLARE_PCI_FIXUP_CLASS_FINAL().  If not,
just use DECLARE_PCI_FIXUP_FINAL().

>  #endif /* CONFIG_PCI_MSI */
>  
>  /*
> -- 
> 2.17.1
> 
> 
