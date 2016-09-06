From: Horia Geanta Neag <horia.geanta@nxp.com>
Subject: Re: [linux-devel] [PATCH 10/10] dt-bindings: sec: Update bindings for
 LS1012A
Date: Tue, 6 Sep 2016 09:43:20 +0000
Message-ID: <DB4PR04MB0847FF62F710EE46700387EA98F90@DB4PR04MB0847.eurprd04.prod.outlook.com>
References: <1472207269-18499-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <1472207269-18499-10-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Bhaskar U <bhaskar.upadhaya@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "oss@buserror.net" <oss@buserror.net>, "linux-devel@gforge.freescale.net" <linux-devel@gforge.freescale.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 8/26/2016 6:36 PM, Bhaskar Upadhaya wrote:
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
> ---
>  .../devicetree/bindings/crypto/fsl-sec5.txt        | 153 +++++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/fsl-sec5.txt
> 
> diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec5.txt b/Documentation/devicetree/bindings/crypto/fsl-sec5.txt
> new file mode 100644
> index 0000000..7bcaa6f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/fsl-sec5.txt
> @@ -0,0 +1,153 @@
> +SEC 5 is Freescale's Cryptographic Accelerator and Assurance Module (CAAM).
> +Currently Freescale arm chip LS1012A is embedded with SEC 5.
This sounds like LS1012A is the only platform with SEC5, which is far
from the truth.

> +SEC 5 device tree binding include:
> +   -SEC 5 Node
> +   -Job Ring Node
> +   -Full Example
> +
> +=====================================================================
> +SEC 5 Node
> +
> +Description
> +
> +    Node defines the base address of the SEC 5 block.
> +    This block specifies the address range of all global
> +    configuration registers for the SEC 5 block.
> +    For example, In LS1012A, we could see three SEC 5 node.
There's only one SEC / CAAM crypto engine, thus only one node.
Copy & paste typo from SEC6 binding?

> +
> +PROPERTIES
> +
> +   - compatible
> +      Usage: required
> +      Value type: <string>
> +      Definition: Must include "fsl,sec-v5.4".
Since you are adding a binding for SEC5, make sure you are accounting
for already-existing trees that are using "fsl,sec-v5.0",
"fsl,sec-v5.2", "fsl,sec-v5.3".
See SoCs in arch/powerpc/boot/dts/fsl/

> +
> +   - fsl,sec-era
> +      Usage: optional
> +      Value type: <u32>
> +      Definition: A standard property. Define the 'ERA' of the SEC
> +          device.
> +
> +   - #address-cells
> +       Usage: required
> +       Value type: <u32>
> +       Definition: A standard property.  Defines the number of cells
> +           for representing physical addresses in child nodes.
> +
> +   - #size-cells
> +       Usage: required
> +       Value type: <u32>
> +       Definition: A standard property.  Defines the number of cells
> +           for representing the size of physical addresses in
> +           child nodes.
> +
> +   - reg
> +      Usage: required
> +      Value type: <prop-encoded-array>
> +      Definition: A standard property.  Specifies the physical
> +          address and length of the SEC 5 configuration registers.
> +
> +   - ranges
> +       Usage: required
> +       Value type: <prop-encoded-array>
> +       Definition: A standard property.  Specifies the physical address
> +           range of the SEC 5.0 register space (-SNVS not included).  A
> +           triplet that includes the child address, parent address, &
> +           length.
> +
> +   Note: All other standard properties (see the ePAPR) are allowed
> +   but are optional.
> +
> +EXAMPLE
> +	crypto: crypto@1700000 {
> +                        compatible = "fsl,sec-v5.4", "fsl,sec-v5.0",
> +                                     "fsl,sec-v4.0";
> +                        fsl,sec-era = <8>;
> +                        #address-cells = <1>;
> +                        #size-cells = <1>;
> +                        ranges = <0x0 0x00 0x1700000 0x100000>;
> +                        reg = <0x00 0x1700000 0x0 0x100000>;
> +                        interrupts = <0 75 0x4>;
> +	}
> +
> +=====================================================================
> +Job Ring (JR) Node
> +
> +    Child of the crypto node defines data processing interface to SEC 5
> +    across the peripheral bus for purposes of processing
> +    cryptographic descriptors. The specified address
> +    range can be made visible to one (or more) cores.
> +    The interrupt defined for this node is controlled within
> +    the address range of this node.
> +
> +  - compatible
> +      Usage: required
> +      Value type: <string>
> +      Definition: Must include "fsl,sec-v5.4-job-ring".
> +
> +  - reg
> +      Usage: required
> +      Value type: <prop-encoded-array>
> +      Definition: Specifies a two JR parameters:  an offset from
> +           the parent physical address and the length the JR registers.
> +
> +   - interrupts
> +      Usage: required
> +      Value type: <prop_encoded-array>
> +      Definition:  Specifies the interrupts generated by this
> +           device.  The value of the interrupts property
> +           consists of one interrupt specifier. The format
> +           of the specifier is defined by the binding document
> +           describing the node's interrupt parent.
> +
> +EXAMPLE
> +	sec_jr0: jr@10000 {
> +		compatible = "fsl,sec-v5.4-job-ring",
> +			"fsl,sec-v5.0-job-ring",
> +			"fsl,sec-v4.0-job-ring";
> +			reg = <0x10000 0x10000>;
> +			interrupts = <0 71 0x4>;
> +	};
> +
> +===================================================================
> +Full Example
> +
> +Since some chips may contain more than one SEC, the dtsi contains
> +only the node contents, not the node itself.  A chip using the SEC
> +should include the dtsi inside each SEC node.  Example:
> +
> +In fsl-ls1012a.dtsi:
> +
> +	compatible = "fsl,sec-v5.4";
> +	fsl,sec-era = <8>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	sec_jr0: jr@10000 {
> +		compatible = "fsl,sec-v5.4-job-ring",
> +			"fsl,sec-v5.0-job-ring",
> +			"fsl,sec-v4.0-job-ring";
> +			reg = <0x10000 0x10000>;
> +			interrupts = <0 71 0x4>;
> +	};
> +	sec_jr1: jr@20000 {
> +		compatible = "fsl,sec-v5.4-job-ring",
> +			"fsl,sec-v5.0-job-ring",
> +			"fsl,sec-v4.0-job-ring";
> +			reg = <0x20000 0x10000>;
> +			interrupts = <0 72 0x4>;
> +	};
> +	sec_jr2: jr@30000 {
> +		compatible = "fsl,sec-v5.4-job-ring",
> +			"fsl,sec-v5.0-job-ring",
> +			"fsl,sec-v4.0-job-ring";
> +			reg = <0x30000 0x10000>;
> +			interrupts = <0 73 0x4>;
> +	};
> +	sec_jr3: jr@40000 {
> +		compatible = "fsl,sec-v5.4-job-ring",
> +			"fsl,sec-v5.0-job-ring",
> +			"fsl,sec-v4.0-job-ring";
> +			reg = <0x40000 0x10000>;
> +			interrupts = <0 74 0x4>;
> +	};
> 
