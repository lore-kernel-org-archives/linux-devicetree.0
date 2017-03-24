From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4 v5] PCI: add driver for Faraday Technology Host Bridge
Date: Fri, 24 Mar 2017 10:38:05 -0500
Message-ID: <20170324153805.GA31729@bhelgaas-glaptop.roam.corp.google.com>
References: <20170312222403.2473-1-linus.walleij@linaro.org>
 <20170324150753.GC25380@bhelgaas-glaptop.roam.corp.google.com>
 <CACRpkdbkhui0iwJbOeD8uwurdWvOYdPKtRPQhSkg0atpAB174Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbkhui0iwJbOeD8uwurdWvOYdPKtRPQhSkg0atpAB174Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Feng-Hsin Chiang <john453-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greentime Hu <green.hu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 04:14:43PM +0100, Linus Walleij wrote:
> On Fri, Mar 24, 2017 at 4:07 PM, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> 
> > Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> 
> Thanks!
> 
> > I don't know enough to review the DT patch, but you have Rob's ack
> > already.
> >
> > Not sure how you want to merge these; if you want to feed the whole
> > thing via ARM SoC, that's fine with me.  Otherwise, let me know if
> > you'd like me to take anything.
> 
> It'd be perfect if you could merge patches 1+2 into the PCI tree,
> there are no dependencies to the ARM tree.
> 
> > Noticed one trivial typo below.
> >
> >> + * Special configuration registers directly in the first few words
> >> + * in he I/O space.
> >
> > s/he//
> 
> Can you fix it when applying or do you want me to resend it with
> this fixed?

I fixed it.

Applied 1 & 2 to pci/host-faraday for v4.12, thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
