Return-Path: <SRS0=Ieez=UT=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH V6 18/27] PCI: tegra: Program AFI_CACHE* registers only
 for Tegra20
References: <20190618180206.4908-1-mmaddireddy@nvidia.com>
 <20190618180206.4908-19-mmaddireddy@nvidia.com>
 <20190620162638.GA18771@e121166-lin.cambridge.arm.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <b90ebb2c-03b2-b7c0-7a70-02dfed00de3a@nvidia.com>
Date: Thu, 20 Jun 2019 22:05:30 +0530
MIME-Version: 1.0
In-Reply-To: <20190620162638.GA18771@e121166-lin.cambridge.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 20-Jun-19 9:56 PM, Lorenzo Pieralisi wrote:
> On Tue, Jun 18, 2019 at 11:31:57PM +0530, Manikanta Maddireddy wrote:
>> Cacheable upstream transactions are supported in Tegra20 and Tegra186 only.
>> AFI_CACHE* registers are available in Tegra20 to support cacheable upstream
>> transactions. In Tegra186, AFI_AXCACHE register is defined instead of
>> AFI_CACHE* to be in line with its MSS design. Therefore, program AFI_CACHE*
> What's an MSS ?
>
> Lorenzo

Memory subsystem.
Sorry for using acronym, will you able to update the commit log before applying
the patch?

Manikanta

>
>> registers only for Tegra20.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> ---
>> V6: No change
>>
>> V5: No change
>>
>> V4: No change
>>
>> V3: Initialized has_cache_bars variable for each soc data structure.
>>
>> V2: Used soc variable for comparision instead of compatible string.
>>
>>  drivers/pci/controller/pci-tegra.c | 18 +++++++++++++-----
>>  1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 3d9028cecc18..a746d963ca36 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -323,6 +323,7 @@ struct tegra_pcie_soc {
>>  	bool program_deskew_time;
>>  	bool raw_violation_fixup;
>>  	bool update_fc_timer;
>> +	bool has_cache_bars;
>>  	struct {
>>  		struct {
>>  			u32 rp_ectl_2_r1;
>> @@ -932,11 +933,13 @@ static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
>>  	afi_writel(pcie, 0, AFI_AXI_BAR5_SZ);
>>  	afi_writel(pcie, 0, AFI_FPCI_BAR5);
>>  
>> -	/* map all upstream transactions as uncached */
>> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
>> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
>> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
>> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
>> +	if (pcie->soc->has_cache_bars) {
>> +		/* map all upstream transactions as uncached */
>> +		afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
>> +		afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
>> +		afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
>> +		afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
>> +	}
>>  
>>  	/* MSI translations are setup only when needed */
>>  	afi_writel(pcie, 0, AFI_MSI_FPCI_BAR_ST);
>> @@ -2441,6 +2444,7 @@ static const struct tegra_pcie_soc tegra20_pcie = {
>>  	.program_deskew_time = false,
>>  	.raw_violation_fixup = false,
>>  	.update_fc_timer = false,
>> +	.has_cache_bars = true,
>>  	.ectl.enable = false,
>>  };
>>  
>> @@ -2469,6 +2473,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
>>  	.program_deskew_time = false,
>>  	.raw_violation_fixup = false,
>>  	.update_fc_timer = false,
>> +	.has_cache_bars = false,
>>  	.ectl.enable = false,
>>  };
>>  
>> @@ -2492,6 +2497,7 @@ static const struct tegra_pcie_soc tegra124_pcie = {
>>  	.program_deskew_time = false,
>>  	.raw_violation_fixup = true,
>>  	.update_fc_timer = false,
>> +	.has_cache_bars = false,
>>  	.ectl.enable = false,
>>  };
>>  
>> @@ -2515,6 +2521,7 @@ static const struct tegra_pcie_soc tegra210_pcie = {
>>  	.program_deskew_time = true,
>>  	.raw_violation_fixup = false,
>>  	.update_fc_timer = true,
>> +	.has_cache_bars = false,
>>  	.ectl = {
>>  		.regs = {
>>  			.rp_ectl_2_r1 = 0x0000000f,
>> @@ -2555,6 +2562,7 @@ static const struct tegra_pcie_soc tegra186_pcie = {
>>  	.program_deskew_time = false,
>>  	.raw_violation_fixup = false,
>>  	.update_fc_timer = false,
>> +	.has_cache_bars = false,
>>  	.ectl.enable = false,
>>  };
>>  
>> -- 
>> 2.17.1
>>
