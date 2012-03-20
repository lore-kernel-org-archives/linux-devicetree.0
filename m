From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 20 Mar 2012 20:32:22 +0100
Message-ID: <20120320193222.GD8315@lunn.ch>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203131557.49488.arnd@arndb.de>
 <20120320172238.GC2484@titan.lakedaemon.net>
 <201203201915.08317.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203201915.08317.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2012 at 07:15:07PM +0000, Arnd Bergmann wrote:
> On Tuesday 20 March 2012, Jason Cooper wrote:
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
> This actually looks wrong to me, because the ehci driver has an
> interesting way of pulling in platform specific drivers.
> 
> I'm pretty sure that it will break modular builds, which can only
> have one module_init function in them. It's not clear to me why this
> patch actually fixes the problem either. Could it be that you have
> multiple platform driver back-ends for ehci enabled at the same time?
> 
> That should not be possible in theory and at least give a warning, but
> the ehci probing method is a bit fragile so I would not be too surprised.

Hi Jason

I fell fowl of something in this area. Do you have CONFIG_USB_EHCI_MV=y?
Make sure you do not have this. 

drivers/usb/host/ehci-hcd.c has some unusual code, and if you have
both CONFIG_USB_EHCI_MV and CONFIG_PLAT_ORION, the CONFIG_USB_EHCI_MV
is given preference and the Orion driver never gets its probe
functions called etc.

	  Andrew
