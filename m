Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 30/30] PCI: tegra: Change link retry log level to INFO
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-31-mmaddireddy@nvidia.com> <20190415142338.GD29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <26c565cb-1eee-3314-cb50-c36e102b322d@nvidia.com>
Date: Mon, 15 Apr 2019 23:35:29 +0530
MIME-Version: 1.0
In-Reply-To: <20190415142338.GD29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 7:53 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:55PM +0530, Manikanta Maddireddy wrote:
>> Link retry log is info log not error, so change it to INFO log level.
> The wording here is confusing. The log is clearly error level right now.
> Perhaps you meant to say something like this:
>
>     Letting users know that a link is down and in the process of being
>     brought up again is informational, not an error condition.
>
> Thierry
I will update in V2.

Manikanta
>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 75873e6627f9..55f8ff4f3e07 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -2461,7 +2461,7 @@ static bool tegra_pcie_port_check_link(struct tegra_pcie_port *port)
>>  		} while (--timeout);
>>  
>>  		if (!timeout) {
>> -			dev_err(dev, "link %u down, retrying\n", port->index);
>> +			dev_info(dev, "link %u down, retrying\n", port->index);
>>  			goto retry;
>>  		}
>>  
>> -- 
>> 2.17.1
>>
