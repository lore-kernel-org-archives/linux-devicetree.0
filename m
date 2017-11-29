From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: Add Cavium Octeon Common Ethernet
 Interface.
Date: Tue, 28 Nov 2017 18:54:09 -0800
Message-ID: <05f5a001-fc52-3376-d823-41166ed7b59f@caviumnetworks.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-2-david.daney@cavium.com>
 <20171129020153.GN14512@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171129020153.GN14512@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Carlos Munoz <cmunoz@cavium.com>
List-Id: devicetree@vger.kernel.org

On 11/28/2017 06:01 PM, Andrew Lunn wrote:
> On Tue, Nov 28, 2017 at 04:55:33PM -0800, David Daney wrote:
>> From: Carlos Munoz <cmunoz@cavium.com>
>>
>> Add bindings for Common Ethernet Interface (BGX) block.
>>
>> Acked-by: Rob Herring <robh@kernel.org>
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
>> index 000000000000..830c5f08dddd
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
> 
> Hi David
> 
> In the probe function we have:
> 
> +       reg = of_get_property(pdev->dev.of_node, "reg", NULL);
> +       addr = of_translate_address(pdev->dev.of_node, reg);
> +       interface = (addr >> 24) & 0xf;
> +       numa_node = (addr >> 36) & 0x7;
> 
> Is this documented somewhere?

In the Hardware Reference Manual for the chips.


> The numa_node is particularly
> interesting. MMIO changes depends on what node this is in the cluster?

Yes.  Bits 38..36 of MMIO addresses indicate which NUMA node the 
corresponding hardware device resides on.  Some operations can only be 
performed by a CPU on the same NUMA node as the device (RX or 
TX-complete interrupts for example)  Other operations can cross CPU 
nodes (TX packet submission for example)


> 
> 	Andrew
> 
