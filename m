From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Add binding doc for Stingray
 PCIe PHY
Date: Fri, 6 Jul 2018 16:56:16 -0700
Message-ID: <6a9c7b49-53b0-2d85-cc43-292020bf57ed@broadcom.com>
References: <1530728533-28770-1-git-send-email-ray.jui@broadcom.com>
 <1530728533-28770-2-git-send-email-ray.jui@broadcom.com>
 <20180705233401.GA26079@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180705233401.GA26079@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On 7/5/2018 4:34 PM, Rob Herring wrote:
> On Wed, Jul 04, 2018 at 11:22:12AM -0700, Ray Jui wrote:
>> Add binding document for Stingray PCIe PHYs for both PAXB and PAXC based
>> root complex
>>
>> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
>> ---
>>   .../devicetree/bindings/phy/brcm,sr-pcie-phy.txt   | 41 ++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt b/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
>> new file mode 100644
>> index 0000000..5a13511
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
>> @@ -0,0 +1,41 @@
>> +Broadcom Stingray PCIe PHY
>> +
>> +Required properties:
>> +- compatible: must be "brcm,sr-pcie-phy"
>> +- reg: base address and length of the PCIe SS register space
>> +- brcm,sr-cdru: phandle to the CDRU syscon node
>> +- brcm,sr-mhb: phandle to the MHB syscon node
>> +- #phy-cells: Must be 1, denotes the PHY index
>> +
>> +For PAXB based root complex, one can have a configuration of up to 8 PHYs
>> +PHY index goes from 0 to 7
>> +
>> +For the internal PAXC based root complex, PHY index is always 8
>> +
>> +Example:
>> +	mhb: syscon@60401000 {
>> +		compatible = "brcm,sr-mhb", "syscon";
>> +		reg = <0 0x60401000 0 0x38c>;
>> +	};
>> +
>> +	cdru: syscon@6641d000 {
>> +		compatible = "brcm,sr-cdru", "syscon";
>> +		reg = <0 0x6641d000 0 0x400>;
>> +	};
>> +
>> +	pcie_phy: phy {
> 
> Needs a unit address.
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Yes, will address that in v4 with your Reviewed-by added.

Thanks,

Ray

>> +		compatible = "brcm,sr-pcie-phy";
>> +		reg = <0 0x40000000 0 0x800>;
>> +		brcm,sr-cdru = <&cdru>;
>> +		brcm,sr-mhb = <&mhb>;
>> +		#phy-cells = <1>;
>> +	};
>> +
>> +	/* users of the PCIe PHY */
>> +
>> +	pcie0: pcie@48000000 {
>> +		...
>> +		...
>> +		phys = <&pcie_phy 0>;
>> +		phy-names = "pcie-phy";
>> +	};
>> -- 
>> 2.1.4
>>
