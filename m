From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: kirkwood: convert uart0 to devicetree.
Date: Wed, 7 Mar 2012 16:29:24 -0500
Message-ID: <20120307212924.GG5050@titan.lakedaemon.net>
References: <cover.1331090356.git.jason@lakedaemon.net>
 <201203071831.31738.arnd@arndb.de>
 <20120307192723.GE5050@titan.lakedaemon.net>
 <201203072113.04369.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203072113.04369.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 07, 2012 at 09:13:04PM +0000, Arnd Bergmann wrote:
> On Wednesday 07 March 2012, Jason wrote:
> > Grrr.  Now I'm getting frustrated.  I'm trying to boot without
> > earlyprintk.  Evidently, something is wrong with the above, because the
> > device boots all the way up (blinky lights come on), but I get no
> > messages after the usual "Uncompressing Linux... done, booting the
> > kernel."
> > 
> > Here's my most recent attempt:
> > 
> >         serial@f1012000 {
> >                 device_type = "serial";
> >                 compatible = "ns16550a";
> >                 reg = <0xf1012000 0x100>; /*phys addr*/
> >                 virt-reg = <0xfed12000>;  /*virt addr*/
> >                 reg-shift = <2>;
> >                 reg-io-width = <1>;
> >                 interrupts = <33>;
> >                 current-speed = <115200>;
> >                 interrupt-parent = <&intc>;
> >                 clock-frequency = <200000000>;
> >         };
> > 
> > I've looked at what is done in the powerpc dt's, but, no luck.  When
> > earlyprintk is enabled, I see no error messages, just:
> > 
> > bootconsole [earlycon0] enabled
> > debug: skip boot console de-registration.
> > ...
> > Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
> > 
> > Any pointers?

> The of_serial driver (you did enable that one in Kconfig, right?)

Wow.  I can't believe I missed that.  I now get:

Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
f1012000.serial: ttyS0 at MMIO 0xf1012000 (irq = 33) is a 16550A
console [ttyS0] enabled

without earlyprintk.

Thanks, Arnd.

Jason.

PS - the only change from your code is the 0x100.  I'm going to do some
more testing...
