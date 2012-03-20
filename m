From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 20 Mar 2012 14:24:59 -0400
Message-ID: <20120320182459.GD2484@titan.lakedaemon.net>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203131557.49488.arnd@arndb.de>
 <20120320172238.GC2484@titan.lakedaemon.net>
 <alpine.LFD.2.02.1203201401410.24151@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.02.1203201401410.24151-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2012 at 02:03:23PM -0400, Nicolas Pitre wrote:
> On Tue, 20 Mar 2012, Jason Cooper wrote:
> 
> > On Tue, Mar 13, 2012 at 03:57:49PM +0000, Arnd Bergmann wrote:
> > > On Monday 12 March 2012, Jason Cooper wrote:
> > > > Only issue I have (I think unrelated) is that orion-ehci isn't coming
> > > > up.  But these patches don't touch that, so I think it might be my
> > > > config again.  Although it doesn't look like it...
> > > 
> > > I looked at your patches but also couldn't find anything that hints
> > > at why ehci would break.
> > 
> > I figured it out.  Apparently, dreamplug is the first board to put root
> > on usb-attached microsd card.  And I'm the first one to try to compile
> > orion-ehci into the kernel.  ;-)
> > 
> > The following fix the problem:
> > 
> > diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> > index 6c6a5a3..0808417 100644
> > --- a/drivers/usb/host/ehci-orion.c
> > +++ b/drivers/usb/host/ehci-orion.c
> > @@ -318,3 +318,5 @@ static struct platform_driver ehci_orion_driver = {
> >         .shutdown       = usb_hcd_platform_shutdown,
> >         .driver.name    = "orion-ehci",
> >  };
> > +
> > +module_platform_driver(ehci_orion_driver);
> > 
> > 
> > 
> > I figure most folks will build orion-ehci as a module and use an initrd.
> 
> Possibly, however that doesn't mean this shouldn't be fixed anyway.

Yes, I didn't mean to imply otherwise.  I know new patches for v3.4 are
no longer being accepted (they should already be in for-next, right?)
So, I'm not sure what the disposition of this patch should be.

If it's appropriate to push it into v3.4[-rc?], great.  I just didn't
want to assume that and appear to be pushing patches after the for-next
window closed.  I'll send it whereever you guys advise.

thx,

Jason.
