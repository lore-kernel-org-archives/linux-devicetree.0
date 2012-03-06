From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PULL REQUEST v2] ARM: kirkwood: fdt: convert kirkwood init
 funcs to fdt
Date: Tue, 6 Mar 2012 09:29:20 -0500
Message-ID: <20120306142920.GQ5050@titan.lakedaemon.net>
References: <cover.1330709314.git.jason@lakedaemon.net>
 <alpine.LFD.2.02.1203051344130.31242@xanadu.home>
 <20120305191546.GK5050@titan.lakedaemon.net>
 <201203052016.26949.arnd@arndb.de>
 <20120305202941.GN5050@titan.lakedaemon.net>
 <alpine.LFD.2.02.1203051542190.31242@xanadu.home>
 <20120305211737.GO5050@titan.lakedaemon.net>
 <alpine.LFD.2.02.1203051626370.31242@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.02.1203051626370.31242-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 05, 2012 at 04:27:27PM -0500, Nicolas Pitre wrote:
> On Mon, 5 Mar 2012, Jason wrote:
> 
> > On Mon, Mar 05, 2012 at 03:43:42PM -0500, Nicolas Pitre wrote:
> > > On Mon, 5 Mar 2012, Jason wrote:
> > > 
> > > > On Mon, Mar 05, 2012 at 08:16:26PM +0000, Arnd Bergmann wrote:
> > > > > On Monday 05 March 2012, Jason wrote:
> > > > > > > 
> > > > > > > The clock frequency part being hardcoded to 200000 in the common .dtsi 
> > > > > > > file looks wrong.  The clock may differ, and it used to (and should) be 
> > > > > > > probed at run time, please see kirkwood_find_tclk().
> > > > > > 
> > > > > > So, should I EXPORT_SYMBOL_GPL(kirkwood_find_tclk); and have each driver
> > > > > > call it?
> > > > > 
> > > > > If the drivers want to use it, I think it has to be orion_find_tclk for
> > > > > drivers that are shared between multiple plat-orion platforms.
> > > > 
> > > > That's pretty much all of them  :-)
> > > > 
> > > > I'll rename it and move it to plat-orion/common.c.  This'll be fun.
> > > 
> > > No no...  This is not a function which is generic at all.  The _result_ 
> > > i.e. core clock frequency value is a generic thing, not the method to 
> > > determine it.
> > 
> > How about this?  Export a global variable, orion_tclk, and a function to
> > read it.  Then, make sure each sub arch sets the global.  Does this
> > sound viable until common clk lands?
> 
> Yep, looks fine.

I just got a first look at Andrew's patches for using the generic clk
across plat/orion.  There's a lot of good stuff in there.  I'll start
building my series on top of his (and obviously Mike's clk series).

thx,

Jason.
