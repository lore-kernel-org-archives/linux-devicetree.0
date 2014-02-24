From: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Subject: Re: [PATCH 3/7] IBM Akebono: Add support to the OHCI platform driver for PPC476GTR
Date: Mon, 24 Feb 2014 11:20:21 +1100
Message-ID: <2060422.gLdTliUGah@mexican>
References: <1392964293-13687-1-git-send-email-alistair@popple.id.au> <1392964293-13687-4-git-send-email-alistair@popple.id.au> <16991392.luyzl1NYP3@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <16991392.luyzl1NYP3@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 21 Feb 2014 15:16:52 Arnd Bergmann wrote:
> On Friday 21 February 2014 17:31:29 Alistair Popple wrote:
> > +static const struct of_device_id ohci_of_match[] = {
> > +       { .compatible = "usb-ohci", },
> > +       {},
> > +};
> > +
> > 
> >  static const struct platform_device_id ohci_platform_table[] = {
> >  
> >         { "ohci-platform", 0 },
> >         { }
> > 
> > @@ -198,6 +209,7 @@ static struct platform_driver ohci_platform_driver = {
> > 
> >                 .owner  = THIS_MODULE,
> >                 .name   = "ohci-platform",
> >                 .pm     = &ohci_platform_pm_ops,
> > 
> > +               .of_match_table = ohci_of_match,
> > 
> >         }
> >  
> >  };
> 
> Linux-next already has a patch to add an of_match_table in this driver,
> using
> 
> static const struct of_device_id ohci_platform_ids[] = {
>         { .compatible = "generic-ohci", },
>         { }
> };
> 
> I think you should just use that string on your platform.

Excellent! I will drop this patch and use "generic-ohci" instead. Thanks for 
pointing this out.

- Alistair

> 	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
