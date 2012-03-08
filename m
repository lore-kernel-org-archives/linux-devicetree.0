From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: kirkwood: convert uart0 to devicetree.
Date: Thu, 8 Mar 2012 23:14:04 +0000
Message-ID: <201203082314.05385.arnd@arndb.de>
References: <cover.1331090356.git.jason@lakedaemon.net>
 <201203072113.04369.arnd@arndb.de>
 <20120308212701.GB16533@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120308212701.GB16533-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 08 March 2012, Grant Likely wrote:
> > 
> > My first guess was that clock-frequency is wrong, but it seems that
> > this one actually is correct, at least it's the same thing that
> > the platform code sets.
> > 
> > You should never need to pass the virtual address to a device,
> > most of all because it cannot be known to the device tree at all.
> > The of_serial driver (you did enable that one in Kconfig, right?)
> 
> Ugh.  Someone really needs to step up and kill the of_serial driver.  All that
> stuff belongs in the core 16550 driver.

Well, actually I would argue that nothing belongs into the core 8250 driver.
What we should do though is split the of_serial.c file into the main 8250
portion and put that into drivers/tty/serial/8250/ along with the other
14 bus glue drivers, and put the nwpserial portion into
drivers/tty/serial/nwpserial.c.

I have started a major rework of 8250 some time ago that I need to finish up,
to make the different ways for registering an 8250 device more regular,
and get rid of the more obscure ways we have in the kernel, replacing them
with platform devices or other bus specific 'struct device' versions.

The main intention of that patch series is to confine the ISA/PCI specific
inb/outb accessors in the files that need them so we can actually build
the platform drivers without defining those, but I can take care of
of_serial.c as well -- after all I wrote that file originally.

	Arnd
