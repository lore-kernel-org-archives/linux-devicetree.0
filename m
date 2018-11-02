From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [RFC PATCH 13/40] dt-bindings: PCI: keystone: Add "reg-names"
 binding information
Date: Fri, 2 Nov 2018 12:49:22 +0530
Message-ID: <ba9f2c1d-c1e0-b920-fdf1-22445fb6eb5a@ti.com>
References: <20180921102155.22839-1-kishon@ti.com>
 <20180921102155.22839-14-kishon@ti.com>
 <5baa1b0e.1c69fb81.4f57b.32f7@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5baa1b0e.1c69fb81.4f57b.32f7@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Gustavo.Pimentel@synopsys.com, Mark Rutland <mark.rutland@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 25/09/18 4:30 AM, Rob Herring wrote:
> On Fri, Sep 21, 2018 at 03:51:28PM +0530, Kishon Vijay Abraham I wrote:
>> Add "reg-names" binding information in order for device tree node
>> to be populated with the correct register strings.
>>
>> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
>> ---
>>  Documentation/devicetree/bindings/pci/pci-keystone.txt | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/pci-keystone.txt b/Documentation/devicetree/bindings/pci/pci-keystone.txt
>> index 2030ee0dc4f9..3a551687cfa2 100644
>> --- a/Documentation/devicetree/bindings/pci/pci-keystone.txt
>> +++ b/Documentation/devicetree/bindings/pci/pci-keystone.txt
>> @@ -12,8 +12,10 @@ described here as well as properties that are not applicable.
>>  Required Properties:-
>>  
>>  compatibility: "ti,keystone-pcie"
>> -reg:	index 1 is the base address and length of DW application registers.
>> -	index 2 is the base address and length of PCI device ID register.
>> +reg: Three register ranges as listed in the reg-names property
>> +reg-names: "dbics" for the DesignWare PCIe registers, "app" for the
>> +	   TI specific application registers, "config" for the
>> +	   configuration space address
> 
> This doesn't doesn't look like a compatible change.

The pcie-keystone driver hasn't worked in mainline because of lack of serdes
support. Since the same driver is used for am654 SoC (which has serdes support
included in this series), I'm trying to cleanup the binding.

Thanks
Kishon
