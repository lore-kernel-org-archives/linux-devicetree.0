From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: kirkwood: convert rtc-mv to fdt.
Date: Sun, 4 Mar 2012 17:27:10 -0500
Message-ID: <20120304222710.GT11986@titan.lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <2c985a303f3b9b0cfcead25634b7e1db68d34ee3.1330625878.git.jason@lakedaemon.net>
 <201203041559.23810.michael@walle.cc>
 <201203041648.17428.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203041648.17428.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: Michael Walle <michael-QKn5cuLxLXY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 04, 2012 at 04:48:17PM +0000, Arnd Bergmann wrote:
> On Sunday 04 March 2012, Michael Walle wrote:
> > in my older patch series i flagged all converted devices with two 
> > compatibility names. Eg:
> > 
> >        { .compatible = "marvell,orion5x-rtc", },
> >        { .compatible = "marvell,kirkwood-rtc", },
> > 
> > IMHO marvell,rtc is i little too general, i guess marvell won't have only one 
> > rtc ;)
> > 
> > Other opinions?
> 
> Being specific is certainly good, and it may also be a good idea to
> list the first one it's compatible with in the device tree source.
> 
> So the device tree for a 88F6281 soc could list
> 
> 	compatible = "marvell,88f6281-rtc", "marvell,kirkwood-rtc", "marvell,orion-rtc";

I'll go ahead and make this style of change throughout.  I assume
"marvell,88f6281-rtc" would only be for SoC internal devices?  eg, the spi
driver wouldn't follow that convention.  I'll see if I can dig up a part
number on it.

> This would give the device driver the option which one to bind to. Anything that
> has an rtc compatible with the one in orion should list that one, so that the driver
> only has to list that one if they are truely identical, but if the driver has to
> get modified later to know the difference between orion and kirkwood rtcs, it can
> check the more specific value.
> 
> 	Arnd

thx,

Jason.
