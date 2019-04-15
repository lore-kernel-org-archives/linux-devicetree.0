Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 23/30] dt-bindings: pci: tegra: Document PCIe DPD pinctrl
 optional prop
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-24-mmaddireddy@nvidia.com> <20190415140749.GY29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <f493390c-4be5-ad74-1b2b-27e815ec4dcb@nvidia.com>
Date: Mon, 15 Apr 2019 21:18:22 +0530
MIME-Version: 1.0
In-Reply-To: <20190415140749.GY29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 7:37 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:48PM +0530, Manikanta Maddireddy wrote:
>> Document PCIe DPD pinctrl optional property to put PEX clk & BIAS pads
>> in low power mode.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt      | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>> index 145a4f04194f..fbbd3bcb3435 100644
>> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>> @@ -65,6 +65,15 @@ Required properties:
>>    - afi
>>    - pcie_x
>>  
>> +Optional properties:
>> +- pinctrl-names : The pin control state names.
>> +- pinctrl-0: PCIe IO(bias & REFCLK) deep power down(DPD) disable state.
>> +  In Tegra210 PCIe clamps are not controlling IO signals, so there
>> +  is leakagae power even after PCIe power partition is off. Pass
> leakage
>
>> +  pinctrl phandle to allow driver to explicitly put PCIe IO in DPD state.
>> +- pinctrl-1: PCIe IO(bias & REFCLK) deep power down(DPD) enable state.
>> +  Pass pinctrl phandle to allow driver bring PCIe IO out of DPD state.
> This is confusingly documented. Your pinctrl-names should list exactly
> what states are supported. The generic pinctrl bindings already specify
> how to define pinctrl states, so I don't think you need to describe all
> of the pinctrl-{0,1,...} states again.
>
> Also, looking at the driver you seem to use custom names for the pinctrl
> states, but those states are really just the "active" and the "idle"
> states, for which there are standard names.
>
> Something like this perhaps:
>
> - pinctrl-names: A list of pinctrl state names. Must contain the
>   following entries:
>   - "default": active state, puts PCIe I/O out of deep power down state
>   - "idle": puts PCIe I/O into deep power down state
>
> It then goes without saying that the phandle pointed to by pinctrl-0
> corresponds to the pinctrl state named by the first entry in
> pinctrl-names.
>
> If you use those default names for the states, I don't think you even
> need extra code, the pinctrl subsystem should be able to take of that
> for you.
>
> Thierry
I will take care of naming in V2. However pinctrl states should be controlled
by PCIe driver because it knows when the "PCIe link up" is initiated and
when then link is down.

Manikanta
>
>> +
>>  Required properties on Tegra124 and later (deprecated):
>>  - phys: Must contain an entry for each entry in phy-names.
>>  - phy-names: Must include the following entries:
>> -- 
>> 2.17.1
>>
