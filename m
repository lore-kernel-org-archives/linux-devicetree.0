Return-Path: <SRS0=79tX=SO=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 12/30] PCI: tegra: Add SW fixup for RAW violations
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-13-mmaddireddy@nvidia.com>
 <20190411200121.GQ256045@google.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <f0f02fbd-0217-9c6d-437f-e5212b67bc24@nvidia.com>
Date: Fri, 12 Apr 2019 11:29:35 +0530
MIME-Version: 1.0
In-Reply-To: <20190411200121.GQ256045@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 12-Apr-19 1:31 AM, Bjorn Helgaas wrote:
> On Thu, Apr 11, 2019 at 10:33:37PM +0530, Manikanta Maddireddy wrote:
>> The logic which blocks read requests till AFI gets ACK for all outstanding
>> MC writes does not behave correctly when number of outstanding write
>> becomes more than 32 in Tegra124 and 132.
>>
>> SW fixup to prevent this issue is to limit outstanding posted writes and
>> tweak updateFC timer threshold.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>> @@ -2381,6 +2408,7 @@ static const struct tegra_pcie_soc tegra20_pcie = {
>>  	.program_uphy = true,
>>  	.update_clamp_threshold = false,
>>  	.program_deskew_time = false,
>> +	.raw_violation_fixup = false,
>>  	.ectl.enable = false,
> It doesn't really matter either way, but you don't *have* to
> initialize all these flags to "false" since that's the default for
> uninitialized fields in static structs like these.  If you left them
> out, the structs would only contain the "true" items, and it'd be
> easier to see what's special about each SoC.

SoC flags are explicitly set false if not supported, I am following same existing

coding style in this driver. Maybe the intention here is to convey what is

not supported by a particular SoC without going through soc struct definition.

>>  };
>>  
>> @@ -2407,6 +2435,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
>>  	.program_uphy = true,
>>  	.update_clamp_threshold = false,
>>  	.program_deskew_time = false,
>> +	.raw_violation_fixup = false,
>>  	.ectl.enable = false,
>>  };
