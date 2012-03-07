From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 14/14] ARM: kirkwood: use devicetree to init sata_mv
Date: Wed, 7 Mar 2012 19:00:47 +0000
Message-ID: <201203071900.48096.arnd@arndb.de>
References: <cover.1331090356.git.jason@lakedaemon.net>
 <201203071840.09572.arnd@arndb.de>
 <20120307185204.GD5050@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120307185204.GD5050-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 07 March 2012, Jason wrote:
> > Is it guaranteed that it's always the first port that gets used if there
> > is only one? If not, this might turn on the wrong one.
> 
> This is the same logic as mach-kirkwood/common.c:176
> 
> void __init kirkwood_sata_init(struct mv_sata_platform_data *sata_data)
> {
>         kirkwood_clk_ctrl |= CGC_SATA0;
>         if (sata_data->n_ports > 1)
>                 kirkwood_clk_ctrl |= CGC_SATA1;
> 
>         orion_sata_init(sata_data, SATA_PHYS_BASE, IRQ_KIRKWOOD_SATA);
> }
> 
> So, I don't think I'm introducing a regression.

Ok, good point. I was wondering whether the individual ports should
be modeled in the device tree, but I guess it's not necessary if nobody
needed this so far.

	Arnd
