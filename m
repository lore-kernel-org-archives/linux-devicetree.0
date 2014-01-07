From: Jingchang Lu <jingchang.lu@freescale.com>
Subject: RE: [PATCH] ARM: dts: vf610: use the interrupt macros
Date: Tue, 7 Jan 2014 09:39:09 +0000
Message-ID: <e1421f5854394a4797628684293397da@BL2PR03MB467.namprd03.prod.outlook.com>
References: <1387952367-6321-1-git-send-email-b32955@freescale.com>
 <20140106060429.GC27227@S2101-09.ap.freescale.net>
 <20140107075217.GA27279@shlinux2.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140107075217.GA27279@shlinux2.ap.freescale.net>
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
To: "shijie.huang@freescale.com" <shijie.huang@freescale.com>, Shawn Guo <shawn.guo@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Huang Shijie [mailto:b32955@freescale.com]
> Sent: Tuesday, January 07, 2014 3:52 PM
> To: Shawn Guo
> Cc: Lu Jingchang-B35083; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH] ARM: dts: vf610: use the interrupt macros
> 
> On Mon, Jan 06, 2014 at 02:04:33PM +0800, Shawn Guo wrote:
> > On Wed, Dec 25, 2013 at 02:19:27PM +0800, Huang Shijie wrote:
> > > This patch uses the IRQ_TYPE_LEVEL_HIGH/IRQ_TYPE_NONE to replace
> > > the hardcode.
> > >
> > > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > > ---
> > >  arch/arm/boot/dts/vf610.dtsi |   37 +++++++++++++++++++-------------
> -----
> > >  1 files changed, 19 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/vf610.dtsi
> b/arch/arm/boot/dts/vf610.dtsi
> > > index ef8a0ee..cd5bb86 100644
> > > --- a/arch/arm/boot/dts/vf610.dtsi
> > > +++ b/arch/arm/boot/dts/vf610.dtsi
> > > @@ -10,6 +10,7 @@
> > >  #include "skeleton.dtsi"
> > >  #include "vf610-pingrp.h"
> > >  #include <dt-bindings/clock/vf610-clock.h>
> > > +#include <dt-bindings/interrupt-controller/irq.h>
> > >
> > >  / {
> > >  	aliases {
> > > @@ -90,7 +91,7 @@
> > >  			uart0: serial@40027000 {
> > >  				compatible = "fsl,vf610-lpuart";
> > >  				reg = <0x40027000 0x1000>;
> > > -				interrupts = <0 61 0x00>;
> >
> > Why is it so special having a 0x00 IRQ trigger type?  Or is it just a
> > typo?  While we are at it, we should probably fix it if it's a typo.
> hi Jingchang:
>   i think it is a typo.
> 
> do you any idea about it?
  Yes, it is a typo I made, please help fix it here.
  Thanks!
  Jingchang

> 
> thanks
> Huang Shijie
> >
> > Shawn
> >
> > > +				interrupts = <0 61 IRQ_TYPE_NONE>;
> > >  				clocks = <&clks VF610_CLK_UART0>;
> > >  				clock-names = "ipg";
> > >  				status = "disabled";
> > > @@ -99,7 +100,7 @@
> > >  			uart1: serial@40028000 {
> > >  				compatible = "fsl,vf610-lpuart";
> > >  				reg = <0x40028000 0x1000>;
> > > -				interrupts = <0 62 0x04>;
> > > +				interrupts = <0 62 IRQ_TYPE_LEVEL_HIGH>;
> > >  				clocks = <&clks VF610_CLK_UART1>;
> > >  				clock-names = "ipg";
> > >  				status = "disabled";
