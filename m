From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/9] ARM: add secondary_startup_arm prototype in
 header file
Date: Mon, 18 May 2015 16:56:45 +0800
Message-ID: <1431939405.8312.3.camel@mtksdaap41>
References: <1431763110-443-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1431763110-443-3-git-send-email-yingjoe.chen@mediatek.com>
	 <CABuKBe+8VHnHbMA4gMzzReUNUf3LiL6JnPhehkxWtzrYAhBBZg@mail.gmail.com>
	 <20150516211953.GQ2067@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150516211953.GQ2067-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2015-05-16 at 22:19 +0100, Russell King - ARM Linux wrote:
> On Sat, May 16, 2015 at 11:02:40AM +0200, Matthias Brugger wrote:
> > 2015-05-16 9:58 GMT+02:00 Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> > > Put secondary_startup_arm() prototype in arch/arm/include/asm/smp.h
> > > so users doesn't have to add extern prototype in their code.
> > >
> > > Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  arch/arm/include/asm/smp.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm/include/asm/smp.h b/arch/arm/include/asm/smp.h
> > > index 18f5a55..f5cffb7 100644
> > > --- a/arch/arm/include/asm/smp.h
> > > +++ b/arch/arm/include/asm/smp.h
> > > @@ -69,6 +69,7 @@ struct secondary_data {
> > >  extern struct secondary_data secondary_data;
> > >  extern volatile int pen_release;
> > >  extern void secondary_startup(void);
> > > +extern void secondary_startup_arm(void);
> > 
> > Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This change should also end up in the patch system as its core ARM stuff,
> especially if it's not scheduled for merging through arm-soc.
> 

Russell,

Thanks. I just put these 2 patches into the patch system.
Since patch 7/9 depends on this patch, I think we should merge this
patch(2/9) through arm-soc tree to prevent build fail.

Joe.C


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
