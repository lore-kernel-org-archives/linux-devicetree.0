From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/5] ARM: vexpress: Add DT support in v2m
Date: Thu, 1 Dec 2011 10:57:56 +0000
Message-ID: <20111201105756.GA2026@localhost.localdomain>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <1322579473-8804-4-git-send-email-pawel.moll@arm.com>
 <20111130155800.GF2045@localhost.localdomain>
 <1322678779.3180.36.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322678779.3180.36.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 30, 2011 at 06:46:19PM +0000, Pawel Moll wrote:
> On Wed, 2011-11-30 at 15:58 +0000, Dave Martin wrote:
> > Now that a person may fail to boot on a supported board simply due to
> > failing to supply a device tree, it may be a good idea to have a more
> > helpful panic message for that situation, perhaps something like the
> > following.
> > 
> > If you don't think this fits in this series, I can always follow up 
> > later.
> > 
> > diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
> > index 6965f64..9dda482 100644
> > --- a/arch/arm/mach-vexpress/v2m.c
> > +++ b/arch/arm/mach-vexpress/v2m.c
> > @@ -434,8 +434,11 @@ static void __init v2m_populate_ct_desc(void)
> >  			ct_desc = ct_descs[i];
> >  
> >  	if (!ct_desc)
> > -		panic("vexpress: failed to populate core tile description "
> > -		      "for tile ID 0x%8x\n", current_tile_id);
> > +		panic("vexpress: this kernel does not support core tile ID "
> > +		      "0x%08x when booting via ATAGs.\n"
> > +		      "You may need a device tree blob or a different kernel "
> > +		      "to boot on this board.\n",
> > +		      current_tile_id);
> >  }
> >  
> >  static void __init v2m_map_io(void)
> > 
> 
> No, that's cool with me, will add that. Thanks!

I just discovered that Documentation/CodingStyle recommends not to split printk
strings onto multiple lines, for easier grepping.  Sounds like sensible advice,
so maybe just split at "\n":

> > +		panic("vexpress: this kernel does not support core tile ID 0x%08x when booting via ATAGs.\n" 
> > +		      "You may need a device tree blob or a different kernel to boot on this board.\n",
> > +		      current_tile_id);

Cheers
---Dave
