From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] of/flattree: use callback to setup initrd from /chosen
Date: Tue, 22 Dec 2009 18:54:37 +0800
Message-ID: <200912221854.37572.jeremy.kerr@canonical.com>
References: <1261474791.289871.854376051633.1.gpush@pororo>
	<1261478868.10767.2.camel@concordia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1261478868.10767.2.camel@concordia>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Michael,

> >  void early_init_dt_setup_initrd_arch(unsigned long start,
> > 				      unsigned long end);
> 
> arch_early_init_dt_setup_initrd() makes more sense to me, but ..

<foo>_arch has been the general convention for arch-specific hooks in 
drivers/of/.

> > +#ifdef CONFIG_BLK_DEV_INITRD
> > +void __init early_init_dt_setup_initrd_arch(unsigned long start,
> > +		unsigned long end)
> > +{
> > +	initrd_start = (unsigned long)__va(start);
> > +	initrd_end = (unsigned long)__va(end);
> > +	initrd_below_start_ok = 1;
> > +}
> > +#endif
> 
> Given you have two identical implementations why not make that the
> default and make it weak, and let ARM override it.

Yeah, that would be good too; just been avoiding weak as a potential source of 
magic voodoo complexity. Grant - up to you on this one.

Cheers,


Jeremy
