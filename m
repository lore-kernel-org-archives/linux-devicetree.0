From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v5 3/7] PCI/VPD: Prevent VPD access for Amazon's
 Annapurna Labs Root Port
Date: Thu, 5 Sep 2019 15:22:58 +0100
Message-ID: <20190905142258.GB9720@e119886-lin.cambridge.arm.com>
References: <20190905140018.5139-1-jonnyc@amazon.com>
 <20190905140018.5139-4-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190905140018.5139-4-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com, dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 05:00:17PM +0300, Jonathan Chocron wrote:
> The Amazon Annapurna Labs PCIe Root Port exposes the VPD capability,
> but there is no actual support for it.
> 
> Trying to access the VPD (for example, as part of lspci -vv or when
> reading the vpd sysfs file), results in the following warning print:
> 
> pcieport 0001:00:00.0: VPD access failed.  This is likely a firmware bug on this device.  Contact the card vendor for a firmware update
> 
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> Reviewed-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> ---
>  drivers/pci/vpd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/vpd.c b/drivers/pci/vpd.c
> index 4963c2e2bd4c..7915d10f9aa1 100644
> --- a/drivers/pci/vpd.c
> +++ b/drivers/pci/vpd.c
> @@ -571,6 +571,12 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LSI_LOGIC, 0x005f, quirk_blacklist_vpd);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATTANSIC, PCI_ANY_ID,
>  		quirk_blacklist_vpd);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_QLOGIC, 0x2261, quirk_blacklist_vpd);
> +/*
> + * The Amazon Annapurna Labs 0x0031 device id is reused for other non Root Port
> + * device types, so the quirk is registered for the PCI_CLASS_BRIDGE_PCI class.
> + */
> +DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031,
> +			      PCI_CLASS_BRIDGE_PCI, 8, quirk_blacklist_vpd);
>  
>  /*
>   * For Broadcom 5706, 5708, 5709 rev. A nics, any read beyond the
> -- 
> 2.17.1
> 
