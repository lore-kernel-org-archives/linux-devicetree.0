From: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] pinctrl: pinctrl-imx: add support for set bits
 for general purpose registers
Date: Tue, 17 Jul 2012 11:02:26 +0800
Message-ID: <20120717030225.GF19699@shlinux2.ap.freescale.net>
References: <1342084080-3145-1-git-send-email-b29396@freescale.com>
 <CACRpkdbHtgKLA3JJxc4VY35zSpJFvk15u62Z3aBCqERoeQ10CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbHtgKLA3JJxc4VY35zSpJFvk15u62Z3aBCqERoeQ10CA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Liu Hui-R64343 <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 15, 2012 at 04:43:03AM +0800, Linus Walleij wrote:
> On Thu, Jul 12, 2012 at 11:07 AM, Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> Hm, hm. This makes be ever more hesitant to have this in pinctrl.
> 
> Remeber again that nothing stops you from remapping the same register
> range in another driver.
> 
Well, i understand and agree with your point.
We will try and see if we can find a better place.

> > +#define IMX6Q_GPR0_CLOCK_8_MUX_SEL_MASK                (0x3 << 30)
> 
> This belongs in drivers/clk/*
> 
> Why funnel these register writes through pinctrl? Just remap that address
> offset in the clk driver.
> 
Hmm, i looked a bit more, not sure they could be put in driver/clk/*
The mux here are module internal clocks, like:
Selects the source of asrck_clock_3 in ASRC according to clock muxing scheme:
00 audmux.amx_output_rxclk_p7 muxed with ssi3.ssi_srck
01 audmux.amx_output_rxclk_p7
10 ssi3.ssi_srck
11 ssi3.rx_bit_clk

I'm not sure we should abstract them in clk framework since usually they're
internally controlled by module driver itself.

> > +#define IMX6Q_GPR0_DMAREQ_MUX_SEL7_MASK                BIT(7)
> 
> This belongs in drivers/dma/*
> 
> Same comments.
> 
> > +#define IMX6Q_GPR1_PCIE_REQ_MASK               (0x3 << 30)
> 
> Looks like it belongs in some PCI driver or glue layer.
> 
> > +#define IMX6Q_GPR1_MIPI_COLOR_SW               BIT(25)
> > +#define IMX6Q_GPR1_DPI_OFF                     BIT(24)
> 
> Looks related to some test or something...
> 
> And so on.
> 
Yes, most of them are modules specific.

> If you really wants a "funnel driver" doing all these diverse things,
> I'd put it in drivers/mfd.
Yes, we may wants this "funnel driver".
What i'm thinking is we may only provides setting api for conveniently use
and how drivers use it or abstract it is driver specific.

> 
> This whole issue appears in other systems so you're not alone
> on this, for example the ux500 PRCMU driver has exactly these
> properties.
> 
So how does ux500 PRCMU handle this?

> I'm also contemplating drivers/syscon again, but
> I have a hard time seeing it would be much more than another
> drivers/mfd-similar construct.
> 
yes, that may be a proper place.

> I would really like input from Arnd and Samuel and other clever
> people on the placement of drivers like this one :-/
> 
> But close address range proximity to the pin controller is not a
> reason to have it in pinctrl.
> 
Well, understand.

Regards
Dong Aisheng
