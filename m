From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH 1/2] dt-bindings: soc: Add ZynqMP PM bindings
Date: Wed, 7 Mar 2018 22:55:09 +0000
Message-ID: <DM2PR0201MB0767A880059E70642B3EB431B8D80@DM2PR0201MB0767.namprd02.prod.outlook.com>
References: <1519773866-18196-1-git-send-email-jollys@xilinx.com>
 <1519773866-18196-2-git-send-email-jollys@xilinx.com>
 <20180305223328.la462hdwwsymvusk@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180305223328.la462hdwwsymvusk@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "andy.gross@linaro.org" <andy.gross@linaro.org>, Rajan Vaja <RAJANV@xilinx.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for the review,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Monday, March 05, 2018 2:33 PM
> To: Jolly Shah <JOLLYS@xilinx.com>
> Cc: matthias.bgg@gmail.com; andy.gross@linaro.org; shawnguo@kernel.org;
> geert+renesas@glider.be; bjorn.andersson@linaro.org;
> sean.wang@mediatek.com; m.szyprowski@samsung.com;
> michal.simek@xilinx.com; mark.rutland@arm.com; Rajan Vaja
> <RAJANV@xilinx.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Jolly Shah
> <JOLLYS@xilinx.com>
> Subject: Re: [PATCH 1/2] dt-bindings: soc: Add ZynqMP PM bindings
> 
> On Tue, Feb 27, 2018 at 03:24:25PM -0800, Jolly Shah wrote:
> > Add documentation to describe Xilinx ZynqMP power management bindings.
> >
> > Signed-off-by: Jolly Shah <jollys@xilinx.com>
> > Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> > ---
> >  .../bindings/soc/xilinx/xlnx,zynqmp-power.txt      | 28
> ++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-power.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-power.txt
> > b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-power.txt
> > new file mode 100644
> > index 0000000..5b7d963
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-power.t
> > +++ xt
> > @@ -0,0 +1,28 @@
> > +Xilinx Zynq MPSoC Power Management Device Tree Bindings
> > +
> > +The zynqmp-power node describes the power management configurations.
> 
> That really tells me nothing. What aspect of power management does this
> interface control?
> 

It controls remote suspend/shutdown interfaces. Will add details in next version.

> > +
> > +Required properties:
> > + - compatible	: Must contain:  "xlnx,zynqmp-power"
> > + - mbox-names	: Name given to channels seen in the 'mboxes' property.
> > +		  "rx" - Mailbox corresponding to receive path
> > +		  "tx" - Mailbox corresponding to transmit path
> > + - mboxes	: Standard property to specify a Mailbox. Each value of
> > +		  the mboxes property should contain a phandle to the
> > +		  mailbox controller device node and an args specifier
> > +		  that will be the phandle to the intended sub-mailbox
> > +		  child node to be used for communication. See
> > +		  Documentation/devicetree/bindings/mailbox/mailbox.txt
> > +		  for more details about the generic mailbox controller
> > +		  and client driver bindings. Also see
> > +		  Documentation/devicetree/bindings/mailbox/ \
> > +		  xlnx,zynqmp-ipi-mailbox.txt for typical controller that
> > +		  is used to communicate with this System controllers.
> 
> No need to define a standard property here. Just need to say how many entries
> and refer to the common binding.
> 

Ok. Will update same in next version.

> > +
> > +Examples:
> > +	zynqmp_power: zynqmp-power {
> > +		compatible = "xlnx,zynqmp-power";
> > +		mboxes = <&ipi_mailbox_pmu0 0>,
> > +			 <&ipi_mailbox_pmu0 1>;
> > +		mbox-names = "tx", "rx";
> > +	};
> > --
> > 2.7.4
> >
