Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 04/30] PCI: tegra: Add PCIe Gen2 link speed support
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-5-mmaddireddy@nvidia.com> <20190415112108.GE29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <5b3b5882-b841-658b-57dd-1572f20dab69@nvidia.com>
Date: Mon, 15 Apr 2019 20:17:02 +0530
MIME-Version: 1.0
In-Reply-To: <20190415112108.GE29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 4:51 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:29PM +0530, Manikanta Maddireddy wrote:
>> Tegra124, 132, 210 and 186 support Gen2 link speed. After PCIe link is up
>> in Gen1, set target link speed as Gen2 and retrain link. Link switches to
>> Gen2 speed if Gen2 capable end point is connected, else link stays in Gen1.
>>
>> Per PCIe 4.0r0.9 sec 7.6.3.7 implementation note, driver need to wait for
>> PCIe LTSSM to come back from recovery before retraining the link.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 61 ++++++++++++++++++++++++++++++
>>  1 file changed, 61 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index a61ce9d475b4..6ccda82735f8 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -191,6 +191,8 @@
>>  #define  RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE	0x20000000
>>  #define  RP_LINK_CONTROL_STATUS_LINKSTAT_MASK	0x3fff0000
>>  
>> +#define RP_LINK_CONTROL_STATUS_2		0x000000b0
>> +
>>  #define PADS_CTL_SEL		0x0000009c
>>  
>>  #define PADS_CTL		0x000000a0
>> @@ -2096,6 +2098,62 @@ static void tegra_pcie_apply_pad_settings(struct tegra_pcie *pcie)
>>  		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
>>  }
>>  
>> +#define LINK_RETRAIN_TIMEOUT 100000
> This is oddly placed. I think this should go somewhere near the top of
> the file. We already have PME_ACK_TIMEOUT there.
>
> But to be honest, I wouldn't even bother with the #define. This is used
> exactly twice and is much longer to type than the actual number.
I will move #define to top of the file. Macro name tells us what this timeout,
so I will keep the macro intact.
>
>> +
>> +static void tegra_pcie_change_link_speed(struct tegra_pcie *pcie)
>> +{
>> +	struct device *dev = pcie->dev;
>> +	struct tegra_pcie_port *port, *tmp;
>> +	ktime_t deadline;
>> +	u32 val;
> The driver uses u32 value for register values elsewhere. It'd be good to
> stay consistent with that convention.
Do you mean "unsigned long"? I observed this discrepancy, in few places u32 is used
and in some places "unsigned long" is used to store register value. I am continuing
to u32 and we need a new patch to change all "unsigned long" variables to u32
which are used to store register values.
>> +
>> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
>> +		/*
>> +		 * Link Capabilities 2 register is hardwired to 0 in Tegra,
>> +		 * so no need to read it before setting target speed.
>> +		 */
>> +		val = readl(port->base + RP_LINK_CONTROL_STATUS_2);
>> +		val &= ~PCI_EXP_LNKSTA_CLS;
>> +		val |= PCI_EXP_LNKSTA_CLS_5_0GB;
>> +		writel(val, port->base + RP_LINK_CONTROL_STATUS_2);
> The comment says there's no need to read the register, but then the code
> goes on and reads it before modifying it.
>
> That's the first thing that came to my mind. Then I realized that the
> code doesn't actually do anything with the Link Capabilities 2 register
> at all. So what's the deal here? Is it that the Link Capabilities 2
> register being hardwired to 0 means that we can change the target speed?
> Your comment needs to explain more clearly how it relates to the code.
I want to say that "Supported Link Speeds Vector" in "Link Capabilities 2" is not
supported by Tegra, so no need read supported link speed before going for
retrain. I will update the comment in detailed.
>> +
>> +		/*
>> +		 * Poll until link comes back from recovery to avoid race
>> +		 * condition.
>> +		 */
>> +		deadline = ktime_add_us(ktime_get(), LINK_RETRAIN_TIMEOUT);
>> +		for (;;) {
>> +			val = readl(port->base + RP_LINK_CONTROL_STATUS);
>> +			if (!(val & PCI_EXP_LNKSTA_LT))
>> +				break;
>> +			if (ktime_after(ktime_get(), deadline))
>> +				break;
>> +			usleep_range(2000, 3000);
>> +		}
> This would be more compact when written as a while loop. Also I think
> it's more readable to make the !(...) an explicit comparison. Finally,
> use whitespace to improve readability. The above looks very cluttered
> and, in my opinion, makes the code difficult to read. Something like
> the below is much easier to read, in my opinion:
>
> 		while (ktime_before(ktime_get(), deadline)) {
> 			value = readl(port->base + RP_LINK_CONTROL_STATUS);
> 			if ((value & PCI_EXP_LNKSTA_LT) == 0)
> 				break;
>
> 			usleep_range(2000, 3000);
> 		}
I will take care of it in V2
>> +		if (val & PCI_EXP_LNKSTA_LT)
>> +			dev_err(dev, "PCIe port %u link is still in recovery\n",
>> +				port->index);
> Since you're continuing execution, perhaps make this dev_warn()?
I will take care of it in V2
>
>> +
>> +		/* Retrain the link */
>> +		val = readl(port->base + RP_LINK_CONTROL_STATUS);
>> +		val |= PCI_EXP_LNKCTL_RL;
>> +		writel(val, port->base + RP_LINK_CONTROL_STATUS);
>> +
>> +		deadline = ktime_add_us(ktime_get(), LINK_RETRAIN_TIMEOUT);
>> +		for (;;) {
>> +			val = readl(port->base + RP_LINK_CONTROL_STATUS);
>> +			if (!(val & PCI_EXP_LNKSTA_LT))
>> +				break;
>> +			if (ktime_after(ktime_get(), deadline))
>> +				break;
>> +			usleep_range(2000, 3000);
>> +		}
> Same comments as above.
I will take care of it in V2
>
>> +		if (val & PCI_EXP_LNKSTA_LT)
>> +			dev_err(dev, "link retrain of PCIe port %u failed\n",
>> +				port->index);
>> +	}
> Most of the error messages in this file are of the form:
>
> 	"failed to ..."
>
> Perhaps make this:
>
> 	"failed to retrain link of port %u\n"
>
> for consistency?
>
> Thierry
I will take care of it in V2
>
>> +}
>> +
>>  static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>>  {
>>  	struct device *dev = pcie->dev;
>> @@ -2122,6 +2180,9 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>>  		tegra_pcie_port_disable(port);
>>  		tegra_pcie_port_free(port);
>>  	}
>> +
>> +	if (pcie->soc->has_gen2)
>> +		tegra_pcie_change_link_speed(pcie);
>>  }
>>  
>>  static void tegra_pcie_disable_ports(struct tegra_pcie *pcie)
>> -- 
>> 2.17.1
>>
