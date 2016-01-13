From: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/2] phy: zynqmp: Add dt bindings for ZynqMP PHY.
Date: Wed, 13 Jan 2016 11:49:06 +0000
Message-ID: <F1B223389110CE49B4CF055ABA2E5D3D78CDD5DB@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1452676943-18931-1-git-send-email-sbhatta@xilinx.com>
 <5696304A.8090508@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5696304A.8090508-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

> -----Original Message-----
> From: Kishon Vijay Abraham I [mailto:kishon-l0cyMroinI0@public.gmane.org]
> Sent: Wednesday, January 13, 2016 4:39 PM
> To: Subbaraya Sundeep Bhatta; robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
> Cc: balbi-l0cyMroinI0@public.gmane.org; gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Subbaraya Sundeep Bhatta
> Subject: Re: [PATCH 1/2] phy: zynqmp: Add dt bindings for ZynqMP PHY.
> 
> Hi,
> 
> On Wednesday 13 January 2016 02:52 PM, Subbaraya Sundeep Bhatta wrote:
> > This patch adds the document describing dt bindings for ZynqMP PHY.
> > ZynqMP SOC has a High Speed Processing System Gigabit Transceiver
> > which provides PHY capabilties to USB, SATA, PCIE, Display Port and
> > Ehernet SGMII controllers.
> >
> > Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/phy/phy-zynqmp.txt         | 104
> +++++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> >
> > diff --git a/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> > b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> > new file mode 100644
> > index 0000000..ec0d3de
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> > @@ -0,0 +1,104 @@
> > +Xilinx ZynqMP PHY binding
> > +
> > +This binding describes a ZynqMP PHY device that is used to control
> > +ZynqMP High Speed Gigabit Transceiver(GT). ZynqMP PS GTR provides
> > +four lanes and are used by USB, SATA, PCIE, Display port and Ethernet
> SGMMI controllers.
> > +
> > +Required properties (controller (parent) node):
> > +- compatible    : Should be "xlnx,zynqmp-psgtr"
> > +
> > +- reg		: Address and length of register sets for each device in
> > +		  "reg-names"
> > +- reg-names     : The names of the register addresses corresponding to the
> > +		  registers filled in "reg":
> > +			- serdes: SERDES block register set
> > +			- siou: SIOU block register set
> > +			- lpd: Low power domain peripherals reset control
> > +			- fpd: Full power domain peripherals reset control
> > +
> > +-xlnx,tx_termination_fix: Include fix for a functional issue in the GT. The TX
> > +			  termination resistance can be out of spec due to a
> > +			  bug in the calibration logic. This issue will be fixed
> > +			  in silicon in future versions.
> > +
> > +Required nodes	:  A sub-node is required for each lane the controller
> > +		   provides. These nodes are translated by the driver's
> > +		   .xlate() function.
> 
> driver details need not be in the binding documentation.

Ok will remove this.
> > +
> > +Required properties (port (child) nodes):
> > +lane0:
> > +- #phy-cells	: Should be 1
> > +		  Cell after port phandle is device type from:
> > +			- XPSGTR_TYPE_PCIE_0
> > +			- XPSGTR_TYPE_SATA_0
> > +			- XPSGTR_TYPE_USB0
> > +			- XPSGTR_TYPE_DP_1
> > +			- XPSGTR_TYPE_SGMII0
> 
> Why not use the already existing PHY TYPES?
> phy-cells can be made as '2' and the last cell can be used as index if that's
> required.

PCIE_0 means lane 0 of PCIe controller and USB0 is USB 0 controller
(there are two USB controllers). To differentiate I named like above.
phy-cells with 2 sounds good. Shall I add PHY_TYPE_SGMII to
include/dt-bindings/phy/phy.h and remove the phy-zynqmp.h ?

Thanks,
Sundeep.B.S.

> 
> Thanks
> Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
