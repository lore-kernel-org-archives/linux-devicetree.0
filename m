Return-Path: <SRS0=T9D/=SR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:4640 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfDOPbb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Apr 2019 11:31:31 -0400
Subject: Re: [PATCH 21/30] PCI: tegra: Add "pci" type check before parsing
 child device tree node
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-22-mmaddireddy@nvidia.com> <20190415133715.GV29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <059fd53c-8a53-be56-a5bc-393f37aae168@nvidia.com>
Date: Mon, 15 Apr 2019 21:00:58 +0530
MIME-Version: 1.0
In-Reply-To: <20190415133715.GV29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 7:07 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:46PM +0530, Manikanta Maddireddy wrote:
>> Each root port is added as a child device tree node of PCIe controller
>> node. These child nodes are parsed using open firmware PCI bus accessor
>> functions. If the child node is not of "pci" type then device tree
>> parsing fails. Add "pci" type check before parsing child device tree node.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 3 +++
>>  1 file changed, 3 insertions(+)
> Erm... what is the use-case that you're trying to support? Why would we
> ever have children nodes that are not of type "pci"?
>
> Thierry
In downstream kernel we have "prod-settings" node as one of the child nodes.
Even though we are not supporting this in upstream kernel, I believe this
check is good to have.

Manikanta
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 8fdc7934d4c9..d08a63132c77 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -2197,6 +2197,9 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>>  		unsigned int index;
>>  		u32 value;
>>  
>> +		if (!of_node_is_type(port, "pci"))
>> +			continue;
>> +
>>  		err = of_pci_get_devfn(port);
>>  		if (err < 0) {
>>  			dev_err(dev, "failed to parse address: %d\n", err);
>> -- 
>> 2.17.1
>>
