From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH net-next v3 4/4] dt-bindings: net: freescale: enetc: Add
 connection bindings for ENETC ethernet nodes
Date: Mon, 25 Feb 2019 16:16:18 +0000
Message-ID: <VI1PR04MB488025A0352E15A1DE33B2BF967A0@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1550847859-17346-1-git-send-email-claudiu.manoil@nxp.com>
 <1550847859-17346-5-git-send-email-claudiu.manoil@nxp.com>
 <20190222233732.GA1518@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222233732.GA1518@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

>-----Original Message-----
>From: Rob Herring <robh@kernel.org>
>Sent: Saturday, February 23, 2019 1:38 AM
>To: Claudiu Manoil <claudiu.manoil@nxp.com>
>Cc: Shawn Guo <shawnguo@kernel.org>; Leo Li <leoyang.li@nxp.com>; David S =
.
>Miller <davem@davemloft.net>; Alexandru Marginean
><alexandru.marginean@nxp.com>; linux-arm-kernel@lists.infradead.org;
>devicetree@vger.kernel.org; netdev@vger.kernel.org; linux-
>kernel@vger.kernel.org
>Subject: Re: [PATCH net-next v3 4/4] dt-bindings: net: freescale: enetc: A=
dd
>connection bindings for ENETC ethernet nodes
>
>On Fri, Feb 22, 2019 at 05:04:19PM +0200, Claudiu Manoil wrote:
>> Define connection bindings (external PHY connections and internal
>> links) for the ENETC on-chip ethernet controllers.
>>
>> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
>> ---
>> v3 - added this patch to the set
>>
>>  .../devicetree/bindings/net/fsl-enetc.txt          | 109 ++++++++++++++=
+++++++
>>  1 file changed, 109 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/net/fsl-enetc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/fsl-enetc.txt
>> b/Documentation/devicetree/bindings/net/fsl-enetc.txt
>> new file mode 100644
>> index 0000000..2fbb998
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/fsl-enetc.txt
>> @@ -0,0 +1,109 @@
>> +* ENETC ethernet nodes - external connection bindings
>> +
>> +The ENETC ethernet controllers are PCIe integrated endpoints (IEPs),
>> +on-chip devices discoverable as standard PCIe endpoints, integrated
>> +into Freescale SoCs.  The ENETC devices are self contained, the
>> +information needed for device initialization is available in hardware
>> +(PCIe ECAM area).  However, depending on board design, their external
>> +connections are configurable.
>> +As usual for SoCs, device tree nodes may be used to define these
>> +external connections.  The rest of the document specifies how
>> +external connections for ENETC ethernet controllers may be defined
>> +via device tree nodes.
>> +
>> +Silicon (SoC) availability (<SoC name>: <SoC DT path/name>)
>> +	- LS1028A: [arch/arm64]	[...]freescale/fsl-ls1028a.dtsi
>
>This doesn't belong in bindings.
>
>> +
>> +
>> +* ENETC nodes
>> +
>> +Defined in the SoC device tree as "pci" child nodes of the
>> +"pci-host-ecam-generic" compatible "pcie" parent node also known as
>> +the Integrated Endpoint Root Complex (IERC) SoC node.
>
>The host controller attachment is also outside the scope of this binding.
>
>> +
>> +Structure - example (LS1028A):
>> +
>> +	pcie@1f0000000 {
>> +		compatible =3D "pci-host-ecam-generic";
>> +		device_type =3D "pci";
>> +		...
>> +		enetc_port0: pci@0,0 {
>
>The node name 'pci' is reserved for bridges. This should match the device =
class if
>possible (ethernet).
>
>> +			reg =3D <0x000000 0 0 0 0>;
>> +		};
>> +		enetc_port1: pci@0,1 {
>> +			reg =3D <0x000100 0 0 0 0>;
>> +		};
>> +		...
>> +	}
>> +
>> +Each ENETC node has a device number and a function number (expressed
>> +by its "reg" property and pci node name, i.e. "pci@0,1" represents
>> +device number 0 and functions number 1).  Only the standard pci "reg"
>> +property is needed here.
>
>There should be a compatible too.
[...]

Ok to simplifying the text and document strictly the enetc device nodes as
"ethernet" nodes, like "ethernet@<dev_no>,<fcn_no>" (i.e ethernet@0,1).
But what would be the compatible string needed for?
The ethernet device driver doesn't need it, probing is done by the pci syst=
em.
Is it ok to use a generic name for the compatible string, like, "fsl,enetc"=
, just
to indicate that the relevant driver is located at ethernet/freescale/enetc=
/
dir in the source code? (under drivers/net, of course)

Thanks.
Claudiu
