From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 6/8] ARM: dts: r8a77470: Initial SoC device tree
Date: Tue, 3 Apr 2018 08:43:29 +0000
Message-ID: <OSBPR01MB210392232C1B5393389EC3A2B8A50@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1522265176-33226-1-git-send-email-biju.das@bp.renesas.com>
 <1522265176-33226-7-git-send-email-biju.das@bp.renesas.com>
 <20180330065440.hbhr26aacokdivl7@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180330065440.hbhr26aacokdivl7@verge.net.au>
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
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Simon & Geert,

Thanks for feedback.

> On Wed, Mar 28, 2018 at 08:26:14PM +0100, Biju Das wrote:
> > The initial R8A77470 SoC device tree including CPU0, GIC, timer, SYSC,
> > RST, CPG, and the required clock descriptions.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > V1->V2:
> > * Incorporated geert's review comment
> > * Moved prr node inside soc node.
> >
> >  arch/arm/boot/dts/r8a77470.dtsi | 155
> > ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 155 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/r8a77470.dtsi
> >
> > diff --git a/arch/arm/boot/dts/r8a77470.dtsi
> > b/arch/arm/boot/dts/r8a77470.dtsi new file mode 100644 index
> > 0000000..f096419
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > @@ -0,0 +1,155 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the r8a77470 SoC
> > + *
> > + * Copyright (C) 2018 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/r8a77470-cpg-mssr.h>
> > +#include <dt-bindings/power/r8a77470-sysc.h>
>
> As requested by Geert in his review of v1, please use numerical values for the
> initial submission as the dt-bindings headers and the DTS files go upstream
> through different maintainer paths.
>
> In other words, please do not include r8a77470-cpg-mssr.h or r8a77470-sysc.h
> in the initial submission of this file as those header files will not be present and
> there will be a build failure.
> Rather, please use numeric values for now and, as a follow-up in the v4.19
> development cycle, provide a patch to use the headers.
>

I got your point now. Will send V3 for this patch with numerical values.





Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
