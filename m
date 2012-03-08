From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: kirkwood: convert uart0 to devicetree.
Date: Thu, 8 Mar 2012 16:55:50 -0500
Message-ID: <20120308215550.GO5050@titan.lakedaemon.net>
References: <cover.1331090356.git.jason@lakedaemon.net>
 <80fb8cef577eee14364e95009f7a590fd9056ee3.1331090356.git.jason@lakedaemon.net>
 <201203071831.31738.arnd@arndb.de>
 <20120307192723.GE5050@titan.lakedaemon.net>
 <20120308213139.GC16533@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120308213139.GC16533-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
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
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 08, 2012 at 02:31:39PM -0700, Grant Likely wrote:
> On Wed, Mar 07, 2012 at 02:27:23PM -0500, Jason wrote:
> > On Wed, Mar 07, 2012 at 06:31:31PM +0000, Arnd Bergmann wrote:
> > > On Wednesday 07 March 2012, Jason Cooper wrote:
> > > > +       serial@f1012000 {
> > > > +               compatible = "ns16550a";
> > > > +               reg = <0xf1012000 0xff>;
> > > > +               reg-shift = <2>;
> > > > +               interrupts = <33>;
> > > > +               clock-frequency = <200000000>;
> > > > +       };
> > > 
> > > I just noticed that the length here should be inclusive, i.e. 0x100 not 0xff.
> > > This is different from the way we define resources in Linux.
> > 
> > Grrr.  Now I'm getting frustrated.  I'm trying to boot without
> > earlyprintk.  Evidently, something is wrong with the above, because the
> > device boots all the way up (blinky lights come on), but I get no
> > messages after the usual "Uncompressing Linux... done, booting the
> > kernel."
> > 
> > Here's my most recent attempt:
> > 
> 
> I see that you've resolved your problem, but some comments below on the
> device node:
> 
> >         serial@f1012000 {
> >                 device_type = "serial";
> 
> Never use device_type.  It should only ever appear in the memory node, and
> I plan to remove it from there too.
> 
> >                 compatible = "ns16550a";
> >                 reg = <0xf1012000 0x100>; /*phys addr*/
> >                 virt-reg = <0xfed12000>;  /*virt addr*/
> 
> Don't use virt-reg.  Nothing in the kernel uses it and the kernel will
> make it's own decision about virtual address mapping.
> 
> >                 reg-shift = <2>;
> >                 reg-io-width = <1>;
> 
> 1 is the default for reg-io-width.  No need to have this property.  It
> should only be used if the device requires 32 bit accesses.
> 
> >                 interrupts = <33>;
> >                 current-speed = <115200>;
> >                 interrupt-parent = <&intc>;
> >                 clock-frequency = <200000000>;
> >         };

Thanks, Grant.  I reverted all of those changes once I found the root of
my problem.

thx,

Jason.
