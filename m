From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 14/14] ARM: kirkwood: use devicetree to init sata_mv
Date: Wed, 7 Mar 2012 13:52:04 -0500
Message-ID: <20120307185204.GD5050@titan.lakedaemon.net>
References: <cover.1331090356.git.jason@lakedaemon.net>
 <8503a766f6f75c9acf49abd66d9cdce54807b2b2.1331090356.git.jason@lakedaemon.net>
 <201203071840.09572.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203071840.09572.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 07, 2012 at 06:40:09PM +0000, Arnd Bergmann wrote:
> On Wednesday 07 March 2012, Jason Cooper wrote:
> > @@ -504,6 +504,16 @@ static int __init kirkwood_clock_gate(void)
> >                 kirkwood_clk_ctrl |= CGC_USB0;
> >                 of_node_put(np);
> >         }
> > +
> > +       np = of_find_compatible_node(NULL, NULL, "mrvl,orion-sata");
> > +       if (np && of_device_is_available(np)) {
> > +               int nr_ports;
> > +               kirkwood_clk_ctrl |= CGC_SATA0;
> > +               of_property_read_u32(np, "nr-ports", &nr_ports);
> > +               if (nr_ports > 1)
> > +                       kirkwood_clk_ctrl |= CGC_SATA1;
> > +               of_node_put(np);
> > +       }
> >  #endif
> >  
> >         /* For SATA: first shutdown the phy */
> 
> Is it guaranteed that it's always the first port that gets used if there
> is only one? If not, this might turn on the wrong one.

This is the same logic as mach-kirkwood/common.c:176

void __init kirkwood_sata_init(struct mv_sata_platform_data *sata_data)
{
        kirkwood_clk_ctrl |= CGC_SATA0;
        if (sata_data->n_ports > 1)
                kirkwood_clk_ctrl |= CGC_SATA1;

        orion_sata_init(sata_data, SATA_PHYS_BASE, IRQ_KIRKWOOD_SATA);
}

So, I don't think I'm introducing a regression.

thx,

Jason.
