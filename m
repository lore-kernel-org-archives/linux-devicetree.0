Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 10/30] PCI: tegra: Enable PCIe xclk clock clamping
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-11-mmaddireddy@nvidia.com> <20190415113703.GK29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <3c8a87b2-b9cb-791c-788c-33dfa0db9a97@nvidia.com>
Date: Mon, 15 Apr 2019 20:28:02 +0530
MIME-Version: 1.0
In-Reply-To: <20190415113703.GK29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 5:07 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:35PM +0530, Manikanta Maddireddy wrote:
>> Enable xclk clock clamping when entering L1. Clamp threshold will
>> determine the time spent waiting for clock module to turn on xclk after
>> signalling it. Default threshold value in Tegra124 and 210 is not enough
> Perhaps spell out Tegra210.
>
>> to turn ON xlck clock. Increase the clamp threshold to meet the clock
> s/ON/on/, s/xlck/xclk/
>
>> module timing in Tegra124 and 210, default threshold value is sufficient
> Spell out Tegra210. Also, maybe make the part after the , a separate
> sentence? And maybe also mention Tegra20 and Tegra30.
>
> Thierry
>
>> in Tegra186.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 28 ++++++++++++++++++++++++++--
>>  1 file changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index e40df52e46a7..f785ecae2f6b 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -219,8 +219,14 @@
>>  #define  RP_VEND_CTL2_PCA_ENABLE (1 << 7)
>>  
>>  #define RP_PRIV_MISC	0x00000fe0
>> -#define  RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT (0xe << 0)
>> -#define  RP_PRIV_MISC_PRSNT_MAP_EP_ABSNT (0xf << 0)
>> +#define  RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT		(0xe << 0)
>> +#define  RP_PRIV_MISC_PRSNT_MAP_EP_ABSNT		(0xf << 0)
>> +#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD_MASK	(0x7f << 16)
>> +#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD		(0xf << 16)
>> +#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_ENABLE		(1 << 23)
>> +#define  RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD_MASK	(0x7f << 24)
>> +#define  RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD		(0xf << 24)
>> +#define  RP_PRIV_MISC_TMS_CLK_CLAMP_ENABLE		(1 << 31)
>>  
>>  #define RP_LINK_CONTROL_STATUS			0x00000090
>>  #define  RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE	0x20000000
>> @@ -297,6 +303,7 @@ struct tegra_pcie_soc {
>>  	bool has_gen2;
>>  	bool force_pca_enable;
>>  	bool program_uphy;
>> +	bool update_clamp_threshold;
>>  	struct {
>>  		struct {
>>  			u32 rp_ectl_2_r1;
>> @@ -528,6 +535,7 @@ static void tegra_pcie_port_reset(struct tegra_pcie_port *port)
>>  
>>  static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
>>  {
>> +	const struct tegra_pcie_soc *soc = port->pcie->soc;
>>  	u32 value;
>>  
>>  	/* Enable AER capability */
>> @@ -548,6 +556,17 @@ static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
>>  	value = readl(port->base + RP_VEND_XP_BIST);
>>  	value |= RP_VEND_XP_BIST_GOTO_L1_L2_AFTER_DLLP_DONE;
>>  	writel(value, port->base + RP_VEND_XP_BIST);
>> +
>> +	value = readl(port->base + RP_PRIV_MISC);
>> +	value |= RP_PRIV_MISC_CTLR_CLK_CLAMP_ENABLE;
>> +	value |= RP_PRIV_MISC_TMS_CLK_CLAMP_ENABLE;
>> +	if (soc->update_clamp_threshold) {
> Blank line between the above two.
>
>> +		value &= ~(RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD_MASK |
>> +				RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD_MASK);
>> +		value |= RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD |
>> +			RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD;
>> +	}
>> +	writel(value, port->base + RP_PRIV_MISC);
> Ditto.
>
> Thierry
I will take care of all the comments in V2

Manikanta
>>  }
>>  
>>  static void tegra_pcie_program_ectl_settings(struct tegra_pcie_port *port)
>> @@ -2337,6 +2356,7 @@ static const struct tegra_pcie_soc tegra20_pcie = {
>>  	.has_gen2 = false,
>>  	.force_pca_enable = false,
>>  	.program_uphy = true,
>> +	.update_clamp_threshold = false,
>>  	.ectl.enable = false,
>>  };
>>  
>> @@ -2361,6 +2381,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
>>  	.has_gen2 = false,
>>  	.force_pca_enable = false,
>>  	.program_uphy = true,
>> +	.update_clamp_threshold = false,
>>  	.ectl.enable = false,
>>  };
>>  
>> @@ -2378,6 +2399,7 @@ static const struct tegra_pcie_soc tegra124_pcie = {
>>  	.has_gen2 = true,
>>  	.force_pca_enable = false,
>>  	.program_uphy = true,
>> +	.update_clamp_threshold = true,
>>  	.ectl.enable = false,
>>  };
>>  
>> @@ -2395,6 +2417,7 @@ static const struct tegra_pcie_soc tegra210_pcie = {
>>  	.has_gen2 = true,
>>  	.force_pca_enable = true,
>>  	.program_uphy = true,
>> +	.update_clamp_threshold = true,
>>  	.ectl.regs.rp_ectl_2_r1 = 0x0000000f,
>>  	.ectl.regs.rp_ectl_4_r1 = 0x00000067,
>>  	.ectl.regs.rp_ectl_5_r1 = 0x55010000,
>> @@ -2427,6 +2450,7 @@ static const struct tegra_pcie_soc tegra186_pcie = {
>>  	.has_gen2 = true,
>>  	.force_pca_enable = false,
>>  	.program_uphy = false,
>> +	.update_clamp_threshold = false,
>>  	.ectl.enable = false,
>>  };
>>  
>> -- 
>> 2.17.1
>>
