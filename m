From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 01/12] ARM: Orion: DT support for IRQ and GPIO
 Controllers
Date: Thu, 5 Jul 2012 15:47:37 +0000
Message-ID: <201207051547.37906.arnd@arndb.de>
References: <1341325365-21393-1-git-send-email-andrew@lunn.ch>
 <201207051347.38887.arnd@arndb.de> <20120705135449.GZ17534@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120705135449.GZ17534-g2DYL2Zd6BY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 05 July 2012, Andrew Lunn wrote:
> > > Orion use generic chip interrupts, both for the main interrupts and
> > > the GPIO interrupts. This does not yet support irq domain, so i have
> > > to layer a legacy domain on top. The legacy domain needs to know the
> > > first IRQ and the number of IRQs. For the primary IRQs that is
> > > easy. However, GPIO IRQ is not so easy, it depends on how many primary
> > > IRQs there are. This is not fixed. Orion5x has 32, Dove 64, kirkwood,
> > > 64, and mv78xx0 has 96. I need to know this number when adding the
> > > GPIO secondary IRQ legacy domain. By calling orion_gpio_of_init() in
> > > the orion_add_irq_domain() i have this number to hand. If i used to
> > > entries in the match table, i would have to put this number into some
> > > global variable, or somehow ask the IRQ subsystem what the next free
> > > IRQ number is.
> > 
> > But couldn't you store the number of interrupts for the primary controller
> > in a local variable? I think the of_irq code already guarantees that
> > the parent is probed first.
> 
> Sure i could. But what is the advantage of that?

Probably not much. I've reread the of_irq_init code again and it seems that
the effect would be the same, perhaps appearing a little more similar to what
the other platforms do.

Please add my Acked-by: to your patch.

	Arnd
