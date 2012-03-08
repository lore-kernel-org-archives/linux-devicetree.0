From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: kirkwood: convert uart0 to devicetree.
Date: Thu, 8 Mar 2012 17:01:01 +0000
Message-ID: <201203081701.01663.arnd@arndb.de>
References: <cover.1331090356.git.jason@lakedaemon.net>
 <201203072113.04369.arnd@arndb.de>
 <20120308162530.GI5050@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120308162530.GI5050-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 08 March 2012, Jason wrote:
> 
> On Wed, Mar 07, 2012 at 09:13:04PM +0000, Arnd Bergmann wrote:
> > Finally, something could be wrong with the interrupt controller.
> > AFAICT, you register it through the device tree now, but it's also
> > getting initialized through kirkwood_init_irq, so the numbers
> > would all be wrong.
> 
> Yes, I'm working through this now.  mv_cesa silently fails to come up
> if it can't find the interrupt controller via fdt.  So, it needs to get
> done.
> 
> Right now, I'm looking at how mach-versatile does it (vic_init()) since
> it's also an ARM926ej-s...
> 

Ok, sounds good. It's not important whether it's an ARM9 or not btw.
You should look at both anything that defines an "interrupt-controller"
property as an example including Documentation/devicetree/bindings/arm/vic.txt
and Documentation/devicetree/bindings/arm/gic.txt.

(taking Thomas Gleixner on Cc)

Since the orion irq chip is based on irqchip_generic, it would be
perfect to have a generic irqchip binding to go along with
kernel/irq/generic-chip.c. Not sure if anyone has thought about this
before, but it looks like we can completely avoid using
arch/arm/plat-orion/irq.c and arch/arm/mach-kirkwood/irq.c if we
do that.

	Arnd
