Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 14/30] PCI: tegra: Set target speed as Gen1 before link up
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-15-mmaddireddy@nvidia.com> <20190415115218.GP29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <75493937-fd77-024b-0e07-62ecc009c917@nvidia.com>
Date: Mon, 15 Apr 2019 20:42:37 +0530
MIME-Version: 1.0
In-Reply-To: <20190415115218.GP29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 5:22 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:39PM +0530, Manikanta Maddireddy wrote:
>> Some of the legacy PCIe endpoints doesn't enumerate if root port advertises
>> both Gen-1 and Gen-2 speeds. Hence, the strategy followed here is to
>> initially advertise only Gen-1 and after link is up, retrain link to Gen-2
>> speed.
>>
>> Following two cards display this behaviour,
>>   - Fusion HDTV 5 Express card
>>   - IOGear SIL - PCIE - SATA card
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 7dc728cc5f51..7e24eac12668 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -670,6 +670,17 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
>>  		value |= soc->update_fc_val;
>>  		writel(value, port->base + RP_VEND_XP);
>>  	}
>> +
>> +	/*
>> +	 * PCIe link doesn't come up with few legacy PCIe endpoints
>> +	 * if root port advertises both Gen-1 and Gen-2 speeds.
>> +	 * Hence, the strategy followed here is to initially advertise
>> +	 * only Gen-1 and after link is up, retrain link to Gen-2 speed
>> +	 */
>> +	value = readl(port->base + RP_LINK_CONTROL_STATUS_2);
>> +	value &= ~PCI_EXP_LNKSTA_CLS;
>> +	value |= PCI_EXP_LNKSTA_CLS_2_5GB;
>> +	writel(value, port->base + RP_LINK_CONTROL_STATUS_2);
>>  }
>>  
>>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
> This looks like it's related to the earlier patch that adds support for
> retraining the link at Gen-2. As such, I think the two patches should be
> moved closer together to make that more obvious.
>
> Also, perhaps even the order needs to be changed. For example, if the
> earlier patch enables advertisement of Gen-2, then there will be a
> period of 10 or so patches where the above devices wouldn't work. So if
> this fixes an error introduced by an earlier patch, it makes sense to
> resort the patches so that we first fix the potential error and then
> introduce the code that would cause the error to happen.
>
> Thierry
Both are independent patches. Even though HW init Target speed is Gen2, Tegra
PCIe gets the link up in Gen1 only because HW autonomous speed change feature
is not available. After link up in Gen1 SW has to retrain the link to Gen2, which is
done in 4/30. Current patch changes the HW init value of Target speed to Gen1,
to support the cards mentioned in commit message.
