From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PULL REQUEST v2] ARM: kirkwood: fdt: convert kirkwood init
 funcs to fdt
Date: Mon, 5 Mar 2012 22:41:26 +0100
Message-ID: <20120305214126.GA18513@lunn.ch>
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
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > If the drivers want to use it, I think it has to be orion_find_tclk for
> > drivers that are shared between multiple plat-orion platforms.
> 
> That's pretty much all of them  :-)
> 
> I'll rename it and move it to plat-orion/common.c.  This'll be fun.

Hi Jason

Maybe it is time to stop and consider a moment....

We have overlapping work going on. My adoption of Mike's generic clk
framework overlaps a lot with your DT tclk problems. If you introduce
orion_find_tclk() into all the drivers, we are probably going to rip
it all out again once my patches go in. Plus we are going to have
horrible merging conflicts between your code and my code

It seems more logical to get the clk code in first, then work on DT.

Could you task swap for a while? Maybe look at converting MPP to
pinmux and then add DT bindings for that. No tclk needed :-)

       Andrew
