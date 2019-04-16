Return-Path: <SRS0=U6j8=SS=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 16/30] PCI: tegra: Program AFI_CACHE* registers only for
 Tegra20
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-17-mmaddireddy@nvidia.com> <20190415132031.GR29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <931047de-ead5-8bdf-cf65-e2d42ecd2b66@nvidia.com>
Date: Tue, 16 Apr 2019 16:17:46 +0530
MIME-Version: 1.0
In-Reply-To: <20190415132031.GR29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 6:50 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:41PM +0530, Manikanta Maddireddy wrote:
>> AFI_CACHE* registers are available only in Tegra20, program them only
>> for Tegra20.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 8e5fdc8ce3d6..cdaaf13a9fd7 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -887,6 +887,7 @@ static irqreturn_t tegra_pcie_isr(int irq, void *arg)
>>   */
>>  static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
>>  {
>> +	struct device_node *np = pcie->dev->of_node;
>>  	u32 fpci_bar, size, axi_address;
>>  
>>  	/* Bar 0: type 1 extended configuration space */
>> @@ -927,11 +928,13 @@ static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
>>  	afi_writel(pcie, 0, AFI_AXI_BAR5_SZ);
>>  	afi_writel(pcie, 0, AFI_FPCI_BAR5);
>>  
>> -	/* map all upstream transactions as uncached */
>> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
>> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
>> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
>> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
>> +	if (of_device_is_compatible(np, "nvidia,tegra20-pcie")) {
> At this point we've already matched on that compatible string, so we
> could probably get that information from the SoC structure. Why are
> these registers not available on later chips? How would we mark
> transactions as uncached on later generations of Tegra?
>
> Also, typically writing to non-existing registers on Tegra186 would
> cause an SError exception, but I haven't seen any of those with PCIe
> on Tegra186. So do these really not exist, or are they simply not used?
>
> Thierry

Do you want me to add new soc flag for AFI_CACHE registers?

As per the HW team feedback, upstream requests targeting DRAM would
be marked as cacheable when the address of the request are within the
regions defined by the cache_bar_sz/st registers.
All upstream DRAM requests are marked as non-cacheable from T30 to T210
as the field is not used by MSS. In Tegra186 cacheable requests are
supported by new register AFI_AXCACHE_0*. *
These register definitions are not present in Tegra186 TRM, but
register offsets are accessible, so these are not used.
However Tegra186 simulations traps this register access because
it is not defined in register spec.

Manikanta

>> +		/* map all upstream transactions as uncached */
>> +		afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
>> +		afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
>> +		afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
>> +		afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
>> +	}
>>  
>>  	/* MSI translations are setup only when needed */
>>  	afi_writel(pcie, 0, AFI_MSI_FPCI_BAR_ST);
>> -- 
>> 2.17.1
>>
