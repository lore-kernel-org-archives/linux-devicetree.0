From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: soc: Add ZynqMP PM bindings
Date: Fri, 24 Aug 2018 22:15:13 +0000
Message-ID: <CY1PR02MB213857834064CF182DA72704B8360@CY1PR02MB2138.namprd02.prod.outlook.com>
References: <1534446483-12156-1-git-send-email-jollys@xilinx.com>
 <1534446483-12156-2-git-send-email-jollys@xilinx.com>
 <20180820194057.GA21738@bogus> <20180820194906.GB26783@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180820194906.GB26783@bogus>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "andy.gross@linaro.org" <andy.gross@linaro.org>, Rajan Vaja <RAJANV@xilinx.com>, Michal Simek <michals@xilinx.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Monday, August 20, 2018 12:49 PM
> To: Jolly Shah <JOLLYS@xilinx.com>
> Cc: matthias.bgg@gmail.com; andy.gross@linaro.org; shawnguo@kernel.org;
> geert+renesas@glider.be; bjorn.andersson@linaro.org;
> sean.wang@mediatek.com; m.szyprowski@samsung.com; Michal Simek
> <michals@xilinx.com>; mark.rutland@arm.com; Rajan Vaja
> <RAJANV@xilinx.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Rajan Vaja
> <RAJANV@xilinx.com>; Jolly Shah <JOLLYS@xilinx.com>
> Subject: Re: [PATCH v2 1/3] dt-bindings: soc: Add ZynqMP PM bindings
> 
> On Mon, Aug 20, 2018 at 02:40:57PM -0500, Rob Herring wrote:
> > On Thu, Aug 16, 2018 at 12:08:01PM -0700, Jolly Shah wrote:
> > > From: Rajan Vaja <rajan.vaja@xilinx.com>
> > >
> > > Add documentation to describe Xilinx ZynqMP power management
> > > bindings.
> > >
> > > Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> > > Signed-off-by: Jolly Shah <jollys@xilinx.com>
> > > ---
> > >  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt    | 16
> ++++++++++++++++
> 
> Also, this should be located in bindings/power/reset/

Base firmware node has clock subnode too. Do you still suggest to move bindings to "bindings/power/reset/" or keep it 
under "bindings/firmware" ?

Thanks,
Jolly Shah

> 
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firm
> > > ware.txt
> > > b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firm
> > > ware.txt
> > > index d215d15..cb9a6b7 100644
> > > ---
> > > a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firm
> > > ware.txt
> > > +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-
> > > +++ firmware.txt
> > > @@ -64,6 +64,17 @@ Output clocks are registered based on clock
> > > information received  from firmware. Output clocks indexes are
> > > mentioned in  include/dt-bindings/clock/xlnx,zynqmp-clk.h.
> > >
> > > +-------------------------------------------------------------------
> > > +- Device Tree Bindings for the Xilinx Zynq MPSoC Power Management
> > > +-------------------------------------------------------------------
> > > +- The zynqmp-power node describes the power management
> > > +configurations.
> > > +It will control remote suspend/shutdown interfaces.
> > > +
> > > +Required properties:
> > > + - compatible:		Must contain:	"xlnx,zynqmp-power"
> > > + - interrupt-parent:	Interrupt controller the interrupt is routed through
> >
> > interrupt-parent is implied and could be in a parent node, so remove.
> >
> > With that,
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > > + - interrupts:		Interrupt specifier
> > > +
> > >  -------
> > >  Example
> > >  -------
> > > @@ -78,5 +89,10 @@ firmware {
> > >  			clocks = <&pss_ref_clk>, <&video_clk>,
> <&pss_alt_ref_clk>, <&aux_ref_clk>, <&gt_crx_ref_clk>;
> > >  			clock-names = "pss_ref_clk", "video_clk",
> "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
> > >  		};
> > > +		zynqmp_power: zynqmp-power {
> > > +			compatible = "xlnx,zynqmp-power";
> > > +			interrupt-parent = <&gic>;
> > > +			interrupts = <0 35 4>;
> > > +		};
> > >  	};
> > >  };
> > > --
> > > 2.7.4
> > >
