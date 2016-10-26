From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH 1/6] dt/bindings: adjust bindings for Layerscape SCFG MSI
Date: Wed, 26 Oct 2016 22:09:07 +0000
Message-ID: <DB4PR04MB07813D4DA5D5567229394A7D8FAB0@DB4PR04MB0781.eurprd04.prod.outlook.com>
References: <1477398945-22774-1-git-send-email-Minghuan.Lian@nxp.com>
 <20161026103101.GC19965@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161026103101.GC19965@leverpostej>
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
To: Mark Rutland <mark.rutland@arm.com>, "M.H. Lian" <minghuan.lian@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Stuart Yoder <stuart.yoder@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <scott.wood@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland@arm.com]
> Sent: Wednesday, October 26, 2016 5:31 AM
> To: M.H. Lian <minghuan.lian@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; Marc Zyngier <marc.zyngier@arm.com>; Stuart
> Yoder <stuart.yoder@nxp.com>; Leo Li <leoyang.li@nxp.com>; Scott Wood
> <scott.wood@nxp.com>; Shawn Guo <shawnguo@kernel.org>; Mingkai Hu
> <mingkai.hu@nxp.com>
> Subject: Re: [PATCH 1/6] dt/bindings: adjust bindings for Layerscape SCFG MSI
> 
> On Tue, Oct 25, 2016 at 08:35:40PM +0800, Minghuan Lian wrote:
> > 1. The different version of a SoC may have different MSI
> > implementation. But compatible "fsl,<soc-name>-msi" can not describe
> > the SoC version.
> 
> Surely, "fsl,<soc-name>-<rev>-msi" can describe this?
> 
> If the hardware differs, it needs a new compatible string.
> 
> If there's some configuration value that varies across revisions (e.g.
> number of slots), you can add a proeprty to describe that explciitly.
> 
> > The MSI driver will use SoC match interface to get SoC type and
> > version instead of compatible string. So all MSI node can use the
> > common compatible "fsl,ls-scfg-msi" and the original compatible is
> > unnecessary.
> >
> > 2. Layerscape SoCs may have one or several MSI controllers.
> > In order to increase MSI interrupt number of a PCIe, the patch moves
> > all MSI node into the parent node "msi-controller". So a PCIe can
> > request MSI from all the MSI controllers.
> 
> This is not necessary, and does not represent a real block of hardware.
> So NAK for this approach.
> 
> The msi-parent property can contain a list of MSI controllers. See the examples
> in Documentation/devicetree/bindings/interrupt-controller/msi.txt.
> Likewise, the msi-map property can map to a number of MSI controllers.
> 
> If the core code can only consider one at a time, then that's an issue to be
> addressed in core code, not one to be bodged around in bindings.
> 
> >
> > Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> > ---
> >  .../interrupt-controller/fsl,ls-scfg-msi.txt       | 57 +++++++++++++++++++---
> >  1 file changed, 49 insertions(+), 8 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-m
> > si.txt
> > b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-m
> > si.txt
> > index 9e38949..29f95fd 100644
> > ---
> > a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-m
> > si.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-sc
> > +++ fg-msi.txt
> > @@ -1,18 +1,28 @@
> >  * Freescale Layerscape SCFG PCIe MSI controller
> >
> > +Layerscape SoCs may have one or multiple MSI controllers.
> > +Each MSI controller must be showed as a child node.
> > +
> >  Required properties:
> >
> > -- compatible: should be "fsl,<soc-name>-msi" to identify
> > -	      Layerscape PCIe MSI controller block such as:
> > -              "fsl,1s1021a-msi"
> > -              "fsl,1s1043a-msi"
> > +- compatible: should be "fsl,ls-scfg-msi"
> 
> This breaks old DTBs, and throws away information which you describe above as
> valuable. So another NAK for that.

I agree with you that we should maintain the backward compatibility.  But on the other hand, I just found that there is a silly typo in the original binding that "ls" is wrongly spelled as "1s" and they look too close to be noticed in previous patch reviews.  :(  The driver and all the DTSes used the binding with the typo which covered up the problem.  So even if we want to keep the "fsl,<soc-name>-msi" binding, we probably want to fix the typo, right?  And that breaks the backward compatibility too.

Regards,
Leo
