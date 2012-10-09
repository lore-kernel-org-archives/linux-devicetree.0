From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Tue, 9 Oct 2012 13:52:50 +0200
Message-ID: <20121009115250.GB28817@glitch>
References: <20121007015300.828366635@gmail.com>
 <20121007015405.958959522@gmail.com>
 <20121008141455.324f914b@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121008141455.324f914b@skate>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 08, 2012 at 02:14:55PM +0200, Thomas Petazzoni wrote:
> 
> On Sun, 07 Oct 2012 03:53:01 +0200, Domenico Andreoli wrote:
> 
> > Index: b/arch/arm/mach-bcm476x/Makefile.boot
> > ===================================================================
> > --- /dev/null
> > +++ b/arch/arm/mach-bcm476x/Makefile.boot
> > @@ -0,0 +1,5 @@
> > +   zreladdr-y := 0x00008000
> > +params_phys-y := 0x00000100
> > +initrd_phys-y := 0x00800000
> 
> Those params_phys-y and initrd_phys-y lines as useless as you're using
> the Device Tree.
> 
> > +#define BCM476X_PERIPH_PHYS   0x00080000
> > +#define BCM476X_PERIPH_VIRT   0xd0080000
> 
> This one should be defined with IOMEM(). Yes, you will have to add a
> cast to make it play nicely with map_desc.virtual.

Will address both of them. Thank you Thomas.

Regards,
Domenico
