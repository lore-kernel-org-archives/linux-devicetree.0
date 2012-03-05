From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PULL REQUEST v2] ARM: kirkwood: fdt: convert kirkwood init
 funcs to fdt
Date: Mon, 5 Mar 2012 15:29:41 -0500
Message-ID: <20120305202941.GN5050@titan.lakedaemon.net>
References: <cover.1330709314.git.jason@lakedaemon.net>
 <alpine.LFD.2.02.1203051344130.31242@xanadu.home>
 <20120305191546.GK5050@titan.lakedaemon.net>
 <201203052016.26949.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203052016.26949.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 05, 2012 at 08:16:26PM +0000, Arnd Bergmann wrote:
> On Monday 05 March 2012, Jason wrote:
> > > 
> > > The clock frequency part being hardcoded to 200000 in the common .dtsi 
> > > file looks wrong.  The clock may differ, and it used to (and should) be 
> > > probed at run time, please see kirkwood_find_tclk().
> > 
> > So, should I EXPORT_SYMBOL_GPL(kirkwood_find_tclk); and have each driver
> > call it?
> 
> If the drivers want to use it, I think it has to be orion_find_tclk for
> drivers that are shared between multiple plat-orion platforms.

That's pretty much all of them  :-)

I'll rename it and move it to plat-orion/common.c.  This'll be fun.

> > One alternate idea I had was to have kirkwood-dreamplug.dts root hold
> > 
> > tclk: clock-frequency = <200000000>;
> > 
> > and then have the drivers ask for it.  afaict, tclk is constant per
> > board.
> > 
> > I'm fine with either way, but I'd rather have it in the dt.
> 
> IMHO it's best to leave any such hacks out of the device tree for
> now, until we have the proper clk bindings in place for kirkwood,
> and then we can just use those.

Ok.

thx,

Jason.
