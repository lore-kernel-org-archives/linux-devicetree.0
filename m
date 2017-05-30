From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r7s72100: add clock bit definitions
Date: Tue, 30 May 2017 10:42:28 +0200
Message-ID: <20170530084227.GC32139@verge.net.au>
References: <20170525160548.103182-1-chris.brandt@renesas.com>
 <CAMuHMdW21gwJZxCMsepX9c3hqpfw_+zc1x_f-6D0oKFVvqY2Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW21gwJZxCMsepX9c3hqpfw_+zc1x_f-6D0oKFVvqY2Kg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 29, 2017 at 11:31:37AM +0200, Geert Uytterhoeven wrote:
> Hi Chris,
> 
> On Thu, May 25, 2017 at 6:05 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> > Add the remaining bit locations for the module stop clock registers.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Chris, please address Geert's review and repost as appropriate.

> 
> > --- a/include/dt-bindings/clock/r7s72100-clock.h
> > +++ b/include/dt-bindings/clock/r7s72100-clock.h
> > @@ -13,7 +13,14 @@
> >  #define R7S72100_CLK_PLL       0
> 
> No CoreSight (MSTP20)?
> 
> >  /* MSTP3 */
> > +#define R7S72100_CLK_IEBUS     7
> > +#define R7S72100_CLK_IRDA      6
> > +#define R7S72100_CLK_LIN0      5
> > +#define R7S72100_CLK_LIN1      4
> >  #define R7S72100_CLK_MTU2      3
> > +#define R7S72100_CLK_CAN       2
> > +#define R7S72100_CLK_ADCPWR    1
> > +#define R7S72100_CLK_MCPWM     0
> 
> Perhaps just R7S72100_CLK_PWM?
> 
> >  /* MSTP4 */
> >  #define R7S72100_CLK_SCIF0     7
> > @@ -26,25 +33,51 @@
> >  #define R7S72100_CLK_SCIF7     0
> >
> >  /* MSTP5 */
> > +#define R7S72100_CLK_SCI0      7
> > +#define R7S72100_CLK_SCI1      6
> > +#define R7S72100_CLK_SNDGEN0   5
> > +#define R7S72100_CLK_SNDGEN1   4
> > +#define R7S72100_CLK_SNDGEN2   3
> > +#define R7S72100_CLK_SNDGEN3   2
> 
> R7S72100_CLK_SG[0-3]?
> 
> >  #define R7S72100_CLK_OSTM0     1
> >  #define R7S72100_CLK_OSTM1     0
> >
> >  /* MSTP6 */
> > +#define R7S72100_CLK_ADC       7
> > +#define R7S72100_CLK_CEU       6
> > +#define R7S72100_CLK_DOC0      5
> > +#define R7S72100_CLK_DOC1      4
> > +#define R7S72100_CLK_DRC0      3
> > +#define R7S72100_CLK_DRC1      2
> > +#define R7S72100_CLK_JCU       1
> >  #define R7S72100_CLK_RTC       0
> >
> >  /* MSTP7 */
> > +#define R7S72100_CLK_VDEC0     7
> > +#define R7S72100_CLK_VDEC1     6
> 
> R7S72100_CLK_VIN[01]?
> 
> >  #define R7S72100_CLK_ETHER     4
> > +#define R7S72100_CLK_NAND      3
> >  #define R7S72100_CLK_USB0      1
> >  #define R7S72100_CLK_USB1      0
> >
> >  /* MSTP8 */
> > +#define R7S72100_CLK_IMR0      7
> > +#define R7S72100_CLK_IMR1      6
> > +#define R7S72100_CLK_IMRDISP   5
> >  #define R7S72100_CLK_MMCIF     4
> > +#define R7S72100_CLK_MLB       3
> > +#define R7S72100_CLK_ETHABV    2
> 
> R7S72100_CLK_ETHAVB
> 
> > +#define R7S72100_CLK_SCUX      1
> >
> >  /* MSTP9 */
> >  #define R7S72100_CLK_I2C0      7
> >  #define R7S72100_CLK_I2C1      6
> >  #define R7S72100_CLK_I2C2      5
> >  #define R7S72100_CLK_I2C3      4
> > +#define R7S72100_CLK_SPIMBC0   3
> > +#define R7S72100_CLK_SPIMBC1   2
> 
> R7S72100_CLK_SPB[0-1]?
> All related registers and clocks are called SPB<something>.
> 
> > +#define R7S72100_CLK_VDC50     1       /* and LVDS */
> > +#define R7S72100_CLK_VDC51     0
> >
> >  /* MSTP10 */
> >  #define R7S72100_CLK_SPI0      7
> > @@ -52,6 +85,9 @@
> >  #define R7S72100_CLK_SPI2      5
> >  #define R7S72100_CLK_SPI3      4
> >  #define R7S72100_CLK_SPI4      3
> > +#define R7S72100_CLK_CDROM     2
> > +#define R7S72100_CLK_SPDIF     1
> > +#define R7S72100_CLK_RGPVG2    0
> 
> No SSI (MSTP11[0-5])?
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
