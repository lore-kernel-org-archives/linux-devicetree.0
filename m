Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 02/30] PCI: tegra: Fix PCIe host power up sequence
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-3-mmaddireddy@nvidia.com> <20190415110136.GC29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <63ed1e7e-6630-bdba-3acd-c4372e83b259@nvidia.com>
Date: Mon, 15 Apr 2019 19:41:21 +0530
MIME-Version: 1.0
In-Reply-To: <20190415110136.GC29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 15-Apr-19 4:31 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:27PM +0530, Manikanta Maddireddy wrote:
>> PCIe host power up sequence involves programming AFI(AXI to FPCI bridge)
>> registers first and then PCIe registers. Otherwise AFI register settings
>> may not latch to PCIe IP.
>>
>> PCIe root port starts LTSSM as soon as PCIe xrst is deasserted.
>> So deassert PCIe xrst after programming PCIe registers.
>>
>> Modify PCIe power up sequence as follows,
>>   - Power ungate PCIe partition
>>   - Enable AFI clock
>>   - Deassert AFI reset
>>   - Program AFI registers
>>   - Enable PCIe clock
>>   - Deassert PCIe reset
>>   - Program PCIe registers
>>   - Deassert PCIe xrst to start LTSSM
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 73 ++++++++++++++++++------------
>>  1 file changed, 43 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index f4f53d092e00..0bf270bcea34 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -966,9 +966,6 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
>>  		}
>>  	}
>>  
>> -	/* take the PCIe interface module out of reset */
>> -	reset_control_deassert(pcie->pcie_xrst);
>> -
>>  	/* finally enable PCIe */
>>  	value = afi_readl(pcie, AFI_CONFIGURATION);
>>  	value |= AFI_CONFIGURATION_EN_FPCI;
>> @@ -997,8 +994,6 @@ static void tegra_pcie_disable_controller(struct tegra_pcie *pcie)
>>  {
>>  	int err;
>>  
>> -	reset_control_assert(pcie->pcie_xrst);
>> -
>>  	if (pcie->soc->program_uphy) {
>>  		err = tegra_pcie_phy_power_off(pcie);
>>  		if (err < 0)
>> @@ -1014,13 +1009,11 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
>>  	int err;
>>  
>>  	reset_control_assert(pcie->afi_rst);
>> -	reset_control_assert(pcie->pex_rst);
>>  
>>  	clk_disable_unprepare(pcie->pll_e);
>>  	if (soc->has_cml_clk)
>>  		clk_disable_unprepare(pcie->cml_clk);
>>  	clk_disable_unprepare(pcie->afi_clk);
>> -	clk_disable_unprepare(pcie->pex_clk);
>>  
>>  	if (!dev->pm_domain)
>>  		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
>> @@ -1036,58 +1029,59 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
>>  	const struct tegra_pcie_soc *soc = pcie->soc;
>>  	int err;
>>  
>> -	reset_control_assert(pcie->pcie_xrst);
>> -	reset_control_assert(pcie->afi_rst);
>> -	reset_control_assert(pcie->pex_rst);
>> -
>> -	if (!dev->pm_domain)
>> -		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
>> -
> This code was in place to ensure that PCIe was in a known good state
> before following the power up sequence below. You mentioned elsewhere
> that there's a regression on Cardhu after applying this series, so
> perhaps Cardhu relies on the above hunk?
No, Tegra30 and Tegra20 has legacy PHY which are dependent on PEX clk and rst.
PHY power on is done in tegra_pcie_enable_controller(), but in this patch I am
enabling PEX clk and rst after tegra_pcie_enable_controller(). This caused
regression on Cardhu.
I realized that sanity test is failing on Cardhu after publishing this series, I will
fix the issue in V2.
I believe you are talking about the bootloader(uboot) which can enable
PCIe partition and reset. To bring the PCIe into good state then we
have to take care of clocks as well. AFAIK clock_disable() is not added
because it maintains the refcount and any mismatch in the count
will thrown warning. I downstream kernel I see pmc driver itself taking
care of initial state and there after maintaining the state with refcount.
Since bootloader may or may not enable PCIe, Can we get the state fixed
in pmc driver instead of fixing it in PCIe driver?

>
>>  	/* enable regulators */
>>  	err = regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
>>  	if (err < 0)
>>  		dev_err(dev, "failed to enable regulators: %d\n", err);
>>  
>> -	if (dev->pm_domain) {
>> -		err = clk_prepare_enable(pcie->pex_clk);
>> +	if (!dev->pm_domain) {
>> +		err = tegra_powergate_power_on(TEGRA_POWERGATE_PCIE);
>>  		if (err) {
>> -			dev_err(dev, "failed to enable PEX clock: %d\n", err);
>> -			return err;
>> +			dev_err(dev, "power ungate failed: %d\n", err);
>> +			goto regulator_disable;
>>  		}
>> -		reset_control_deassert(pcie->pex_rst);
>> -	} else {
>> -		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_PCIE,
>> -							pcie->pex_clk,
>> -							pcie->pex_rst);
>> +		err = tegra_powergate_remove_clamping(TEGRA_POWERGATE_PCIE);
>>  		if (err) {
>> -			dev_err(dev, "powerup sequence failed: %d\n", err);
>> -			return err;
>> +			dev_err(dev, "remove clamp failed: %d\n", err);
>> +			goto powergate;
>>  		}
>>  	}
>>  
>> -	reset_control_deassert(pcie->afi_rst);
>> -
>>  	err = clk_prepare_enable(pcie->afi_clk);
>>  	if (err < 0) {
>>  		dev_err(dev, "failed to enable AFI clock: %d\n", err);
>> -		return err;
>> +		goto powergate;
>>  	}
>>  
>>  	if (soc->has_cml_clk) {
>>  		err = clk_prepare_enable(pcie->cml_clk);
>>  		if (err < 0) {
>>  			dev_err(dev, "failed to enable CML clock: %d\n", err);
>> -			return err;
>> +			goto afi_clk_disable;
>>  		}
>>  	}
>>  
>>  	err = clk_prepare_enable(pcie->pll_e);
>>  	if (err < 0) {
>>  		dev_err(dev, "failed to enable PLLE clock: %d\n", err);
>> -		return err;
>> +		goto cml_clk_disable;
>>  	}
>>  
>> +	reset_control_deassert(pcie->afi_rst);
>> +
>>  	return 0;
>> +
>> +cml_clk_disable:
>> +	if (soc->has_cml_clk)
>> +		clk_disable_unprepare(pcie->cml_clk);
>> +afi_clk_disable:
>> +	clk_disable_unprepare(pcie->afi_clk);
>> +powergate:
>> +	if (!dev->pm_domain)
>> +		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
>> +regulator_disable:
>> +	regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
>> +	return err;
>>  }
>>  
>>  static int tegra_pcie_clocks_get(struct tegra_pcie *pcie)
>> @@ -2108,7 +2102,12 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>>  			 port->index, port->lanes);
>>  
>>  		tegra_pcie_port_enable(port);
>> +	}
>> +
>> +	/* Start LTSSM from Tegra side */
>> +	reset_control_deassert(pcie->pcie_xrst);
>>  
>> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
>>  		if (tegra_pcie_port_check_link(port))
>>  			continue;
>>  
>> @@ -2123,6 +2122,8 @@ static void tegra_pcie_disable_ports(struct tegra_pcie *pcie)
>>  {
>>  	struct tegra_pcie_port *port, *tmp;
>>  
>> +	reset_control_assert(pcie->pcie_xrst);
>> +
>>  	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
>>  		tegra_pcie_port_disable(port);
>>  }
>> @@ -2472,6 +2473,9 @@ static int __maybe_unused tegra_pcie_pm_suspend(struct device *dev)
>>  
>>  	tegra_pcie_disable_ports(pcie);
>>  
>> +	reset_control_assert(pcie->pex_rst);
>> +	clk_disable_unprepare(pcie->pex_clk);
>> +
>>  	if (IS_ENABLED(CONFIG_PCI_MSI))
>>  		tegra_pcie_disable_msi(pcie);
>>  
>> @@ -2501,10 +2505,19 @@ static int __maybe_unused tegra_pcie_pm_resume(struct device *dev)
>>  	if (IS_ENABLED(CONFIG_PCI_MSI))
>>  		tegra_pcie_enable_msi(pcie);
>>  
>> +	err = clk_prepare_enable(pcie->pex_clk);
>> +	if (err) {
>> +		dev_err(dev, "failed to enable PEX clock: %d\n", err);
>> +		goto disable_controller;
>> +	}
>> +	reset_control_deassert(pcie->pex_rst);
>> +
>>  	tegra_pcie_enable_ports(pcie);
>>  
>>  	return 0;
>>  
>> +disable_controller:
>> +	tegra_pcie_disable_controller(pcie);
>>  poweroff:
>>  	tegra_pcie_power_off(pcie);
>>  
> There's quite a bit going on in this patch in general and I find it hard
> to review because not all the changes seem related to what you described
> in the commit message.
>
> Can you perhaps try to split out the error cleanup changes into a
> separate patch where it makes sense? It seems to me like at least for
> tegra_pcie_power_on() we're currently missing all of the cleanup code.
> You could make that a preparatory patch that goes before this particular
> patch, which will hopefully make this patch easier to review.
>
> Thierry
Okay, I will prepare new patch for error handling and restrict this patch only for
sequence correction
