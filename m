From: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 2/3] phy: zynqmp: Add dt bindings for ZynqMP PHY.
Date: Mon, 18 Jan 2016 09:17:00 +0000
Message-ID: <F1B223389110CE49B4CF055ABA2E5D3D78CF6844@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1452694404-1253-1-git-send-email-sbhatta@xilinx.com>
 <20160115021016.GA19573@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160115021016.GA19573@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Friday, January 15, 2016 7:40 AM
> To: Subbaraya Sundeep Bhatta
> Cc: kishon-l0cyMroinI0@public.gmane.org; balbi-l0cyMroinI0@public.gmane.org; gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Subbaraya Sundeep
> Bhatta
> Subject: Re: [PATCH v2 2/3] phy: zynqmp: Add dt bindings for ZynqMP PHY.
> 
> On Wed, Jan 13, 2016 at 07:43:24PM +0530, Subbaraya Sundeep Bhatta wrote:
> > This patch adds the document describing dt bindings for ZynqMP PHY.
> > ZynqMP SOC has a High Speed Processing System Gigabit Transceiver
> > which provides PHY capabilties to USB, SATA, PCIE, Display Port and
> > Ehernet SGMII controllers.
> >
> > Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> >  v2:
> > 	modified to use phy cells as 2.
> >
> >  .../devicetree/bindings/phy/phy-zynqmp.txt         | 103
> +++++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> >
> > diff --git a/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> > b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> > new file mode 100644
> > index 0000000..975cf21
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> > @@ -0,0 +1,103 @@
> > +Xilinx ZynqMP PHY binding
> > +
> > +This binding describes a ZynqMP PHY device that is used to control
> > +ZynqMP High Speed Gigabit Transceiver(GT). ZynqMP PS GTR provides
> > +four lanes and are used by USB, SATA, PCIE, Display port and Ethernet
> SGMMI controllers.
> 
> s/SGMMI/SGMII/

Yeah, I will change it.
> 
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
> > +		   provides.
> > +
> > +Required properties (port (child) nodes):
> > +lane0:
> > +- #phy-cells	: Should be 2
> > +		  Cell after port phandle is device type from:
> > +			- <PHY_TYPE_PCIE 0>
> > +			- <PHY_TYPE_SATA 0>
> > +			- <PHY_TYPE_USB3 0>
> > +			- <PHY_TYPE_DP 1>
> > +			- <PHY_TYPE_SGMII 0>
> 
> What is the 2nd cell for? The phandle doesn't count for the size.

ZynMP SoC has 2 USB controllers, 1 SATA controller with 2 lanes,
1 PCIe controller with 4 lanes, 1 Display port with 2 lanes and
4 SGMII controllers. PHY provides 4 output lanes only for 14(PIPE) inputs 
(as mentioned above: 2 + 2 + 4 + 2+ 4 = 14). All the inputs are routed
to PHY output lanes with a Mux (Interconnect matrix). Only some combinations
are valid i.e, one cannot set mux to use USB1 on lane 0 as such. Here second
cell is input number.
 <PHY_TYPE_PCIE 0> derives to PCIe's lane 0 input in driver for which lane 0 of
PHY can be used.  The valid inputs of each PHY output lane are mentioned here.

> 
> However, I would simplify this to get rid of the sub nodes and set lane in the 1st
> cell and the type in the 2nd cell.

Sorry I did not get you on how to get rid of sub nodes. Could you please explain?

Thanks,
Sundeep
> 
> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
