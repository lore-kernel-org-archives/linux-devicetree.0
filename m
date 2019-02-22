From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v3 4/4] dt-bindings: net: freescale: enetc: Add
 connection bindings for ENETC ethernet nodes
Date: Fri, 22 Feb 2019 17:37:32 -0600
Message-ID: <20190222233732.GA1518@bogus>
References: <1550847859-17346-1-git-send-email-claudiu.manoil@nxp.com>
 <1550847859-17346-5-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1550847859-17346-5-git-send-email-claudiu.manoil@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, alexandru.marginean@nxp.com, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 05:04:19PM +0200, Claudiu Manoil wrote:
> Define connection bindings (external PHY connections and internal links)
> for the ENETC on-chip ethernet controllers.
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
> ---
> v3 - added this patch to the set
> 
>  .../devicetree/bindings/net/fsl-enetc.txt          | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/fsl-enetc.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/fsl-enetc.txt b/Documentation/devicetree/bindings/net/fsl-enetc.txt
> new file mode 100644
> index 0000000..2fbb998
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/fsl-enetc.txt
> @@ -0,0 +1,109 @@
> +* ENETC ethernet nodes - external connection bindings
> +
> +The ENETC ethernet controllers are PCIe integrated endpoints
> +(IEPs), on-chip devices discoverable as standard PCIe endpoints,
> +integrated into Freescale SoCs.  The ENETC devices are self
> +contained, the information needed for device initialization
> +is available in hardware (PCIe ECAM area).  However, depending
> +on board design, their external connections are configurable.
> +As usual for SoCs, device tree nodes may be used to define these
> +external connections.  The rest of the document specifies how
> +external connections for ENETC ethernet controllers may be
> +defined via device tree nodes.
> +
> +Silicon (SoC) availability (<SoC name>: <SoC DT path/name>)
> +	- LS1028A: [arch/arm64]	[...]freescale/fsl-ls1028a.dtsi

This doesn't belong in bindings.

> +
> +
> +* ENETC nodes
> +
> +Defined in the SoC device tree as "pci" child nodes of the
> +"pci-host-ecam-generic" compatible "pcie" parent node also known
> +as the Integrated Endpoint Root Complex (IERC) SoC node.

The host controller attachment is also outside the scope of this 
binding.

> +
> +Structure - example (LS1028A):
> +
> +	pcie@1f0000000 {
> +		compatible = "pci-host-ecam-generic";
> +		device_type = "pci";
> +		...
> +		enetc_port0: pci@0,0 {

The node name 'pci' is reserved for bridges. This should match the 
device class if possible (ethernet).

> +			reg = <0x000000 0 0 0 0>;
> +		};
> +		enetc_port1: pci@0,1 {
> +			reg = <0x000100 0 0 0 0>;
> +		};
> +		...
> +	}
> +
> +Each ENETC node has a device number and a function number (expressed
> +by its "reg" property and pci node name, i.e. "pci@0,1" represents
> +device number 0 and functions number 1).  Only the standard pci "reg"
> +property is needed here.

There should be a compatible too.

> +For easy reference, each ENETC node is tagged by a handle having the
> +following format:
> +
> +	"enetc_port<idx>"   where, idx = 0 .. n-1;
> +			    n - #of available ENETC nodes (Ports) on
> +				the given SoC.

These are just source labels, so really they can be anything.

> +
> +NOTES
> +i. The SoC H/W Reference Manual provides a mapping of the ENETC Port
> +numbers to the PCIe Device Number/ Function Number.
> +Example (LS1028):
> +	All ENETC PFs (PCIe Physical Functions) have Device Number 0.
> +	Port 0 - PF0 (pci@0,0)
> +	Port 1 - PF1 (pci@0,1)
> +	Port 2 - PF2 (pci@0,2)
> +	Port 3 - PF6 (pci@0,6)
> +
> +ii. The SoC H/W Reference Manual also defines which ENETC Ports may have
> +external connections (external ports) and which ones are internally
> +connected to a on-chip L2 switch for instance (internal ports).
> +
> +
> +* Defining connections for ENETC nodes
> +
> +To define external connections for the external ENETC Ports on a given
> +board/platform, the board device tree should include the SoC device tree
> +and reference the external ports by their "enetc_port<idx>" handle.

SoC vs. board files are convention, but not really part of the binding 
ABI.

> +
> +Following cases arise, defining all possible connection bindings:
> +
> +1) The ENETC Port is connected to a MDIO configurable PHY:
> +
> +	In this case, the ENETC node should include a "mdio" sub-node
> +	that in turn should contain the "phy" node describing the
> +	external phy.  ENETC Port node structure (example):
> +
> +	&enetc_port0 {

Please just show the full DT example, not separate chunks.

> +		phy-handle = <&sgmii_phy0>;
> +		phy-connection-type = "sgmii";
> +
> +		mdio {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			sgmii_phy0: ethernet-phy@2 {
> +				reg = <0x2>;
> +			};
> +		};
> +	};
> +
> +	All properties are mandatory for this case, their bindings already
> +	defined (see ethernet.txt and phy.txt).
> +
> +2) The ENETC Port has a fixed-link connection:
> +
> +	In this case, the ENETC Port node defines a fixed link connection,
> +	with the following structure (example):
> +
> +	&enetc_port2 {
> +		fixed-link {
> +			speed = <1000>;
> +			full-duplex;
> +		};
> +	};
> +
> +	The "fixed-link" node properties are standard (as defined in
> +	fixed-link.txt).
> +	This connection type also applies to the internal ENETC Ports.
> -- 
> 2.7.4
> 
