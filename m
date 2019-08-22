From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/19] dt-bindings: arm: mrvl: Document MMP3 compatible string
Date: Thu, 22 Aug 2019 07:42:42 -0500
Message-ID: <CAL_Jsq+BVUX3MMjsjK+hhjgDzdiqoo8dwEMD_98OrkGMOQf8GA@mail.gmail.com>
References: <20190809093158.7969-1-lkundrak@v3.sk> <20190809093158.7969-3-lkundrak@v3.sk>
 <20190821210349.GA29732@bogus> <c859d12167d18c21dda13b30c2dd3256f407d1d9.camel@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c859d12167d18c21dda13b30c2dd3256f407d1d9.camel@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 3:12 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> On Wed, 2019-08-21 at 16:03 -0500, Rob Herring wrote:
> > On Fri, Aug 09, 2019 at 11:31:41AM +0200, Lubomir Rintel wrote:
> > > Marvel MMP3 is a successor to MMP2, containing similar peripherals with two
> > > PJ4B cores.
> > >
> > > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > > ---
> > >  Documentation/devicetree/bindings/arm/mrvl/mrvl.txt | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt b/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> > > index 951687528efb0..66e1e1414245b 100644
> > > --- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> > > +++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> > > @@ -12,3 +12,7 @@ Required root node properties:
> > >  MMP2 Brownstone Board
> > >  Required root node properties:
> > >     - compatible = "mrvl,mmp2-brownstone", "mrvl,mmp2";
> > > +
> > > +MMP3 SoC
> > > +Required root node properties:
> > > +   - compatible = "marvell,mmp3";
> >
> > Please convert this file to DT schema before adding new SoCs.
>
> Is this something that should generally be done for all new or changed
> DT bindings?

Preferred, but not quite yet required everywhere. It depends on the
maintainer/subsystem still. But for board level bindings, you'll
notice most of them are converted. Marvell, Broadcom, and TI are the
main ones left.

Rob
