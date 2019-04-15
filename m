Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 11/30] PCI: tegra: Increase the deskew retry time
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-12-mmaddireddy@nvidia.com> <20190415113918.GL29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <e7a8746e-484a-03b1-bec1-ee026d0651f0@nvidia.com>
Date: Mon, 15 Apr 2019 20:28:54 +0530
MIME-Version: 1.0
In-Reply-To: <20190415113918.GL29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 5:09 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:36PM +0530, Manikanta Maddireddy wrote:
>> Some times link speed change from Gen2 to Gen1 fails due to instability
> "Sometimes"
>
>> in deskew logic on lane-0 in Tegra210. Increase the deskew retry time
>> to resolve this issue.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index f785ecae2f6b..9e61da68cfae 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -209,6 +209,10 @@
>>  #define  RP_VEND_XP_OPPORTUNISTIC_ACK		(1 << 27)
>>  #define  RP_VEND_XP_OPPORTUNISTIC_UPDATEFC	(1 << 28)
>>  
>> +#define RP_VEND_CTL0	0x00000f44
>> +#define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH_MASK	(0xf << 12)
>> +#define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH	(0x9 << 12)
>> +
>>  #define RP_VEND_CTL1	0x00000f48
>>  #define  RP_VEND_CTL1_ERPT	(1 << 13)
>>  
>> @@ -304,6 +308,7 @@ struct tegra_pcie_soc {
>>  	bool force_pca_enable;
>>  	bool program_uphy;
>>  	bool update_clamp_threshold;
>> +	bool program_deskew_time;
>>  	struct {
>>  		struct {
>>  			u32 rp_ectl_2_r1;
>> @@ -615,6 +620,23 @@ static void tegra_pcie_program_ectl_settings(struct tegra_pcie_port *port)
>>  	writel(val, port->base + RP_ECTL_6_R2);
>>  }
>>  
>> +static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
>> +{
>> +	const struct tegra_pcie_soc *soc = port->pcie->soc;
>> +	u32 value;
>> +
>> +	/*
>> +	 * Tune deskew retry time to take care of Gen2 -> Gen1
>> +	 * link speed change error in corner cases
>> +	 */
>> +	if (soc->program_deskew_time) {
>> +		value = readl(port->base + RP_VEND_CTL0);
>> +		value &= ~RP_VEND_CTL0_DSK_RST_PULSE_WIDTH_MASK;
>> +		value |= RP_VEND_CTL0_DSK_RST_PULSE_WIDTH;
>> +		writel(value, port->base + RP_VEND_CTL0);
>> +	}
>> +}
>> +
>>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>>  {
>>  	unsigned long ctrl = tegra_pcie_port_get_pex_ctrl(port);
>> @@ -643,6 +665,7 @@ static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>>  	tegra_pcie_enable_rp_features(port);
>>  	if (soc->ectl.enable)
>>  		tegra_pcie_program_ectl_settings(port);
>> +	tegra_pcie_apply_sw_fixup(port);
> Blank line between the above two for readability.
>
> Thierry
I will take care of all the comments in V2

Manikanta
>
>>  }
>>  
>>  static void tegra_pcie_port_disable(struct tegra_pcie_port *port)
>> @@ -2357,6 +2380,7 @@ static const struct tegra_pcie_soc tegra20_pcie = {
>>  	.force_pca_enable = false,
>>  	.program_uphy = true,
>>  	.update_clamp_threshold = false,
>> +	.program_deskew_time = false,
>>  	.ectl.enable = false,
>>  };
>>  
>> @@ -2382,6 +2406,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
>>  	.force_pca_enable = false,
>>  	.program_uphy = true,
>>  	.update_clamp_threshold = false,
>> +	.program_deskew_time = false,
>>  	.ectl.enable = false,
>>  };
>>  
>> @@ -2400,6 +2425,7 @@ static const struct tegra_pcie_soc tegra124_pcie = {
>>  	.force_pca_enable = false,
>>  	.program_uphy = true,
>>  	.update_clamp_threshold = true,
>> +	.program_deskew_time = false,
>>  	.ectl.enable = false,
>>  };
>>  
>> @@ -2418,6 +2444,7 @@ static const struct tegra_pcie_soc tegra210_pcie = {
>>  	.force_pca_enable = true,
>>  	.program_uphy = true,
>>  	.update_clamp_threshold = true,
>> +	.program_deskew_time = true,
>>  	.ectl.regs.rp_ectl_2_r1 = 0x0000000f,
>>  	.ectl.regs.rp_ectl_4_r1 = 0x00000067,
>>  	.ectl.regs.rp_ectl_5_r1 = 0x55010000,
>> @@ -2451,6 +2478,7 @@ static const struct tegra_pcie_soc tegra186_pcie = {
>>  	.force_pca_enable = false,
>>  	.program_uphy = false,
>>  	.update_clamp_threshold = false,
>> +	.program_deskew_time = false,
>>  	.ectl.enable = false,
>>  };
>>  
>> -- 
>> 2.17.1
>>
