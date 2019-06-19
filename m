Return-Path: <SRS0=8+7u=US=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH V6 20/27] PCI: tegra: Disable MSI for Tegra PCIe root port
References: <20190618180206.4908-1-mmaddireddy@nvidia.com>
 <20190618180206.4908-21-mmaddireddy@nvidia.com>
 <20190618194830.GA110859@google.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <e06f85eb-be0c-c2a5-84a9-51aa9b8372c3@nvidia.com>
Date: Wed, 19 Jun 2019 09:25:54 +0530
MIME-Version: 1.0
In-Reply-To: <20190618194830.GA110859@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 19-Jun-19 1:18 AM, Bjorn Helgaas wrote:
> On Tue, Jun 18, 2019 at 11:31:59PM +0530, Manikanta Maddireddy wrote:
>> Tegra PCIe generates PME and AER events over legacy interrupt line. Disable
>> MSI to avoid service drivers registering interrupt routine over MSI IRQ
>> line.
>>
>> PME and AER interrupts registered to MSI without this change,
>> cat /proc/interrupts | grep -i pci
>> 36: 21 0 0 0 0 0 GICv2 104 Level       PCIE
>> 37: 35 0 0 0 0 0 GICv2 105 Level       Tegra PCIe MSI
>> 76: 0  0 0 0 0 0 Tegra PCIe MSI 0 Edge PCIe PME, aerdrv, PCIe BW notif
>>
>> PME and AER interrupts registered to legacy IRQ with this change,
>> cat /proc/interrupts | grep -i pci
>> 36: 33 0 0 0 0 0 GICv2 104 Level      PCIE, PCIe PME, aerdrv, PCIe BW notif
>> 37: 52 0 0 0 0 0 GICv2 105 Level      Tegra PCIe MSI
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>> V6: Replaced pcie_pme_disable_msi() with no_msi quirk
>>
>> V5: No change
>>
>> V4: No change
>>
>> V3: Corrected typo in commit log
>>
>> V2: No change
>>
>>  drivers/pci/quirks.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>> index a59ad09ce911..20dcad421991 100644
>> --- a/drivers/pci/quirks.c
>> +++ b/drivers/pci/quirks.c
>> @@ -2576,6 +2576,45 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA,
>>  			PCI_DEVICE_ID_NVIDIA_NVENET_15,
>>  			nvenet_msi_disable);
>>  
>> +/*
>> + * Tegra PCIe generates PME and AER events over legacy interrupt line.
>> + * So disable msi for Tegra PCIe root ports.
> s/msi/MSI/
>
> What's going on here?  Vidya posted a very similar patch [1] (although

This series is focused on Tegra20, Tegra30, Tegra124, Tegra210 and Tegra186,
whereas Vidya's series is focused only on Tegra194. So I didn't include
Tegra194 device IDs.

> his included nice spec citations, which you omitted), but his added
> quirks for 0x1ad0, 0x1ad1, and 0x1ad2.  You didn't include any of
> those here.
>
> Maybe Lorenzo will sort this all out, but it would make things easier
> if you and Vidya got together and integrated your patches yourselves
> so Lorenzo didn't have to worry about it.
>
> [1] https://lore.kernel.org/lkml/20190612095339.20118-3-vidyas@nvidia.com

I talked with Vidya, he will take this changes in his series if he needs
to publish another version, or else he will publish a new patch to add
quirk for legacy Tegra SOCs.

Lorenzo,
If this series is ready for integration, please drop this patch.

Manikanta

>
>> + */
>> +static void pci_quirk_nvidia_tegra_disable_rp_msi(struct pci_dev *dev)
>> +{
>> +	dev->no_msi = 1;
>> +}
>> +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0bf0,
>> +			      PCI_CLASS_BRIDGE_PCI, 8,
>> +			      pci_quirk_nvidia_tegra_disable_rp_msi);
>> +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0bf1,
>> +			      PCI_CLASS_BRIDGE_PCI, 8,
>> +			      pci_quirk_nvidia_tegra_disable_rp_msi);
>> +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1c,
>> +			      PCI_CLASS_BRIDGE_PCI, 8,
>> +			      pci_quirk_nvidia_tegra_disable_rp_msi);
>> +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1d,
>> +			      PCI_CLASS_BRIDGE_PCI, 8,
>> +			      pci_quirk_nvidia_tegra_disable_rp_msi);
>> +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e12,
>> +			      PCI_CLASS_BRIDGE_PCI, 8,
>> +			      pci_quirk_nvidia_tegra_disable_rp_msi);
>> +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e13,
>> +			      PCI_CLASS_BRIDGE_PCI, 8,
>> +			      pci_quirk_nvidia_tegra_disable_rp_msi);
>> +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0fae,
>> +			      PCI_CLASS_BRIDGE_PCI, 8,
>> +			      pci_quirk_nvidia_tegra_disable_rp_msi);
>> +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0faf,
>> +			      PCI_CLASS_BRIDGE_PCI, 8,
>> +			      pci_quirk_nvidia_tegra_disable_rp_msi);
>> +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x10e5,
>> +			      PCI_CLASS_BRIDGE_PCI, 8,
>> +			      pci_quirk_nvidia_tegra_disable_rp_msi);
>> +DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x10e6,
>> +			      PCI_CLASS_BRIDGE_PCI, 8,
>> +			      pci_quirk_nvidia_tegra_disable_rp_msi);
>> +
>>  /*
>>   * Some versions of the MCP55 bridge from Nvidia have a legacy IRQ routing
>>   * config register.  This register controls the routing of legacy
>> -- 
>> 2.17.1
>>
