From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PULL REQUEST v2] ARM: kirkwood: fdt: convert kirkwood init
 funcs to fdt
Date: Mon, 5 Mar 2012 13:49:35 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1203051344130.31242@xanadu.home>
References: <cover.1330709314.git.jason@lakedaemon.net>
 <20120302200034.GQ11986@titan.lakedaemon.net>
 <201203022035.44672.arnd@arndb.de> <201203022118.05796.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203022118.05796.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2 Mar 2012, Arnd Bergmann wrote:

> On Friday 02 March 2012, Arnd Bergmann wrote:
> > On Friday 02 March 2012, Jason wrote:
> > > The following changes since commit 759a45185ac0e4dfaf8bbfcb390ec73aca4b7a34:
> > > 
> > >   ARM: kirkwood: convert uart0 to devicetree. (2012-02-27 16:21:44 +0000)
> > > 
> > > are available in the git repository at:
> > >   git://git.infradead.org/users/jcooper/linux-kirkwood.git kirkwood_dt_test
> > > 
> > 
> > Applied to next/dt branch.
> 
> On second thought, I should probably wait for the maintainer to comment
> as well ;-)
> 
> Nico, does this look ok to you?

The clock frequency part being hardcoded to 200000 in the common .dtsi 
file looks wrong.  The clock may differ, and it used to (and should) be 
probed at run time, please see kirkwood_find_tclk().


Nicolas
