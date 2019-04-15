Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 03/30] PCI: tegra: Move REFCLK pad settings out of
 phy_power_on()
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-4-mmaddireddy@nvidia.com> <20190415110628.GD29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <7eb69509-5a38-2fe4-5aef-9a38ad0accac@nvidia.com>
Date: Mon, 15 Apr 2019 19:50:56 +0530
MIME-Version: 1.0
In-Reply-To: <20190415110628.GD29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 15-Apr-19 4:36 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:28PM +0530, Manikanta Maddireddy wrote:
>> In Tegra186 PHY programming is done by BPMP-FW, so PHY calls are skipped
>> in driver. REFCLK pad settings are independent of PHY and should be
>> programmed by driver. So move REFCLK pad settings out of phy_power_on().
>> These pad settings tune REFCLK peak to peak amplitude.
>>
>> Fixes: cf5d31801278 ("PCI: tegra: Program PADS_REFCLK_CFG* always, not
>> just on legacy SoCs")
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 20 +++++++++++++-------
>>  1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 0bf270bcea34..a61ce9d475b4 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -852,7 +852,6 @@ static int tegra_pcie_port_phy_power_off(struct tegra_pcie_port *port)
>>  static int tegra_pcie_phy_power_on(struct tegra_pcie *pcie)
>>  {
>>  	struct device *dev = pcie->dev;
>> -	const struct tegra_pcie_soc *soc = pcie->soc;
>>  	struct tegra_pcie_port *port;
>>  	int err;
>>  
>> @@ -878,12 +877,6 @@ static int tegra_pcie_phy_power_on(struct tegra_pcie *pcie)
>>  		}
>>  	}
>>  
>> -	/* Configure the reference clock driver */
>> -	pads_writel(pcie, soc->pads_refclk_cfg0, PADS_REFCLK_CFG0);
>> -
>> -	if (soc->num_ports > 2)
>> -		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
>> -
>>  	return 0;
>>  }
>>  
>> @@ -2092,11 +2085,24 @@ static bool tegra_pcie_port_check_link(struct tegra_pcie_port *port)
>>  	return false;
>>  }
>>  
>> +static void tegra_pcie_apply_pad_settings(struct tegra_pcie *pcie)
>> +{
>> +	const struct tegra_pcie_soc *soc = pcie->soc;
>> +
>> +	/* Configure the reference clock driver */
>> +	pads_writel(pcie, soc->pads_refclk_cfg0, PADS_REFCLK_CFG0);
>> +
>> +	if (soc->num_ports > 2)
>> +		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
>> +}
>> +
>>  static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>>  {
>>  	struct device *dev = pcie->dev;
>>  	struct tegra_pcie_port *port, *tmp;
>>  
>> +	tegra_pcie_apply_pad_settings(pcie);
>> +
>>  	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
>>  		dev_info(dev, "probing port %u, using %u lanes\n",
>>  			 port->index, port->lanes);
> This also seems to move the programming of these registers to a
> different point in time. Was that intentional? If so, please mention it
> in the commit message and describe why that's necessary.
>
> If that was not intentional, it seems like the right place to call this
> would be right after the call to tegra_pcie_enable_controller() in
> tegra_pcie_pm_resume().
>
> Thierry
PCIe pad registers access needs PEX clk and reset enabled, so I moved to
tegra_pcie_enable_ports(). But looking at this carefully I see a pattern
that only per port PCIe register programming is done, however PCIe
pad register spec is for all controller. So the right place would be
tegra_pcie_pm_resume() after enable PEX clk and reset. I will update
in V2
