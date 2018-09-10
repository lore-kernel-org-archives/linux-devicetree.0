From: Nava kishore Manne <navam@xilinx.com>
Subject: RE: [RFC PATCH v3 2/3] dt-bindings: reset: Add bindings for ZynqMP
 reset driver
Date: Mon, 10 Sep 2018 04:43:27 +0000
Message-ID: <BYAPR02MB47104ED6BE886376B9232685C2050@BYAPR02MB4710.namprd02.prod.outlook.com>
References: <1536131342-28041-1-git-send-email-nava.manne@xilinx.com>
 <1536131342-28041-3-git-send-email-nava.manne@xilinx.com>
 <1536142188.4084.1.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1536142188.4084.1.camel@pengutronix.de>
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
To: Philipp Zabel <p.zabel@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, Rajan Vaja <RAJANV@xilinx.com>, Jolly Shah <JOLLYS@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Philipp

Thanks for the quick response..
Please find my commnets inline.

> -----Original Message-----
> From: Philipp Zabel [mailto:p.zabel@pengutronix.de]
> Sent: Wednesday, September 5, 2018 3:40 PM
> To: Nava kishore Manne <navam@xilinx.com>; robh+dt@kernel.org;
> mark.rutland@arm.com; Michal Simek <michals@xilinx.com>; Rajan Vaja
> <RAJANV@xilinx.com>; Jolly Shah <JOLLYS@xilinx.com>;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [RFC PATCH v3 2/3] dt-bindings: reset: Add bindings for ZynqMP
> reset driver
> 
> Hi,
> 
> On Wed, 2018-09-05 at 12:39 +0530, Nava kishore Manne wrote:
> > Add documentation to describe Xilinx ZynqMP reset driver bindings.
> >
> > Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> > ---
> > Changes for v3:
> > 		-Corrected Commit Msg.
> > Changes for v2:
> > 		-Moved reset node as a child to firwmare
> > 		 node.
> >
> >  .../firmware/xilinx/xlnx,zynqmp-firmware.txt       | 142
> +++++++++++++++++++++
> >  1 file changed, 142 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
> > re.txt
> > b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
> > re.txt
> > index 1b431d9..351b1bb 100644
> > ---
> > a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
> > re.txt
> > +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-fi
> > +++ rmware.txt
> [...]
> >  -------
> >  Example
> >  -------
> > @@ -25,5 +163,9 @@ firmware {
> >  	zynqmp_firmware: zynqmp-firmware {
> >  		compatible = "xlnx,zynqmp-firmware";
> >  		method = "smc";
> > +		reset-controller:reset-controller@0 {
> 
> I think the label should use underscore instead of hyphen, and the unit address
> part should be removed from the node name. There is no unit address, as there
> is no reg property inside the node and the parent node doesn't have #address-
> cells:
> 

Will fix in the next version.

Regards,
Navakishore.
