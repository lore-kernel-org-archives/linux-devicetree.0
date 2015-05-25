From: maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH v3 2/2] soc: Add driver for Freescale Vybrid Platform
Date: Mon, 25 May 2015 15:47:49 +0530
Message-ID: <20150525101749.GB5725@Sanchayan-Arch.toradex.int>
References: <cover.1432290463.git.maitysanchayan@gmail.com>
 <35561091.AtkcGa6qVG@wuerfel>
 <61585e4449cfc1f36e16a64b9b4a54fe@agner.ch>
 <3574233.JhJlJx8SSu@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3574233.JhJlJx8SSu@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Arnd,

On 15-05-22 15:20:00, Arnd Bergmann wrote:
> On Friday 22 May 2015 14:02:52 Stefan Agner wrote:
> > > Can you use syscon_regmap_lookup_by_phandle instead, and put the
> > > phandles in the fsl,vf610-mscm-cpucfg node?
> > 
> > Hm, with that we would wire up hardware modules which does nothing has
> > to do with each other. We just happen to need a driver which collects
> > information accross the SoC. I'm not sure we should put the modules
> > required into the device tree.
> > 
> > I don't think its nice to have the compatible strings in the source
> > code, however it feels more appropriate than in the device tree, IMHO...
> 
> I see. Another option would be to point directly to the registers
> you need:
> 
> 	ocotp-cfg0 = <&ocotp 0x10>;
> 	ocotp-cfg1 = <&ocotp 0x20>;
> 	rom-revision = <&rom 0x80>;
> 
> We don't yet have an abstraction to access a register from a syscon
> reference like this, but you could either roll your own here, or 
> add a generic abstraction.

Can you tell me a little about how can I start implementing it? I am not
clear on how to approach this.

> 
> > > Also, I'd argue that the mscm should not be a syscon device at all,
> > > but instead I'd use platform_get_resource()/devm_ioremap_resource()
> > > to get an __iomem pointer.
> > 
> > We need to have mscm-cpucfg to be syscon because we need to get the CPU
> > personality in the MSCM interrupt router driver (irq-vf610-mscm-ir.c). 
> 
> It can be both at the same time now.
> 
> 	Arnd

Regards,
Sanchayan.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
