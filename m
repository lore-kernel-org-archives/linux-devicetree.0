From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 3/4] edac: Add APM X-Gene SoC EDAC driver
Date: Fri, 23 May 2014 19:20:06 +0200
Message-ID: <20140523172006.GA6440@pd.tnic>
References: <1399590199-12256-1-git-send-email-lho@apm.com>
 <1399590199-12256-2-git-send-email-lho@apm.com>
 <1399590199-12256-3-git-send-email-lho@apm.com>
 <1399590199-12256-4-git-send-email-lho@apm.com>
 <20140520193930.GA23070@pd.tnic>
 <CAPw-ZTkOYhWT_5QFJvGBM-aHOOH-1cqsMgnhOVEirRdG9FEosw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPw-ZTkOYhWT_5QFJvGBM-aHOOH-1cqsMgnhOVEirRdG9FEosw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 23, 2014 at 09:26:12AM -0700, Loc Ho wrote:
> Hi,
> 
> >> +static int xgene_edac_mc_is_active(struct xgene_edac_mc_ctx *ctx, int mc_idx)
> >> +{
> >> +     u32 reg;
> >> +     u32 mcu_mask;
> >> +
> >> +     reg = readl(ctx->csw_csr + CSW_CSWCR);
> >> +     if (reg & CSW_CSWCR_DUALMCB_MASK) {
> >> +             /*
> >> +              * Dual MCB active - Determine if all 4 activie or just MCU0
> >
> > Spellcheck: "activie"
> 
> The proper spelling is "active" from online dictionary.

Oh really?! Thanks for teaching me that. Let me try again, this time
with pointers:

> >> +              * Dual MCB active - Determine if all 4 activie or just MCU0
							     ^
							     |
							     |
---------WRONG SPELLING HERE---------------------------------+

You need to open this with an editor that doesn't damage whitespace to
see where the arrow points at.

> Are you sure about this? With dev_err, it prints the device node info
> as well. This allows one to determine which instance that has issue.
> X-Gene has 4 instance of memory controllers.

Ok, we don't have a corresponding functionality in edac for that.

> >> +
> >> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 4);
> >> +     ctx->mcu_csr = devm_ioremap_resource(&pdev->dev, res);
> >> +     if (IS_ERR(ctx->mcu_csr)) {
> >> +             dev_err(&pdev->dev, "no MCU resource address\n");
> >> +             rc = PTR_ERR(ctx->mcu_csr);
> >> +             goto err_free;
> >> +     }
> >> +     /* Ignore non-active MCU */
> >> +     if (!xgene_edac_mc_is_active(ctx, ((res->start >> 16) & 0xF) / 4)) {
> >> +             rc = -ENODEV;
> >> +             goto err_free;
> >> +     }
> >
> > You could move edac_mc_alloc() here, after the resources have been
> > collected successfully and simplify the unwinding path.
> 
> I need the ctx pointer which is part of the edac_mc_alloc. Can't move it here.

Of course you can - you can use a local ctx and copy it.

edac_mc_alloc is a heavy call and I'd keep it after the lighter
platform_get_resource() have completed successfully so that you don't
have to undo it with edac_mc_del_mc.

But hey, this is your driver so it's your decision in the end.

Which reminds me, I'd need an entry for MAINTAINERS from you or someone
who's going to take care of this driver and whom I should direct bug
reports to.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
