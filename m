From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add external-facing PCIe port property
Date: Mon, 25 Mar 2019 12:59:48 +0000
Message-ID: <598b0675-38b2-9e52-d903-016dc548756c@arm.com>
References: <20190318182124.53859-1-jean-philippe.brucker@arm.com>
 <20190318182124.53859-2-jean-philippe.brucker@arm.com>
 <20190320220338.GH251185@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190320220338.GH251185@google.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <Grant.Likely@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Jeremy Linton <Jeremy.Linton@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Robin Murphy <Robin.Murphy@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 20/03/2019 22:03, Bjorn Helgaas wrote:
> On Mon, Mar 18, 2019 at 06:21:23PM +0000, Jean-Philippe Brucker wrote:
>> Provide a way for the firmware to tell the OS which devices are external
>> to the machine and therefore untrusted. The property can describe for
>> example thunderbolt and other hot-pluggable ports, which should always
>> have the strongest IOMMU protection.
> 
> s/thunderbolt/Thunderbolt/
> 
> I think the important bit is that the port is user-accessible, whether
> it is hot-pluggable or not, right?

Yes, I'll change this

> 
> I think I'm OK with this from a PCI perspective.
> 
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
>> ---
>>  Documentation/devicetree/bindings/pci/pci.txt | 47 +++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Documentation/devicetree/bindings/pci/pci.txt
>> index c77981c5dd18..55cdbc5d2804 100644
>> --- a/Documentation/devicetree/bindings/pci/pci.txt
>> +++ b/Documentation/devicetree/bindings/pci/pci.txt
>> @@ -24,3 +24,50 @@ driver implementation may support the following properties:
>>     unsupported link speed, for instance, trying to do training for
>>     unsupported link speed, etc.  Must be '4' for gen4, '3' for gen3, '2'
>>     for gen2, and '1' for gen1. Any other values are invalid.
>> +
>> +PCI-PCI Bridge properties
>> +-------------------------
>> +
>> +Root ports and switch ports may be described explicitly in the device
> 
> Maybe "PCIe root ports and switch ports" since pci.txt seems to apply
> to both conventional PCI and PCIe?

Ok

> 
>> +tree, as children of the host bridge node. Even though those devices are
>> +discoverable by probing, it might be necessary to describe properties that
>> +aren't provided by standard PCIe capabilities.
>> +
>> +Required properties:
>> +
>> +- reg:
>> +   Identifies the PCI-PCI bridge. As defined in the IEEE Std 1275-1994
>> +   document, it is a five-cell address encoded as (phys.hi phys.mid
>> +   phys.lo size.hi size.lo). phys.hi should contain the device's BDF as
>> +   0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.
>> +
>> +   The bus number is defined by firmware, through the standard bridge
>> +   configuration mechanism. If this port is a switch port, then firmware
>> +   allocates the bus number and writes it into the Secondary Bus Number
>> +   register of the bridge directly above this port. Otherwise, the bus
>> +   number of a root port is the first number in the bus-range property,
>> +   defaulting to zero.
>> +
>> +   If firmware leaves the ARI Forwarding Enable bit set in the bridge
>> +   above this port, then phys.hi contains the 8-bit function number as
>> +   0b00000000 bbbbbbbb ffffffff 00000000. Note that the PCIe specification
>> +   recommends that firmware only leaves ARI enabled when it knows that the
>> +   OS is ARI-aware.
>> +
>> +Optional properties:
>> +
>> +- external-facing:
>> +   When present, the port is external facing. All bridges and endpoints
>> +   downstream of this port are external to the machine.
> 
> Maybe include a note about why this is important, ie, we care because
> malicious devices may be attached to an external port?  I know you
> have that in the commit log but it would be more visible here.
> 
> Elsewhere you use "external-facing", here too for consistency?

Makes sense, I'll add a note. I currently have:

- external-facing:
   When present, the port is external-facing. All bridges and endpoints
   downstream of this port are external to the machine. The OS can, for
   example, use this information to identify devices that cannot be
   trusted with relaxed DMA protection, as users could easily attach
   malicious devices to this port.

Thanks for reviewing, I'll resend shortly

Jean

> 
>> +Example:
>> +
>> +pcie@10000000 {
>> +	compatible = "pci-host-ecam-generic";
>> +	...
>> +	pcie@0008 {
>> +		/* Root port 00:01.0 is external-facing */
>> +		reg = <0x00000800 0 0 0 0>;
>> +		external-facing;
>> +	};
>> +};
>> -- 
>> 2.21.0
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
