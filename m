From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: Add Cavium Octeon Common Ethernet
 Interface.
Date: Wed, 15 Nov 2017 11:30:12 -0800
Message-ID: <93196fac-378f-4e59-d926-67e96817f60c@caviumnetworks.com>
References: <20171109192915.11912-1-david.daney@cavium.com>
 <20171109192915.11912-2-david.daney@cavium.com>
 <20171115191857.podohd56knfd4hyh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171115191857.podohd56knfd4hyh@rob-hp-laptop>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Carlos Munoz <cmunoz@cavium.com>
List-Id: devicetree@vger.kernel.org

On 11/15/2017 11:18 AM, Rob Herring wrote:
> On Thu, Nov 09, 2017 at 11:29:08AM -0800, David Daney wrote:
>> From: Carlos Munoz <cmunoz@cavium.com>
>>
>> Add bindings for Common Ethernet Interface (BGX) block.
>>
>> Signed-off-by: Carlos Munoz <cmunoz@cavium.com>
>> Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> ---
>>   .../devicetree/bindings/net/cavium-bgx.txt         | 61 ++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/cavium-bgx.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/cavium-bgx.txt b/Documentation/devicetree/bindings/net/cavium-bgx.txt
>> new file mode 100644
>> index 000000000000..6b1f8b994c20
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/cavium-bgx.txt
>> @@ -0,0 +1,61 @@
>> +* Common Ethernet Interface (BGX) block
>> +
>> +Properties:
>> +
>> +- compatible: "cavium,octeon-7890-bgx": Compatibility with all cn7xxx SOCs.
>> +
>> +- reg: The base address of the BGX block.
>> +
>> +- #address-cells: Must be <1>.
>> +
>> +- #size-cells: Must be <0>.  BGX addresses have no size component.
>> +
>> +A BGX block has several children, each representing an Ethernet
>> +interface.
>> +
>> +
>> +* Ethernet Interface (BGX port) connects to PKI/PKO
>> +
>> +Properties:
>> +
>> +- compatible: "cavium,octeon-7890-bgx-port": Compatibility with all
>> +	      cn7xxx SOCs.
>> +
>> +	      "cavium,octeon-7360-xcv": Compatibility with cn73xx SOCs
>> +	      for RGMII.
>> +
>> +- reg: The index of the interface within the BGX block.
> 
> There's no memory mapped region associated with the sub-blocks?

No.  Many of the sub block control bits are co-located in the same 
registers.


> 
>> +
>> +Optional properties:
>> +
>> +- local-mac-address: Mac address for the interface.
>> +
>> +- phy-handle: phandle to the phy node connected to the interface.
>> +
>> +- phy-mode: described in ethernet.txt.
>> +
>> +- fixed-link: described in fixed-link.txt.
>> +
>> +Example:
>> +
>> +	ethernet-mac-nexus@11800e0000000 {
>> +		compatible = "cavium,octeon-7890-bgx";
>> +		reg = <0x00011800 0xe0000000 0x00000000 0x01000000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		ethernet-mac@0 {
> 
> ethernet@0


Good point.  I will fix that.


> 
>> +			compatible = "cavium,octeon-7360-xcv";
>> +			reg = <0>;
>> +			local-mac-address = [ 00 01 23 45 67 89 ];
>> +			phy-handle = <&phy3>;
>> +			phy-mode = "rgmii-rxid"
>> +		};
>> +		ethernet-mac@1 {
> 
> ditto.
> 
> Otherwise,
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks,
David Daney
> 
>> +			compatible = "cavium,octeon-7890-bgx-port";
>> +			reg = <1>;
>> +			local-mac-address = [ 00 01 23 45 67 8a ];
>> +			phy-handle = <&phy4>;
>> +			phy-mode = "sgmii"
>> +		};
>> +	};
>> -- 
>> 2.13.6
>>
