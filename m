Return-Path: <SRS0=tmaH=UQ=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH V4 26/28] PCI: Add DT binding for "reset-gpios" property
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
 <20190516055307.25737-27-mmaddireddy@nvidia.com> <20190617113038.GK508@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <bc6a3de8-89b0-41a8-006e-0db85fbb4d4d@nvidia.com>
Date: Mon, 17 Jun 2019 17:08:45 +0530
MIME-Version: 1.0
In-Reply-To: <20190617113038.GK508@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 17-Jun-19 5:00 PM, Thierry Reding wrote:
> On Thu, May 16, 2019 at 11:23:05AM +0530, Manikanta Maddireddy wrote:
>> Add DT binding for "reset-gpios" property which supports GPIO based PERST#
>> signal.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> ---
>> V4: No change
>>
>> V3: Moved to common pci binding doc
>>
>> V2: Using standard "reset-gpio" property
>>
>>  Documentation/devicetree/bindings/pci/pci.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Documentation/devicetree/bindings/pci/pci.txt
>> index c77981c5dd18..79124898aa5b 100644
>> --- a/Documentation/devicetree/bindings/pci/pci.txt
>> +++ b/Documentation/devicetree/bindings/pci/pci.txt
>> @@ -24,3 +24,6 @@ driver implementation may support the following properties:
>>     unsupported link speed, for instance, trying to do training for
>>     unsupported link speed, etc.  Must be '4' for gen4, '3' for gen3, '2'
>>     for gen2, and '1' for gen1. Any other values are invalid.
>> +- reset-gpios:
>> +   If present this property specifies PERST# GPIO. Host drivers can parse the
>> +   GPIO and apply fundamental reset to endpoints.
> As mentioned in patch 27/28, maybe mention here that this is only a
> workaround for bad board designs and that it shouldn't be necessary in
> the majority of cases.
>
> Thierry

This is common DT binding doc, I cannot add Tegra specific here.
reset-gpios is common DT prop, so Rob asked me to add it in common file.

Manikanta 
