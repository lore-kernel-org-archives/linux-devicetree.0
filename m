Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 05/30] PCI: tegra: Advertise PCIe Advanced Error Reporting
 (AER) capability
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-6-mmaddireddy@nvidia.com> <20190415112321.GF29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <be5b0ef9-ccb9-c850-12f8-96bb5eb9ed45@nvidia.com>
Date: Mon, 15 Apr 2019 20:19:27 +0530
MIME-Version: 1.0
In-Reply-To: <20190415112321.GF29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 4:53 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:30PM +0530, Manikanta Maddireddy wrote:
>> Default root port setting hides AER capability. This patch enables the
>> advertisement of AER capability by root port.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 6ccda82735f8..9ff1a0e2797f 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -180,6 +180,9 @@
>>  #define RP_VEND_XP	0x00000f00
>>  #define  RP_VEND_XP_DL_UP	(1 << 30)
>>  
>> +#define RP_VEND_CTL1	0x00000f48
>> +#define  RP_VEND_CTL1_ERPT	(1 << 13)
>> +
>>  #define RP_VEND_CTL2 0x00000fa8
>>  #define  RP_VEND_CTL2_PCA_ENABLE (1 << 7)
>>  
>> @@ -478,6 +481,16 @@ static void tegra_pcie_port_reset(struct tegra_pcie_port *port)
>>  	afi_writel(port->pcie, value, ctrl);
>>  }
>>  
>> +static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
> Why not call this tegra_pcie_enable_aer()? Are you planning on adding a
> lot more overrides to this function? If there aren't too many, you may
> want to just have one small function per feature and drop the comment in
> the function body.
>
> If there's going to be a lot, the above seems okay.
>
> Thierry
Yes, I am going to add more overrides.
>> +{
>> +	u32 value;
>> +
>> +	/* Enable AER capability */
>> +	value = readl(port->base + RP_VEND_CTL1);
>> +	value |= RP_VEND_CTL1_ERPT;
>> +	writel(value, port->base + RP_VEND_CTL1);
>> +}
>> +
>>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>>  {
>>  	unsigned long ctrl = tegra_pcie_port_get_pex_ctrl(port);
>> @@ -502,6 +515,8 @@ static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>>  		value |= RP_VEND_CTL2_PCA_ENABLE;
>>  		writel(value, port->base + RP_VEND_CTL2);
>>  	}
>> +
>> +	tegra_pcie_enable_rp_features(port);
>>  }
>>  
>>  static void tegra_pcie_port_disable(struct tegra_pcie_port *port)
>> -- 
>> 2.17.1
>>
