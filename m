Return-Path: <SRS0=N2Ii=TR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH V4 00/28] Enable Tegra PCIe root port features
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
 <20190516131257.GA101793@google.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <1d6b0b74-5b66-c936-a374-3a19dc7637e5@nvidia.com>
Date: Fri, 17 May 2019 14:08:48 +0530
MIME-Version: 1.0
In-Reply-To: <20190516131257.GA101793@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 16-May-19 6:42 PM, Bjorn Helgaas wrote:
> On Thu, May 16, 2019 at 11:22:39AM +0530, Manikanta Maddireddy wrote:
>> This series of patches adds,
>> - Tegra root port features like Gen2, AER, etc
>> - Power and perf optimizations
>> - Fixes like "power up sequence", "dev_err prints", etc
> Please:
>
>   1) Put the brakes on.  You posted v3 of these 30 patches on May 13
>      and v4 on May 16.  There's no hurry; the merge window is still
>      open and nothing will be added to -next until at least next week.
>      If you space these out a little, people will have time to digest
>      them.
>
>   2) Mention in the cover letter what changed between v3 and v4 so
>      people know where to spend their effort.

Reason for sending v4 quickly is because one of the patches deviated from
Rob & Thierry's comments in v2. To address this I published v4 and marked
v3 series as superseded. 

I will follow these two points from next time, meanwhile updating the
changes from v3 to v4 below,

Changes from v3 to v4:
 - Patch [V3,27/29] is dropped
 - Patch [V3,28/29]: devm_gpiod_get_from_of_node() is directly used in
   pci-tegra driver instead of of_get_pci* wrapper function defined in
   Patch [V3,27/29].

Manikanta 

>> This series of patches are tested on Tegra186 based Jetson-TX2, Tegra210
>> based Jetson-TX1, T124 based Jetson-TK1 platforms, Tegra20 and Tegra30
>> platforms.
>>
>> Manikanta Maddireddy (28):
>>   soc/tegra: pmc: Export tegra_powergate_power_on()
>>   PCI: tegra: Handle failure cases in tegra_pcie_power_on()
>>   PCI: tegra: Rearrange Tegra PCIe driver functions
>>   PCI: tegra: Mask AFI_INTR in runtime suspend
>>   PCI: tegra: Fix PCIe host power up sequence
>>   PCI: tegra: Add PCIe Gen2 link speed support
>>   PCI: tegra: Advertise PCIe Advanced Error Reporting (AER) capability
>>   PCI: tegra: Program UPHY electrical settings for Tegra210
>>   PCI: tegra: Enable opportunistic UpdateFC and ACK
>>   PCI: tegra: Disable AFI dynamic clock gating
>>   PCI: tegra: Process pending DLL transactions before entering L1 or L2
>>   PCI: tegra: Enable PCIe xclk clock clamping
>>   PCI: tegra: Increase the deskew retry time
>>   PCI: tegra: Add SW fixup for RAW violations
>>   PCI: tegra: Update flow control timer frequency in Tegra210
>>   PCI: tegra: Set target speed as Gen1 before starting LTSSM
>>   PCI: tegra: Fix PLLE power down issue due to CLKREQ# signal
>>   PCI: tegra: Program AFI_CACHE* registers only for Tegra20
>>   PCI: tegra: Change PRSNT_SENSE IRQ log to debug
>>   PCI: tegra: Use legacy IRQ for port service drivers
>>   PCI: tegra: Add AFI_PEX2_CTRL reg offset as part of soc struct
>>   PCI: tegra: Access endpoint config only if PCIe link is up
>>   dt-bindings: pci: tegra: Document PCIe DPD pinctrl optional prop
>>   arm64: tegra: Add PEX DPD states as pinctrl properties
>>   PCI: tegra: Put PEX CLK & BIAS pads in DPD mode
>>   PCI: Add DT binding for "reset-gpios" property
>>   PCI: tegra: Add support for GPIO based PERST#
>>   PCI: tegra: Change link retry log level to debug
>>
>>  .../bindings/pci/nvidia,tegra20-pcie.txt      |   8 +
>>  Documentation/devicetree/bindings/pci/pci.txt |   3 +
>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  19 +
>>  drivers/pci/controller/pci-tegra.c            | 615 +++++++++++++++---
>>  drivers/soc/tegra/pmc.c                       |   1 +
>>  5 files changed, 566 insertions(+), 80 deletions(-)
>>
>> -- 
>> 2.17.1
>>
