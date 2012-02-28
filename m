From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH WIP] ARM: kirkwood: covert orion-spi to fdt.
Date: Tue, 28 Feb 2012 10:40:59 +0100
Message-ID: <20120228094059.GA27255@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > @@ -524,6 +528,13 @@ static int __init kirkwood_clock_gate(void)
> >       } else  /* keep this bit set for devices that don't have PCIe1 */
> >               kirkwood_clk_ctrl |= CGC_PEX1;
> >
> > +#ifdef CONFIG_OF
> > +     dp = of_find_node_by_path("/");
> > +     if (of_device_is_available(of_find_compatible_node(dp, NULL,
> > +
> +"marvell,orion-spi")))
> > +             kirkwood_clk_ctrl |= CGC_RUNIT;
> > +#endif
> > +
> >       /* Now gate clock the required units */
> >       writel(kirkwood_clk_ctrl, CLOCK_GATING_CTRL);
> >       printk(KERN_DEBUG " after: 0x%08x\n", readl(CLOCK_GATING_CTRL));
> 
> This looks like it could be improved by only enabling the clock
> if we actually start using the device from the spi driver, in its
> probe function. Not sure if that's worth it.

I have two comments about this:

I think this code belongs on the board-dts.c file. kirkwood_clk_ctrl
is a global so can be set from anywhere. It is also set in other files
than common.c, eg pcie.c.

In the end, i hope this all goes away. I have patches based on Mike's
generic clk infrastructure, which adds clk/clkdev to all orion based
machines. So the SPI driver, in its probe function will get its clock,
enable it, and also find out the speed of it. The release function
also disables the clock, turning it off if nobody else is using it. 

I just hope the generic clk does not take too long to land.

  Andrew
