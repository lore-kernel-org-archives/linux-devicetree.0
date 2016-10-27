From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/6] dt/bindings: adjust bindings for Layerscape SCFG MSI
Date: Thu, 27 Oct 2016 15:18:54 +0100
Message-ID: <20161027141826.GC30535@leverpostej>
References: <1477398945-22774-1-git-send-email-Minghuan.Lian@nxp.com>
 <20161026103101.GC19965@leverpostej>
 <DB4PR04MB07813D4DA5D5567229394A7D8FAB0@DB4PR04MB0781.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <DB4PR04MB07813D4DA5D5567229394A7D8FAB0@DB4PR04MB0781.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leo Li <leoyang.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Stuart Yoder <stuart.yoder@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Scott Wood <scott.wood@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 26, 2016 at 10:09:07PM +0000, Leo Li wrote:
> 
> > -----Original Message-----
> > From: Mark Rutland [mailto:mark.rutland@arm.com]
> > Sent: Wednesday, October 26, 2016 5:31 AM
> > To: M.H. Lian <minghuan.lian@nxp.com>
> > Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; Marc Zyngier <marc.zyngier@arm.com>; Stuart
> > Yoder <stuart.yoder@nxp.com>; Leo Li <leoyang.li@nxp.com>; Scott Wood
> > <scott.wood@nxp.com>; Shawn Guo <shawnguo@kernel.org>; Mingkai Hu
> > <mingkai.hu@nxp.com>
> > Subject: Re: [PATCH 1/6] dt/bindings: adjust bindings for Layerscape SCFG MSI
> > 
> > On Tue, Oct 25, 2016 at 08:35:40PM +0800, Minghuan Lian wrote:

> > > -- compatible: should be "fsl,<soc-name>-msi" to identify
> > > -	      Layerscape PCIe MSI controller block such as:
> > > -              "fsl,1s1021a-msi"
> > > -              "fsl,1s1043a-msi"
> > > +- compatible: should be "fsl,ls-scfg-msi"
> > 
> > This breaks old DTBs, and throws away information which you describe above as
> > valuable. So another NAK for that.
> 
> I agree with you that we should maintain the backward compatibility.
> But on the other hand, I just found that there is a silly typo in the
> original binding that "ls" is wrongly spelled as "1s" and they look
> too close to be noticed in previous patch reviews.  :(

Sure, that's annoying, but we're stuck with it.

> The driver and all the DTSes used the binding with the typo which
> covered up the problem.  So even if we want to keep the
> "fsl,<soc-name>-msi" binding, we probably want to fix the typo, right?
> And that breaks the backward compatibility too.

Regardless of what we do, we should *not* break compatibility. The old
strings must remain.

However, we can *add* correctly-spelt variants, and mark the existing
strings as deprecated (in both the binding and driver). The in-kernel
dts can be updated to use the correctly-spelt strings.

Thanks,
Mark.
