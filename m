From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 14/14] ARM: kirkwood: use devicetree to init sata_mv
Date: Wed, 7 Mar 2012 18:40:09 +0000
Message-ID: <201203071840.09572.arnd@arndb.de>
References: <cover.1331090356.git.jason@lakedaemon.net>
 <8503a766f6f75c9acf49abd66d9cdce54807b2b2.1331090356.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <8503a766f6f75c9acf49abd66d9cdce54807b2b2.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 07 March 2012, Jason Cooper wrote:
> @@ -504,6 +504,16 @@ static int __init kirkwood_clock_gate(void)
>                 kirkwood_clk_ctrl |= CGC_USB0;
>                 of_node_put(np);
>         }
> +
> +       np = of_find_compatible_node(NULL, NULL, "mrvl,orion-sata");
> +       if (np && of_device_is_available(np)) {
> +               int nr_ports;
> +               kirkwood_clk_ctrl |= CGC_SATA0;
> +               of_property_read_u32(np, "nr-ports", &nr_ports);
> +               if (nr_ports > 1)
> +                       kirkwood_clk_ctrl |= CGC_SATA1;
> +               of_node_put(np);
> +       }
>  #endif
>  
>         /* For SATA: first shutdown the phy */

Is it guaranteed that it's always the first port that gets used if there
is only one? If not, this might turn on the wrong one.

	Arnd
