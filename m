Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 28/30] dt-bindings: pci: tegra: Document nvidia,rst-gpio
 optional prop
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-29-mmaddireddy@nvidia.com> <20190415142012.GB29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <02b91c79-cb55-d6f9-f153-cadbfa9c8b8b@nvidia.com>
Date: Mon, 15 Apr 2019 23:31:46 +0530
MIME-Version: 1.0
In-Reply-To: <20190415142012.GB29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 7:50 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:53PM +0530, Manikanta Maddireddy wrote:
>> Document "nvidia,rst-gpio" optional property which supports GPIO based
>> PERST# signal.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>> index dca8393b86d1..23928fd59538 100644
>> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>> @@ -75,6 +75,8 @@ Optional properties:
>>    Pass pinctrl phandle to allow driver bring PCIe IO out of DPD state.
>>  - nvidia,plat-gpios: A list of platform specific gpios which controls
>>    endpoint's internal regulator or PCIe logic.
>> +- nvidia,rst-gpio: If GPIO is used as PERST# signal instead of available
>> +  SFIO, add this property with phandle to GPIO controller and GPIO number.
> GPIO properties are pretty much standardized, so this should really be
> called just "reset-gpio".
>
> Also it looks like this is documented in the wrong place. In the example
> below you set this property for the root port, that is inside a child
> node of the PCI controller, but if I understand correctly, and it's hard
> to say from the context, the above is documented as part of the
> properties of the host bridge node.
>
> Thierry
I will correct this in V2.

Manikanta
>>  
>>  Required properties on Tegra124 and later (deprecated):
>>  - phys: Must contain an entry for each entry in phy-names.
>> @@ -671,6 +673,7 @@ Board DTS:
>>  
>>  		pci@1,0 {
>>  			nvidia,num-lanes = <4>;
>> +			nvidia,rst-gpio = <&tegra_main_gpio TEGRA_MAIN_GPIO(A, 3) 0>;
>>  			status = "okay";
>>  		};
>>  
>> -- 
>> 2.17.1
>>
