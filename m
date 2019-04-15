Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 04/30] PCI: tegra: Add PCIe Gen2 link speed support
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-5-mmaddireddy@nvidia.com> <20190415112108.GE29254@ulmo>
 <5b3b5882-b841-658b-57dd-1572f20dab69@nvidia.com>
 <20190415153651.GL29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <ab436004-248f-3874-a48f-7be5463f2edf@nvidia.com>
Date: Mon, 15 Apr 2019 21:23:22 +0530
MIME-Version: 1.0
In-Reply-To: <20190415153651.GL29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 9:06 PM, Thierry Reding wrote:
> On Mon, Apr 15, 2019 at 08:17:02PM +0530, Manikanta Maddireddy wrote:
>>
>> On 15-Apr-19 4:51 PM, Thierry Reding wrote:
>>> On Thu, Apr 11, 2019 at 10:33:29PM +0530, Manikanta Maddireddy wrote:
>>>> Tegra124, 132, 210 and 186 support Gen2 link speed. After PCIe link is up
>>>> in Gen1, set target link speed as Gen2 and retrain link. Link switches to
>>>> Gen2 speed if Gen2 capable end point is connected, else link stays in Gen1.
>>>>
>>>> Per PCIe 4.0r0.9 sec 7.6.3.7 implementation note, driver need to wait for
>>>> PCIe LTSSM to come back from recovery before retraining the link.
>>>>
>>>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>>>> ---
>>>>  drivers/pci/controller/pci-tegra.c | 61 ++++++++++++++++++++++++++++++
>>>>  1 file changed, 61 insertions(+)
>>>>
>>>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>>>> index a61ce9d475b4..6ccda82735f8 100644
>>>> --- a/drivers/pci/controller/pci-tegra.c
>>>> +++ b/drivers/pci/controller/pci-tegra.c
>>>> @@ -191,6 +191,8 @@
>>>>  #define  RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE	0x20000000
>>>>  #define  RP_LINK_CONTROL_STATUS_LINKSTAT_MASK	0x3fff0000
>>>>  
>>>> +#define RP_LINK_CONTROL_STATUS_2		0x000000b0
>>>> +
>>>>  #define PADS_CTL_SEL		0x0000009c
>>>>  
>>>>  #define PADS_CTL		0x000000a0
>>>> @@ -2096,6 +2098,62 @@ static void tegra_pcie_apply_pad_settings(struct tegra_pcie *pcie)
>>>>  		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
>>>>  }
>>>>  
>>>> +#define LINK_RETRAIN_TIMEOUT 100000
>>> This is oddly placed. I think this should go somewhere near the top of
>>> the file. We already have PME_ACK_TIMEOUT there.
>>>
>>> But to be honest, I wouldn't even bother with the #define. This is used
>>> exactly twice and is much longer to type than the actual number.
>> I will move #define to top of the file. Macro name tells us what this timeout,
>> so I will keep the macro intact.
>>>> +
>>>> +static void tegra_pcie_change_link_speed(struct tegra_pcie *pcie)
>>>> +{
>>>> +	struct device *dev = pcie->dev;
>>>> +	struct tegra_pcie_port *port, *tmp;
>>>> +	ktime_t deadline;
>>>> +	u32 val;
>>> The driver uses u32 value for register values elsewhere. It'd be good to
>>> stay consistent with that convention.
>> Do you mean "unsigned long"? I observed this discrepancy, in few places u32 is used
>> and in some places "unsigned long" is used to store register value. I am continuing
>> to u32 and we need a new patch to change all "unsigned long" variables to u32
>> which are used to store register values.
> I meant to say that we spell out "value" everywhere else and don't use
> the abbreviation.
>
> Thierry
Got it, I will take care of it in V2.
