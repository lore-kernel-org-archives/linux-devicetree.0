From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add external-facing PCIe port property
Date: Fri, 5 Apr 2019 22:39:30 +0100
Message-ID: <e81910c5-2cb9-a05c-dc32-cd407cf3029d@arm.com>
References: <20190402131548.41949-1-jean-philippe.brucker@arm.com>
 <20190402131548.41949-2-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190402131548.41949-2-jean-philippe.brucker@arm.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-pci@vger.kernel.org, Grant.Likely@arm.com, Jeremy.Linton@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-04-02 2:15 pm, Jean-Philippe Brucker wrote:
> Provide a way for the firmware to tell the OS which devices are external
> to the machine and therefore untrusted. The property can describe for
> example Thunderbolt and other user-accessible ports, which should always
> have the strongest IOMMU protection.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> ---
>   Documentation/devicetree/bindings/pci/pci.txt | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Documentation/devicetree/bindings/pci/pci.txt
> index c77981c5dd18..92c01db610df 100644
> --- a/Documentation/devicetree/bindings/pci/pci.txt
> +++ b/Documentation/devicetree/bindings/pci/pci.txt
> @@ -24,3 +24,53 @@ driver implementation may support the following properties:
>      unsupported link speed, for instance, trying to do training for
>      unsupported link speed, etc.  Must be '4' for gen4, '3' for gen3, '2'
>      for gen2, and '1' for gen1. Any other values are invalid.
> +
> +PCI-PCI Bridge properties
> +-------------------------
> +
> +PCIe root ports and switch ports may be described explicitly in the device
> +tree, as children of the host bridge node. Even though those devices are
> +discoverable by probing, it might be necessary to describe properties that
> +aren't provided by standard PCIe capabilities.
> +
> +Required properties:
> +
> +- reg:
> +   Identifies the PCI-PCI bridge. As defined in the IEEE Std 1275-1994
> +   document, it is a five-cell address encoded as (phys.hi phys.mid
> +   phys.lo size.hi size.lo). phys.hi should contain the device's BDF as
> +   0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.
> +
> +   The bus number is defined by firmware, through the standard bridge
> +   configuration mechanism. If this port is a switch port, then firmware
> +   allocates the bus number and writes it into the Secondary Bus Number
> +   register of the bridge directly above this port. Otherwise, the bus
> +   number of a root port is the first number in the bus-range property,
> +   defaulting to zero.
> +
> +   If firmware leaves the ARI Forwarding Enable bit set in the bridge
> +   above this port, then phys.hi contains the 8-bit function number as
> +   0b00000000 bbbbbbbb ffffffff 00000000. Note that the PCIe specification
> +   recommends that firmware only leaves ARI enabled when it knows that the
> +   OS is ARI-aware.
> +
> +Optional properties:
> +
> +- external-facing:
> +   When present, the port is external-facing. All bridges and endpoints
> +   downstream of this port are external to the machine. The OS can, for
> +   example, use this information to identify devices that cannot be
> +   trusted with relaxed DMA protection, as users could easily attach
> +   malicious devices to this port.
> +
> +Example:
> +
> +pcie@10000000 {
> +	compatible = "pci-host-ecam-generic";
> +	...
> +	pcie@0008 {
> +		/* Root port 00:01.0 is external-facing */
> +		reg = <0x00000800 0 0 0 0>;
> +		external-facing;
> +	};
> +};
> 
