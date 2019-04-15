Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 26/30] dt-bindings: pci: tegra: Document nvidia,plat-gpios
 optional prop
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-27-mmaddireddy@nvidia.com> <20190415141654.GA29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <b575fd56-0d31-bbe2-deef-5a21d6e4b33e@nvidia.com>
Date: Mon, 15 Apr 2019 23:28:29 +0530
MIME-Version: 1.0
In-Reply-To: <20190415141654.GA29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 7:46 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:51PM +0530, Manikanta Maddireddy wrote:
>> Document "nvidia,plat-gpios" optional property which supports configuring
>> of platform specific gpios.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>> index fbbd3bcb3435..dca8393b86d1 100644
>> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>> @@ -73,6 +73,8 @@ Optional properties:
>>    pinctrl phandle to allow driver to explicitly put PCIe IO in DPD state.
>>  - pinctrl-1: PCIe IO(bias & REFCLK) deep power down(DPD) enable state.
>>    Pass pinctrl phandle to allow driver bring PCIe IO out of DPD state.
>> +- nvidia,plat-gpios: A list of platform specific gpios which controls
>> +  endpoint's internal regulator or PCIe logic.
> We discussed this with Vidya during review of the Tegra194 PCIe device
> tree bindings and arrived at the conclusion that all of the GPIOs that
> need to be controlled for PCI to work can be modelled as proper device
> nodes (I think regulator and GPIO-controlled muxes were the only two
> use-cases for which we need this).
>
> Can the same be done for this PCI controller? What use-cases are we
> talking about?
In Tegra194 case it is apt to use regulator framework because gpios are used
to control regulators. However I published this patch to control vendor defined
gpios in endpoints. For ex: isolate gpio in RTL8111. Since I am not sure if
regulator framework is apt, I published as gpio patch.
>>  Required properties on Tegra124 and later (deprecated):
>>  - phys: Must contain an entry for each entry in phy-names.
>> @@ -567,6 +569,7 @@ Board DTS:
>>  		pci@2,0 {
>>  			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-4}>;
>>  			phy-names = "pcie-0";
>> +			nvidia,plat-gpios = <&gpio TEGRA_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
>>  			status = "okay";
>>  		};
>>  	};
> I recall this being the setup for Jetson Nano and the X.3 GPIO going to
> an Ethernet device. Let's find out what exactly this GPIO is used for
> and why we need it to be set up as part of the PCI controller driver
> rather than the Ethernet device.
>
> If it turns out we can't model this other than with a generic GPIO type
> of property we need a better explanation than the above, and the Jetson
> Nano use-case would provide that explanation.
>
> And if indeed we cannot model this more accurately, I think we should
> use something like the gpio-hog binding rather than some custom PCI
> controller property.
>
> Thierry
Yes, in Jetson Nano gpio x.3 is controlling isolate pin of RTL8111.
RTL8111 datasheet available online says that as long as isolate
pin is asserted it'll not sample RX lanes and doesn't drive TX lanes.
Since RTL8111 PCIe IP should be active when PCIe host driver is
attempting link up, this gpio can be controlled by host driver only.

I didn't go for gpio-hog because this gpio should be asserted
during suspend, to enable wake on LAN.

Manikanta
